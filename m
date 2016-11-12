Return-Path: <andrew.stuart@supercoders.com.au>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1AE5E009CE; Fri, 11 Nov 2016 21:23:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UPPERCASE_50_75
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0003]
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
X-Greylist: delayed 549 seconds by postgrey-1.32 at yocto-www;
	Fri, 11 Nov 2016 21:23:31 PST
Received: from mail.supercoders.com.au (mail.supercoders.com.au [54.215.13.78])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1955E0093B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Nov 2016 21:23:31 -0800 (PST)
Received: from [192.168.1.132] (unknown [101.167.6.11])
	by mail.supercoders.com.au (Postfix) with ESMTPS id EE04B608AA
	for <meta-virtualization@yoctoproject.org>;
	Sat, 12 Nov 2016 05:14:21 +0000 (UTC)
From: Andrew Stuart <andrew.stuart@supercoders.com.au>
Message-Id: <689434D1-C433-4938-9F84-8F24C30093F6@supercoders.com.au>
Date: Sat, 12 Nov 2016 16:14:19 +1100
To: meta-virtualization@yoctoproject.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Subject: How do I enable all Xen device drivers?
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
X-List-Received-Date: Sat, 12 Nov 2016 05:23:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The problem I have is that I do not see an eth0 when running on Xen / =
EC2

I am trying to enable the correct Xen drivers.

I can see that this file contains what appars to be the correct kernel =
settings:

Could comeone please explain to me - like I=E2=80=99m five years old =
because I=E2=80=99m new to Yocto - what I need to do to get my build to =
use these settings please?

thanks!


poky/meta-virtualization/recipes-kernel/linux/linux-yocto/xen.cfg

CONFIG_HYPERVISOR_GUEST=3Dy
CONFIG_PARAVIRT=3Dy
CONFIG_XEN=3Dy
CONFIG_XEN_DOM0=3Dy
CONFIG_XEN_PVHVM=3Dy
CONFIG_XEN_MAX_DOMAIN_MEMORY=3D500
CONFIG_XEN_SAVE_RESTORE=3Dy
# CONFIG_XEN_DEBUG_FS is not set
CONFIG_XEN_PVH=3Dy
CONFIG_MMU_NOTIFIER=3Dy
CONFIG_HIBERNATE_CALLBACKS=3Dy
CONFIG_PCI_XEN=3Dy
CONFIG_XEN_PCIDEV_FRONTEND=3Dy
CONFIG_SYS_HYPERVISOR=3Dy
CONFIG_XEN_BLKDEV_FRONTEND=3Dy
CONFIG_XEN_BLKDEV_BACKEND=3Dm
CONFIG_XEN_SCSI_FRONTEND=3Dm
CONFIG_XEN_NETDEV_FRONTEND=3Dy
CONFIG_XEN_NETDEV_BACKEND=3Dm
CONFIG_INPUT_MISC=3Dy
CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dy
CONFIG_HVC_IRQ=3Dy
CONFIG_HVC_XEN=3Dy
CONFIG_HVC_XEN_FRONTEND=3Dy
CONFIG_XEN_WDT=3Dm
CONFIG_FB_SYS_FILLRECT=3Dy
CONFIG_FB_SYS_COPYAREA=3Dy
CONFIG_FB_SYS_IMAGEBLIT=3Dy
CONFIG_FB_SYS_FOPS=3Dy
CONFIG_FB_DEFERRED_IO=3Dy
CONFIG_XEN_FBDEV_FRONTEND=3Dy
CONFIG_XEN_BALLOON=3Dy
CONFIG_XEN_SCRUB_PAGES=3Dy
CONFIG_XEN_DEV_EVTCHN=3Dy
CONFIG_XEN_BACKEND=3Dy
CONFIG_XENFS=3Dy
CONFIG_XEN_COMPAT_XENFS=3Dy
CONFIG_XEN_SYS_HYPERVISOR=3Dy
CONFIG_XEN_XENBUS_FRONTEND=3Dy
CONFIG_XEN_GNTDEV=3Dm
CONFIG_XEN_GRANT_DEV_ALLOC=3Dm
CONFIG_SWIOTLB_XEN=3Dy
CONFIG_XEN_PCIDEV_BACKEND=3Dm
CONFIG_XEN_PRIVCMD=3Dy
CONFIG_XEN_ACPI_PROCESSOR=3Dm
CONFIG_XEN_MCE_LOG=3Dy
CONFIG_XEN_HAVE_PVMMU=3Dy
CONFIG_XEN_EFI=3Dy
CONFIG_XEN_AUTO_XLATE=3Dy
CONFIG_XEN_ACPI=3Dy=

