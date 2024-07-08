Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D501AC3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 04:36:15 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.72627.1720413374280174585
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Jul 2024 21:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Y9s+aq9N;
 spf=pass (domain: mvista.com, ip: 209.85.128.169, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-651da7c1531so30426187b3.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Jul 2024 21:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720413373; x=1721018173; darn=lists.yoctoproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4Ig481coHdTi/85q+8TaqRPEj65igYLUbvw2SGsHzg=;
        b=Y9s+aq9NSN0WIzWZh3Z78XB0+TOx1vgcF2JZgO/SudBBnBjcGfOZjTu3Jop+er+Jy5
         hgcFCVJ8BA6dyjM3s0/dYKCgBhGmza43T9PULmQSAHC69N+/lDW9mqGe9/uMVk4Ev50E
         mCC/DF3jcJ+dIvdRHza7Ty6BMWlNQBx71FAzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720413373; x=1721018173;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q4Ig481coHdTi/85q+8TaqRPEj65igYLUbvw2SGsHzg=;
        b=vsvM4imXhVl2UIRz6zWjOn/JV6+VB6Me+BBqjP959Gx38AU6u9dSSVxRqO1mL+ZKJ8
         4bb7J4t0cQ+1EZm5E4GrHJG1LBtmkE397xQjTVh3UYEjSP1D3d2UGSEaUdMMEZtT9Fl9
         ui+5ZZREBybJAgxqPUULz5cYfnajSEz/FMZNR5bSCy0oj93L4z98Td4gBMenRAGgWq5h
         cgBZAxkHmd8QI10PFyoxPqFKJWbwkmopUFOJ7EpzkhkedAfrzpu90BPkm2e6w/Y3P58D
         6B9bsOWdMyQMl4V3+wNEMEuHKyrwa01QnJOPM1EPleJKcBZtvqF2XuNm9b6uvGDjbBWL
         C6EA==
X-Gm-Message-State: AOJu0YzO53BNA7SAhFavLCp+e+oPHikcW2HXQW3SegxZagRLAFgCr/OL
	2mE43vzzh4HW1wS1v71OQtktVNHaIU71zOG4H1mkvyg5ebQ1HX61u00YTybaucuwSBKDj80/17h
	+
X-Google-Smtp-Source: AGHT+IEp2yWxHtOGJetmFdnalqYp5oSt1hl9FKbbolg/e+mgPjur1ZH/Fz0CCCpATUxYP1/rbqXLew==
X-Received: by 2002:a81:430a:0:b0:64a:7040:2d8a with SMTP id 00721157ae682-652d5b0e4f6mr116506387b3.23.1720413372959;
        Sun, 07 Jul 2024 21:36:12 -0700 (PDT)
Received: from [192.168.0.102] ([150.129.170.238])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65527a498b4sm8083727b3.59.2024.07.07.21.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 21:36:12 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------4W0Pb7XC8tRwiaZGF5a5975Q"
Message-ID: <c31a6e36-326a-4206-846b-d70f4bcdc37b@mvista.com>
Date: Mon, 8 Jul 2024 10:06:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][meta-virtualization][PATCH] libvirt: fix multiple
 CVEs
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com
References: <20240626062358.90542-1-hprajapati@mvista.com>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <20240626062358.90542-1-hprajapati@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jul 2024 04:36:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8818

This is a multi-part message in MIME format.
--------------4W0Pb7XC8tRwiaZGF5a5975Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Team/Bruce,

any update on this patch ??

Regards,

Hitendra Prajapati

