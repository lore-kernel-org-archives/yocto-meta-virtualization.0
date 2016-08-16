Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD510E00E7A; Tue, 16 Aug 2016 08:19:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D5CFE00E7A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Aug 2016 08:19:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7GFJpdu024924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Aug 2016 08:19:52 -0700
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Aug 2016 08:19:51 -0700
To: <kai.kang@windriver.com>
References: <20160816083420.16088-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <61b16da4-ebdb-30b3-a951-9026d719b81d@windriver.com>
Date: Tue, 16 Aug 2016 11:19:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160816083420.16088-1-kai.kang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: remove qemu from PACKAGECONFIG
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
X-List-Received-Date: Tue, 16 Aug 2016 15:19:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-16 04:34 AM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> qemu is not compatible with mips64, so remove 'qemu' which causes
> libvirt depends on package qemu from PACKAGECONFIG for mips64.

Can you clarify "not compatible" ? i.e. capture the error message, or
describe the runtime issues.

Bruce

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.3.5.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index 6222b69..68e0885 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -173,6 +173,9 @@ PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
>                    "
>
> +# qemu is NOT compatible with mips64
> +PACKAGECONFIG_remove_class-target_mips64 = "qemu"
> +
>  # enable,disable,depends,rdepends
>  #
>  PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
>


