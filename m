Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4682.1593065114530971227
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 23:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GZRjU9wf;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62AC7E01D78; Wed, 24 Jun 2020 23:05:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E584E01D75
	for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:05:13 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id u12so3753330qth.12
        for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pxE/CGrE6jNfwacUm10GRnycc0tRegYeUkK32F9HD8c=;
        b=GZRjU9wf3LR+zGqArs+W3NOR/tmfxg1Qhl/AQJAcopddQ9vGfv6fLYyvVSmbAeNNtR
         PzrD6E5iQu0hUPqFWH4o7IwyrM85A901696ElTudQ32OfadwmJZssMV3nZ1KbqK+l7Yc
         BsrhVTEMq/zHnIunrs8c4vh/mq5PnpkHH4U2j8mYpvwGWQEaaB6ss/KQbNTSq1WGZTfM
         rGRBnsmlRccVmzlmWP4UX1mitBMcUFHWdG2aDofbFo4LSFigEAsKbqwTy/PWXS1pgqUL
         YHsEZvNVJV6NO8trk8lstcSq1OpDbyvOazUNAect2nN1X8duFSrFCKxzoMsywMFJVgXt
         7Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pxE/CGrE6jNfwacUm10GRnycc0tRegYeUkK32F9HD8c=;
        b=j9JCX/oVApjIoQaH2ROQDPg1kObvD+uy3+wlsh0CnRrTOp5DWrnS1AlPq6dyfueAxx
         iBcDs4WYO5s4uNEI+c8a6CN1b3pzPNh+ntXsoijihgK3HMGSLtJhZGXLDa9om1Q5wfU1
         DczWabXExs19qtDJATD0gk+YfVC4Ky5c3TWy569jnQmNMRVtrkllqh0KCDc4vWsKCKy+
         CDWXeXxp5VTkQqtF6jNoIidlRZS+rpzoZHtzvOV/v0hYOxPAK1u4bCM2WFt/bBf3iXIU
         Fw1MKMcA5Kw0CMTqkOS8Cy+lENt5nSkBvNwHaZXAYk1dtRp7EU/g78NeoOgEUyE6mrw6
         hJaQ==
X-Gm-Message-State: AOAM533jwuJSA7AXoMOtJHpolSBpwnDkVXB8IxFsVNa4I34Y9+Gc1t53
	UnPcV1vmyW0y9ylCtMapEC0tcBdyiKc=
X-Google-Smtp-Source: ABdhPJxqaCylZCGJSLlWT1vXMIbLaLebmeBjcybFPaz7JEMvm3vj9wnGRsBXhPu1ag3N2IfzOeNCQQ==
X-Received: by 2002:ac8:4e86:: with SMTP id 6mr30725662qtp.390.1593065112441;
        Wed, 24 Jun 2020 23:05:12 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-6.mycingular.net. [166.176.184.6])
        by smtp.gmail.com with ESMTPSA id g5sm6059161qta.46.2020.06.24.23.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:05:12 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH 07/10] xen, raspberry pi 4: provide a default defconfig for raspberrypi4
Date: Wed, 24 Jun 2020 23:04:28 -0700
Message-Id: <20200625060431.31826-8-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625060431.31826-1-christopher.w.clark@gmail.com>
References: <20200625060431.31826-1-christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../xen/files/defconfig_raspberrypi4-64       | 117 ++++++++++++++++++
 .../recipes-extended/xen/xen_git.bbappend     |  11 ++
 2 files changed, 128 insertions(+)
 create mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
 create mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend

