Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E4BC3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 14:30:38 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.81272.1720449030109851738
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 07:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VfKffzAv;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-75fe9e62048so1954707a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jul 2024 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720449029; x=1721053829; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxwcshhxHs9dNaXYaQBESikVy60t/3/CzZJeEwGwnQs=;
        b=VfKffzAv+XBCxR5oKvuU+EGj/4V1BTZ73ky4ypytSXjWiysTCFpkUerS8pR0pShxsk
         uQPxju0QTsm/jdHVdxLcqebtPa0jOJQR1gUOqTPpran/c361CuzM46vlekbjJTUYUiWO
         chRsyGbnxOcweQgoU0FKKUK2+/ZDzeQ2TQN78EhDnm7hzbxFs9Y+8OpvYyngUAYR+Pp/
         rRz5ICP9hLRSwC8c12HbN4yGo0UlyvsYkIiDxVBTEqM/AjLl8jHh1pxbgm4a8SR2vMgi
         Y1tc7IaH3KomYWvyo6CguKK0D3OEHjr6NlS/ZGixhjuM2haeohVLvFxtPRUeZO2557lr
         JgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720449029; x=1721053829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxwcshhxHs9dNaXYaQBESikVy60t/3/CzZJeEwGwnQs=;
        b=vFSibJbIfWocO2UpysccwW/46Ablb+f/HQvA1LIezdIZImBkWirKBVauEizKVBsJIO
         aKy+VHb3UQD6YHZ19ANaGBS3U9xFEhYazMbf9hq52AxjjcPxSo75YX160CK+VxO3b7IA
         EIsySA7a9zDBl5XS17rhqx33bAUB7nGIVnOGY+OHkiLAcy8xb08iQqnQXy7rgL7NgSUa
         vXCE3LolcB6W2xyWkemLdMZ/hSY2qdnToIWM4GBEE9e8oFGtGt4Wy8gAX6idE+MVK0uc
         nziUVp2M2VRK3ZlzgsfBvXii8gOfdHoT8vDvwi7UrrqizpcwWir4fpD8Jnr23f02p9/j
         Nevg==
X-Gm-Message-State: AOJu0YyuLQUGs0/ahCLxgMCwBwD396MElAGbW4Sc/fPrXSa4040lXEg1
	C4OYt8nmRTEKcfJDkwbjFgaEUrCseW0c0W9lzPuzjgCjosiNBQrH6Kgej0T3/vL1jugBgLH+hBX
	8TaBT8xaTXx1TnfIv3gzJhWDfo0M=
X-Google-Smtp-Source: AGHT+IGXzDhwV8HEqBjLowTig6N8nJPQrZXVgydGYSwa+b7PZszdlyYqYx5g39u6STqiqYaQZdVlhx7ykjJtRrueFvY=
X-Received: by 2002:a17:90a:d988:b0:2c9:7ebd:926c with SMTP id
 98e67ed59e1d1-2c99c7ff6c2mr6054666a91.45.1720449028873; Mon, 08 Jul 2024
 07:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240626062358.90542-1-hprajapati@mvista.com> <c31a6e36-326a-4206-846b-d70f4bcdc37b@mvista.com>
In-Reply-To: <c31a6e36-326a-4206-846b-d70f4bcdc37b@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Jul 2024 10:30:17 -0400
Message-ID: <CADkTA4M6rokbqXEzrqyQ3Q2aYwnUdrzrEc+AF4tPjBGkpSN6iw@mail.gmail.com>
Subject: Re: [scarthgap][meta-virtualization][PATCH] libvirt: fix multiple CVEs
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jul 2024 14:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8819

On Mon, Jul 8, 2024 at 12:36=E2=80=AFAM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Hi Team/Bruce,
>
> any update on this patch ??
>

I've been out of the office for the past 6 days, and unfortunately
couldn't get to this before I left.

My plan before I left was to finally convert the libvirt recipe to use
the upstream git repository, since
I don't like the noise of backporting patches when they are sitting in
a perfectly good upstream
repository .. while we wait for another release tarball to cleanly consume =
them.

