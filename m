Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8BB5E016B7
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Oct 2013 14:22:55 -0700 (PDT)
Received: by mail-ie0-f177.google.com with SMTP id qd12so13235566ieb.8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Oct 2013 14:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1Ijm+gs5GAa0WB5I1WqMZFaeWhMqH/MIJZ6Xhnl03xw=;
	b=QdUiEVgfqPlOxEN1nyQPG/cwdwMDP1uEt/w/sueEYzGkpAZppQx2tpgP/qBQFQ2BoG
	dxAcZarmLwZsKM9UKuJdExEASGKuSqA4l9Pr83SIsEoh2DvRZ+Cgmikgb9P7qoicWrkB
	U8DJGAQQWlDX3LsCYno9hSdYGQv7CZ+fxB4pkFZoyqAO7WAitPfhhywazyqssd0Db5yB
	odF3IihCSmxNOH1V+9h+awqGE1kuMNzYnEmO87tgDS5SvwzxJ9p2oQu2CII13juDgyeN
	J1MV14NHUy5fM33jz4E5F9HEc1W8WaT4dA8bRcMnB+OhnWGDSohM42Clo2eob1nErIC7
	N7hQ==
X-Received: by 10.50.25.101 with SMTP id b5mr14537357igg.31.1381094575027;
	Sun, 06 Oct 2013 14:22:55 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id i3sm22631061igh.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 06 Oct 2013 14:22:54 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sun,  6 Oct 2013 17:22:16 -0400
Message-Id: <1381094537-11576-4-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
References: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH] xen-guest-image-minimal: example image for a PV/HVM/PVHVM xen guest built with the 'xen-guest' kernel fragment.
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
X-List-Received-Date: Sun, 06 Oct 2013 21:22:56 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/images/xen-guest-image-minimal.bb | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 recipes-extended/images/xen-guest-image-minimal.bb

diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
new file mode 100644
index 0000000..05b0b61
--- /dev/null
+++ b/recipes-extended/images/xen-guest-image-minimal.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "A Xen PV guest image."
+
+inherit core-image
+
+IMAGE_INSTALL += " \
+    packagegroup-core-boot \
+    kernel-module-xen-acpi-processor \
+    kernel-module-xen-blkback \
+    kernel-module-xen-netback \
+    kernel-module-xen-pciback \
+    kernel-module-xen-pcifront \
+    "
+
+IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', ' xf86-video-fbdev', '', d)}"
+IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
+
+LICENSE = "MIT"
+
+SYSLINUX_KERNEL_ARGS ?= "LABEL=boot ramdisk_size=32768 root=/dev/ram0 rootimg=rootfs.img rw console=hvc0 console=tty0 panic=10 debugshell=5"
+
+# syslinux is not required for PV guest configuration, but for HVM
+build_syslinux_cfg () {
+	echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
+	echo "DEFAULT boot" >> ${SYSLINUXCFG}
+	echo "TIMEOUT 10" >> ${SYSLINUXCFG}
+	echo "PROMPT 1" >> ${SYSLINUXCFG}
+	echo "LABEL boot" >> ${SYSLINUXCFG}
+	echo "  KERNEL /vmlinuz" >> ${SYSLINUXCFG}
+	echo "  INITRD /initrd" >> ${SYSLINUXCFG}
+	echo "  APPEND ${SYSLINUX_KERNEL_ARGS}" >> ${SYSLINUXCFG}
+}
-- 
1.8.4.rc3