diff --git a/dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64 b/dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
new file mode 100644
index 0000000..f3343d3
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
@@ -0,0 +1,117 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Xen/arm 4.13.0 Configuration
+#
+CONFIG_64BIT=y
+CONFIG_ARM_64=y
+CONFIG_ARM=y
+CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
+
+#
+# Architecture Features
+#
+CONFIG_NR_CPUS=128
+# CONFIG_ACPI is not set
+CONFIG_GICV3=y
+# CONFIG_HAS_ITS is not set
+CONFIG_HVM=y
+# CONFIG_NEW_VGIC is not set
+CONFIG_SBSA_VUART_CONSOLE=y
+CONFIG_ARM_SSBD=y
+CONFIG_HARDEN_BRANCH_PREDICTOR=y
+# CONFIG_TEE is not set
+
+#
+# ARM errata workaround via the alternative framework
+#
+CONFIG_ARM64_ERRATUM_827319=y
+CONFIG_ARM64_ERRATUM_824069=y
+CONFIG_ARM64_ERRATUM_819472=y
+CONFIG_ARM64_ERRATUM_832075=y
+CONFIG_ARM64_ERRATUM_834220=y
+CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
+CONFIG_ALL_PLAT=y
+# CONFIG_QEMU is not set
+# CONFIG_RCAR3 is not set
+# CONFIG_MPSOC is not set
+# CONFIG_NO_PLAT is not set
+CONFIG_ALL64_PLAT=y
+# CONFIG_ALL32_PLAT is not set
+CONFIG_MPSOC_PLATFORM=y
+
+#
+# Common Features
+#
+CONFIG_GRANT_TABLE=y
+CONFIG_HAS_ALTERNATIVE=y
+CONFIG_HAS_DEVICE_TREE=y
+CONFIG_HAS_FAST_MULTIPLY=y
+# CONFIG_MEM_ACCESS is not set
+CONFIG_HAS_PDX=y
+
+#
+# Speculative hardening
+#
+CONFIG_SPECULATIVE_HARDEN_ARRAY=y
+# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set
+CONFIG_XSM=y
+CONFIG_XSM_FLASK=y
+CONFIG_XSM_FLASK_AVC_STATS=y
+# CONFIG_XSM_FLASK_POLICY is not set
+CONFIG_XSM_SILO=y
+# CONFIG_XSM_DUMMY_DEFAULT is not set
+# CONFIG_XSM_FLASK_DEFAULT is not set
+CONFIG_XSM_SILO_DEFAULT=y
+# CONFIG_ARGO is not set
+
+#
+# Schedulers
+#
+CONFIG_SCHED_CREDIT=y
+CONFIG_SCHED_CREDIT2=y
+CONFIG_SCHED_RTDS=y
+CONFIG_SCHED_ARINC653=y
+CONFIG_SCHED_NULL=y
+# CONFIG_SCHED_CREDIT_DEFAULT is not set
+CONFIG_SCHED_CREDIT2_DEFAULT=y
+# CONFIG_SCHED_RTDS_DEFAULT is not set
+# CONFIG_SCHED_ARINC653_DEFAULT is not set
+# CONFIG_SCHED_NULL_DEFAULT is not set
+CONFIG_SCHED_DEFAULT="credit2"
+# CONFIG_LIVEPATCH is not set
+# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set
+# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
+CONFIG_CMDLINE=""
+CONFIG_DOM0_MEM=""
+CONFIG_TRACEBUFFER=y
+
+#
+# Device Drivers
+#
+CONFIG_HAS_NS16550=y
+CONFIG_HAS_CADENCE_UART=y
+CONFIG_HAS_MVEBU=y
+CONFIG_HAS_MESON=y
+CONFIG_HAS_PL011=y
+CONFIG_HAS_SCIF=y
+CONFIG_HAS_PASSTHROUGH=y
+CONFIG_ARM_SMMU=y
+# CONFIG_IPMMU_VMSA is not set
+CONFIG_IOMMU_FORCE_PT_SHARE=y
+CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
+
+#
+# Debugging Options
+#
+CONFIG_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_FRAME_POINTER=y
+# CONFIG_COVERAGE is not set
+# CONFIG_DEBUG_LOCK_PROFILE is not set
+CONFIG_DEBUG_LOCKS=y
+# CONFIG_PERF_COUNTERS is not set
+CONFIG_VERBOSE_DEBUG=y
+# CONFIG_DEVICE_TREE_DEBUG is not set
+CONFIG_SCRUB_DEBUG=y
+# CONFIG_DEBUG_TRACE is not set
+CONFIG_XMEM_POOL_POISON=y
diff --git a/dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend b/dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend
new file mode 100644
index 0000000..995dfd3
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend
@@ -0,0 +1,11 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI_append_raspberrypi4-64 = " \
+    file://defconfig_raspberrypi4-64 \
+    "
+
+do_post_patch_append_raspberrypi4-64() {
+    if [ ! -e "${WORKDIR}/defconfig" ] ; then
+        cp "${WORKDIR}/defconfig_raspberrypi4-64" "${WORKDIR}/defconfig"
+    fi
+}
-- 
2.17.1

