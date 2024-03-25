Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40267C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 14:37:43 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.53862.1711377459360780678
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 07:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e0TSzQv8;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dee27acf7aso30757785ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Mar 2024 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711377457; x=1711982257; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMYSpTT0ygc3Ub2glS0sP/OTOfcTDFAU/LBQh/UTpww=;
        b=e0TSzQv8Y5ktUBTJWksG5MLUge14DX0eGE22pPA3M+RZ5BLUNYanLqn8+lyYY+oo+6
         Tp95lyBbvlcQ6jN49SnmFcsbL4sRgDi3Ni7y0g+weO0hBP3wGKMTFy92MAEGUWYi9Q96
         sTxO1o0Ga35aMOSNOFtWUf+eh6KGU8nIIv9KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711377457; x=1711982257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMYSpTT0ygc3Ub2glS0sP/OTOfcTDFAU/LBQh/UTpww=;
        b=DODpoL+iYqMUZ2rTOG02u4ENHcnBqX7V9Pysx8qI0CfLUZ7IjnCP3Po03SsYO6mmvU
         y7gdEEDqPQ8BjOXCfqWYoqQnSIkm2nUGmfdLcuNsFSUpNlHR8Z5UicR56o3B/o4sQluG
         S4dlmsuY67O3NXJ7xt2ViT6HHl1vt5kt7b9h1/EDCDeT7taHiOx6AADdiC4YK2a8ktP4
         49J6Gd8c0werVzzlQlx8u2m1OEmEza5CIt8riAGg9Jxtzl5c+re89UxbUzANIZeA652W
         TvuCDjWhN74zezklslVYY6YFsnMu0UtkPYmwxG2HPwd9f9UDsrTnO0o1/WRVaAt3iEvh
         gbPw==
X-Gm-Message-State: AOJu0YympaIMuY/IEvwAnHUHPum1x2kI771Jqy3Eg7M+E5I0/8i+IWTU
	3keFZDb2SfAG8g/i72jA1bJZ5NdL2feiYeCl6Shq4wvlE4OAjJlWIXDLLUX7bEevg0gmz1CfL+9
	4
X-Google-Smtp-Source: AGHT+IHp+ER3SwNd6W1rIyTmNxW4J7ZcxlRVa1hAum5RP2l/uPchee0zissfOlR1B0y7/GHTbqRmMA==
X-Received: by 2002:a17:902:e986:b0:1de:e954:c0e4 with SMTP id f6-20020a170902e98600b001dee954c0e4mr7480108plb.63.1711377457250;
        Mon, 25 Mar 2024 07:37:37 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c31:1c4a:1510:8d09:6822:d0f5])
        by smtp.gmail.com with ESMTPSA id x7-20020a1709027c0700b001dd88a5dc47sm4733773pll.290.2024.03.25.07.37.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 07:37:36 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Mon, 25 Mar 2024 20:07:30 +0530
From: Ashish Sharma <asharma@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [meta-virtualization][dunfell][PATCH V2] libvirt: Backport fix for CVE-2024-2494
Date: Mon, 25 Mar 2024 20:07:29 +0530
Message-Id: <20240325143729.11867-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Mar 2024 14:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8653

Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../libvirt/libvirt/CVE-2024-2494.patch       | 220 ++++++++++++++++++
 recipes-extended/libvirt/libvirt_6.1.0.bb     |   1 +
 2 files changed, 221 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-2494.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
