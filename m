Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.4205.1619253086258941598
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Apr 2021 01:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CSVoDvXE;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id ei1so6921914qvb.9
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Apr 2021 01:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kIW6grm85t5k4GqHz4njH7DXFJ3qmgy8cPSayltT1Vg=;
        b=CSVoDvXEM4BKP3Axbz9hFvBV/u5vwCo1hAzO6Xg6IEDlx5jXg3+NN4v3clLQ6aHmVv
         U//DmjgY3psZo962N2NXffzEz+EdZ7r/zJjRsvuKKBvAA3FfEgRFBNX2Sh0vkpATqQcC
         yYBmNMBxTbZ0N2jzo+zV5t6X3zXtiutNdy2pSoMo6O6bYy1mOKhcWMoSTNQCG0koKant
         1FaU3BXrawDXSemk0qVFhA6qi5lcz1hblquBlf4Cgfnk2VFEx4DtgKCNzVwd3Ujo74Gm
         GLFmyNOvUCUd31pC1tQ7fPMu5nLEH7vIzVWCXpKpDkt0ePlEPssKjZHMJ83q4hFpR9aG
         I8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kIW6grm85t5k4GqHz4njH7DXFJ3qmgy8cPSayltT1Vg=;
        b=XepO6iyuC9EuRUNQS1fwmQGnxuOgOOTfs026Ge8dHY8dlc3ysFIjkc3ebjnzgQUdMd
         r55l6KhTOrAZzYA5RUVy5JYczoNvBaIrmEMuHXBLrnFlEJ2SO+bAK847Cg2+txSAuM40
         UTudf+eH9bf2O5js5huId7Ar6O4Mji7tC49jrClppH7iU/LY+lahmK9WWCc4NBgCSORD
         AMcs3Dai46r9NSZpfJo5g+FvG8MPHGfJ1ok6vahasP7sHyimjKrg4PJiqoMkLIEoqAqt
         NKx0QpdqILxqudIBXu89qQS+hhKT9U6Gt1BeF5yIAKLcoeWuBYZvkR6aKLrv8FnuDldi
         E6hg==
X-Gm-Message-State: AOAM531ZfoutptBlhVfpQAqjkg6x+OduK68IKTH86kgKyap5BVgRNJBi
	ljzCj9gbtqm4O9FSO10ggiN2hStIq9Y=
X-Google-Smtp-Source: ABdhPJynSBH9aLrW6WwJI/HC4YpAh8Oxuxxa0f9w6+rAa0KRubVIK7qjqsSeWvZ2aOfEbnWPYQFJZg==
X-Received: by 2002:a0c:c3cd:: with SMTP id p13mr8323305qvi.4.1619253085112;
        Sat, 24 Apr 2021 01:31:25 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-81.mycingular.net. [166.176.184.81])
        by smtp.gmail.com with ESMTPSA id x24sm5984951qtm.95.2021.04.24.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:31:24 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 2/8] xen, rpi4: drop the raspberrypi4-64 defconfig, xen_git.bbappend
Date: Sat, 24 Apr 2021 01:30:57 -0700
Message-Id: <20210424083103.202107-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424083103.202107-1-christopher.w.clark@gmail.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since upstream Xen 4.14 and 4.15 have working default configs for Xen on
the Raspberry Pi 4, the defconfig and bbappend in the raspberrypi
dynamic layer can now be removed.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../xen/files/defconfig_raspberrypi4-64       | 117 ------------------
 .../recipes-extended/xen/xen_git.bbappend     |  11 --
 2 files changed, 128 deletions(-)
 delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
 delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend

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
-- 
2.25.1

