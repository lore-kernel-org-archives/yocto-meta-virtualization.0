Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86664E006EA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Oct 2013 10:23:13 -0700 (PDT)
Received: from host60.citrix.com ([66.165.176.60] helo=[172.16.1.10])
	by www.twobit.us with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VTEWV-0005I0-K9; Mon, 07 Oct 2013 17:23:12 +0000
Message-ID: <5252EDC5.9010101@twobit.us>
Date: Mon, 07 Oct 2013 13:22:13 -0400
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
In-Reply-To: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 66.165.176.60
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] linux-yocto: Add xen guest kernel fragment support for PV/HVM guests, using 'xen-guest' distro flag.
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
X-List-Received-Date: Mon, 07 Oct 2013 17:23:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm not the gate-keeper here so feel free to disagree but I'd like this more if it were broken up a bit. Thoughts on breaking guest support out into a PV guest and a PVHVM guest? The goal here would be to partition the kernel options that aren't modules (specifically PVHVM, DOM0, PVMMU, PRIVILEGED_GUEST etc).

No need to do all of this on the first past I suppose. It may be better to have someone propose a partitioning after this gets picked up.

Also: what's with having 'KVM_GUEST' compiled in? Is it a dependency?

Cheers,
- Philip

On 10/06/2013 05:22 PM, Chris Patterson wrote:
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto/xen-guest.cfg | 55 ++++++++++++++++++++++++++
>  recipes-kernel/linux/linux-yocto/xen-guest.scc |  4 ++
>  recipes-kernel/linux/linux-yocto_3.10.bbappend |  3 ++
>  recipes-kernel/linux/linux-yocto_3.4.bbappend  |  3 ++
>  recipes-kernel/linux/linux-yocto_3.8.bbappend  |  3 ++
>  5 files changed, 68 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.scc
> 
> diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.cfg b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
> new file mode 100644
> index 0000000..cbde3cc
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
> @@ -0,0 +1,55 @@
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
> +CONFIG_KVM_GUEST=y
> +CONFIG_PARAVIRT_CLOCK=y
> +CONFIG_HIBERNATE_CALLBACKS=y
> +CONFIG_PCI_XEN=y
> +CONFIG_XEN_PCIDEV_FRONTEND=m
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
> +CONFIG_XEN_GNTDEV=y
> +CONFIG_XEN_GRANT_DEV_ALLOC=y
> +CONFIG_SWIOTLB_XEN=y
> +CONFIG_XEN_PCIDEV_BACKEND=m
> +CONFIG_XEN_PRIVCMD=m
> +CONFIG_XEN_ACPI_PROCESSOR=m
> +CONFIG_XEN_MCE_LOG=y
> +CONFIG_XEN_HAVE_PVMMU=y
> diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.scc b/recipes-kernel/linux/linux-yocto/xen-guest.scc
> new file mode 100644
> index 0000000..575bc43
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/xen-guest.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Xen PV Guest Support"
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware xen-guest.cfg
> diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
> index cc7fd98..a3165cd 100644
> --- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
> @@ -17,3 +17,6 @@ KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' feature
>  
>  # xen dom0 kernel support
>  SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
> +
> +# xen guest kernel support
> +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen-guest', ' file://xen-guest.scc', '', d)}"
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 448d57f..4d3a0d1 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -14,3 +14,6 @@ module_autoload_kvm-intel = "kvm-intel"
>  
>  # xen dom0 kernel support
>  SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
> +
> +# xen guest kernel support
> +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen-guest', ' file://xen-guest.scc', '', d)}"
> diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> index cc7fd98..a3165cd 100644
> --- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> @@ -17,3 +17,6 @@ KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' feature
>  
>  # xen dom0 kernel support
>  SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
> +
> +# xen guest kernel support
> +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen-guest', ' file://xen-guest.scc', '', d)}"
> 