On 26/06/24 11:53 am, Hitendra Prajapati wrote:
> Backport fixes for:
>
> * CVE-2024-1441 - Upstream-Status: Backport fromhttps://gitlab.com/libvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6ebb8
> * CVE-2024-2494 - Upstream-Status: Backport fromhttps://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2
> * CVE-2024-4418 - Upstream-Status: Backport fromhttps://gitlab.com/libvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1
>
> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
> ---
>   .../libvirt/libvirt/CVE-2024-1441.patch       |  70 ++++++
>   .../libvirt/libvirt/CVE-2024-2494.patch       | 220 ++++++++++++++++++
>   .../libvirt/libvirt/CVE-2024-4418.patch       |  86 +++++++
>   recipes-extended/libvirt/libvirt_10.0.0.bb    |   3 +
>   4 files changed, 379 insertions(+)
>   create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
>   create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
>   create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
> new file mode 100644
> index 00000000..3fbf1d52
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
> @@ -0,0 +1,70 @@
> +From c664015fe3a7bf59db26686e9ed69af011c6ebb8 Mon Sep 17 00:00:00 2001
> +From: Martin Kletzander<mkletzan@redhat.com>
> +Date: Tue, 27 Feb 2024 16:20:12 +0100
> +Subject: [PATCH] Fix off-by-one error in udevListInterfacesByStatus
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Ever since this function was introduced in 2012 it could've tried
> +filling in an extra interface name.  That was made worse in 2019 when
> +the caller functions started accepting NULL arrays of size 0.
> +
> +This is assigned CVE-2024-1441.
> +
> +Signed-off-by: Martin Kletzander<mkletzan@redhat.com>
> +Reported-by: Alexander Kuznetsov<kuznetsovam@altlinux.org>
> +Fixes: 5a33366f5c0b18c93d161bd144f9f079de4ac8ca
> +Fixes: d6064e2759a24e0802f363e3a810dc5a7d7ebb15
> +Reviewed-by: Ján Tomko<jtomko@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6ebb8]
> +CVE: CVE-2024-1441
> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
> +---
> + NEWS.rst                               | 15 +++++++++++++++
> + src/interface/interface_backend_udev.c |  2 +-
> + 2 files changed, 16 insertions(+), 1 deletion(-)
> +
> +diff --git a/NEWS.rst b/NEWS.rst
> +index d013fc7..25f2038 100644
> +--- a/NEWS.rst
> ++++ b/NEWS.rst
> +@@ -557,6 +557,21 @@ v9.2.0 (2023-04-01)
> + v9.1.0 (2023-03-01)
> + ===================
> +
> ++  * ``CVE-2024-1441``: Fix off-by-one error leading to a crash
> ++
> ++    In **libvirt-1.0.0** there were couple of interface listing APIs
> ++    introduced which had an off-by-one error.  That error could lead to a
> ++    very rare crash if an array was passed to those functions which did
> ++    not fit all the interfaces.
> ++
> ++    In **libvirt-5.10** a check for non-NULL arrays has been adjusted to
> ++    allow for NULL arrays with size 0 instead of rejecting all NULL
> ++    arrays.  However that made the above issue significantly worse since
> ++    that off-by-one error now did not write beyond an array, but
> ++    dereferenced said NULL pointer making the crash certain in a
> ++    specific scenario in which a NULL array of size 0 was passed to the
> ++    aforementioned functions.
> ++
> + * **Removed features**
> +
> +   * vbox: removed support for version 5.2 and 6.0 APIs
> +diff --git a/src/interface/interface_backend_udev.c b/src/interface/interface_backend_udev.c
> +index fb6799e..4091483 100644
> +--- a/src/interface/interface_backend_udev.c
> ++++ b/src/interface/interface_backend_udev.c
> +@@ -222,7 +222,7 @@ udevListInterfacesByStatus(virConnectPtr conn,
> +         g_autoptr(virInterfaceDef) def = NULL;
> +
> +         /* Ensure we won't exceed the size of our array */
> +-        if (count > names_len)
> ++        if (count >= names_len)
> +             break;
> +
> +         path = udev_list_entry_get_name(dev_entry);
> +--
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> new file mode 100644
> index 00000000..6b38f13a
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> @@ -0,0 +1,220 @@
> +From 8a3f8d957507c1f8223fdcf25a3ff885b15557f2 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=<berrange@redhat.com>
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
> +Reviewed-by: Michal Privoznik<mprivozn@redhat.com>
> +Found-by: Alexandr Shashkin<dutyrok@altlinux.org>
> +Co-developed-by: Alexander Kuznetsov<kuznetsovam@altlinux.org>
> +Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2]
> +CVE: CVE-2024-2494
> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
> +---
> + src/remote/remote_daemon_dispatch.c | 65 +++++++++++++++++++++++++++++
> + src/rpc/gendispatch.pl              |  5 +++
> + 2 files changed, 70 insertions(+)
> +
> +diff --git a/src/remote/remote_daemon_dispatch.c b/src/remote/remote_daemon_dispatch.c
> +index 7daf503..7542caa 100644
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
> +@@ -5079,6 +5136,10 @@ remoteDispatchDomainGetInterfaceParameters(virNetServer *server G_GNUC_UNUSED,
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
> +@@ -5299,6 +5360,10 @@ remoteDispatchNodeGetMemoryParameters(virNetServer *server G_GNUC_UNUSED,
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
> +index ea46a9d..17abadc 100755
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
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch b/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
> new file mode 100644
> index 00000000..81189abb
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
> @@ -0,0 +1,86 @@
> +From 8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=<berrange@redhat.com>
> +Date: Tue, 30 Apr 2024 11:51:15 +0100
> +Subject: [PATCH] rpc: ensure temporary GSource is removed from client event
> + loop
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Users are seeing periodic segfaults from libvirt client apps,
> +especially thread heavy ones like virt-manager. A typical
> +stack trace would end up in the virNetClientIOEventFD method,
> +with illegal access to stale stack data. eg
> +The root cause is a bad assumption in the virNetClientIOEventLoop
> +method. This method is run by whichever thread currently owns the
> +buck, and is responsible for handling I/O. Inside a for(;;) loop,
> +this method creates a temporary GSource, adds it to the event loop
> +and runs g_main_loop_run(). When I/O is ready, the GSource callback
> +(virNetClientIOEventFD) will fire and call g_main_loop_quit(), and
> +return G_SOURCE_REMOVE which results in the temporary GSource being
> +destroyed. A g_autoptr() will then remove the last reference.
> +
> +What was overlooked, is that a second thread can come along and
> +while it can't enter virNetClientIOEventLoop, it will register an
> +idle source that uses virNetClientIOWakeup to interrupt the
> +original thread's 'g_main_loop_run' call. When this happens the
> +virNetClientIOEventFD callback never runs, and so the temporary
> +GSource is not destroyed. The g_autoptr() will remove a reference,
> +but by virtue of still being attached to the event context, there
> +is an extra reference held causing GSource to be leaked. The
> +next time 'g_main_loop_run' is called, the original GSource will
> +trigger its callback, and access data that was allocated on the
> +stack by the previous thread, and likely SEGV.
> +
> +To solve this, the thread calling 'g_main_loop_run' must call
> +g_source_destroy, immediately upon return, to guarantee that
> +the temporary GSource is removed.
> +
> +CVE-2024-4418
> +Reviewed-by: Ján Tomko<jtomko@redhat.com>
> +Reported-by: Martin Shirokov<shirokovmartin@gmail.com>
> +Tested-by: Martin Shirokov<shirokovmartin@gmail.com>
> +Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1]
> +CVE: CVE-2024-4418
> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
> +---
> + src/rpc/virnetclient.c | 14 +++++++++++++-
> + 1 file changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/rpc/virnetclient.c b/src/rpc/virnetclient.c
> +index 68098b1..147b0d6 100644
> +--- a/src/rpc/virnetclient.c
> ++++ b/src/rpc/virnetclient.c
> +@@ -1657,7 +1657,7 @@ static int virNetClientIOEventLoop(virNetClient *client,
> + #endif /* !WIN32 */
> +         int timeout = -1;
> +         virNetMessage *msg = NULL;
> +-        g_autoptr(GSource) G_GNUC_UNUSED source = NULL;
> ++        g_autoptr(GSource) source = NULL;
> +         GIOCondition ev = 0;
> +         struct virNetClientIOEventData data = {
> +             .client = client,
> +@@ -1721,6 +1721,18 @@ static int virNetClientIOEventLoop(virNetClient *client,
> +
> +         g_main_loop_run(client->eventLoop);
> +
> ++        /*
> ++         * If virNetClientIOEventFD ran, this GSource will already be
> ++         * destroyed due to G_SOURCE_REMOVE. It is harmless to re-destroy
> ++         * it, since we still own a reference.
> ++         *
> ++         * If virNetClientIOWakeup ran, it will have interrupted the
> ++         * g_main_loop_run call, before virNetClientIOEventFD could
> ++         * run, and thus the GSource is still registered, and we need
> ++         * to destroy it since it is referencing stack memory for 'data'
> ++         */
> ++        g_source_destroy(source);
> ++
> + #ifndef WIN32
> +         ignore_value(pthread_sigmask(SIG_SETMASK, &oldmask, NULL));
> + #endif /* !WIN32 */
> +--
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
> index 6b19b700..a33b6980 100644
> --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> @@ -32,6 +32,9 @@ SRC_URI ="http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \ 
> file://gnutls-helper.py \ 
> file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch 
> \ 
> file://0001-messon.build-remove-build-path-information-to-avoid-.patch 
> \ + file://CVE-2024-1441.patch \ + file://CVE-2024-2494.patch \ + 
> file://CVE-2024-4418.patch \ "
>   
>   SRC_URI[libvirt.sha256sum] = "8ba2e72ec8bdd2418554a1474c42c35704c30174b7611eaf9a16544b71bcf00a"
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
Mo: +91 9998906483
--------------4W0Pb7XC8tRwiaZGF5a5975Q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="2">Hi Team/Bruce,</font></p>
    <p><font size="2">any update on this patch ??</font></p>
    <p><font size="2">Regards,</font></p>
    <p><font size="2">Hitendra Prajapati<br>
      </font></p>
    <div class="moz-cite-prefix">On 26/06/24 11:53 am, Hitendra
      Prajapati wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240626062358.90542-1-hprajapati@mvista.com">
      <pre class="moz-quote-pre" wrap="">Backport fixes for:

* CVE-2024-1441 - Upstream-Status: Backport from <a class="moz-txt-link-freetext" href="https://gitlab.com/libvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6ebb8">https://gitlab.com/libvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6ebb8</a>
* CVE-2024-2494 - Upstream-Status: Backport from <a class="moz-txt-link-freetext" href="https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2">https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2</a>
* CVE-2024-4418 - Upstream-Status: Backport from <a class="moz-txt-link-freetext" href="https://gitlab.com/libvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1">https://gitlab.com/libvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1</a>

Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
---
 .../libvirt/libvirt/CVE-2024-1441.patch       |  70 ++++++
 .../libvirt/libvirt/CVE-2024-2494.patch       | 220 ++++++++++++++++++
 .../libvirt/libvirt/CVE-2024-4418.patch       |  86 +++++++
 recipes-extended/libvirt/libvirt_10.0.0.bb    |   3 +
 4 files changed, 379 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-4418.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
new file mode 100644
index 00000000..3fbf1d52
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
@@ -0,0 +1,70 @@
+From c664015fe3a7bf59db26686e9ed69af011c6ebb8 Mon Sep 17 00:00:00 2001
+From: Martin Kletzander <a class="moz-txt-link-rfc2396E" href="mailto:mkletzan@redhat.com">&lt;mkletzan@redhat.com&gt;</a>
+Date: Tue, 27 Feb 2024 16:20:12 +0100
+Subject: [PATCH] Fix off-by-one error in udevListInterfacesByStatus
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Ever since this function was introduced in 2012 it could've tried
+filling in an extra interface name.  That was made worse in 2019 when
+the caller functions started accepting NULL arrays of size 0.
+
+This is assigned CVE-2024-1441.
+
+Signed-off-by: Martin Kletzander <a class="moz-txt-link-rfc2396E" href="mailto:mkletzan@redhat.com">&lt;mkletzan@redhat.com&gt;</a>
+Reported-by: Alexander Kuznetsov <a class="moz-txt-link-rfc2396E" href="mailto:kuznetsovam@altlinux.org">&lt;kuznetsovam@altlinux.org&gt;</a>
+Fixes: 5a33366f5c0b18c93d161bd144f9f079de4ac8ca
+Fixes: d6064e2759a24e0802f363e3a810dc5a7d7ebb15
+Reviewed-by: Ján Tomko <a class="moz-txt-link-rfc2396E" href="mailto:jtomko@redhat.com">&lt;jtomko@redhat.com&gt;</a>
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.com/libvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6ebb8">https://gitlab.com/libvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6ebb8</a>]
+CVE: CVE-2024-1441
+Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ NEWS.rst                               | 15 +++++++++++++++
+ src/interface/interface_backend_udev.c |  2 +-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS.rst b/NEWS.rst
+index d013fc7..25f2038 100644
+--- a/NEWS.rst
++++ b/NEWS.rst
+@@ -557,6 +557,21 @@ v9.2.0 (2023-04-01)
+ v9.1.0 (2023-03-01)
+ ===================
+ 
++  * ``CVE-2024-1441``: Fix off-by-one error leading to a crash
++
++    In **libvirt-1.0.0** there were couple of interface listing APIs
++    introduced which had an off-by-one error.  That error could lead to a
++    very rare crash if an array was passed to those functions which did
++    not fit all the interfaces.
++
++    In **libvirt-5.10** a check for non-NULL arrays has been adjusted to
++    allow for NULL arrays with size 0 instead of rejecting all NULL
++    arrays.  However that made the above issue significantly worse since
++    that off-by-one error now did not write beyond an array, but
++    dereferenced said NULL pointer making the crash certain in a
++    specific scenario in which a NULL array of size 0 was passed to the
++    aforementioned functions.
++
+ * **Removed features**
+ 
+   * vbox: removed support for version 5.2 and 6.0 APIs
+diff --git a/src/interface/interface_backend_udev.c b/src/interface/interface_backend_udev.c
+index fb6799e..4091483 100644
+--- a/src/interface/interface_backend_udev.c
++++ b/src/interface/interface_backend_udev.c
+@@ -222,7 +222,7 @@ udevListInterfacesByStatus(virConnectPtr conn,
+         g_autoptr(virInterfaceDef) def = NULL;
+ 
+         /* Ensure we won't exceed the size of our array */
+-        if (count &gt; names_len)
++        if (count &gt;= names_len)
+             break;
+ 
+         path = udev_list_entry_get_name(dev_entry);
+-- 
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
new file mode 100644
index 00000000..6b38f13a
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
@@ -0,0 +1,220 @@
+From 8a3f8d957507c1f8223fdcf25a3ff885b15557f2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <a class="moz-txt-link-rfc2396E" href="mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
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
+Reviewed-by: Michal Privoznik <a class="moz-txt-link-rfc2396E" href="mailto:mprivozn@redhat.com">&lt;mprivozn@redhat.com&gt;</a>
+Found-by: Alexandr Shashkin <a class="moz-txt-link-rfc2396E" href="mailto:dutyrok@altlinux.org">&lt;dutyrok@altlinux.org&gt;</a>
+Co-developed-by: Alexander Kuznetsov <a class="moz-txt-link-rfc2396E" href="mailto:kuznetsovam@altlinux.org">&lt;kuznetsovam@altlinux.org&gt;</a>
+Signed-off-by: Daniel P. Berrangé <a class="moz-txt-link-rfc2396E" href="mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2">https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2</a>]
+CVE: CVE-2024-2494
+Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ src/remote/remote_daemon_dispatch.c | 65 +++++++++++++++++++++++++++++
+ src/rpc/gendispatch.pl              |  5 +++
+ 2 files changed, 70 insertions(+)
+
+diff --git a/src/remote/remote_daemon_dispatch.c b/src/remote/remote_daemon_dispatch.c
+index 7daf503..7542caa 100644
+--- a/src/remote/remote_daemon_dispatch.c
++++ b/src/remote/remote_daemon_dispatch.c
+@@ -2291,6 +2291,10 @@ remoteDispatchDomainGetSchedulerParameters(virNetServer *server G_GNUC_UNUSED,
+     if (!conn)
+         goto cleanup;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -2339,6 +2343,10 @@ remoteDispatchDomainGetSchedulerParametersFlags(virNetServer *server G_GNUC_UNUS
+     if (!conn)
+         goto cleanup;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -2497,6 +2505,10 @@ remoteDispatchDomainBlockStatsFlags(virNetServer *server G_GNUC_UNUSED,
+         goto cleanup;
+     flags = args-&gt;flags;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_DOMAIN_BLOCK_STATS_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -2717,6 +2729,14 @@ remoteDispatchDomainGetVcpuPinInfo(virNetServer *server G_GNUC_UNUSED,
+     if (!(dom = get_nonnull_domain(conn, args-&gt;dom)))
+         goto cleanup;
+ 
++    if (args-&gt;ncpumaps &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps must be non-negative"));
++        goto cleanup;
++    }
++    if (args-&gt;maplen &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;ncpumaps &gt; REMOTE_VCPUINFO_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps &gt; REMOTE_VCPUINFO_MAX"));
+         goto cleanup;
+@@ -2811,6 +2831,11 @@ remoteDispatchDomainGetEmulatorPinInfo(virNetServer *server G_GNUC_UNUSED,
+     if (!(dom = get_nonnull_domain(conn, args-&gt;dom)))
+         goto cleanup;
+ 
++    if (args-&gt;maplen &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be non-negative"));
++        goto cleanup;
++    }
++
+     /* Allocate buffers to take the results */
+     if (args-&gt;maplen &gt; 0)
+         cpumaps = g_new0(unsigned char, args-&gt;maplen);
+@@ -2858,6 +2883,14 @@ remoteDispatchDomainGetVcpus(virNetServer *server G_GNUC_UNUSED,
+     if (!(dom = get_nonnull_domain(conn, args-&gt;dom)))
+         goto cleanup;
+ 
++    if (args-&gt;maxinfo &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be non-negative"));
++        goto cleanup;
++    }
++    if (args-&gt;maplen &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;maxinfo &gt; REMOTE_VCPUINFO_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo &gt; REMOTE_VCPUINFO_MAX"));
+         goto cleanup;
+@@ -3096,6 +3129,10 @@ remoteDispatchDomainGetMemoryParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args-&gt;flags;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_DOMAIN_MEMORY_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3156,6 +3193,10 @@ remoteDispatchDomainGetNumaParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args-&gt;flags;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_DOMAIN_NUMA_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3216,6 +3257,10 @@ remoteDispatchDomainGetBlkioParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args-&gt;flags;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_DOMAIN_BLKIO_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3277,6 +3322,10 @@ remoteDispatchNodeGetCPUStats(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args-&gt;flags;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_NODE_CPU_STATS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3339,6 +3388,10 @@ remoteDispatchNodeGetMemoryStats(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args-&gt;flags;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_NODE_MEMORY_STATS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -3514,6 +3567,10 @@ remoteDispatchDomainGetBlockIoTune(virNetServer *server G_GNUC_UNUSED,
+     if (!conn)
+         goto cleanup;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_DOMAIN_BLOCK_IO_TUNE_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -5079,6 +5136,10 @@ remoteDispatchDomainGetInterfaceParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args-&gt;flags;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_DOMAIN_INTERFACE_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+@@ -5299,6 +5360,10 @@ remoteDispatchNodeGetMemoryParameters(virNetServer *server G_GNUC_UNUSED,
+ 
+     flags = args-&gt;flags;
+ 
++    if (args-&gt;nparams &lt; 0) {
++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be non-negative"));
++        goto cleanup;
++    }
+     if (args-&gt;nparams &gt; REMOTE_NODE_MEMORY_PARAMETERS_MAX) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too large"));
+         goto cleanup;
+diff --git a/src/rpc/gendispatch.pl b/src/rpc/gendispatch.pl
+index ea46a9d..17abadc 100755
+--- a/src/rpc/gendispatch.pl
++++ b/src/rpc/gendispatch.pl
+@@ -1070,6 +1070,11 @@ elsif ($mode eq "server") {
+         print "\n";
+ 
+         if ($single_ret_as_list) {
++            print "    if (args-&gt;$single_ret_list_max_var &lt; 0) {\n";
++            print "        virReportError(VIR_ERR_RPC,\n";
++            print "                       \"%s\", _(\"max$single_ret_list_name must be non-negative\"));\n";
++            print "        goto cleanup;\n";
++            print "    }\n";
+             print "    if (args-&gt;$single_ret_list_max_var &gt; $single_ret_list_max_define) {\n";
+             print "        virReportError(VIR_ERR_RPC,\n";
+             print "                       \"%s\", _(\"max$single_ret_list_name &gt; $single_ret_list_max_define\"));\n";
+-- 
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch b/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
new file mode 100644
index 00000000..81189abb
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
@@ -0,0 +1,86 @@
+From 8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <a class="moz-txt-link-rfc2396E" href="mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
+Date: Tue, 30 Apr 2024 11:51:15 +0100
+Subject: [PATCH] rpc: ensure temporary GSource is removed from client event
+ loop
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Users are seeing periodic segfaults from libvirt client apps,
+especially thread heavy ones like virt-manager. A typical
+stack trace would end up in the virNetClientIOEventFD method,
+with illegal access to stale stack data. eg
+The root cause is a bad assumption in the virNetClientIOEventLoop
+method. This method is run by whichever thread currently owns the
+buck, and is responsible for handling I/O. Inside a for(;;) loop,
+this method creates a temporary GSource, adds it to the event loop
+and runs g_main_loop_run(). When I/O is ready, the GSource callback
+(virNetClientIOEventFD) will fire and call g_main_loop_quit(), and
+return G_SOURCE_REMOVE which results in the temporary GSource being
+destroyed. A g_autoptr() will then remove the last reference.
+
+What was overlooked, is that a second thread can come along and
+while it can't enter virNetClientIOEventLoop, it will register an
+idle source that uses virNetClientIOWakeup to interrupt the
+original thread's 'g_main_loop_run' call. When this happens the
+virNetClientIOEventFD callback never runs, and so the temporary
+GSource is not destroyed. The g_autoptr() will remove a reference,
+but by virtue of still being attached to the event context, there
+is an extra reference held causing GSource to be leaked. The
+next time 'g_main_loop_run' is called, the original GSource will
+trigger its callback, and access data that was allocated on the
+stack by the previous thread, and likely SEGV.
+
+To solve this, the thread calling 'g_main_loop_run' must call
+g_source_destroy, immediately upon return, to guarantee that
+the temporary GSource is removed.
+
+CVE-2024-4418
+Reviewed-by: Ján Tomko <a class="moz-txt-link-rfc2396E" href="mailto:jtomko@redhat.com">&lt;jtomko@redhat.com&gt;</a>
+Reported-by: Martin Shirokov <a class="moz-txt-link-rfc2396E" href="mailto:shirokovmartin@gmail.com">&lt;shirokovmartin@gmail.com&gt;</a>
+Tested-by: Martin Shirokov <a class="moz-txt-link-rfc2396E" href="mailto:shirokovmartin@gmail.com">&lt;shirokovmartin@gmail.com&gt;</a>
+Signed-off-by: Daniel P. Berrangé <a class="moz-txt-link-rfc2396E" href="mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.com/libvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1">https://gitlab.com/libvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1</a>]
+CVE: CVE-2024-4418
+Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ src/rpc/virnetclient.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/rpc/virnetclient.c b/src/rpc/virnetclient.c
+index 68098b1..147b0d6 100644
+--- a/src/rpc/virnetclient.c
++++ b/src/rpc/virnetclient.c
+@@ -1657,7 +1657,7 @@ static int virNetClientIOEventLoop(virNetClient *client,
+ #endif /* !WIN32 */
+         int timeout = -1;
+         virNetMessage *msg = NULL;
+-        g_autoptr(GSource) G_GNUC_UNUSED source = NULL;
++        g_autoptr(GSource) source = NULL;
+         GIOCondition ev = 0;
+         struct virNetClientIOEventData data = {
+             .client = client,
+@@ -1721,6 +1721,18 @@ static int virNetClientIOEventLoop(virNetClient *client,
+ 
+         g_main_loop_run(client-&gt;eventLoop);
+ 
++        /*
++         * If virNetClientIOEventFD ran, this GSource will already be
++         * destroyed due to G_SOURCE_REMOVE. It is harmless to re-destroy
++         * it, since we still own a reference.
++         *
++         * If virNetClientIOWakeup ran, it will have interrupted the
++         * g_main_loop_run call, before virNetClientIOEventFD could
++         * run, and thus the GSource is still registered, and we need
++         * to destroy it since it is referencing stack memory for 'data'
++         */
++        g_source_destroy(source);
++
+ #ifndef WIN32
+         ignore_value(pthread_sigmask(SIG_SETMASK, &amp;oldmask, NULL));
+ #endif /* !WIN32 */
+-- 
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
index 6b19b700..a33b6980 100644
--- a/recipes-extended/libvirt/libvirt_10.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
@@ -32,6 +32,9 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt\file://gnutls-helper.py\file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch\file://0001-messon.build-remove-build-path-information-to-avoid-.patch\+file://CVE-2024-1441.patch\+file://CVE-2024-2494.patch\+file://CVE-2024-4418.patch\">"http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://gnutls-helper.py \
            file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
            file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
+           file://CVE-2024-1441.patch \
+           file://CVE-2024-2494.patch \
+           file://CVE-2024-4418.patch \
           "</a>
 
 SRC_URI[libvirt.sha256sum] = "8ba2e72ec8bdd2418554a1474c42c35704c30174b7611eaf9a16544b71bcf00a"
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000FF">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
        Mo: +91 9998906483 <br>
      </font></div>
  </body>
</html>

--------------4W0Pb7XC8tRwiaZGF5a5975Q--

