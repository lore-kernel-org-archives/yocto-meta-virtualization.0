Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13811.1633013672258595519
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 07:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0E60113E;
	Thu, 30 Sep 2021 07:54:31 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com [10.1.195.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41B4E3F70D;
	Thu, 30 Sep 2021 07:54:31 -0700 (PDT)
From: "luca fancellu" <luca.fancellu@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bertrand.marquis@arm.com
Subject: [PATCH 2/2] xen, rpi4: Use PARTUUID for rootfs discovery
Date: Thu, 30 Sep 2021 15:54:23 +0100
Message-Id: <20210930145423.17162-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930145423.17162-1-luca.fancellu@arm.com>
References: <20210930145423.17162-1-luca.fancellu@arm.com>

The mmc probing order has become unpredictable
due to recent linux kernel changes, therefore devices
like the raspberry pi that have two mmc interface most
of the time can't boot from the hard-coded root path.

Modify the u-boot script to fetch the PARTUUID of the
second partition of the sd card and use it to put
root=PARTUUID=<xxx> in the command line passed to
the dom0 kernel.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in          | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
index 0367e36..9874220 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
@@ -13,10 +13,6 @@ fdt resize 0x1000
 echo Add boot arguments for Xen
 fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=/soc/serial@7e215040 dom0_mem='@@RPI_DOM0_MEM@@' @@RPI_DEBUG_XEN_ARGS@@"
 
-echo Add boot arguments for dom0
-setenv dom0_bootargs "console=hvc0 earlycon=xenboot debug root=/dev/mmcblk0p2 rootwait"
-fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
-
 echo Add a dom0 node to chosen to put Linux boot information in
 fdt mknode /chosen dom0
 
@@ -32,6 +28,13 @@ fdt rm /scb/pcie@7d500000/pci@1,0/usb@1,0
 echo Delay to allow the MMC card to be ready
 sleep 1
 
+# Retrieve PARTUUID for the rootfs partition of the sdcard
+part uuid mmc 1:2 rootfs_partuuid
+
+echo Add boot arguments for dom0
+setenv dom0_bootargs "console=hvc0 earlycon=xenboot debug root=PARTUUID=${rootfs_partuuid} rootwait"
+fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
+
 echo Load Xen into memory
 fatload mmc 1:1 ${xen_loadaddr} xen
 echo Xen loaded, size: 0x$filesize
-- 
2.17.1