new file mode 100644
index 00000000..99c5eec9
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
@@ -0,0 +1,220 @@
+From 8a3f8d957507c1f8223fdcf25a3ff885b15557f2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Fri, 15 Mar 2024 10:47:50 +0000
+Subject: [PATCH] remote: check for negative array lengths before allocation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+While the C API entry points will validate non-negative lengths
+for various parameters, the RPC server de-serialization code
+will need to allocate memory for arrays before entering the C
+API. These allocations will thus happen before the non-negative
+length check is performed.
+
+Passing a negative length to the g_new0 function will usually
+result in a crash due to the negative length being treated as
+a huge positive number.
+
+This was found and diagnosed by ALT Linux Team with AFLplusplus.
+
+CVE-2024-2494
+Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
+Found-by: Alexandr Shashkin <dutyrok@altlinux.org>
+Co-developed-by: Alexander Kuznetsov <kuznetsovam@altlinux.org>
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+
+CVE: CVE-2024-2494
+Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ src/remote/remote_daemon_dispatch.c | 65 +++++++++++++++++++++++++++++
+ src/rpc/gendispatch.pl              |  5 +++
+ 2 files changed, 70 insertions(+)
+
+diff --git a/src/remote/remote_daemon_dispatch.c b/src/remote/remote_daemon_dispatch.c
+index aaabd1e56c..01dcac4b12 100644
+--- a/src/remote/remote_daemon_dispatch.c
++++ b/src/remote/remote_daemon_dispatch.c
+@@ -2291,6 +2291,10 @@ remoteDispatchDomainGetSchedulerParameters(virNetServer *server G_GNUC_UNUSED,
+     if (!conn)
+         goto cleanup;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -2339,6 +2343,10 @@ remoteDispatchDomainGetSchedulerParametersFlags(virNetServer *server G_GNUC_UNUS
+     if (!conn)
+         goto cleanup;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -2497,6 +2505,10 @@ remoteDispatchDomainBlockStatsFlags(virNetServer *server G_GNUC_UNUSED,
+         goto cleanup;
+     flags = args->flags;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_DOMAIN_BLOCK_STATS_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -2717,6 +2729,14 @@ remoteDispatchDomainGetVcpuPinInfo(virNetServer *server G_GNUC_UNUSED,
+     if (!(dom = get_nonnull_domain(conn, args->dom)))
+         goto cleanup;
+ 
++    if (args->ncpumaps < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps must be non-negative"));
++        goto cleanup;
++    }
++    if (args->maplen < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be non-negative"));
++        goto cleanup;
++    }
+     if (args->ncpumaps > REMOTE_VCPUINFO_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps > REMOTE_VCPUINFO_MAX"));
+         goto cleanup;
+@@ -2811,6 +2831,11 @@ remoteDispatchDomainGetEmulatorPinInfo(virNetServer *server G_GNUC_UNUSED,
+     if (!(dom = get_nonnull_domain(conn, args->dom)))
+         goto cleanup;
+ 
++    if (args->maplen < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be non-negative"));
++        goto cleanup;
++    }
++
+     /* Allocate buffers to take the results */
+     if (args->maplen > 0)
+         cpumaps = g_new0(unsigned char, args->maplen);
+@@ -2858,6 +2883,14 @@ remoteDispatchDomainGetVcpus(virNetServer *server G_GNUC_UNUSED,
+     if (!(dom = get_nonnull_domain(conn, args->dom)))
+         goto cleanup;
+ 
++    if (args->maxinfo < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be non-negative"));
++        goto cleanup;
++    }
++    if (args->maplen < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be non-negative"));
++        goto cleanup;
++    }
+     if (args->maxinfo > REMOTE_VCPUINFO_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo > REMOTE_VCPUINFO_MAX"));
+         goto cleanup;
+@@ -3096,6 +3129,10 @@ remoteDispatchDomainGetMemoryParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args->flags;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_DOMAIN_MEMORY_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3156,6 +3193,10 @@ remoteDispatchDomainGetNumaParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args->flags;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_DOMAIN_NUMA_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3216,6 +3257,10 @@ remoteDispatchDomainGetBlkioParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args->flags;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_DOMAIN_BLKIO_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3277,6 +3322,10 @@ remoteDispatchNodeGetCPUStats(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args->flags;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_NODE_CPU_STATS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3339,6 +3388,10 @@ remoteDispatchNodeGetMemoryStats(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args->flags;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_NODE_MEMORY_STATS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3514,6 +3567,10 @@ remoteDispatchDomainGetBlockIoTune(virNetServer *server G_GNUC_UNUSED,
+     if (!conn)
+         goto cleanup;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_DOMAIN_BLOCK_IO_TUNE_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -5081,6 +5138,10 @@ remoteDispatchDomainGetInterfaceParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args->flags;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_DOMAIN_INTERFACE_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -5301,6 +5362,10 @@ remoteDispatchNodeGetMemoryParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args->flags;
+ 
++    if (args->nparams < 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args->nparams > REMOTE_NODE_MEMORY_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+diff --git a/src/rpc/gendispatch.pl b/src/rpc/gendispatch.pl
+index 5ce988c5ae..c5842dc796 100755
+--- a/src/rpc/gendispatch.pl
++++ b/src/rpc/gendispatch.pl
+@@ -1070,6 +1070,11 @@ elsif ($mode eq "server") {
+         print "\n";
+ 
+         if ($single_ret_as_list) {
++            print "    if (args->$single_ret_list_max_var < 0) {\n";
++            print "        virReportError(VIR_ERR_RPC,\n";
++            print "                       \"%s\", _(\"max$single_ret_list_name must be non-negative\"));\n";
++            print "        goto cleanup;\n";
++            print "    }\n";
+             print "    if (args->$single_ret_list_max_var > $single_ret_list_max_define) {\n";
+             print "        virReportError(VIR_ERR_RPC,\n";
+             print "                       \"%s\", _(\"max$single_ret_list_name > $single_ret_list_max_define\"));\n";
+-- 
+GitLab
+
diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.1.0.bb
index 6843f532..d3f875a1 100644
--- a/recipes-extended/libvirt/libvirt_6.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
@@ -51,6 +51,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://CVE-2022-0897.patch \
            file://CVE-2021-3975.patch \
            file://CVE-2021-4147.patch \
+           file://CVE-2024-2494.patch \
           "
 SRC_URI[libvirt.md5sum] = "a870e63f20fac2ccf98e716d05256145"
 SRC_URI[libvirt.sha256sum] = "167c185be45560e73dd3e14ed375778b555c01455192de2dafc4d0f74fabebc0"
-- 
2.24.4


