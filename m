Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8232EC4167B
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 19:05:02 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.8844.1653159899335559692
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FwunITo4;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id w200so10325718pfc.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F3xbYuBC8365/gLm3+WwRuIuZTaDOBoADIWequEA34Q=;
        b=FwunITo4Y9Sh4YDLMHEFNCwpTp7sKy+1izFDgbR0f/pHdSm5jhAiOJO4/WWMIaaCVb
         xU+hVD2X71n05xU5uSVGiNrwQuxx6eN1Xc7Zhu1FxlwzaDSeZD7PjLAufGIiWCJaVbBB
         52EYcZi+clvkwIdKvBHNBNlmxkaXpKXUbszL0qrJODjBj0hbVK1txh6Mvwp+8nfKfkRB
         6+/RG4w7r81mi6i37O8LOrvk/49oDzf2Nr0M78S5ug9w7fwLpfW8ebFu5F+YCtW4An7y
         k18dH8vEajO8G6Vr3ENysYjR5Khgbc2LDA+4rlmQLB2gbBmxTotrnxoPcL1X6PXH8Nfw
         eOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F3xbYuBC8365/gLm3+WwRuIuZTaDOBoADIWequEA34Q=;
        b=dOUjMeDd7udC1UdkSKH0s/JbPLqjk//PkTznA3usdrzbuR5gZmYQvLBxTs/Jr0fJVb
         M2Ouahjl8rNwOyoEv2f/DuYfwp69l67yn5tIjgHGlaaqH7fo69Dbqd49cJgaui4aZVKu
         Hr5e3p5F+3uBoG7RxKKUXHHARa2xT0WaEB3rRND8mqCUmVvsHjGxS24CygqXhdwSk3RS
         KQ5H+1McU4h6yZQSQ5eLsgNDNKJVe/6joBW9ZfqVxMZVwhW++iYTMl1tmVlW7isgsjJ7
         GQ9B7WDt2rE0xZKrTfAbRUsJjn5XnbEMRzeuOmyWV15M/HtFbbFGz/zlKkRHq/gun5NC
         VDxg==
X-Gm-Message-State: AOAM532vksi976ROzEi1AXg+pJO/OBlaIe95Z7Km2eGgguxUp/nHuCmZ
	9jJ2inUDjH4LPEqKEiik0BDMPACUcb0=
X-Google-Smtp-Source: 
 ABdhPJzTDlyhjBbcS2vfcbBI2orLXGVKwjqevC0NkPtJZzv7q47AKlCH6Wo55NB5St1xiEMyguAp6g==
X-Received: by 2002:a63:314b:0:b0:3f5:dc43:3b81 with SMTP id
 x72-20020a63314b000000b003f5dc433b81mr13709865pgx.456.1653159898688;
        Sat, 21 May 2022 12:04:58 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b001620a2737b6sm1592856plg.74.2022.05.21.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:04:58 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][hardknott][PATCH 3/3] xen: fix boot on the
 Raspberry Pi 4 with Xen 4.14
Date: Sat, 21 May 2022 12:04:42 -0700
Message-Id: <20220521190447.135705-7-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220521190447.135705-1-christopher.w.clark@gmail.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 21 May 2022 19:05:02 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7304

Apply the patch from Xen to fix device tree parsing in newer kernels
and remove the Xen configuration file since the default works.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../xen/files/defconfig_raspberrypi4-64       | 117 ------------------
 .../recipes-extended/xen/xen_git.bbappend     |  11 --
 ...issing-device_type-property-in-pci-p.patch |  91 ++++++++++++++
 recipes-extended/xen/xen_4.14.bb              |   1 +
 4 files changed, 92 insertions(+), 128 deletions(-)
 delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
 delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend
 create mode 100644 recipes-extended/xen/files/0001-xen-workaround-missing-device_type-property-in-pci-p.patch

