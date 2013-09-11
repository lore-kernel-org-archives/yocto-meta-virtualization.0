Return-Path: <cjp256@gmail.com>
Received: from mail-qe0-f41.google.com (mail-qe0-f41.google.com
	[209.85.128.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B84CCE015A6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2013 18:03:15 -0700 (PDT)
Received: by mail-qe0-f41.google.com with SMTP id ff1so4952985qeb.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2013 18:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XjW5uJ3zNNy/6WWykzBpbPd1u3zUxy7djTkUicWYvT0=;
	b=LL5WnQppFMpPUduB31xNvf2Dl6yNyJUC7ERqD/GDxTBfF/oL3mHN9DJzeOlfHAKMff
	xjjOVZp/ZMhcKs5Mr3ncpEBUkhpIQ2qFRzOIgdWX9Tsi1JEKR4A4hlyi0YzTZmh5KGnq
	+5FbhBKIUTCe/TSqtm+OqirpXzleBGMzz/wLATtHJ4yukkvzMqDN8GWo2+jw8KS1PvS1
	2XyYkrjo9DLoMoYP++hI/6cPQWDFL0DNXhq73G7iZVzM5/dZU5x8gDXzdMlLFcuXnAUd
	DxZGMkLTnDZBFDp1JvjlKjH5iC5Mw7BJlsYKwX4ESVjE8GlJxk9RUUD8O++YkootBpNj
	cOpA==
X-Received: by 10.229.127.74 with SMTP id f10mr37684841qcs.16.1378861394793;
	Tue, 10 Sep 2013 18:03:14 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id f14sm34325809qej.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 18:03:14 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 10 Sep 2013 21:02:41 -0400
Message-Id: <1378861361-7980-5-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
References: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 4/4] xen-image-minimal: update image to support xen 4.3.0 base with xl toolstack.
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
X-List-Received-Date: Wed, 11 Sep 2013 01:03:17 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/images/xen-image-minimal.bb | 52 ++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 0cf55d6..23c4911 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -1,14 +1,54 @@
 DESCRIPTION = "A minimal xen image"
-IMAGE_INSTALL = "packagegroup-core-boot xen-minimal dropbear mdadm"
 
-IMAGE_LINGUAS = " "
+INITRD_IMAGE = "core-image-minimal-initramfs"
+
+IMAGE_INSTALL += " \
+    packagegroup-core-boot \
+    packagegroup-core-ssh-openssh \
+    kernel-module-xen-acpi-processor \
+    kernel-module-xen-blkback \
+    kernel-module-xen-blkfront \
+    kernel-module-xen-evtchn \
+    kernel-module-xenfs \
+    kernel-module-xen-gntalloc \
+    kernel-module-xen-gntdev \
+    kernel-module-xen-netback \
+    kernel-module-xen-netfront \
+    kernel-module-xen-pciback \
+    kernel-module-xen-pcifront \
+    kernel-module-xen-privcmd \
+    kernel-module-xen-wdt \
+    xen-base \
+    xen-qemu \
+    "
+
 LICENSE = "MIT"
 
 inherit core-image
 
-IMAGE_ROOTFS_SIZE = "8192"
+syslinux_iso_populate_append() {
+	install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${ISODIR}${ISOLINUXDIR}
+}
+
+syslinux_hddimg_populate_append() {
+	install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${HDDDIR}${SYSLINUXDIR}
+}
+
+grubefi_populate_append() {
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}${EFIDIR}/xen.gz
+}
+
+populate_append() {
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}/xen.gz
+}
 
-# remove not needed ipkg informations
-ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
+build_syslinux_cfg () {
+	echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
+	echo "DEFAULT boot" >> ${SYSLINUXCFG}
+	echo "TIMEOUT 10" >> ${SYSLINUXCFG}
+	echo "PROMPT 1" >> ${SYSLINUXCFG}
+	echo "LABEL boot" >> ${SYSLINUXCFG}
+	echo "  KERNEL mboot.c32" >> ${SYSLINUXCFG}
+	echo "  APPEND /xen.gz loglvl=all guest_loglvl=all console=com1,vga com1=115200,8n1 --- /vmlinuz ramdisk_size=32768 root=/dev/ram0 rw console=hvc0 earlyprintk=xen console=tty0 panic=10 LABEL=boot debugshell=5 --- /initrd" >> ${SYSLINUXCFG}
+}
 
-require xen-bootimg.inc
-- 
1.8.4.rc3


