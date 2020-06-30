Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.6623.1593482161252402080
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 18:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gKWfJUm5;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C35AE01DBE; Mon, 29 Jun 2020 18:56:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A6B4E01DBD
	for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:56:00 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id z2so14482962qts.5
        for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fscHp2E3eovrt4hXTLEd1ZUKlXLEoWwox/iWH8eG7gw=;
        b=gKWfJUm5oZBEgrM+PUGRK5HAbZ6HmzG0hBZu15+6LpraOs6ZIHHqCsSUPLh5nSsc4m
         slj3GL0YvpVJyCpg48My1FGfd4tFAHYag6I6TgNDOTkDqk1MW2gmfpoLLoVzZq3K6xF9
         oHJS0PK/PkjJ6+14d7uJVbjDYaYB98GhRQezndFf+p3T8aaCC7zZpg2bzHViSdGPE7mU
         cPSi8LpRdBiwUzzFX2SoJKspCAH2Pwxe8jecxra3jJgmHCpZTBepweHhy7bzAy8A1LhH
         ozriFf8mcUsHpUwp+8HMtceA7FYpx0bxls5axraVP77CYfGR/RwS+mLXlD1HuKaniYbT
         Sn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fscHp2E3eovrt4hXTLEd1ZUKlXLEoWwox/iWH8eG7gw=;
        b=PCcnwACALNXLMFeEyn5eL6oylEPm5APE5SBAeex/uOkLZAsMZxdUzA7tNhgUh2RO/I
         zYl2vA4mmH6XIwzwJdJWV8ZETtNb1Q5tZ8C1sdYHe4nu+uNL6chMkZlrRHkc9laqwIHo
         ZvbSiwpHS2zXmcMFDcUCiKxXZn6qGZ+NFe6jo3biqJnoNiKjrHk8s228xZiHuNavdJe0
         GQI+o6yt3RiiFFRJPRz/8K7ERBeBuaZEBX6c8GGGnkncAyV1dg+CJHSExxGyjHjSWi3/
         Hi0AmlW61shnG0pzdlKGkMD23wHtiKKnVMFZWUN7zR0LsgFEIY1eAHilFIb851Fx3O3H
         nruA==
X-Gm-Message-State: AOAM530Xhrsdiye6Nq18X4ohjzIaNJOBAaRtGrll0g8KpXlpIuiQnJHv
	3MTCR+BihbhqKOAXy1F6iUjK0MQg1Qw=
X-Google-Smtp-Source: ABdhPJwWGBhlEXI6wmtMXYIvxgTiGeD6HSPgCQ5FDvT+9vt2C4bqhbt4nWRj3oepPiMTqq/UU8W8gQ==
X-Received: by 2002:aed:3fa5:: with SMTP id s34mr18965088qth.343.1593482159399;
        Mon, 29 Jun 2020 18:55:59 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-186-179.mycingular.net. [166.176.186.179])
        by smtp.gmail.com with ESMTPSA id t48sm1841794qtb.50.2020.06.29.18.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 18:55:59 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH v2 09/11] xen, raspberry pi: add Xen-specific SD card class
Date: Mon, 29 Jun 2020 18:54:52 -0700
Message-Id: <20200630015454.10151-10-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>

At the moment the regular meta-raspberrypi SD card class does not allow
for optional inclusion of extra files in the SD card boot partition
without requiring those same files be present in the root filesystem.
This affects hypervisor binaries, such as Xen, which do not necessarily
belong within the guest filesystem.

As a workaround, inherit the sdcard_image-rpi.bbclass and clone the
main IMAGE_CMD function, adding the Xen-specific deploy that is needed.
This can be retired when the parent class has extensibility added.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 classes/sdcard_image-rpi-xen.bbclass  | 120 ++++++++++++++++++++++++++
 conf/distro/include/meta-virt-xen.inc |   3 +
 2 files changed, 123 insertions(+)
 create mode 100644 classes/sdcard_image-rpi-xen.bbclass

