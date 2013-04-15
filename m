Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45E17E014D8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Apr 2013 05:30:17 -0700 (PDT)
Received: by mail-la0-f42.google.com with SMTP id fn20so4002620lab.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Apr 2013 05:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=eCQ23FOtR3AMXbIl9razvm6YrxCHgSnc7nK/3nQWSaM=;
	b=caKCaFC0RIcffzu79mMSS/lFfrnYCoEBTsxKvKfY3FNq6BhUVMVbPc1sdzRIWobNLh
	0yY2EwR3Z+4jxz4AEStUuDQs/18GPnL9lElgFcW3h8aRuclRTfalJilukGL65fxHAq34
	d4pFk5I6qiUncXSc7aTUQKuT1h14AU0/egb6ugC1vdbe23LiverQfbKvcr+AytyWGQWo
	MD9QWimOTx56b2aquxZ8lmgcEawQPUwdyADKYSvIFGNpitJfiYOSTwQFZHUu5NV9MYlK
	/EaKVFfFyr5h0KC7IPAT0g73ryhOMj31ZzHg0vrC7Fokme5q+fJGH8YYwtq+01135ieO
	yrFA==
MIME-Version: 1.0
X-Received: by 10.112.128.231 with SMTP id nr7mr10207298lbb.26.1366029015665; 
	Mon, 15 Apr 2013 05:30:15 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Mon, 15 Apr 2013 05:30:15 -0700 (PDT)
In-Reply-To: <1365995924-17342-1-git-send-email-hong-hua.yin@freescale.com>
References: <1365995924-17342-1-git-send-email-hong-hua.yin@freescale.com>
Date: Mon, 15 Apr 2013 08:30:15 -0400
Message-ID: <CADkTA4PFMnbuN3FMrs3PnLBUNG5NfUROsQ7BUvSDTt79tYngEA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Olivia Yin <hong-hua.yin@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] update libvirt DEPENDS and FILES
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
X-List-Received-Date: Mon, 15 Apr 2013 12:30:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

You need some sort of long log here .. we can read the patch itself and
see that you are updating DEPENDS and FILES, but the patch commit
needs to tell us why you are updating them, and what it is fixing/changing.

Cheers,

Bruce

On Sun, Apr 14, 2013 at 11:18 PM, Olivia Yin <hong-hua.yin@freescale.com> wrote:
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index c1c000e..3ce9743 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -6,7 +6,7 @@ SECTION = "console/tools"
>  PR = "r1"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
> -          iptables ebtables dnsmasq readline"
> +          iptables ebtables dnsmasq readline libpciaccess augeas"
>
>  # These might be included by PACKAGECONFIG
>  #RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
> @@ -94,8 +94,10 @@ FILES_${PN} += "${libdir}/libvirt/connection-driver \
>             ${datadir}/augeas \
>             ${datadir}/polkit-1"
>
> -FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
> -FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
> +FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug \
> +                    ${libdir}/libvirt/lock-driver/.debug"
> +FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a \
> +                           ${libdir}/libvirt/lock-driver/*.a"
>
>  INITSCRIPT_PACKAGES = "${PN}-libvirtd"
>  INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
> --
> 1.5.6.5
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

