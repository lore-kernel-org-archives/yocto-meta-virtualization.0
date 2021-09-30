Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13727.1633013671760426750
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 07:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 106C9101E;
	Thu, 30 Sep 2021 07:54:31 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com [10.1.195.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94BE63F70D;
	Thu, 30 Sep 2021 07:54:30 -0700 (PDT)
From: "luca fancellu" <luca.fancellu@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bertrand.marquis@arm.com
Subject: [PATCH 1/2] xen, rpi4: Fix syntax in linux-yocto bbappend
Date: Thu, 30 Sep 2021 15:54:22 +0100
Message-Id: <20210930145423.17162-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Syntax conversion for bbappend linux-yocto_5.10
and linux-yocto-dev inside the raspberrypi
dynamic layer.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .../recipes-kernel/linux/linux-yocto-dev.bbappend           | 6 +++---
 .../recipes-kernel/linux/linux-yocto_5.10.bbappend          | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
index 8381e44..5f43052 100644
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -1,8 +1,8 @@
 # For a Xen-enabled distro on the Raspberry Pi, override the contents of cmdline.txt
 # with Xen-on-ARM-specific command line options
 
-KBRANCH_raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
-KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
-COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
+KBRANCH:raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
+KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
+COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
 
 require linux-yocto_xen-rpi.inc
diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
index af92493..f279ef7 100644
--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -1,6 +1,6 @@
 # Enable use of the linux-yocto 5.10 kernel for the Raspberry Pi 4
-KBRANCH_raspberrypi4-64 ?= "v5.10/standard/bcm-2xxx-rpi"
-KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
-COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
+KBRANCH:raspberrypi4-64 ?= "v5.10/standard/bcm-2xxx-rpi"
+KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
+COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
 
 require linux-yocto_xen-rpi.inc
-- 
2.17.1

