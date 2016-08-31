Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F12E5E0049A; Wed, 31 Aug 2016 08:05:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31167E00519
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 08:05:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7VF52B3005734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 08:05:05 -0700
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 08:05:04 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1472655650-25674-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <d225cb19-d742-2190-bed5-ab8704037e53@windriver.com>
Date: Wed, 31 Aug 2016 11:05:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472655650-25674-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: update list of licenses
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
X-List-Received-Date: Wed, 31 Aug 2016 15:05:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-31 11:00 AM, Mark Asselstine wrote:
> Apparently if a license is listed for a package it must be included in
> the overall LICENSE variable otherwise you will get WARNINGS such as:
>
>     WARNING: LICENSE_libvirt-ptest includes licenses (LGPLv2.1 GPLv2+)
>     that are not listed in LICENSE
>
> We ensure that the license string is consistent between the LICENSE
> variable and the subpackage license string to remove this
> warning. Since '2+' is a superset of '2', ie. "version 2 or later",
> and actually is more reflective of the text found on the file headers
> and such we use GPLv2+ and LGPLv2.1+.

merged.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.3.5.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index 6222b69..7271ebe 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux."
>  HOMEPAGE = "http://libvirt.org"
> -LICENSE = "LGPLv2.1+"
> -LICENSE_${PN}-ptest = "GPLv2+ & LGPLv2.1"
> +LICENSE = "LGPLv2.1+ & GPLv2+"
> +LICENSE_${PN}-ptest = "GPLv2+ & LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LESSER;md5=4b54a1fd55a448865a0b32d41598759d"
>  SECTION = "console/tools"
>


