Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFB33E00D8A; Wed, 31 Jul 2019 00:24:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D58CE00D4D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Jul 2019 00:24:04 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6V7N8ik018980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jul 2019 00:23:37 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 31 Jul 2019 00:23:26 -0700
To: <bruce.ashfield@gmail.com>
References: <5D3AC37B.2090709@windriver.com>
	<1564132251-408200-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D414290.4020606@windriver.com>
Date: Wed, 31 Jul 2019 15:26:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1564132251-408200-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.170]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] cri-o: skip it when depends not found
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jul 2019 07:24:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping.

Thanks,

On 2019年07月26日 17:10, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> cri-o depends on ostree, libselinux and libseccomp
> and we should check if the layer which provides these
> recipes exist or not before go on.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   recipes-containers/cri-o/cri-o_git.bb | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index c27aef7..b0c0ce4 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -42,6 +42,28 @@ RDEPENDS_${PN} = " \
>       cni \
>       "
>
> +python __anonymous() {
> +    msg = ""
> +    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
> +    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> +    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libseccomp']
> +    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> +        msg += "Make sure meta-security should be present as it provides 'libseccomp'"
> +        raise bb.parse.SkipRecipe(msg)
> +    # ERROR: Nothing PROVIDES 'ostree' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
> +    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> +    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'ostree']
> +    elif 'cube' not in d.getVar('BBFILE_COLLECTIONS').split():
> +        msg += "Make sure meta-cube should be present as it provides 'ostree'"
> +        raise bb.parse.SkipRecipe(msg)
> +    # ERROR: Nothing PROVIDES 'libselinux' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
> +    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> +    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libselinux']
> +    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
> +        msg += "Make sure meta-selinux should be present as it provides 'libselinux'"
> +        raise bb.parse.SkipRecipe(msg)
> +}
> +
>   PACKAGES =+ "${PN}-config"
>
>   RDEPENDS_${PN} += " virtual/containerd virtual/runc"
>