Once I dig out from email, I'll get back to looking into that .. but
if it takes more than a day or two,
I'll apply these and then drop them once I get the conversion working.

Bruce

> Regards,
>
> Hitendra Prajapati
>
> On 26/06/24 11:53 am, Hitendra Prajapati wrote:
>
> Backport fixes for:
>
> * CVE-2024-1441 - Upstream-Status: Backport from https://gitlab.com/libvi=
rt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6ebb8
> * CVE-2024-2494 - Upstream-Status: Backport from https://gitlab.com/libvi=
rt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2
> * CVE-2024-4418 - Upstream-Status: Backport from https://gitlab.com/libvi=
rt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../libvirt/libvirt/CVE-2024-1441.patch       |  70 ++++++
>  .../libvirt/libvirt/CVE-2024-2494.patch       | 220 ++++++++++++++++++
>  .../libvirt/libvirt/CVE-2024-4418.patch       |  86 +++++++
>  recipes-extended/libvirt/libvirt_10.0.0.bb    |   3 +
>  4 files changed, 379 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch b/recip=
es-extended/libvirt/libvirt/CVE-2024-1441.patch
> new file mode 100644
> index 00000000..3fbf1d52
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
> @@ -0,0 +1,70 @@
> +From c664015fe3a7bf59db26686e9ed69af011c6ebb8 Mon Sep 17 00:00:00 2001
> +From: Martin Kletzander <mkletzan@redhat.com>
> +Date: Tue, 27 Feb 2024 16:20:12 +0100
> +Subject: [PATCH] Fix off-by-one error in udevListInterfacesByStatus
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Ever since this function was introduced in 2012 it could've tried
> +filling in an extra interface name.  That was made worse in 2019 when
> +the caller functions started accepting NULL arrays of size 0.
> +
> +This is assigned CVE-2024-1441.
> +
> +Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> +Reported-by: Alexander Kuznetsov <kuznetsovam@altlinux.org>
> +Fixes: 5a33366f5c0b18c93d161bd144f9f079de4ac8ca
> +Fixes: d6064e2759a24e0802f363e3a810dc5a7d7ebb15
> +Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/c=
664015fe3a7bf59db26686e9ed69af011c6ebb8]
> +CVE: CVE-2024-1441
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> ++  * ``CVE-2024-1441``: Fix off-by-one error leading to a crash
> ++
> ++    In **libvirt-1.0.0** there were couple of interface listing APIs
> ++    introduced which had an off-by-one error.  That error could lead to=
 a
