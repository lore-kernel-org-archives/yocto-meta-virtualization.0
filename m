Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.6453.1593482155234242815
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 18:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qDGasUou;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B0D3E01DBD; Mon, 29 Jun 2020 18:55:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.182 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5BD5E01DBD
	for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:51 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id r22so17185341qke.13
        for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nKKPxcm3JWxDI5Qo5Hs8zFgAUyux4tXAtpawd58AVdA=;
        b=qDGasUoud3kUKonUw81qsdkNUIGvJ65Ma5iKeGapKJT0qaSTEmB4hPJPkQFDJxen/S
         eSs+tdqEaCIHzRWP1zyXeI72vWC3oQWdN6jFhU9AaMtyd1B5fvU/bIRmQRuCB/nVTlH/
         h5As9AbfS1IGq0RAAk4YkwsFvXitFMGmURfMojdOKhlPCnDssYrrddJyHAsHfXr+9OHa
         hob1PgC1A/fV3KEPtVE2q9Ep1Ynf335L1Zur1KDxjqeoTdez1VkGR/VR32cF9ISxJkcJ
         lnSBYJDk0oSPM67v1Y5pPbLJmL4220dUDUUpBipTGP0S9Z7Ynku910pyjE5aGv7hEne6
         9VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nKKPxcm3JWxDI5Qo5Hs8zFgAUyux4tXAtpawd58AVdA=;
        b=iBkaWmulWd9ccymh+lu4eaVUEOF7nqfw4LAJqX+pI+2vhb1998jV9huKhbyziDYOYw
         /CbjKlIoNWvHWrUB52RUj5pCh9kafOB5FM69AdxeR3B22q0hrWNfBOmdpdLElgHCcKPk
         HKI6NSbtK7IlRHPwOePJdRxLSkus+Skh/yyToU9lW5Ee/UybXHTKzevCYwQV0r3rLJe7
         6iVicZmGods2MP4PTY7tfjaf+iXcrIImt2fZ5RiW+CqYe9eX7j8gmJs0KgcAYZyVQomD
         tdDeb3mO+vqHvE0zoHu1gPCnkmMAZw4y/x8xkSINUHqR0UMYT3t3y2Z5qmk2srF9+2+J
         Zlwg==
X-Gm-Message-State: AOAM531fx6CBOrHmqcgL8F4wittQ/arGxNpFI8FkDY3jLirJ5dWGDkBj
	BUQsL0BnV/Z7QHSWlxxKXz8W+Fh2uSg=
X-Google-Smtp-Source: ABdhPJxchp6XGodqiOPgVG/ACqzI8+8uxs4C09y2kMKk2LalCE8fXgjLEOGAva4P1b4BjBOQfn3sGA==
X-Received: by 2002:a37:b847:: with SMTP id i68mr17610879qkf.126.1593482150815;
        Mon, 29 Jun 2020 18:55:50 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-186-179.mycingular.net. [166.176.186.179])
        by smtp.gmail.com with ESMTPSA id t48sm1841794qtb.50.2020.06.29.18.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 18:55:50 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH v2 06/11] xen, raspberry pi: add dynamic-layer for Xen configuration for Rpi4
Date: Mon, 29 Jun 2020 18:54:49 -0700
Message-Id: <20200630015454.10151-7-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>

A Xen-specific u-boot script is needed for launching Xen, and the GIC
(interrupt controller) needs to be enabled.

Since this is both Xen-specific and Raspberry Pi-specific, use a
dynamic layer to conditionally enable the recipes when both
meta-virtualization and meta-raspberrypi are in use together.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 conf/layer.conf                               | 15 ++++++
 .../bootfiles/rpi-config_git.bbappend         |  6 +++
 .../rpi-u-boot-scr/files/boot.cmd.xen.in      | 49 +++++++++++++++++++
 .../rpi-u-boot-scr/rpi-u-boot-scr.bbappend    | 17 +++++++
 4 files changed, 87 insertions(+)
 create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
 create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend

