Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6779E00D48; Mon,  4 Jan 2016 06:23:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AF91E00D51
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Jan 2016 06:22:59 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u04EMt3G025745
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 4 Jan 2016 06:22:55 -0800
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Jan 2016 06:22:54 -0800
To: <zongchun.yu@nxp.com>, <meta-virtualization@yoctoproject.org>
References: <1451021311-37491-1-git-send-email-zongchun.yu@nxp.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <568A8027.6090802@windriver.com>
Date: Mon, 4 Jan 2016 09:22:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1451021311-37491-1-git-send-email-zongchun.yu@nxp.com>
Subject: Re: [meta-openstack][fido-kilo][PATCH] python-trove: upgrade to 2015.1.2
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
X-List-Received-Date: Mon, 04 Jan 2016 14:23:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-12-25 12:28 AM, zongchun.yu@nxp.com wrote:
> From: Zongchun Yu <zongchun.yu@nxp.com>
>
> The stable/juno branch is removed in the git tree.
> change to stable/kilo branch.

Thanks. I've merged this change!

Bruce

>
> Signed-off-by: Zongchun Yu <zongchun.yu@nxp.com>
> ---
>   meta-openstack/recipes-devtools/python/python-trove_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-trove_git.bb b/meta-openstack/recipes-devtools/python/python-trove_git.bb
> index ae6defd..e56fc9b 100755
> --- a/meta-openstack/recipes-devtools/python/python-trove_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-trove_git.bb
> @@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>   PR = "r0"
>   SRCNAME = "trove"
>
> -SRC_URI = "git://github.com/openstack/trove.git;branch=stable/juno \
> +SRC_URI = "git://github.com/openstack/trove.git;branch=stable/kilo \
>             file://trove-init \
>             "
>
> -SRCREV="6c4ea5b845a4d6d71d3d3786517b5b358c30f3ec"
> -PV="2014.2+git${SRCPV}"
> +SRCREV="299d2de4fa1f46be8a023207568dbf81cd67b530"
> +PV="2015.1.2+git${SRCPV}"
>   S = "${WORKDIR}/git"
>
>   inherit update-rc.d setuptools identity hosts useradd default_configs
>


