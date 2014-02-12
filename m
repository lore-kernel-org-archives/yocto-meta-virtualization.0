Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 360B6E0074F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Feb 2014 07:40:11 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id mc6so7088137lab.7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Feb 2014 07:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LwEVEY4pk9WxVFDvSbOrH2tOaw4GoVma/hFGSGnqE/Q=;
	b=uCiHLF1dB4Ag+WS+fvEBfG3QZR0oPK+/08iQnJyJIuB2pcbgrXqFH4bR765xv1G15a
	rU5UgPFWcSyVQv74mCAlXvLvcrKDSEBm9a3BmHAriXGpvxQnSlx9IcKLUortee1kLqiT
	HBT1fLrWguiqCZsc39U6vq0ls/3BPoOSC912zO5BvgOrPrsZ+Ovu7N5bgfPze+mx7MDy
	LtuQZ8+NR3CKtn7EbdUL5DyOMVjZ6ifEQz/QEQzhglSzwgyQntrU4NFzRAOFHSxhOrwd
	C7esbq1DmShkL3sFXeE/qW/7RBdaOLAnFsmDGtiTj7hpJyP8yHtD1qvU8ym2op/lxK6k
	EV+Q==
MIME-Version: 1.0
X-Received: by 10.152.19.166 with SMTP id g6mr31962092lae.21.1392219609881;
	Wed, 12 Feb 2014 07:40:09 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 12 Feb 2014 07:40:09 -0800 (PST)
In-Reply-To: <1392173107-21170-2-git-send-email-flihp@twobit.us>
References: <1392173107-21170-1-git-send-email-flihp@twobit.us>
	<1392173107-21170-2-git-send-email-flihp@twobit.us>
Date: Wed, 12 Feb 2014 10:40:09 -0500
Message-ID: <CADkTA4M9vk053S65KVYGaA2dwns1tQW9drmnuDhtaLOXe_KB3A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC 1/3] xen: Create structure necessary to break Xen kernel config into dom0 / guest.
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
X-List-Received-Date: Wed, 12 Feb 2014 15:40:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 9:45 PM, Philip Tricca <flihp@twobit.us> wrote:
> For now the config remains the same for both dom0 and guest
> DISTRO_FEATURES. This work provides the structure for migrating
> config options into the two different distro features as the need
> arises.

I have a similar split for KVM hosts and guests, the options are largely
the same, but the flexibility is maintained for cases where they really
do need to differ.

