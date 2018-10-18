Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06795E00994; Thu, 18 Oct 2018 08:38:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E62E1E00971;
	Thu, 18 Oct 2018 08:38:55 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9IFcp4l010822
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Oct 2018 08:38:52 -0700 (PDT)
Received: from [128.224.56.49] (128.224.56.49) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 18 Oct 2018 08:38:51 -0700
To: <kai.kang@windriver.com>, <yocto@yoctoproject.org>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <20181016014519.9084-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <c62fad2e-16b2-9144-c4bc-18652948d8e5@windriver.com>
Date: Thu, 18 Oct 2018 11:38:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181016014519.9084-1-kai.kang@windriver.com>
Subject: Re: [yocto] [PATCH] libvirt: remove qemu from PACKAGECONFIG for mips n32 and n64
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
X-List-Received-Date: Thu, 18 Oct 2018 15:38:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Wrong mailing list. Use meta-virtualization for these patches.

I'm cross posting this there, for the archives.

I've grabbed and merged this change (but could easily have missed
it, since it was the wrong list and I wasn't directly copied).

Bruce

On 10/15/18 9:45 PM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> PACKAGECONFIG 'qemu' causes libvirt depends on package qemu. But qemu
> is not compatible with mips n32 and n64. So remove 'qemu' from
> PACKAGECONFIG for mips n32 and n64.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   recipes-extended/libvirt/libvirt_4.7.0.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
> index 47275ae..a1175f5 100644
> --- a/recipes-extended/libvirt/libvirt_4.7.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
> @@ -186,6 +186,10 @@ PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
>                     "
>   
> +# qemu is NOT compatible with mips64
> +PACKAGECONFIG_remove_mipsarchn32 = "qemu"
> +PACKAGECONFIG_remove_mipsarchn64 = "qemu"
> +
>   # enable,disable,depends,rdepends
>   #
>   PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
> 