diff --git a/dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64 b/dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
deleted file mode 100644
index f3343d3..0000000
--- a/dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
+++ /dev/null
@@ -1,117 +0,0 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Xen/arm 4.13.0 Configuration
-#
-CONFIG_64BIT=y
-CONFIG_ARM_64=y
-CONFIG_ARM=y
-CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
-
-#
-# Architecture Features
-#
-CONFIG_NR_CPUS=128
-# CONFIG_ACPI is not set
-CONFIG_GICV3=y
-# CONFIG_HAS_ITS is not set
-CONFIG_HVM=y
-# CONFIG_NEW_VGIC is not set
-CONFIG_SBSA_VUART_CONSOLE=y
-CONFIG_ARM_SSBD=y
-CONFIG_HARDEN_BRANCH_PREDICTOR=y
-# CONFIG_TEE is not set
-
-#
-# ARM errata workaround via the alternative framework
-#
-CONFIG_ARM64_ERRATUM_827319=y
-CONFIG_ARM64_ERRATUM_824069=y
-CONFIG_ARM64_ERRATUM_819472=y
-CONFIG_ARM64_ERRATUM_832075=y
-CONFIG_ARM64_ERRATUM_834220=y
-CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
-CONFIG_ALL_PLAT=y
-# CONFIG_QEMU is not set
-# CONFIG_RCAR3 is not set
-# CONFIG_MPSOC is not set
-# CONFIG_NO_PLAT is not set
-CONFIG_ALL64_PLAT=y
-# CONFIG_ALL32_PLAT is not set
-CONFIG_MPSOC_PLATFORM=y
-
-#
-# Common Features
-#
-CONFIG_GRANT_TABLE=y
-CONFIG_HAS_ALTERNATIVE=y
-CONFIG_HAS_DEVICE_TREE=y
-CONFIG_HAS_FAST_MULTIPLY=y
-# CONFIG_MEM_ACCESS is not set
-CONFIG_HAS_PDX=y
-
-#
-# Speculative hardening
-#
-CONFIG_SPECULATIVE_HARDEN_ARRAY=y
-# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set
-CONFIG_XSM=y
-CONFIG_XSM_FLASK=y
-CONFIG_XSM_FLASK_AVC_STATS=y
-# CONFIG_XSM_FLASK_POLICY is not set
-CONFIG_XSM_SILO=y
-# CONFIG_XSM_DUMMY_DEFAULT is not set
-# CONFIG_XSM_FLASK_DEFAULT is not set
-CONFIG_XSM_SILO_DEFAULT=y
-# CONFIG_ARGO is not set
-
-#
-# Schedulers
-#
-CONFIG_SCHED_CREDIT=y
-CONFIG_SCHED_CREDIT2=y
-CONFIG_SCHED_RTDS=y
-CONFIG_SCHED_ARINC653=y
-CONFIG_SCHED_NULL=y
-# CONFIG_SCHED_CREDIT_DEFAULT is not set
-CONFIG_SCHED_CREDIT2_DEFAULT=y
-# CONFIG_SCHED_RTDS_DEFAULT is not set
-# CONFIG_SCHED_ARINC653_DEFAULT is not set
-# CONFIG_SCHED_NULL_DEFAULT is not set
-CONFIG_SCHED_DEFAULT="credit2"
-# CONFIG_LIVEPATCH is not set
-# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set
-# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
-CONFIG_CMDLINE=""
-CONFIG_DOM0_MEM=""
-CONFIG_TRACEBUFFER=y
-
-#
-# Device Drivers
-#
-CONFIG_HAS_NS16550=y
-CONFIG_HAS_CADENCE_UART=y
-CONFIG_HAS_MVEBU=y
-CONFIG_HAS_MESON=y
-CONFIG_HAS_PL011=y
-CONFIG_HAS_SCIF=y
-CONFIG_HAS_PASSTHROUGH=y
-CONFIG_ARM_SMMU=y
-# CONFIG_IPMMU_VMSA is not set
-CONFIG_IOMMU_FORCE_PT_SHARE=y
-CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
-
-#
-# Debugging Options
-#
-CONFIG_DEBUG=y
-CONFIG_DEBUG_INFO=y
-CONFIG_FRAME_POINTER=y
-# CONFIG_COVERAGE is not set
-# CONFIG_DEBUG_LOCK_PROFILE is not set
-CONFIG_DEBUG_LOCKS=y
-# CONFIG_PERF_COUNTERS is not set
-CONFIG_VERBOSE_DEBUG=y
-# CONFIG_DEVICE_TREE_DEBUG is not set
-CONFIG_SCRUB_DEBUG=y
-# CONFIG_DEBUG_TRACE is not set
-CONFIG_XMEM_POOL_POISON=y
diff --git a/dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend b/dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend
deleted file mode 100644
index 995dfd3..0000000
--- a/dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI_append_raspberrypi4-64 = " \
-    file://defconfig_raspberrypi4-64 \
-    "
-
-do_post_patch_append_raspberrypi4-64() {
-    if [ ! -e "${WORKDIR}/defconfig" ] ; then
-        cp "${WORKDIR}/defconfig_raspberrypi4-64" "${WORKDIR}/defconfig"
-    fi
-}
diff --git a/recipes-extended/xen/files/0001-xen-workaround-missing-device_type-property-in-pci-p.patch b/recipes-extended/xen/files/0001-xen-workaround-missing-device_type-property-in-pci-p.patch
new file mode 100644
index 0000000..09a461b
--- /dev/null
+++ b/recipes-extended/xen/files/0001-xen-workaround-missing-device_type-property-in-pci-p.patch
@@ -0,0 +1,91 @@
+From 5a4087004d1adbbb223925f3306db0e5824a2bdc Mon Sep 17 00:00:00 2001
+From: Stefano Stabellini <sstabellini@kernel.org>
+Date: Tue, 9 Feb 2021 11:53:34 -0800
+Subject: [PATCH] xen: workaround missing device_type property in pci/pcie
+ nodes
+
+PCI buses differ from default buses in a few important ways, so it is
+important to detect them properly. Normally, PCI buses are expected to
+have the following property:
+
+    device_type = "pci"
+
+In reality, it is not always the case. To handle PCI bus nodes that
+don't have the device_type property, also consider the node name: if the
+node name is "pcie" or "pci" then consider the bus as a PCI bus.
+
+This commit is based on the Linux kernel commit
+d1ac0002dd29 "of: address: Work around missing device_type property in
+pcie nodes".
+
+This fixes Xen boot on RPi4. Some RPi4 kernels have the following node
+on their device trees:
+
+&pcie0 {
+	pci@1,0 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		reg = <0 0 0 0 0>;
+
+		usb@1,0 {
+			reg = <0x10000 0 0 0 0>;
+			resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
+		};
+	};
+};
+
+The pci@1,0 node is a PCI bus. If we parse the node and its children as
+a default bus, the reg property under usb@1,0 would have to be
+interpreted as an address range mappable by the CPU, which is not the
+case and would break.
+
+Link: https://lore.kernel.org/xen-devel/YBmQQ3Tzu++AadKx@mattapan.m5p.com/
+[fix style on commit]
+Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
+Tested-by: Elliott Mitchell <ehem+xen@m5p.com>
+Tested-by: Jukka Kaartinen <jukka.kaartinen@unikie.com>
+Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Acked-by: Julien Grall <jgrall@amazon.com>
+---
+ xen/common/device_tree.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
+index 18825e333e..03d25a81ce 100644
+--- a/xen/common/device_tree.c
++++ b/xen/common/device_tree.c
+@@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const __be32 *addr)
+  * PCI bus specific translator
+  */
+ 
++static bool dt_node_is_pci(const struct dt_device_node *np)
++{
++    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
++
++    if ( is_pci )
++        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_name);
++
++    return is_pci;
++}
++
+ static bool_t dt_bus_pci_match(const struct dt_device_node *np)
+ {
+     /*
+      * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
+      * powermacs "ht" is hypertransport
++     *
++     * If none of the device_type match, and that the node name is
++     * "pcie" or "pci", accept the device as PCI (with a warning).
+      */
+     return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
+-        !strcmp(np->type, "vci") || !strcmp(np->type, "ht");
++        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
++        dt_node_is_pci(np);
+ }
+ 
+ static void dt_bus_pci_count_cells(const struct dt_device_node *np,
+-- 
+2.25.1
+
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
index 6ac3236..14dd54a 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -6,6 +6,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+    file://0001-xen-workaround-missing-device_type-property-in-pci-p.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
-- 
2.25.1


