Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BEA7E005B4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 22:32:20 -0700 (PDT)
Received: by mail-la0-f46.google.com with SMTP id eh20so1153267lab.33
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=l78kxIVbGvljD4zq69BDB1Gunr3ZhNTijOODOrScr/Q=;
	b=sQ0oUu6+sT/GgLRZjf0eMScUg+SQ7RXdEIxrAHqH5+xPKqJqk2rLE+v262E+lEOgBy
	5z8LTUZDjUVeWZBZ6lQLBaEwgoEgyNC2kKtYZDL8BIBQ9bnxuroXkKIcAyjr+AHs7Ljw
	emXXDbQsSXVXIGHdQxE7oHnWZ2ZCN+Agomqafiz3jwHpTQx5EYDakzipM+IzxGPvjMNS
	FlrF4R+SvqYqns+ed7QvLhNAr15CrtPcXy6F2m2KzjIJ/hLSK97ZbXQCLSvV8DDFgtuV
	+FdWLY8WJV0IP/5snUsjYB5N7BcRHUWtyqiPYM/PzP+9wC7KhANKKEpdLD6J80lLvfy3
	YUYA==
MIME-Version: 1.0
X-Received: by 10.152.115.242 with SMTP id jr18mr29437lab.40.1377840739345;
	Thu, 29 Aug 2013 22:32:19 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 22:32:19 -0700 (PDT)
In-Reply-To: <1377833844-14672-2-git-send-email-cjp256@gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-2-git-send-email-cjp256@gmail.com>
Date: Fri, 30 Aug 2013 01:32:19 -0400
Message-ID: <CADkTA4MAHOGDS7=8VMQQuUYDq_uGXq04WRyGqhfkVw=NBLHxOA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] linux-yocto: add kernel fragment and scc for xen dom0 kernel support.
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
X-List-Received-Date: Fri, 30 Aug 2013 05:32:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 11:37 PM, Chris Patterson <cjp256@gmail.com> wrote:
> ---
>  recipes-kernel/linux/linux-yocto/xen.cfg |   53 ++++++++++++++++++++++++++++++
>  recipes-kernel/linux/linux-yocto/xen.scc |    4 +++
>  2 files changed, 57 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc
>
> diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
> new file mode 100644
> index 0000000..f9cfb6a
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/xen.cfg

Nice. The fragment looks good. I'd actually like to bump this up to the level of
in-tree support that we have for KVM.

And by that, I mean that I can merge this to the meta branch of the linux-yocto
kernel (and also found in the tracking yocto-kernel-cache repository).

Once there, it can be built and tested standalone, as well as shared by other
feature fragments. You'd then be able to just enable it via a KERNEL_FEATURES
entry, just like KVM.

Cheers,

Bruce

> @@ -0,0 +1,53 @@
> +..........................................................................
> +.                                WARNING
> +.
> +. This file is a kernel configuration fragment, and not a full kernel
> +. configuration file.  The final kernel configuration is made up of
> +. an assembly of processed fragments, each of which is designed to
> +. capture a specific part of the final configuration (e.g. platform
> +. configuration, feature configuration, and board specific hardware
> +. configuration).  For more information on kernel configuration, please
> +. consult the product documentation.
> +.
> +..........................................................................
> +
> +CONFIG_PARAVIRT_GUEST=y
> +# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> +CONFIG_XEN=y
> +CONFIG_XEN_DOM0=y
> +CONFIG_XEN_PRIVILEGED_GUEST=y
> +CONFIG_XEN_PVHVM=y
> +CONFIG_XEN_MAX_DOMAIN_MEMORY=500
> +CONFIG_XEN_SAVE_RESTORE=y
> +# CONFIG_XEN_DEBUG_FS is not set
> +CONFIG_PARAVIRT=y
> +# CONFIG_PARAVIRT_SPINLOCKS is not set
> +CONFIG_PARAVIRT_CLOCK=y
> +# CONFIG_PARAVIRT_DEBUG is not set
> +CONFIG_PCI_XEN=y
> +CONFIG_XEN_PCIDEV_FRONTEND=m
> +CONFIG_XEN_BLKDEV_FRONTEND=m
> +CONFIG_XEN_BLKDEV_BACKEND=m
> +CONFIG_XEN_NETDEV_FRONTEND=m
> +CONFIG_XEN_NETDEV_BACKEND=m
> +CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
> +CONFIG_HVC_XEN=y
> +CONFIG_HVC_XEN_FRONTEND=y
> +CONFIG_XEN_WDT=m
> +CONFIG_XEN_FBDEV_FRONTEND=y
> +# Xen driver support
> +CONFIG_XEN_BALLOON=y
> +CONFIG_XEN_SCRUB_PAGES=y
> +CONFIG_XEN_DEV_EVTCHN=m
> +CONFIG_XEN_BACKEND=y
> +CONFIG_XENFS=m
> +CONFIG_XEN_COMPAT_XENFS=y
> +CONFIG_XEN_SYS_HYPERVISOR=y
> +CONFIG_XEN_XENBUS_FRONTEND=y
> +CONFIG_XEN_GNTDEV=m
> +CONFIG_XEN_GRANT_DEV_ALLOC=m
> +CONFIG_SWIOTLB_XEN=y
> +CONFIG_XEN_PCIDEV_BACKEND=y
> +CONFIG_XEN_PRIVCMD=m
> +CONFIG_XEN_ACPI_PROCESSOR=m
> +CONFIG_PCI_STUB=y
> diff --git a/recipes-kernel/linux/linux-yocto/xen.scc b/recipes-kernel/linux/linux-yocto/xen.scc
> new file mode 100644
> index 0000000..6c68bda
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/xen.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Xen Dom0 Support"
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware xen.cfg
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

