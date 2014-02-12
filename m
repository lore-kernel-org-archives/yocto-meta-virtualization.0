Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E831EE0077B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Feb 2014 14:12:29 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[172.16.1.12]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1WDi0r-0003VD-Er; Wed, 12 Feb 2014 22:10:39 +0000
Message-ID: <52FBF1C4.6070101@twobit.us>
Date: Wed, 12 Feb 2014 17:12:20 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20131104 Icedove/17.0.10
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1392173107-21170-1-git-send-email-flihp@twobit.us>
	<1392173107-21170-2-git-send-email-flihp@twobit.us>
	<CADkTA4M9vk053S65KVYGaA2dwns1tQW9drmnuDhtaLOXe_KB3A@mail.gmail.com>
In-Reply-To: <CADkTA4M9vk053S65KVYGaA2dwns1tQW9drmnuDhtaLOXe_KB3A@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
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
X-List-Received-Date: Wed, 12 Feb 2014 22:12:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/12/2014 10:40 AM, Bruce Ashfield wrote:
> On Tue, Feb 11, 2014 at 9:45 PM, Philip Tricca <flihp@twobit.us> wrote:
>> For now the config remains the same for both dom0 and guest
>> DISTRO_FEATURES. This work provides the structure for migrating
>> config options into the two different distro features as the need
>> arises.
> 
> I have a similar split for KVM hosts and guests, the options are largely
> the same, but the flexibility is maintained for cases where they really
> do need to differ.
> 
> But here's a more general question, rather than having to trigger on
> distro features, why not separate the differences based on different machines ?
> (maybe that is what you are already doing, and I'm missing it).

No you're spot-on, didn't miss a thing.

> i.e. for a KVM host, I use the "native" BSP + some kernel options. For the
> KVM guest, I have a x86-kvm-guest BSP that encapsulates the options
> and userspace that we want.
> 
> The kernel configurations and other changes you have here would be the
> same, but just with a different separation mechanism.

This sounds like a great suggestion. I'll take a look at what you all
have done with KVM. It does sound like a better fit. I'll send out a v2
once I've got my head around using the machine mechanisms.

Thanks,
Philip

>> Signed-off-by: Philip Tricca <flihp@twobit.us>
>>
>>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-common.cfg
>>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-dom0.cfg
>>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-dom0.scc
>>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.cfg
>>  create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.scc
>>  delete mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
>>  delete mode 100644 recipes-kernel/linux/linux-yocto/xen.scc
>>
>> diff --git a/recipes-kernel/linux/linux-yocto/xen-common.cfg b/recipes-kernel/linux/linux-yocto/xen-common.cfg
>> new file mode 100644
>> index 0000000..4e796b9
>> --- /dev/null
>> +++ b/recipes-kernel/linux/linux-yocto/xen-common.cfg
>> @@ -0,0 +1,54 @@
>> +###
>> +# linux 3.4, 3.8
>> +CONFIG_PARAVIRT_GUEST=y
>> +###
>> +
>> +###
>> +# linux 3.10
>> +CONFIG_HYPERVISOR_GUEST=y
>> +###
>> +
>> +CONFIG_PARAVIRT=y
>> +CONFIG_XEN=y
>> +CONFIG_XEN_DOM0=y
>> +CONFIG_XEN_PRIVILEGED_GUEST=y
>> +CONFIG_XEN_PVHVM=y
>> +CONFIG_XEN_MAX_DOMAIN_MEMORY=500
>> +CONFIG_XEN_SAVE_RESTORE=y
>> +CONFIG_PARAVIRT_CLOCK=y
>> +CONFIG_HIBERNATE_CALLBACKS=y
>> +CONFIG_PCI_XEN=y
>> +CONFIG_XEN_PCIDEV_FRONTEND=y
>> +CONFIG_SYS_HYPERVISOR=y
>> +CONFIG_XEN_BLKDEV_FRONTEND=y
>> +CONFIG_XEN_BLKDEV_BACKEND=m
>> +CONFIG_XEN_NETDEV_FRONTEND=y
>> +CONFIG_XEN_NETDEV_BACKEND=m
>> +CONFIG_INPUT_MISC=y
>> +CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
>> +CONFIG_HVC_IRQ=y
>> +CONFIG_HVC_XEN=y
>> +CONFIG_HVC_XEN_FRONTEND=y
>> +CONFIG_XEN_WDT=m
>> +CONFIG_FB_SYS_FILLRECT=y
>> +CONFIG_FB_SYS_COPYAREA=y
>> +CONFIG_FB_SYS_IMAGEBLIT=y
>> +CONFIG_FB_SYS_FOPS=y
>> +CONFIG_FB_DEFERRED_IO=y
>> +CONFIG_XEN_FBDEV_FRONTEND=y
>> +CONFIG_XEN_BALLOON=y
>> +CONFIG_XEN_SCRUB_PAGES=y
>> +CONFIG_XEN_DEV_EVTCHN=y
>> +CONFIG_XEN_BACKEND=y
>> +CONFIG_XENFS=y
>> +CONFIG_XEN_COMPAT_XENFS=y
>> +CONFIG_XEN_SYS_HYPERVISOR=y
>> +CONFIG_XEN_XENBUS_FRONTEND=y
>> +CONFIG_XEN_GNTDEV=m
>> +CONFIG_XEN_GRANT_DEV_ALLOC=m
>> +CONFIG_SWIOTLB_XEN=y
>> +CONFIG_XEN_PCIDEV_BACKEND=m
>> +CONFIG_XEN_PRIVCMD=y
>> +CONFIG_XEN_ACPI_PROCESSOR=m
>> +CONFIG_XEN_MCE_LOG=y
>> +CONFIG_XEN_HAVE_PVMMU=y
>> diff --git a/recipes-kernel/linux/linux-yocto/xen-dom0.cfg b/recipes-kernel/linux/linux-yocto/xen-dom0.cfg
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/recipes-kernel/linux/linux-yocto/xen-dom0.scc b/recipes-kernel/linux/linux-yocto/xen-dom0.scc
>> new file mode 100644
>> index 0000000..a84b0cb
>> --- /dev/null
>> +++ b/recipes-kernel/linux/linux-yocto/xen-dom0.scc
>> @@ -0,0 +1,5 @@
>> +define KFEATURE_DESCRIPTION "Xen dom0 Kernel Support"
>> +define KFEATURE_COMPATIBILITY arch
>> +
>> +kconf non-hardware xen-common.cfg
>> +kconf non-hardware xen-dom0.cfg
>> diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.cfg b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
>> new file mode 100644
>> index 0000000..e69de29
>> diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.scc b/recipes-kernel/linux/linux-yocto/xen-guest.scc
>> new file mode 100644
>> index 0000000..0edba0c
>> --- /dev/null
>> +++ b/recipes-kernel/linux/linux-yocto/xen-guest.scc
>> @@ -0,0 +1,5 @@
>> +define KFEATURE_DESCRIPTION "Xen Guest Kernel Support"
>> +define KFEATURE_COMPATIBILITY arch
>> +
>> +kconf non-hardware xen-common.cfg
>> +kconf non-hardware xen-guest.cfg
>> diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
>> deleted file mode 100644
>> index 4e796b9..0000000
>> --- a/recipes-kernel/linux/linux-yocto/xen.cfg
>> +++ /dev/null
>> @@ -1,54 +0,0 @@
>> -###
>> -# linux 3.4, 3.8
>> -CONFIG_PARAVIRT_GUEST=y
>> -###
>> -
>> -###
>> -# linux 3.10
>> -CONFIG_HYPERVISOR_GUEST=y
>> -###
>> -
>> -CONFIG_PARAVIRT=y
>> -CONFIG_XEN=y
>> -CONFIG_XEN_DOM0=y
>> -CONFIG_XEN_PRIVILEGED_GUEST=y
>> -CONFIG_XEN_PVHVM=y
>> -CONFIG_XEN_MAX_DOMAIN_MEMORY=500
>> -CONFIG_XEN_SAVE_RESTORE=y
>> -CONFIG_PARAVIRT_CLOCK=y
>> -CONFIG_HIBERNATE_CALLBACKS=y
>> -CONFIG_PCI_XEN=y
>> -CONFIG_XEN_PCIDEV_FRONTEND=y
>> -CONFIG_SYS_HYPERVISOR=y
>> -CONFIG_XEN_BLKDEV_FRONTEND=y
>> -CONFIG_XEN_BLKDEV_BACKEND=m
>> -CONFIG_XEN_NETDEV_FRONTEND=y
>> -CONFIG_XEN_NETDEV_BACKEND=m
>> -CONFIG_INPUT_MISC=y
>> -CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
>> -CONFIG_HVC_IRQ=y
>> -CONFIG_HVC_XEN=y
>> -CONFIG_HVC_XEN_FRONTEND=y
>> -CONFIG_XEN_WDT=m
>> -CONFIG_FB_SYS_FILLRECT=y
>> -CONFIG_FB_SYS_COPYAREA=y
>> -CONFIG_FB_SYS_IMAGEBLIT=y
>> -CONFIG_FB_SYS_FOPS=y
>> -CONFIG_FB_DEFERRED_IO=y
>> -CONFIG_XEN_FBDEV_FRONTEND=y
>> -CONFIG_XEN_BALLOON=y
>> -CONFIG_XEN_SCRUB_PAGES=y
>> -CONFIG_XEN_DEV_EVTCHN=y
>> -CONFIG_XEN_BACKEND=y
>> -CONFIG_XENFS=y
>> -CONFIG_XEN_COMPAT_XENFS=y
>> -CONFIG_XEN_SYS_HYPERVISOR=y
>> -CONFIG_XEN_XENBUS_FRONTEND=y
>> -CONFIG_XEN_GNTDEV=m
>> -CONFIG_XEN_GRANT_DEV_ALLOC=m
>> -CONFIG_SWIOTLB_XEN=y
>> -CONFIG_XEN_PCIDEV_BACKEND=m
>> -CONFIG_XEN_PRIVCMD=y
>> -CONFIG_XEN_ACPI_PROCESSOR=m
>> -CONFIG_XEN_MCE_LOG=y
>> -CONFIG_XEN_HAVE_PVMMU=y
>> diff --git a/recipes-kernel/linux/linux-yocto/xen.scc b/recipes-kernel/linux/linux-yocto/xen.scc
>> deleted file mode 100644
>> index b588e5d..0000000
>> --- a/recipes-kernel/linux/linux-yocto/xen.scc
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -define KFEATURE_DESCRIPTION "Xen Kernel Support"
>> -define KFEATURE_COMPATIBILITY arch
>> -
>> -kconf non-hardware xen.cfg
>> diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
>> index c029c05..e4ae462 100644
>> --- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
>> +++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
>> @@ -16,4 +16,8 @@ module_autoload_kvm-intel = "kvm-intel"
>>  KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
>>
>>  # xen kernel support
>> -SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
>> +SRC_URI += " \
>> +    ${@base_contains('DISTRO_FEATURES', 'xen-dom0', ' file://xen-dom0.scc', '', d)} \
>> +    ${@base_contains('DISTRO_FEATURES', 'xen-guest', ' file://xen-guest.scc', '', d)} \
>> +"
>> +
>> --
>> 1.7.10.4
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 


