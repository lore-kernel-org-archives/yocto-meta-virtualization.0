Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1416.1596783924149718001
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 00:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uwW7qtnn;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 095C8E01FA6; Fri,  7 Aug 2020 00:05:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A72DDE01FA5
	for <meta-virtualization@yoctoproject.org>; Fri,  7 Aug 2020 00:05:22 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id o22so591373qtt.13
        for <meta-virtualization@yoctoproject.org>; Fri, 07 Aug 2020 00:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RtKLDNSE49WC8i5EDo/fEtAyY+bBHROfB36gNOK5xpc=;
        b=uwW7qtnnWu7a9vszEv0c9DRat5MHkVOacmYLGMTa06gLbkUDQ9l4Zh3OY/ko0Kt1z5
         LgpI/uV5hnIDTVUHFxEL/3whgC3grmN1tUJl3MJUREda8Kujmekqnmo48HMLBoM/mJHq
         MFKnIAm547IO27AHNTxBy9HYEo+bdFG58W6jYjWayF6hkJXVuN11XQ96pLCjyqOqygn9
         ls78ZkO94Ha3BzjRG1FbwTu4ulKtH57FYfDABncrdtGTQ3ekpb+5likZ/N/y1kMsEPN2
         khYo9rvBGBk9djIUVbK/TLNBv7OwiFW4cU2kl77Dp7jHzDPkqfmF95KOHaP2XVfBh5sQ
         s4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RtKLDNSE49WC8i5EDo/fEtAyY+bBHROfB36gNOK5xpc=;
        b=HMWwyqkelG+nmmwbkaF8ffPVxUVon+XTn+xLVYyNQYd2a+MvDP/b+eRvNfODal6grJ
         NMt6fbOEcnmmjbFEkw2ke3NyXJ1Es/fDs5YkaIgz4Vi3OL56lfN0V9O0JaweC9f+NZF5
         vfO9vnMTuV/gJrXWzw9ayOsF1gzta3r3DTH6ikQoNDYsN4WimropQHr6ooClffrjRMMM
         EoHrvSj8XH4rzmwmNv1GdJvCeSnv66o0R40S5XoYnWr/v5RS7r5BzoN12H+Qu/rpnOLg
         5/6SXoJ3s45wmItReYKeBbBrTEal01tyHXWFkkNnMKrXA0EXDmBjJjgEP9WS4EwlQ6Xv
         hU0g==
X-Gm-Message-State: AOAM531RLip0nUtfWEj8jfhe+gBnogJhEuCKVwgeb12gpId5ssr8KgOE
	wDptgRw3HTTqix1wMG6esjIttwE+t1s=
X-Google-Smtp-Source: ABdhPJwJZQslP7E7MGrtksOti2pi01ZwN2w1sApPn4hhR10q7lq/gXRcrV/9Ui59V8F7+9eAOJdcpQ==
X-Received: by 2002:ac8:7b94:: with SMTP id p20mr11895433qtu.312.1596783921731;
        Fri, 07 Aug 2020 00:05:21 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-185-85.mycingular.net. [166.176.185.85])
        by smtp.gmail.com with ESMTPSA id v45sm6992275qtc.42.2020.08.07.00.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 00:05:21 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH 1/5] xen: retire the Raspberry Pi sdcard class
Date: Fri,  7 Aug 2020 00:04:59 -0700
Message-Id: <20200807070503.30777-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807070503.30777-1-christopher.w.clark@gmail.com>
References: <20200807070503.30777-1-christopher.w.clark@gmail.com>

The sdcard class in the meta-raspberrypi layer is now extensible with
support for adding files such as hypervisor binaries to the boot
partition, so this layer can switch to use that and drop the custom
sdcard bbclass.

Uses the new RPI_SDIMG_EXTRA_DEPENDS and DEPLOYPAYLOAD variables,
and: IMAGE_CLASS: sdcard_image-rpi-xen => sdcard_image-rpi
    IMAGE_FSTYPE: rpi-xen-sdimg => rpi-sdimg

Please note that the filename suffix of the image is changed by this.

Also apply _raspberrypi4-64 scoping to the Raspberry Pi settings.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 classes/sdcard_image-rpi-xen.bbclass  | 120 --------------------------
 conf/distro/include/meta-virt-xen.inc |  13 +--
 2 files changed, 8 insertions(+), 125 deletions(-)
 delete mode 100644 classes/sdcard_image-rpi-xen.bbclass