diff --git a/conf/layer.conf b/conf/layer.conf
index 142621c..1ec7a15 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -11,6 +11,21 @@ BBFILE_PRIORITY_virtualization-layer = "8"
 # Custom licenses used by some packages in this layer
 LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
 
+# The dynamic-layers directory hosts extensions and layer-specific
+# modifications.
+#
+# The .bbappend and .bb files are included if the respective layer
+# collection is available.
+BBFILES += "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bbappend' % layer \
+               for layer in BBFILE_COLLECTIONS.split())}"
+BBFILES += "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bb' % layer \
+               for layer in BBFILE_COLLECTIONS.split())}"
+
+BBFILES_DYNAMIC += " \
+    raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bb \
+    raspberrypi:${LAYERDIR}/dynamic-layers/rasbperrypi/*/*/*.bbappend \
+"
+
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_virtualization-layer = "1"
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend b/dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend
new file mode 100644
index 0000000..2b9c4fb
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend
@@ -0,0 +1,6 @@
+do_deploy_append() {
+    # We need the GIC enabled for Xen to work.
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
+        echo "enable_gic=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
+    fi
+}
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
new file mode 100644
index 0000000..6c38d7d
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
@@ -0,0 +1,49 @@
+# Set the fdt address to what came from the GPU, so we can edit it
+fdt addr ${fdt_addr}
+
+# Pull the bootargs that the GPU has edited
+fdt get value bootargs /chosen bootargs
+
+# Set module load addresses
+setenv xen_loadaddr     "0x00200000"
+setenv kernel_loadaddr  "0x00400000"
+
+# Add some space to the fdt so we can edit it
+fdt resize 0x1000
+echo Add boot arguments for Xen
+fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=/soc/serial@7e215040 dom0_mem='@@RPI_DOM0_MEM@@' @@RPI_DEBUG_XEN_ARGS@@"
+
+echo Add boot arguments for dom0
+setenv dom0_bootargs "console=hvc0 earlyprintk=xen debug root=/dev/mmcblk0p2 rootwait"
+fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
+
+echo Add a dom0 node to chosen to put Linux boot information in
+fdt mknode /chosen dom0
+
+echo Set this for the Linux boot command
+fdt set /chosen/dom0 compatible "xen,linux-zimage", "xen,multiboot-module"
+
+# Tell Xen where PCI is
+fdt set /scb/pcie@7d500000 device_type "pci"
+
+echo Delay to allow the MMC card to be ready
+sleep 1
+
+echo Load Xen into memory
+fatload mmc 0:1 ${xen_loadaddr} xen
+echo Load Linux kernel into memory
+fatload mmc 0:1 ${kernel_loadaddr} Image
+setenv kernel_size 0x$filesize
+
+echo Set the address and size for the Linux kernel so Xen can pick it up
+fdt set /chosen/dom0 reg <${kernel_loadaddr} ${kernel_size}>
+
+# Define the size and address cells
+fdt set /chosen '#size-cells' <1>
+fdt set /chosen '#address-cells' <1>
+
+# Display the chosen fdt section - can be important for debugging
+fdt print /chosen
+
+echo Boot Xen
+booti ${xen_loadaddr} - ${fdt_addr}
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend
new file mode 100644
index 0000000..2a51116
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend
@@ -0,0 +1,17 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+RPI_DOM0_MEM ??= "256M"
+RPI_DEBUG_XEN_ARGS ??= "sync_console bootscrub=0"
+
+SRC_URI += "file://boot.cmd.xen.in"
+
+# If the distro is Xen enabled, override the default boot.cmd.in with the
+# alternative boot.cmd.xen.in from this layer, with variables subsitution here
+do_compile_append() {
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
+        sed -e 's/@@RPI_DOM0_MEM@@/${RPI_DOM0_MEM}/' \
+            -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
+                "${WORKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
+        mkimage -A arm -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
+    fi
+}
-- 
2.17.1

