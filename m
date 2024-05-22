Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A35C25B74
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 02:00:57 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.352.1716343252193646920
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 May 2024 19:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fOf9wWyX;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: asharma@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2b432be5cc9so885889a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 May 2024 19:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1716343251; x=1716948051; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68pMwIZ7dhbGVrbT/QA22CbFsYEW5gCtbJxsZ+01AmU=;
        b=fOf9wWyXu39xD/j8reSfyqLLIJs4S9pfEiBTj+C8sxnJM2S8BFpEuE0bTz9+/FieBI
         31xrS6gXzl941s6gEgRgkDnHxeenaVhyE08kHbAKevT5A3ihmWG/r8QxKq2ExO07T2ei
         b8BMcPtSj1xGNI2abaRDMsoE2v5TA0QIgVb0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716343251; x=1716948051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68pMwIZ7dhbGVrbT/QA22CbFsYEW5gCtbJxsZ+01AmU=;
        b=EL68uX8NAzZmIdBRyRlt8OC5yLOu6gXIi0VPWkVZ/+8q/oP4SsjsD2MiQaTaPeNEg7
         THQNYD+CCHA6dPCoFT8Uhga4CpdVW37DKZAgxzO/DTD9IsUoi5wmyuq53ZmQVy3+xnNZ
         KG2qzbPlSEMBCPBNR/23MFLwK0D0SRnu3p4hTmFMsDW/xLNKFJbvKf5WDB1gcLLWsdMW
         FEb0GdjPG6OJGMknaACkC2R/oKxpplDAymB76IeeEABbdudcvF149bJ6+ijbFsDVOn2N
         jHpyuWCzwnC9xwZJaspzUON13jsbIhtI0YTYA+L3UD6T97E8g/JkaUnGXG4L4fL35NuN
         UZOQ==
X-Gm-Message-State: AOJu0YxOep4ikrSsyN3p5IMBXtbuEVUmc7uh1AYOnB8nlw1ekS/5zQ5+
	tR/DjfpRirVkqfhoA0rrgo0uh6ETGgYbf4w2c/qP7SSwbnNGZiR6eHRizQzM1KwScK63efbjlfC
	S
X-Google-Smtp-Source: AGHT+IGXZBGB36aDEYzFMfj6+2CTeDU++QzxoMWwbYVehof6apTKZwwozFeB8miqkxxGXwxBb12sTA==
X-Received: by 2002:a17:90a:af88:b0:2bd:92c3:6b93 with SMTP id 98e67ed59e1d1-2bd9f49bda2mr917960a91.34.1716343250933;
        Tue, 21 May 2024 19:00:50 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.86.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a126sm24713643a91.5.2024.05.21.19.00.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2024 19:00:50 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 22 May 2024 07:28:34 +0530
From: Ashish Sharma <asharma@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [meta-virtualization][dunfell][kirkstone][PATCH V2] libvirt: Backport fix for CVE-2024-2494
Date: Wed, 22 May 2024 07:28:33 +0530
Message-Id: <20240522015833.18685-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 02:00:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8736

Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../libvirt/libvirt/CVE-2024-2494.patch       | 220 ++++++++++++++++++
 recipes-extended/libvirt/libvirt_8.1.0.bb     |   1 +
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
diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
index 63cf4914..a88e0ee3 100644
--- a/recipes-extended/libvirt/libvirt_8.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://gnutls-helper.py \
            file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
            file://CVE-2023-2700.patch \
+           file://CVE-2024-2494.patch \
           "
 
 SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
-- 
2.35.7