But here's a more general question, rather than having to trigger on
distro features, why not separate the differences based on different machines ?
(maybe that is what you are already doing, and I'm missing it).

i.e. for a KVM host, I use the "native" BSP + some kernel options. For the
KVM guest, I have a x86-kvm-guest BSP that encapsulates the options
and userspace that we want.

The kernel configurations and other changes you have here would be the
same, but just with a different separation mechanism.

Cheers,

Bruce

>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
>
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-common.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-dom0.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-dom0.scc
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.scc
>  delete mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
>  delete mode 100644 recipes-kernel/linux/linux-yocto/xen.scc
>
> diff --git a/recipes-kernel/linux/linux-yocto/xen-common.cfg b/recipes-kernel/linux/linux-yocto/xen-common.cfg
> new file mode 100644
> index 0000000..4e796b9
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/xen-common.cfg
> @@ -0,0 +1,54 @@
> +###
> +# linux 3.4, 3.8
> +CONFIG_PARAVIRT_GUEST=y
> +###
> +
> +###
> +# linux 3.10
> +CONFIG_HYPERVISOR_GUEST=y
> +###
> +
> +CONFIG_PARAVIRT=y
> +CONFIG_XEN=y
> +CONFIG_XEN_DOM0=y
> +CONFIG_XEN_PRIVILEGED_GUEST=y
> +CONFIG_XEN_PVHVM=y
> +CONFIG_XEN_MAX_DOMAIN_MEMORY=500
> +CONFIG_XEN_SAVE_RESTORE=y
> +CONFIG_PARAVIRT_CLOCK=y
> +CONFIG_HIBERNATE_CALLBACKS=y
> +CONFIG_PCI_XEN=y
> +CONFIG_XEN_PCIDEV_FRONTEND=y
> +CONFIG_SYS_HYPERVISOR=y
> +CONFIG_XEN_BLKDEV_FRONTEND=y
> +CONFIG_XEN_BLKDEV_BACKEND=m
> +CONFIG_XEN_NETDEV_FRONTEND=y
> +CONFIG_XEN_NETDEV_BACKEND=m
> +CONFIG_INPUT_MISC=y
> +CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
> +CONFIG_HVC_IRQ=y
> +CONFIG_HVC_XEN=y
> +CONFIG_HVC_XEN_FRONTEND=y
> +CONFIG_XEN_WDT=m
> +CONFIG_FB_SYS_FILLRECT=y
> +CONFIG_FB_SYS_COPYAREA=y
> +CONFIG_FB_SYS_IMAGEBLIT=y
> +CONFIG_FB_SYS_FOPS=y
> +CONFIG_FB_DEFERRED_IO=y
> +CONFIG_XEN_FBDEV_FRONTEND=y
> +CONFIG_XEN_BALLOON=y
> +CONFIG_XEN_SCRUB_PAGES=y
> +CONFIG_XEN_DEV_EVTCHN=y
> +CONFIG_XEN_BACKEND=y
> +CONFIG_XENFS=y
> +CONFIG_XEN_COMPAT_XENFS=y
> +CONFIG_XEN_SYS_HYPERVISOR=y
> +CONFIG_XEN_XENBUS_FRONTEND=y
> +CONFIG_XEN_GNTDEV=m
> +CONFIG_XEN_GRANT_DEV_ALLOC=m
> +CONFIG_SWIOTLB_XEN=y
> +CONFIG_XEN_PCIDEV_BACKEND=m
> +CONFIG_XEN_PRIVCMD=y
> +CONFIG_XEN_ACPI_PROCESSOR=m
> +CONFIG_XEN_MCE_LOG=y
> +CONFIG_XEN_HAVE_PVMMU=y
> diff --git a/recipes-kernel/linux/linux-yocto/xen-dom0.cfg b/recipes-kernel/linux/linux-yocto/xen-dom0.cfg
> new file mode 100644
> index 0000000..e69de29
> diff --git a/recipes-kernel/linux/linux-yocto/xen-dom0.scc b/recipes-kernel/linux/linux-yocto/xen-dom0.scc
> new file mode 100644
> index 0000000..a84b0cb
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/xen-dom0.scc
> @@ -0,0 +1,5 @@
> +define KFEATURE_DESCRIPTION "Xen dom0 Kernel Support"
> +define KFEATURE_COMPATIBILITY arch
> +
> +kconf non-hardware xen-common.cfg
> +kconf non-hardware xen-dom0.cfg
> diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.cfg b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
> new file mode 100644
> index 0000000..e69de29
> diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.scc b/recipes-kernel/linux/linux-yocto/xen-guest.scc
> new file mode 100644
> index 0000000..0edba0c
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/xen-guest.scc
> @@ -0,0 +1,5 @@
> +define KFEATURE_DESCRIPTION "Xen Guest Kernel Support"
> +define KFEATURE_COMPATIBILITY arch
> +
> +kconf non-hardware xen-common.cfg
> +kconf non-hardware xen-guest.cfg
> diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
> deleted file mode 100644
> index 4e796b9..0000000
> --- a/recipes-kernel/linux/linux-yocto/xen.cfg
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -###
> -# linux 3.4, 3.8
> -CONFIG_PARAVIRT_GUEST=y
> -###
> -
> -###
> -# linux 3.10
> -CONFIG_HYPERVISOR_GUEST=y
> -###
> -
> -CONFIG_PARAVIRT=y
> -CONFIG_XEN=y
> -CONFIG_XEN_DOM0=y
> -CONFIG_XEN_PRIVILEGED_GUEST=y
> -CONFIG_XEN_PVHVM=y
> -CONFIG_XEN_MAX_DOMAIN_MEMORY=500
> -CONFIG_XEN_SAVE_RESTORE=y
> -CONFIG_PARAVIRT_CLOCK=y
> -CONFIG_HIBERNATE_CALLBACKS=y
> -CONFIG_PCI_XEN=y
> -CONFIG_XEN_PCIDEV_FRONTEND=y
> -CONFIG_SYS_HYPERVISOR=y
> -CONFIG_XEN_BLKDEV_FRONTEND=y
> -CONFIG_XEN_BLKDEV_BACKEND=m
> -CONFIG_XEN_NETDEV_FRONTEND=y
> -CONFIG_XEN_NETDEV_BACKEND=m
> -CONFIG_INPUT_MISC=y
> -CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
> -CONFIG_HVC_IRQ=y
> -CONFIG_HVC_XEN=y
> -CONFIG_HVC_XEN_FRONTEND=y
> -CONFIG_XEN_WDT=m
> -CONFIG_FB_SYS_FILLRECT=y
> -CONFIG_FB_SYS_COPYAREA=y
> -CONFIG_FB_SYS_IMAGEBLIT=y
> -CONFIG_FB_SYS_FOPS=y
> -CONFIG_FB_DEFERRED_IO=y
> -CONFIG_XEN_FBDEV_FRONTEND=y
> -CONFIG_XEN_BALLOON=y
> -CONFIG_XEN_SCRUB_PAGES=y
> -CONFIG_XEN_DEV_EVTCHN=y
> -CONFIG_XEN_BACKEND=y
> -CONFIG_XENFS=y
> -CONFIG_XEN_COMPAT_XENFS=y
> -CONFIG_XEN_SYS_HYPERVISOR=y
> -CONFIG_XEN_XENBUS_FRONTEND=y
> -CONFIG_XEN_GNTDEV=m
> -CONFIG_XEN_GRANT_DEV_ALLOC=m
> -CONFIG_SWIOTLB_XEN=y
> -CONFIG_XEN_PCIDEV_BACKEND=m
> -CONFIG_XEN_PRIVCMD=y
> -CONFIG_XEN_ACPI_PROCESSOR=m
> -CONFIG_XEN_MCE_LOG=y
> -CONFIG_XEN_HAVE_PVMMU=y
> diff --git a/recipes-kernel/linux/linux-yocto/xen.scc b/recipes-kernel/linux/linux-yocto/xen.scc
> deleted file mode 100644
> index b588e5d..0000000
> --- a/recipes-kernel/linux/linux-yocto/xen.scc
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -define KFEATURE_DESCRIPTION "Xen Kernel Support"
> -define KFEATURE_COMPATIBILITY arch
> -
> -kconf non-hardware xen.cfg
> diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
> index c029c05..e4ae462 100644
> --- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
> @@ -16,4 +16,8 @@ module_autoload_kvm-intel = "kvm-intel"
>  KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
>
>  # xen kernel support
> -SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
> +SRC_URI += " \
> +    ${@base_contains('DISTRO_FEATURES', 'xen-dom0', ' file://xen-dom0.scc', '', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'xen-guest', ' file://xen-guest.scc', '', d)} \
> +"
> +
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

