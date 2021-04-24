Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.4170.1619253098626072104
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Apr 2021 01:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bsEQMDvv;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id gv2so15674559qvb.8
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Apr 2021 01:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vv+aSHudtZIWl9V8CMTc5Y7y6fwDNILZ/jbVmLusKno=;
        b=bsEQMDvvcfjcvWvEwa0M+XxYvUmf2x5KkGkd512cZpf9Haup5t0nLd961dk+roddZk
         NVxHUfGCuexzCyQVa2PGZMIx2aU6uwH3eJcEeeJJ7jls2WAR3z67uhhRGmbV1BAGnD8O
         yrXBCY6mXY6ASWpGFzHXmkI2SGp8mHyMS14TCRevY+2gCRCztR41bKK4u74LQOJXq5g8
         9p4tMdKc8kxxqB2ZLVnOBayN+Sqid4GoKQKSdfCzcdSQ8z8VSnaz+N9waQ951Awn5Nz9
         tfoEoLYWlF0r0Wq+wi40sFJfEKlKx2C5/idcTTFsaNtKAF964hNjGEKkpumUistnxGrW
         hnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vv+aSHudtZIWl9V8CMTc5Y7y6fwDNILZ/jbVmLusKno=;
        b=lypUoNvRMJpGLy3ZdUFUWAmbCHRYPBzFO2T7nlykup9tToDId+K7OAordq8zYMB3em
         +QfKOSkEnUmUQT6FIhicRmtxg4qB+QeDEZanjT9ACm9OrFGmq7Sru8g9EJbDWBDTWmWu
         6R+pFydSfwowWsxrvdn/gsu4nYpjRIxWi28U8ZG1TY0IGcx67BmPQD9nBxbVDfMtFg7O
         IC4nkKx35p2mZyk21iZHPJguY67kf0ZmyF48QUnaOAqwcItH6YL6msHGDkPqdPrZyXd6
         xpfEUlzbdc/yppbGSa7Y2ejFOUuh8cfkLP8vv6sHbHGXY/UfSj7lTW1ZGWSL1nU8q9Qv
         QYtg==
X-Gm-Message-State: AOAM532be2Xt0l/gT2MkuoyZsz/D3dEf/NBT0o8Nmdb4weLzajpb6y/J
	pjSoULKO6GhkL6rMPkBWL+192dOi02g=
X-Google-Smtp-Source: ABdhPJyEuB8c1Jf/Nsta8I9CuYBksb/J72U7DIQ/WePuNmMEJ4fkrFX2RCd+h3JxOq9/2wWwYmYhfA==
X-Received: by 2002:a05:6214:766:: with SMTP id f6mr155449qvz.17.1619253097661;
        Sat, 24 Apr 2021 01:31:37 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-81.mycingular.net. [166.176.184.81])
        by smtp.gmail.com with ESMTPSA id x24sm5984951qtm.95.2021.04.24.01.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:31:37 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 8/8] xen, rpi4: add xen-rpi-u-boot-scr recipe for default u-boot script
Date: Sat, 24 Apr 2021 01:31:03 -0700
Message-Id: <20210424083103.202107-9-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424083103.202107-1-christopher.w.clark@gmail.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new xen-rpi-u-boot-scr recipe to PROVIDE u-boot-default-script
instead of using a bbappend to rpi-u-boot-scr.

This allows the new recipe to be selected by indicating it as
PREFERRED_PROVIDER of u-boot-default-script, and then do that in the
Xen on Raspberry Pi 4 config file, xen-raspberrypi4-64.inc.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../distro/include/xen-raspberrypi4-64.inc    |  2 ++
 .../rpi-u-boot-scr/rpi-u-boot-scr.bbappend    | 17 ----------
 .../files/boot.cmd.xen.in                     |  0
 .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  | 34 +++++++++++++++++++
 4 files changed, 36 insertions(+), 17 deletions(-)
 delete mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend
 rename dynamic-layers/raspberrypi/recipes-bsp/{rpi-u-boot-scr => xen-rpi-u-boot-scr}/files/boot.cmd.xen.in (100%)
 create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb

diff --git a/dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc b/dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc
index 9c36255..2ea19dd 100644
--- a/dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc
+++ b/dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc
@@ -21,3 +21,5 @@ BOOT_SPACE = "61440"
 # Override the meta-raspberrypi default kernel preference
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 KERNEL_DEVICETREE ?= "broadcom/bcm2711-rpi-4-b.dtb"
+
+PREFERRED_PROVIDER_u-boot-default-script ?= "xen-rpi-u-boot-scr"
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend
deleted file mode 100644
index 2a51116..0000000
--- a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend
+++ /dev/null
@@ -1,17 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-RPI_DOM0_MEM ??= "256M"
-RPI_DEBUG_XEN_ARGS ??= "sync_console bootscrub=0"
-
-SRC_URI += "file://boot.cmd.xen.in"
-
-# If the distro is Xen enabled, override the default boot.cmd.in with the
-# alternative boot.cmd.xen.in from this layer, with variables subsitution here
-do_compile_append() {
-    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
-        sed -e 's/@@RPI_DOM0_MEM@@/${RPI_DOM0_MEM}/' \
-            -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
-                "${WORKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
-        mkimage -A arm -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
-    fi
-}
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
similarity index 100%
rename from dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
rename to dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boot.cmd.xen.in
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
new file mode 100644
index 0000000..87619d0
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
@@ -0,0 +1,34 @@
+SUMMARY = "U-boot boot script for Xen on Raspberry Pi 4"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+COMPATIBLE_MACHINE = "^raspberrypi4-64$"
+
+DEPENDS = "u-boot-mkimage-native"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://boot.cmd.xen.in"
+
+RPI_DOM0_MEM ??= "256M"
+RPI_DEBUG_XEN_ARGS ??= "sync_console bootscrub=0"
+
+do_compile() {
+    sed -e 's/@@KERNEL_IMAGETYPE@@/${KERNEL_IMAGETYPE}/' \
+        -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
+        -e 's/@@RPI_DOM0_MEM@@/${RPI_DOM0_MEM}/' \
+        -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
+        "${WORKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
+
+    mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
+}
+
+inherit kernel-arch deploy nopackages
+
+do_deploy() {
+    install -d ${DEPLOYDIR}
+    install -m 0644 boot.scr ${DEPLOYDIR}
+}
+
+addtask do_deploy after do_compile before do_build
+
+PROVIDES += "u-boot-default-script"
-- 
2.25.1