diff --git a/classes/sdcard_image-rpi-xen.bbclass b/classes/sdcard_image-rpi-xen.bbclass
deleted file mode 100644
index c03520c..0000000
--- a/classes/sdcard_image-rpi-xen.bbclass
+++ /dev/null
@@ -1,120 +0,0 @@
-inherit sdcard_image-rpi
-
-# This image class should be retired and folded into sdcard_image-rpi.bbclass
-# when it has support for adding binaries to the boot partition that are not
-# present in the root partition filesystem: ie. the hypervisor (xen) image.
-
-do_image_rpi_xen_sdimg[depends] = " \
-    parted-native:do_populate_sysroot \
-    mtools-native:do_populate_sysroot \
-    dosfstools-native:do_populate_sysroot \
-    virtual/kernel:do_deploy \
-    ${IMAGE_BOOTLOADER}:do_deploy \
-    rpi-config:do_deploy \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'armstub', 'armstubs:do_deploy', '' ,d)} \
-    ${@bb.utils.contains('RPI_USE_U_BOOT', '1', 'u-boot:do_deploy', '',d)} \
-    ${@bb.utils.contains('RPI_USE_U_BOOT', '1', 'u-boot-default-script:do_deploy', '',d)} \
-    xen:do_deploy \
-    "
-
-do_image_rpi_xen_sdimg[recrdeps] = "do_build"
-
-IMAGE_TYPEDEP_rpi-xen-sdimg = "${SDIMG_ROOTFS_TYPE}"
-
-SDIMG = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.rpi-xen-sdimg"
-
-# Take from: IMAGE_CMD_rpi-sdimg from meta-raspberrypi, current as of: 44d7dd0e
-# with modification to include the Xen hypervisor binary in the boot partition.
-IMAGE_CMD_rpi-xen-sdimg () {
-
-    # Align partitions
-    BOOT_SPACE_ALIGNED=$(expr ${BOOT_SPACE} + ${IMAGE_ROOTFS_ALIGNMENT} - 1)
-    BOOT_SPACE_ALIGNED=$(expr ${BOOT_SPACE_ALIGNED} - ${BOOT_SPACE_ALIGNED} % ${IMAGE_ROOTFS_ALIGNMENT})
-    SDIMG_SIZE=$(expr ${IMAGE_ROOTFS_ALIGNMENT} + ${BOOT_SPACE_ALIGNED} + $ROOTFS_SIZE)
-
-    echo "Creating filesystem with Boot partition ${BOOT_SPACE_ALIGNED} KiB and RootFS $ROOTFS_SIZE KiB"
-
-    # Check if we are building with device tree support
-    DTS="${KERNEL_DEVICETREE}"
-
-    # Initialize sdcard image file
-    dd if=/dev/zero of=${SDIMG} bs=1024 count=0 seek=${SDIMG_SIZE}
-
-    # Create partition table
-    parted -s ${SDIMG} mklabel msdos
-    # Create boot partition and mark it as bootable
-    parted -s ${SDIMG} unit KiB mkpart primary fat32 ${IMAGE_ROOTFS_ALIGNMENT} $(expr ${BOOT_SPACE_ALIGNED} \+ ${IMAGE_ROOTFS_ALIGNMENT})
-    parted -s ${SDIMG} set 1 boot on
-    # Create rootfs partition to the end of disk
-    parted -s ${SDIMG} -- unit KiB mkpart primary ext2 $(expr ${BOOT_SPACE_ALIGNED} \+ ${IMAGE_ROOTFS_ALIGNMENT}) -1s
-    parted ${SDIMG} print
-
-    # Create a vfat image with boot files
-    BOOT_BLOCKS=$(LC_ALL=C parted -s ${SDIMG} unit b print | awk '/ 1 / { print substr($4, 1, length($4 -1)) / 512 /2 }')
-    rm -f ${WORKDIR}/boot.img
-    mkfs.vfat -F32 -n "${BOOTDD_VOLUME_ID}" -S 512 -C ${WORKDIR}/boot.img $BOOT_BLOCKS
-    mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/bcm2835-bootfiles/* ::/ || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/bcm2835-bootfiles/* into boot.img"
-    if [ "${@bb.utils.contains("MACHINE_FEATURES", "armstub", "1", "0", d)}" = "1" ]; then
-        mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/armstubs/${ARMSTUB} ::/ || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/armstubs/${ARMSTUB} into boot.img"
-    fi
-    if test -n "${DTS}"; then
-        # Copy board device trees to root folder
-        for dtbf in ${@split_overlays(d, True)}; do
-            dtb=`basename $dtbf`
-            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/$dtb ::$dtb || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/$dtb into boot.img"
-        done
-
-        # Copy device tree overlays to dedicated folder
-        mmd -i ${WORKDIR}/boot.img overlays
-        for dtbf in ${@split_overlays(d, False)}; do
-            dtb=`basename $dtbf`
-            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/$dtb ::overlays/$dtb || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/$dtb into boot.img"
-        done
-    fi
-    if [ "${RPI_USE_U_BOOT}" = "1" ]; then
-        mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/u-boot.bin ::${SDIMG_KERNELIMAGE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/u-boot.bin into boot.img"
-        mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/boot.scr ::boot.scr || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/boot.scr into boot.img"
-        if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin ::${KERNEL_IMAGETYPE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin into boot.img"
-        else
-            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ::${KERNEL_IMAGETYPE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} into boot.img"
-        fi
-    else
-        if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin ::${SDIMG_KERNELIMAGE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin into boot.img"
-        else
-            mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ::${SDIMG_KERNELIMAGE} || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} into boot.img"
-        fi
-    fi
-    # -- Begin Xen deploy modification
-    mcopy -v -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/xen-${MACHINE} ::xen || bbfatal "mcopy cannot copy ${DEPLOY_DIR_IMAGE}/xen-${MACHINE} into boot.img"
-    # -- End Xen deploy modification
-
-    if [ -n "${FATPAYLOAD}" ] ; then
-        echo "Copying payload into VFAT"
-        for entry in ${FATPAYLOAD} ; do
-            # use bbwarn instead of bbfatal to stop aborting on vfat issues like not supporting .~lock files
-            mcopy -v -i ${WORKDIR}/boot.img -s ${IMAGE_ROOTFS}$entry :: || bbwarn "mcopy cannot copy ${IMAGE_ROOTFS}$entry into boot.img"
-        done
-    fi
-
-    # Add stamp file
-    echo "${IMAGE_NAME}" > ${WORKDIR}/image-version-info
-    mcopy -v -i ${WORKDIR}/boot.img ${WORKDIR}/image-version-info :: || bbfatal "mcopy cannot copy ${WORKDIR}/image-version-info into boot.img"
-
-    # Deploy vfat partition
-    if [ "${SDIMG_VFAT_DEPLOY}" = "1" ]; then
-        cp ${WORKDIR}/boot.img ${IMGDEPLOYDIR}/${SDIMG_VFAT}
-        ln -sf ${SDIMG_VFAT} ${SDIMG_LINK_VFAT}
-    fi
-
-    # Burn Partitions
-    dd if=${WORKDIR}/boot.img of=${SDIMG} conv=notrunc seek=1 bs=$(expr ${IMAGE_ROOTFS_ALIGNMENT} \* 1024)
-    # If SDIMG_ROOTFS_TYPE is a .xz file use xzcat
-    if echo "${SDIMG_ROOTFS_TYPE}" | egrep -q "*\.xz"
-    then
-        xzcat ${SDIMG_ROOTFS} | dd of=${SDIMG} conv=notrunc seek=1 bs=$(expr 1024 \* ${BOOT_SPACE_ALIGNED} + ${IMAGE_ROOTFS_ALIGNMENT} \* 1024)
-    else
-        dd if=${SDIMG_ROOTFS} of=${SDIMG} conv=notrunc seek=1 bs=$(expr 1024 \* ${BOOT_SPACE_ALIGNED} + ${IMAGE_ROOTFS_ALIGNMENT} \* 1024)
-    fi
-}
diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index b61f612..1ad670e 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -6,11 +6,14 @@ PACKAGECONFIG_append_pn-qemu_arm = " fdt"
 PACKAGECONFIG_append_pn-qemu_aarch64 = " fdt"
 
 # Raspberry Pi settings
-#  - Xen uses u-boot for configuration and uses the uart
-RPI_USE_U_BOOT = "1"
-ENABLE_UART = "1"
+# Xen uses u-boot for configuration and uses the uart
+RPI_USE_U_BOOT_raspberrypi4-64 = "1"
+ENABLE_UART_raspberrypi4-64 = "1"
 # Build the bootable SD card image
-IMAGE_CLASSES_append_raspberrypi4-64 = " sdcard_image-rpi-xen"
-IMAGE_FSTYPES_append_raspberrypi4-64 = " rpi-xen-sdimg"
+IMAGE_CLASSES_append_raspberrypi4-64 = " sdcard_image-rpi"
+IMAGE_FSTYPES_append_raspberrypi4-64 = " rpi-sdimg"
+# Add Xen to the bootable SD card image
+RPI_SDIMG_EXTRA_DEPENDS_append_raspberrypi4-64 = " xen:do_deploy"
+DEPLOYPAYLOAD_raspberrypi4-64 = "xen-${MACHINE}:xen"
 # Align kernel version with current meta-virtualization kernel version
 PREFERRED_VERSION_linux-raspberrypi ?= "5.4.%"
-- 
2.17.1