diff --git a/classes/sdcard_image-rpi-xen.bbclass b/classes/sdcard_image-rpi-xen.bbclass
new file mode 100644
index 0000000..c03520c
--- /dev/null
+++ b/classes/sdcard_image-rpi-xen.bbclass
@@ -0,0 +1,120 @@
+inherit sdcard_image-rpi
+
+# This image class should be retired and folded into sdcard_image-rpi.bbclass
+# when it has support for adding binaries to the boot partition that are not
+# present in the root partition filesystem: ie. the hypervisor (xen) image.
+
+do_image_rpi_xen_sdimg[depends] = " \
+    parted-native:do_populate_sysroot \
+    mtools-native:do_populate_sysroot \
+    dosfstools-native:do_populate_sysroot \
+    virtual/kernel:do_deploy \
+    ${IMAGE_BOOTLOADER}:do_deploy \
+    rpi-config:do_deploy \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'armstub', 'armstubs:do_deploy', '' ,d)} \
+    ${@bb.utils.contains('RPI_USE_U_BOOT', '1', 'u-boot:do_deploy', '',d)} \
+    ${@bb.utils.contains('RPI_USE_U_BOOT', '1', 'u-boot-default-script:do_deploy', '',d)} \
+    xen:do_deploy \
+    "
+
+do_image_rpi_xen_sdimg[recrdeps] = "do_build"
+
+IMAGE_TYPEDEP_rpi-xen-sdimg = "${SDIMG_ROOTFS_TYPE}"
+
+SDIMG = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.rpi-xen-sdimg"
+
+# Take from: IMAGE_CMD_rpi-sdimg from meta-raspberrypi, current as of: 44d7dd0e
+# with modification to include the Xen hypervisor binary in the boot partition.
+IMAGE_CMD_rpi-xen-sdimg () {
+
+    # Align partitions
+    BOOT_SPACE_ALIGNED=$(expr ${BOOT_SPACE} + ${IMAGE_ROOTFS_ALIGNMENT} - 1)
+    BOOT_SPACE_ALIGNED=$(expr ${BOOT_SPACE_ALIGNED} - ${BOOT_SPACE_ALIGNED} % ${IMAGE_ROOTFS_ALIGNMENT})
+    SDIMG_SIZE=$(expr ${IMAGE_ROOTFS_ALIGNMENT} + ${BOOT_SPACE_ALIGNED} + $ROOTFS_SIZE)
+
+    echo "Creating filesystem with Boot partition ${BOOT_SPACE_ALIGNED} KiB and RootFS $ROOTFS_SIZE KiB"
+
+    # Check if we are building with device tree support
+    DTS="${KERNEL_DEVICETREE}"
+
+    # Initialize sdcard image file
+    dd if=/dev/zero of=${SDIMG} bs=1024 count=0 seek=${SDIMG_SIZE}
+
+    # Create partition table
+    parted -s ${SDIMG} mklabel msdos
+    # Create boot partition and mark it as bootable
+    parted -s ${SDIMG} unit KiB mkpart primary fat32 ${IMAGE_ROOTFS_ALIGNMENT} $(expr ${BOOT_SPACE_ALIGNED} \+ ${IMAGE_ROOTFS_ALIGNMENT})
+    parted -s ${SDIMG} set 1 boot on
+    # Create rootfs partition to the end of disk
+    parted -s ${SDIMG} -- unit KiB mkpart primary ext2 $(expr ${BOOT_SPACE_ALIGNED} \+ ${IMAGE_ROOTFS_ALIGNMENT}) -1s
+    parted ${SDIMG} print
+
+    # Create a vfat image with boot files
+    BOOT_BLOCKS=$(LC_ALL=C parted -s ${SDIMG} unit b print | awk '/ 1 / { print substr($4, 1, length($4 -1)) / 512 /2 }')
+    rm -f ${WORKDIR}/boot.img
+    mkfs.vfat -F32 -n "${BOOTDD_VOLUME_ID}" -S 512 -C ${WORKDIR}/boot.img $BOOT_BLOCKS
+    mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/bcm2835-bootfiles/* ::/ || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/bcm2835-bootfiles/* into boot.img"
+    if [ "${@bb.utils.contains("MACHINE_FEATURES", "armstub", "1", "0", d)}" = "1" ]; then
+        mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/armstubs/${ARMSTUB} ::/ || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/armstubs/${ARMSTUB} into boot.img"
+    fi
+    if test -n "${DTS}"; then
+        # Copy board device trees to root folder
+        for dtbf in ${@split_overlays(d, True)}; do
+            dtb=`basename $dtbf`
+            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/$dtb ::$dtb || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/$dtb into boot.img"
+        done
+
+        # Copy device tree overlays to dedicated folder
+        mmd -i ${WORKDIR}/boot.img overlays
+        for dtbf in ${@split_overlays(d, False)}; do
+            dtb=`basename $dtbf`
+            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/$dtb ::overlays/$dtb || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/$dtb into boot.img"
+        done
+    fi
+    if [ "${RPI_USE_U_BOOT}" = "1" ]; then
+        mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/u-boot.bin ::${SDIMG_KERNELIMAGE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/u-boot.bin into boot.img"
+        mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/boot.scr ::boot.scr || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/boot.scr into boot.img"
+        if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin ::${KERNEL_IMAGETYPE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin into boot.img"
+        else
+            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ::${KERNEL_IMAGETYPE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} into boot.img"
+        fi
+    else
+        if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin ::${SDIMG_KERNELIMAGE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin into boot.img"
+        else
+            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ::${SDIMG_KERNELIMAGE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} into boot.img"
+        fi
+    fi
+    # -- Begin Xen deploy modification
+    mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/xen-${MACHINE} ::xen || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/xen-${MACHINE} into boot.img"
+    # -- End Xen deploy modification
+
+    if [ -n "${FATPAYLOAD}" ] ; then
+        echo "Copying payload into VFAT"
+        for entry in ${FATPAYLOAD} ; do
+            # use bbwarn instead of bbfatal to stop aborting on vfat issues like not supporting .~lock files
+            mcopy -v -i ${WORKDIR}/boot.img -s ${IMAGE_ROOTFS}$entry :: || bbwarn "mcopy cannot copy ${IMAGE_ROOTFS}$entry into boot.img"
+        done
+    fi
+
+    # Add stamp file
+    echo "${IMAGE_NAME}" > ${WORKDIR}/image-version-info
+    mcopy -v -i ${WORKDIR}/boot.img ${WORKDIR}/image-version-info :: || bbfatal "mcopy cannot copy ${WORKDIR}/image-version-info into boot.img"
+
+    # Deploy vfat partition
+    if [ "${SDIMG_VFAT_DEPLOY}" = "1" ]; then
+        cp ${WORKDIR}/boot.img ${IMGDEPLOYDIR}/${SDIMG_VFAT}
+        ln -sf ${SDIMG_VFAT} ${SDIMG_LINK_VFAT}
+    fi
+
+    # Burn Partitions
+    dd if=${WORKDIR}/boot.img of=${SDIMG} conv=notrunc seek=1 bs=$(expr ${IMAGE_ROOTFS_ALIGNMENT} \* 1024)
+    # If SDIMG_ROOTFS_TYPE is a .xz file use xzcat
+    if echo "${SDIMG_ROOTFS_TYPE}" | egrep -q "*\.xz"
+    then
+        xzcat ${SDIMG_ROOTFS} | dd of=${SDIMG} conv=notrunc seek=1 bs=$(expr 1024 \* ${BOOT_SPACE_ALIGNED} + ${IMAGE_ROOTFS_ALIGNMENT} \* 1024)
+    else
+        dd if=${SDIMG_ROOTFS} of=${SDIMG} conv=notrunc seek=1 bs=$(expr 1024 \* ${BOOT_SPACE_ALIGNED} + ${IMAGE_ROOTFS_ALIGNMENT} \* 1024)
+    fi
+}
diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index 2ada83a..b4a20fe 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -12,3 +12,6 @@ SERIAL_CONSOLES = "115200;hvc0"
 #  - Xen uses u-boot for configuration and uses the uart
 RPI_USE_U_BOOT = "1"
 ENABLE_UART = "1"
+# Build the bootable SD card image
+IMAGE_CLASSES_append_raspberrypi4-64 = " sdcard_image-rpi-xen"
+IMAGE_FSTYPES_append_raspberrypi4-64 = " rpi-xen-sdimg"
-- 
2.17.1