> ++    very rare crash if an array was passed to those functions which did
> ++    not fit all the interfaces.
> ++
> ++    In **libvirt-5.10** a check for non-NULL arrays has been adjusted t=
o
> ++    allow for NULL arrays with size 0 instead of rejecting all NULL
> ++    arrays.  However that made the above issue significantly worse sinc=
e
> ++    that off-by-one error now did not write beyond an array, but
> ++    dereferenced said NULL pointer making the crash certain in a
> ++    specific scenario in which a NULL array of size 0 was passed to the
> ++    aforementioned functions.
> ++
> + * **Removed features**
> +
> +   * vbox: removed support for version 5.2 and 6.0 APIs
> +diff --git a/src/interface/interface_backend_udev.c b/src/interface/inte=
rface_backend_udev.c
> +index fb6799e..4091483 100644
> +--- a/src/interface/interface_backend_udev.c
> ++++ b/src/interface/interface_backend_udev.c
> +@@ -222,7 +222,7 @@ udevListInterfacesByStatus(virConnectPtr conn,
> +         g_autoptr(virInterfaceDef) def =3D NULL;
> +
> +         /* Ensure we won't exceed the size of our array */
> +-        if (count > names_len)
> ++        if (count >=3D names_len)
> +             break;
> +
> +         path =3D udev_list_entry_get_name(dev_entry);
> +--
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch b/recip=
es-extended/libvirt/libvirt/CVE-2024-2494.patch
> new file mode 100644
> index 00000000..6b38f13a
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> @@ -0,0 +1,220 @@
> +From 8a3f8d957507c1f8223fdcf25a3ff885b15557f2 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
> +Date: Fri, 15 Mar 2024 10:47:50 +0000
> +Subject: [PATCH] remote: check for negative array lengths before allocat=
ion
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
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
> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8=
a3f8d957507c1f8223fdcf25a3ff885b15557f2]
> +CVE: CVE-2024-2494
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/remote/remote_daemon_dispatch.c | 65 +++++++++++++++++++++++++++++
> + src/rpc/gendispatch.pl              |  5 +++
> + 2 files changed, 70 insertions(+)
> +
> +diff --git a/src/remote/remote_daemon_dispatch.c b/src/remote/remote_dae=
mon_dispatch.c
> +index 7daf503..7542caa 100644
> +--- a/src/remote/remote_daemon_dispatch.c
> ++++ b/src/remote/remote_daemon_dispatch.c
> +@@ -2291,6 +2291,10 @@ remoteDispatchDomainGetSchedulerParameters(virNet=
Server *server G_GNUC_UNUSED,
> +     if (!conn)
> +         goto cleanup;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -2339,6 +2343,10 @@ remoteDispatchDomainGetSchedulerParametersFlags(v=
irNetServer *server G_GNUC_UNUS
> +     if (!conn)
> +         goto cleanup;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -2497,6 +2505,10 @@ remoteDispatchDomainBlockStatsFlags(virNetServer =
*server G_GNUC_UNUSED,
> +         goto cleanup;
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_BLOCK_STATS_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -2717,6 +2729,14 @@ remoteDispatchDomainGetVcpuPinInfo(virNetServer *=
server G_GNUC_UNUSED,
> +     if (!(dom =3D get_nonnull_domain(conn, args->dom)))
> +         goto cleanup;
> +
> ++    if (args->ncpumaps < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps must b=
e non-negative"));
> ++        goto cleanup;
> ++    }
> ++    if (args->maplen < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be =
non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->ncpumaps > REMOTE_VCPUINFO_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps > REMO=
TE_VCPUINFO_MAX"));
> +         goto cleanup;
> +@@ -2811,6 +2831,11 @@ remoteDispatchDomainGetEmulatorPinInfo(virNetServ=
er *server G_GNUC_UNUSED,
> +     if (!(dom =3D get_nonnull_domain(conn, args->dom)))
> +         goto cleanup;
> +
> ++    if (args->maplen < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be =
non-negative"));
> ++        goto cleanup;
> ++    }
> ++
> +     /* Allocate buffers to take the results */
> +     if (args->maplen > 0)
> +         cpumaps =3D g_new0(unsigned char, args->maplen);
> +@@ -2858,6 +2883,14 @@ remoteDispatchDomainGetVcpus(virNetServer *server=
 G_GNUC_UNUSED,
> +     if (!(dom =3D get_nonnull_domain(conn, args->dom)))
> +         goto cleanup;
> +
> ++    if (args->maxinfo < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> ++    if (args->maplen < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->maxinfo > REMOTE_VCPUINFO_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo > REMOT=
E_VCPUINFO_MAX"));
> +         goto cleanup;
> +@@ -3096,6 +3129,10 @@ remoteDispatchDomainGetMemoryParameters(virNetSer=
ver *server G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_MEMORY_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -3156,6 +3193,10 @@ remoteDispatchDomainGetNumaParameters(virNetServe=
r *server G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_NUMA_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -3216,6 +3257,10 @@ remoteDispatchDomainGetBlkioParameters(virNetServ=
er *server G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_BLKIO_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -3277,6 +3322,10 @@ remoteDispatchNodeGetCPUStats(virNetServer *serve=
r G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_NODE_CPU_STATS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -3339,6 +3388,10 @@ remoteDispatchNodeGetMemoryStats(virNetServer *se=
rver G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_NODE_MEMORY_STATS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -3514,6 +3567,10 @@ remoteDispatchDomainGetBlockIoTune(virNetServer *=
server G_GNUC_UNUSED,
> +     if (!conn)
> +         goto cleanup;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_BLOCK_IO_TUNE_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -5079,6 +5136,10 @@ remoteDispatchDomainGetInterfaceParameters(virNet=
Server *server G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_INTERFACE_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
> +         goto cleanup;
> +@@ -5299,6 +5360,10 @@ remoteDispatchNodeGetMemoryParameters(virNetServe=
r *server G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be=
 non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_NODE_MEMORY_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too lar=
ge"));
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
> ++            print "                       \"%s\", _(\"max$single_ret_li=
st_name must be non-negative\"));\n";
> ++            print "        goto cleanup;\n";
> ++            print "    }\n";
> +             print "    if (args->$single_ret_list_max_var > $single_ret=
_list_max_define) {\n";
> +             print "        virReportError(VIR_ERR_RPC,\n";
> +             print "                       \"%s\", _(\"max$single_ret_li=
st_name > $single_ret_list_max_define\"));\n";
> +--
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch b/recip=
es-extended/libvirt/libvirt/CVE-2024-4418.patch
> new file mode 100644
> index 00000000..81189abb
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
> @@ -0,0 +1,86 @@
> +From 8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
> +Date: Tue, 30 Apr 2024 11:51:15 +0100
> +Subject: [PATCH] rpc: ensure temporary GSource is removed from client ev=
ent
> + loop
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
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
> +Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
> +Reported-by: Martin Shirokov <shirokovmartin@gmail.com>
> +Tested-by: Martin Shirokov <shirokovmartin@gmail.com>
> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/8=
074d64dc2eca846d6a61efe1a9b7428a0ce1dd1]
> +CVE: CVE-2024-4418
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/rpc/virnetclient.c | 14 +++++++++++++-
> + 1 file changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/rpc/virnetclient.c b/src/rpc/virnetclient.c
> +index 68098b1..147b0d6 100644
> +--- a/src/rpc/virnetclient.c
> ++++ b/src/rpc/virnetclient.c
> +@@ -1657,7 +1657,7 @@ static int virNetClientIOEventLoop(virNetClient *c=
lient,
> + #endif /* !WIN32 */
> +         int timeout =3D -1;
> +         virNetMessage *msg =3D NULL;
> +-        g_autoptr(GSource) G_GNUC_UNUSED source =3D NULL;
> ++        g_autoptr(GSource) source =3D NULL;
> +         GIOCondition ev =3D 0;
> +         struct virNetClientIOEventData data =3D {
> +             .client =3D client,
> +@@ -1721,6 +1721,18 @@ static int virNetClientIOEventLoop(virNetClient *=
client,
> +
> +         g_main_loop_run(client->eventLoop);
> +
> ++        /*
> ++         * If virNetClientIOEventFD ran, this GSource will already be
> ++         * destroyed due to G_SOURCE_REMOVE. It is harmless to re-destr=
oy
> ++         * it, since we still own a reference.
> ++         *
> ++         * If virNetClientIOWakeup ran, it will have interrupted the
> ++         * g_main_loop_run call, before virNetClientIOEventFD could
> ++         * run, and thus the GSource is still registered, and we need
> ++         * to destroy it since it is referencing stack memory for 'data=
'
> ++         */
> ++        g_source_destroy(source);
> ++
> + #ifndef WIN32
> +         ignore_value(pthread_sigmask(SIG_SETMASK, &oldmask, NULL));
> + #endif /* !WIN32 */
> +--
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extende=
d/libvirt/libvirt_10.0.0.bb
> index 6b19b700..a33b6980 100644
> --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> @@ -32,6 +32,9 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.t=
ar.xz;name=3Dlibvirt \
>             file://gnutls-helper.py \
>             file://0001-prevent-gendispatch.pl-generating-build-path-in-c=
ode.patch \
>             file://0001-messon.build-remove-build-path-information-to-avo=
id-.patch \
> +           file://CVE-2024-1441.patch \
> +           file://CVE-2024-2494.patch \
> +           file://CVE-2024-4418.patch \
>            "
>
>  SRC_URI[libvirt.sha256sum] =3D "8ba2e72ec8bdd2418554a1474c42c35704c30174=
b7611eaf9a16544b71bcf00a"
>
> --
> Regards,
> Hitendra Prajapati
> MontaVista Software LLC
> Mo: +91 9998906483



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

