Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04435C54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 08:35:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.3798.1711442129969266343
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Mar 2024 01:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XYD0QS1g;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1def89f0cfdso45670665ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Mar 2024 01:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711442129; x=1712046929; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykhUQpnuFmd2mVYXMNqouRqfG3Scf1E2Uy0kWecNTe4=;
        b=XYD0QS1gOLezxQ8N/DFnng4dTCGuzDpkziBTAKBt9f3vJogA5Rb88Fm6fqULJsoGqr
         rvpXIdWMC7mvHMpi4E43zdakr2yQUU123gQhsr96Es19mOekUNX6n7r2EL/rBWM61CHd
         02atEPf/xb9lQQYbhHYmq1a+Pl5Y8ctlDtTUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711442129; x=1712046929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykhUQpnuFmd2mVYXMNqouRqfG3Scf1E2Uy0kWecNTe4=;
        b=iF97zdJGu6SLIGoweTXG59/rhThBEE/fjXaJDqxLhzgi3RsqJ5bTfwx3fqh1P2Afz3
         maa3nANCsCKTSlJzmfyq6x0tL9S/E4+40HIrv4maBcECE0tL3+20KiSEtN0gclWC9/hH
         LYmodn7P2SlrBfJgNAy3+sUSiixDbHwyixrB3qOGEKu21Izb2ae3w6pNdNXc3AIEFFV9
         PqYIaj4WODdeVEp/fuMMBtDXsyyM19sDxgfHCgqYDVJkK0ijY9O5/4PCLwomQYU6NSV+
         gkqbINwYg1+BbPeJKU84L3P13LYi/FAVdgL9tKBKIDtFPSYHIsE9PMNmNE7LPtRUHdKq
         eezg==
X-Gm-Message-State: AOJu0Yyj1po0kTpBjGF38RojQDMczMQdw0YEN+s7IN9SUEiY9jXS32RR
	xRwKL2B02+YQDDLhJ3w0igczeQySZ8bm9KBOk87CVf8UNsCR1FJM9NlQwbW+MUPnGDgOu7sDfAo
	8
X-Google-Smtp-Source: AGHT+IFC6Qmz3XfqBmlAfEdjCAWToZZG6Lrks1pdtTEor/NoJ1Ij2Sfu7/4ZGg4QrDPSoeRXNW/kzA==
X-Received: by 2002:a17:902:c949:b0:1e0:9964:76f4 with SMTP id i9-20020a170902c94900b001e0996476f4mr1326131pla.14.1711442128957;
        Tue, 26 Mar 2024 01:35:28 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c31:1c4a:1510:8d09:6822:d0f5])
        by smtp.gmail.com with ESMTPSA id l7-20020a170902f68700b001e0b863b815sm3952682plg.96.2024.03.26.01.35.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 01:35:28 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 26 Mar 2024 14:05:22 +0530
From: Ashish Sharma <asharma@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [meta-virtualization][kirkstone][PATCH] libvirt: Backport fix for CVE-2024-2494
Date: Tue, 26 Mar 2024 14:05:21 +0530
Message-Id: <20240326083521.28230-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Mar 2024 08:35:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8655

Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../libvirt/libvirt/CVE-2024-2494.patch       | 220 ++++++++++++++++++
 recipes-extended/libvirt/libvirt_8.1.0.bb     |   1 +
 2 files changed, 221 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-2494.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
new file mode 100644
index 000000000..99c5eec98
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
index 63cf49146..a88e0ee31 100644
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


