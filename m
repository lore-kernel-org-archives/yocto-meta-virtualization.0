Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAE5C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 19:12:18 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.565.1716923534906883743
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 May 2024 12:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HDvoHyc4;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5b97648b38eso674427eaf.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 May 2024 12:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716923534; x=1717528334; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fh1ubd3BAXBjAec4Ao5l1evnSdXJMcBs0UWT1R0soew=;
        b=HDvoHyc4NJ/JmlYIxNba6j4A8IS1SMsZ1EWJjbs/4GS7Ty7aMe8hx6PSn5dy1ogrGf
         UjiJ/RnLAOQJs2DPelpCoRqmxiESC2jL8lLpcGyVPHss5lRy/9lWUjTaGoCxKsjyLs9M
         dppLViiQ4j4FHWbYpH49uobk/W2APYkZgLyjJnb9HGCk9ALw3CL4AO3PEYWJ70d7nhRd
         In1h2q03UADpXvMH/I4HCo94qaMmXXtl5a2tVC6wIDXpGgsOW9DXuAFiuHuKskYAIyqu
         oU7Waw1sYSR9ua+OEPPoFkbLCMupaYNlkI09II7iIWgldU9xJI+nm7b4IOvzAUqMwXTu
         LOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923534; x=1717528334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh1ubd3BAXBjAec4Ao5l1evnSdXJMcBs0UWT1R0soew=;
        b=VXgw0e10Xjs0itoLFFpBKkBZEJyJHV0P6J36aetWXccIKV1jbi9bizdIjoPzY18pXB
         zX+9rRCqq52RGiA92LvBiPO1D6p42F1ms8kFFmjWvBdt2I8ykO0CI3Nb2EgvBywDUwmo
         495HvNYyCWRJI8tdMr+tKBMIIjZPvMP3PbFK14Ij7q4tIfyyYJPt01ZEM7KHV6UvspGn
         6GdfMHG7WGYHlVE3nckHjwW1xn6rzxWNasau7Z/3nGsY/iGETZ1WZSLzE5c4AsvLJSN1
         t5VXBmbuXYi0eCnd9/KqvUTrvkCmkPMrCrRHok57a75uftUZ8aL7zRE/VDFT63Z74Cqf
         M1IQ==
X-Gm-Message-State: AOJu0YwBDKq3rtzHMxBKZRDL9XwncpjynUmeeNo2TwokUVuyymDo9qTA
	XGxcNOvlBvsJzVZgUujjOWnpXgHN9a5tKAmAlPujpZVOJo30fkEfARZ4Lg==
X-Google-Smtp-Source: AGHT+IGyPqk+NOJjM6jUE1Ho1vkMwXp81MGylnSTttEKa279T9lclCZZi7IXUS6PvKjvvlqIDv1OXA==
X-Received: by 2002:a05:6358:1229:b0:192:84cb:925d with SMTP id e5c5f4694b2df-197e50f5169mr1033616955d.8.1716923533658;
        Tue, 28 May 2024 12:12:13 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794d50177dcsm62769685a.1.2024.05.28.12.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:12:13 -0700 (PDT)
Date: Tue, 28 May 2024 19:12:11 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: asharma@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][dunfell][kirkstone][PATCH V2] libvirt:
 Backport fix for CVE-2024-2494
Message-ID: <ZlYsiy0wJzJ+enoi@gmail.com>
References: <20240522015833.18685-1-asharma@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240522015833.18685-1-asharma@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 May 2024 19:12:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8772

merged to kirkstne, but the libvirt version is different
in dunfell, so this can't be applied there.

Bruce

In message: [meta-virtualization][dunfell][kirkstone][PATCH V2] libvirt: Backport fix for CVE-2024-2494
on 22/05/2024 Ashish Sharma via lists.yoctoproject.org wrote:

> Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2]
> 
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../libvirt/libvirt/CVE-2024-2494.patch       | 220 ++++++++++++++++++
>  recipes-extended/libvirt/libvirt_8.1.0.bb     |   1 +
>  2 files changed, 221 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> new file mode 100644
> index 00000000..99c5eec9
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> @@ -0,0 +1,220 @@
> +From 8a3f8d957507c1f8223fdcf25a3ff885b15557f2 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> +Date: Fri, 15 Mar 2024 10:47:50 +0000
> +Subject: [PATCH] remote: check for negative array lengths before allocation
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +While the C API entry points will validate non-negative lengths
> +for various parameters, the RPC server de-serialization code
> +will need to allocate memory for arrays before entering the C
> +API. These allocations will thus happen before the non-negative
> +length check is performed.
> +
> +Passing a negative length to the g_new0 function will usually
> +result in a crash due to the negative length being treated as
> +a huge positive number.
> +
> +This was found and diagnosed by ALT Linux Team with AFLplusplus.
> +
> +CVE-2024-2494
> +Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> +Found-by: Alexandr Shashkin <dutyrok@altlinux.org>
> +Co-developed-by: Alexander Kuznetsov <kuznetsovam@altlinux.org>
> +Signed-off-by: Daniel P. Berrang� <berrange@redhat.com>
> +
> +CVE: CVE-2024-2494
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2]
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + src/remote/remote_daemon_dispatch.c | 65 +++++++++++++++++++++++++++++
> + src/rpc/gendispatch.pl              |  5 +++
> + 2 files changed, 70 insertions(+)
> +
> +diff --git a/src/remote/remote_daemon_dispatch.c b/src/remote/remote_daemon_dispatch.c
> +index aaabd1e56c..01dcac4b12 100644
> +--- a/src/remote/remote_daemon_dispatch.c
> ++++ b/src/remote/remote_daemon_dispatch.c
> +@@ -2291,6 +2291,10 @@ remoteDispatchDomainGetSchedulerParameters(virNetServer *server G_GNUC_UNUSED,
> +     if (!conn)
> +         goto cleanup;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -2339,6 +2343,10 @@ remoteDispatchDomainGetSchedulerParametersFlags(virNetServer *server G_GNUC_UNUS
> +     if (!conn)
> +         goto cleanup;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -2497,6 +2505,10 @@ remoteDispatchDomainBlockStatsFlags(virNetServer *server G_GNUC_UNUSED,
> +         goto cleanup;
> +     flags = args->flags;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_BLOCK_STATS_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -2717,6 +2729,14 @@ remoteDispatchDomainGetVcpuPinInfo(virNetServer *server G_GNUC_UNUSED,
> +     if (!(dom = get_nonnull_domain(conn, args->dom)))
> +         goto cleanup;
> + 
> ++    if (args->ncpumaps < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps must be non-negative"));
> ++        goto cleanup;
> ++    }
> ++    if (args->maplen < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->ncpumaps > REMOTE_VCPUINFO_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps > REMOTE_VCPUINFO_MAX"));
> +         goto cleanup;
> +@@ -2811,6 +2831,11 @@ remoteDispatchDomainGetEmulatorPinInfo(virNetServer *server G_GNUC_UNUSED,
> +     if (!(dom = get_nonnull_domain(conn, args->dom)))
> +         goto cleanup;
> + 
> ++    if (args->maplen < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be non-negative"));
> ++        goto cleanup;
> ++    }
> ++
> +     /* Allocate buffers to take the results */
> +     if (args->maplen > 0)
> +         cpumaps = g_new0(unsigned char, args->maplen);
> +@@ -2858,6 +2883,14 @@ remoteDispatchDomainGetVcpus(virNetServer *server G_GNUC_UNUSED,
> +     if (!(dom = get_nonnull_domain(conn, args->dom)))
> +         goto cleanup;
> + 
> ++    if (args->maxinfo < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be non-negative"));
> ++        goto cleanup;
> ++    }
> ++    if (args->maplen < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->maxinfo > REMOTE_VCPUINFO_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo > REMOTE_VCPUINFO_MAX"));
> +         goto cleanup;
> +@@ -3096,6 +3129,10 @@ remoteDispatchDomainGetMemoryParameters(virNetServer *server G_GNUC_UNUSED,
> + 
> +     flags = args->flags;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_MEMORY_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -3156,6 +3193,10 @@ remoteDispatchDomainGetNumaParameters(virNetServer *server G_GNUC_UNUSED,
> + 
> +     flags = args->flags;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_NUMA_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -3216,6 +3257,10 @@ remoteDispatchDomainGetBlkioParameters(virNetServer *server G_GNUC_UNUSED,
> + 
> +     flags = args->flags;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_BLKIO_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -3277,6 +3322,10 @@ remoteDispatchNodeGetCPUStats(virNetServer *server G_GNUC_UNUSED,
> + 
> +     flags = args->flags;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_NODE_CPU_STATS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -3339,6 +3388,10 @@ remoteDispatchNodeGetMemoryStats(virNetServer *server G_GNUC_UNUSED,
> + 
> +     flags = args->flags;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_NODE_MEMORY_STATS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -3514,6 +3567,10 @@ remoteDispatchDomainGetBlockIoTune(virNetServer *server G_GNUC_UNUSED,
> +     if (!conn)
> +         goto cleanup;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_BLOCK_IO_TUNE_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -5081,6 +5138,10 @@ remoteDispatchDomainGetInterfaceParameters(virNetServer *server G_GNUC_UNUSED,
> + 
> +     flags = args->flags;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_INTERFACE_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +@@ -5301,6 +5362,10 @@ remoteDispatchNodeGetMemoryParameters(virNetServer *server G_GNUC_UNUSED,
> + 
> +     flags = args->flags;
> + 
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_NODE_MEMORY_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
> +         goto cleanup;
> +diff --git a/src/rpc/gendispatch.pl b/src/rpc/gendispatch.pl
> +index 5ce988c5ae..c5842dc796 100755
> +--- a/src/rpc/gendispatch.pl
> ++++ b/src/rpc/gendispatch.pl
> +@@ -1070,6 +1070,11 @@ elsif ($mode eq "server") {
> +         print "\n";
> + 
> +         if ($single_ret_as_list) {
> ++            print "    if (args->$single_ret_list_max_var < 0) {\n";
> ++            print "        virReportError(VIR_ERR_RPC,\n";
> ++            print "                       \"%s\", _(\"max$single_ret_list_name must be non-negative\"));\n";
> ++            print "        goto cleanup;\n";
> ++            print "    }\n";
> +             print "    if (args->$single_ret_list_max_var > $single_ret_list_max_define) {\n";
> +             print "        virReportError(VIR_ERR_RPC,\n";
> +             print "                       \"%s\", _(\"max$single_ret_list_name > $single_ret_list_max_define\"));\n";
> +-- 
> +GitLab
> +
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index 63cf4914..a88e0ee3 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -30,6 +30,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://gnutls-helper.py \
>             file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
>             file://CVE-2023-2700.patch \
> +           file://CVE-2024-2494.patch \
>            "
>  
>  SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
> -- 
> 2.35.7
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8736): https://lists.yoctoproject.org/g/meta-virtualization/message/8736
> Mute This Topic: https://lists.yoctoproject.org/mt/106236215/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


