Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.4209.1619253096577132727
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Apr 2021 01:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bbhd4ejx;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id 18so24687854qtz.6
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Apr 2021 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jna1jFJBPwplTz3/ESkMwSPUgGA9zHXE4Qw70ytHKts=;
        b=bbhd4ejxP/ELA20n9WN2iuecOZWxzOH4uLzvBKihJ/Y/nkZfpV6mEA+lcQ/ZJShxUG
         rJzXIRi7XxEkGOwzUKX/VU5sNwl8iuHMwgz3eysGG+APOsfxGs7TH6Arc1GfdRMy0Co3
         YkUSNAuXlDnNaXfmB4mh6Q3K0d8IxO+vd4ScdTMB/+8VCgobr0zYwT18Mh6sqQwiv7n2
         8gsin8FTOU6YDTRvG/dJeLiKwAOEuH+uZskEaEMZVnke+bVmMz2JBDEkRBVWnHlJtAhD
         IA5Av1yDyuLkLSEw8qj873lYmwLfrc/vmxLbnviX7Nyd/yise832KYlb8wC9rFd+g/3q
         L6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jna1jFJBPwplTz3/ESkMwSPUgGA9zHXE4Qw70ytHKts=;
        b=AOHtFOcR2VqCxciuqkYEXFTbJMS/Fj4hKFnumzW8Tftj4Dz25W66kdmOsvvmwue5Uu
         p0bq1RgiHV53SV45FzjVOUdWuSH9guQaypeuaYoA3U4O4WUslJ/3JmyEIHkqc5d8M1Of
         Pge9/ZqoJWO+PoKmP/Tm6Qc5gGrWmr2iLkLFVORNpfWnGqnupGjb9xecktCUAZlx6+Ny
         P6G2dSWmxGu/CMjm5yOJkN1IO5+Tmy6kuObqw0j72iUUKDjoyzcivzS9fXDd/6uGMs5v
         IrLcr5iIxfz2pHahmNR3QPW8chddrhVP2g/ZX61mFYnmGLimzbF//LIaQ+sSfqB9v1wN
         5Uyw==
X-Gm-Message-State: AOAM530oiFnNM+8kozEK6QVX4Prxil0CvLOCtRWUqN66ONpfU8AU5rmD
	AerAerRVT5eGEK9lGn00DCGjHFh56YE=
X-Google-Smtp-Source: ABdhPJzVZmI0feUGXplKu/Ydu/Qi63DbC3zKIz4waxu3LUbigBS0GT9CtFFYLaNm10x+I02g5Vg3zA==
X-Received: by 2002:ac8:5b86:: with SMTP id a6mr7092729qta.293.1619253095586;
        Sat, 24 Apr 2021 01:31:35 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-81.mycingular.net. [166.176.184.81])
        by smtp.gmail.com with ESMTPSA id x24sm5984951qtm.95.2021.04.24.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:31:35 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 7/8] xen, rpi4: move rpi4-machine+xen-distro cfg into dynamic layer
Date: Sat, 24 Apr 2021 01:31:02 -0700
Message-Id: <20210424083103.202107-8-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424083103.202107-1-christopher.w.clark@gmail.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve meta-virt-xen.inc by moving all the Raspberry Pi 4 config
settings to a new xen-raspberrypi4-64.inc file in the raspberrypi
dynamic layer.

The new .inc file is included only for the raspberrypi4-64 MACHINE,
so the config settings no longer need to be applied using overrides.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 conf/distro/include/meta-virt-xen.inc         | 22 ++++--------------
 .../distro/include/xen-raspberrypi4-64.inc    | 23 +++++++++++++++++++
 2 files changed, 28 insertions(+), 17 deletions(-)
 create mode 100644 dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc

diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index 584cd6e..02a7810 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -5,20 +5,8 @@ PACKAGECONFIG_append_pn-qemu = " xen"
 PACKAGECONFIG_append_pn-qemu_arm = " fdt"
 PACKAGECONFIG_append_pn-qemu_aarch64 = " fdt"
 
-# Raspberry Pi settings
-# Xen uses u-boot for configuration and uses the uart
-RPI_USE_U_BOOT_raspberrypi4-64 = "1"
-ENABLE_UART_raspberrypi4-64 = "1"
-# Build the bootable SD card image
-IMAGE_CLASSES_append_raspberrypi4-64 = " sdcard_image-rpi"
-IMAGE_FSTYPES_append_raspberrypi4-64 = " rpi-sdimg"
-# Add Xen to the bootable SD card image
-RPI_SDIMG_EXTRA_DEPENDS_append_raspberrypi4-64 = " xen:do_deploy"
-DEPLOYPAYLOAD_raspberrypi4-64 = "xen-${MACHINE}:xen"
-# We need the GIC enabled for Xen to work
-RPI_EXTRA_CONFIG_append_raspberrypi4-64  = "\nenable_gic=1"
-# Increase boot partition for space for kernel and Xen
-BOOT_SPACE_raspberrypi4-64 = "61440"
-# Override the meta-raspberrypi default kernel preference
-PREFERRED_PROVIDER_virtual/kernel_raspberrypi4-64 ?= "linux-yocto"
-KERNEL_DEVICETREE_raspberrypi4-64 ?= "broadcom/bcm2711-rpi-4-b.dtb"
+# Xen on Raspberry Pi 4 64-bit support
+XEN_RPI4_64_CONFIG_PATH ??= \
+    'dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc'
+include ${@bb.utils.contains('MACHINE', 'raspberrypi4-64', \
+    '${XEN_RPI4_64_CONFIG_PATH}', '', d)}
diff --git a/dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc b/dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc
new file mode 100644
index 0000000..9c36255
--- /dev/null
+++ b/dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc
@@ -0,0 +1,23 @@
+# Xen on Raspberry Pi 4 settings
+
+# Xen uses u-boot for configuration and uses the uart
+RPI_USE_U_BOOT = "1"
+ENABLE_UART = "1"
+
+# Build the bootable SD card image
+IMAGE_CLASSES_append = " sdcard_image-rpi"
+IMAGE_FSTYPES_append = " rpi-sdimg"
+
+# Add Xen to the bootable SD card image
+RPI_SDIMG_EXTRA_DEPENDS_append = " xen:do_deploy"
+DEPLOYPAYLOAD = "xen-${MACHINE}:xen"
+
+# We need the GIC enabled for Xen to work
+RPI_EXTRA_CONFIG_append  = "\nenable_gic=1"
+
+# Increase boot partition for space for kernel and Xen
+BOOT_SPACE = "61440"
+
+# Override the meta-raspberrypi default kernel preference
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+KERNEL_DEVICETREE ?= "broadcom/bcm2711-rpi-4-b.dtb"
-- 
2.25.1

