Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9229AE00C10; Tue, 30 Jan 2018 14:11:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE1F2E005A2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 14:11:50 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0UMBoFx024092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 14:11:50 -0800 (PST)
Received: from server.local (128.224.23.36) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 30 Jan 2018 14:11:49 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1517326665-29148-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <16591189-2d13-10d4-13b8-864f2b162bb8@windriver.com>
Date: Tue, 30 Jan 2018 17:11:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517326665-29148-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: drop no longer existing python3 dependencies
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
X-List-Received-Date: Tue, 30 Jan 2018 22:11:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-01-30 10:37 AM, Mark Asselstine wrote:
> Several python3 packages have been removed as the functionality has
> been moved into python3 core. As such we can no longer RDEPENDS on
> these packages, nor is there a need to.
> 
> See similar commits in meta-openembedded:
> df997e0747de - Remove deprecated python3-subprocess from the RDEPENDS
> 90b1f996af78 - Remove deprecated python3-argparse from the RDEPENDS
> ef52e9980433 - Remove deprecated python3-lang from the RDEPENDS
> 
> This is fallout from openembedded core commit:
> 54ac820b8a63 - python3: Restructure python3 packaging and replace it
>                 with autopackaging

merged.

Bruce

> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 7898067..662d5b0 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -3,12 +3,12 @@ require openvswitch.inc
>   DEPENDS += "virtual/kernel"
>   
>   RDEPENDS_${PN}-ptest += "\
> -	python3-logging python3-syslog python3-argparse python3-io \
> -	python3-fcntl python3-shell python3-lang python3-xml python3-math \
> +	python3-logging python3-syslog python3-io \
> +	python3-fcntl python3-shell python3-xml python3-math \
>   	python3-datetime python3-netclient python3 sed \
>   	ldd perl-module-socket perl-module-carp perl-module-exporter \
>   	perl-module-xsloader python3-netserver python3-threading \
> -	python3-resource python3-subprocess findutils which \
> +	python3-resource findutils which \
>   	"
>   
>   S = "${WORKDIR}/git"
> 


