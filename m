Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C7FC38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 04:10:07 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.6477.1720584600720250826
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 21:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PMYPvLGd;
 spf=pass (domain: mvista.com, ip: 209.85.128.178, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-654cf0a069eso41402637b3.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 21:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720584600; x=1721189400; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XH7lPoPZ1AkZQaZaKjwGq37ShTii+YzcRPpB1l/KGk0=;
        b=PMYPvLGdUcvqExP2LyKVoi5JF0+mDdxQL1jXyIcRlI3IGPnfyCdIkwMbL9jHSfuzWm
         tC4tw8fpYy9SLCSofffFTQz+HsBOIqdb1ghBpij8BfGJ5K82j8TlG1rVEsLlXErgQ4we
         AtGzIVX/+wRCWTtP6SAKx2/AexOsLPFYMcGA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720584600; x=1721189400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH7lPoPZ1AkZQaZaKjwGq37ShTii+YzcRPpB1l/KGk0=;
        b=oxe3XQUvO8oAIfe81le5Usu1H5m931/wI+VOyWjZrc8ffZL99ZMEB3xH7RTmg0QO4c
         gZRT7U+MlubQKzJaSHvG0t0klE4hNvNzOlfYTYbSjeDcFizB73sg0ZD/0nwagfmiEsEI
         +yvfUt7M5CI+2LBOHLUXjYVE4aTOCqNKqZhoYp0n8r4WHe6BZa84Opo+ty94/pW+Y87u
         g8kM3IkGlu7EphyWowKp2Ql6F7dJZGeQ8FA62yF4Y8p6xuijsb7ohlwHeds55Ecrvg4X
         U6dfcENALfo8eFPhV995ojj76VwjaGDsCa1BVksUOzlPS3yXn3BkbKjLhDkY/1E4ReiU
         RM2g==
X-Gm-Message-State: AOJu0YxtlxXMtC89M3PuywrG8ivz3KNAbkCRiirfZ5ks5FwEgUJwq4Ad
	lGZtG45DX73BIIvknW01xyRtrPtrlXHEPiNvc93Bl1+6cu98bkcVgB4jJQdddpKBLNWUeuBtQMA
	Ej+ZIzfQOdQQavoM8KwxMT68YkxoyawydZ97Axw==
X-Google-Smtp-Source: AGHT+IGJsr6R4QcwH7M29GETfPfxV99loRSab6tmOJKF47dfzM8cK3FRH+TpadOsgDCJCFC5H2Kbld4ZiDDNib7jz00=
X-Received: by 2002:a0d:f6c7:0:b0:64b:40ff:b972 with SMTP id
 00721157ae682-658f07d8152mr48037557b3.48.1720584599619; Tue, 09 Jul 2024
 21:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240626062358.90542-1-hprajapati@mvista.com> <c31a6e36-326a-4206-846b-d70f4bcdc37b@mvista.com>
 <CADkTA4M6rokbqXEzrqyQ3Q2aYwnUdrzrEc+AF4tPjBGkpSN6iw@mail.gmail.com> <CADkTA4Ng0B9Soz2Fmw=KOD2XVC-wXiSWz7bgyGnqtL3ntXJkZA@mail.gmail.com>
In-Reply-To: <CADkTA4Ng0B9Soz2Fmw=KOD2XVC-wXiSWz7bgyGnqtL3ntXJkZA@mail.gmail.com>
From: Hitendra Prajapati <hprajapati@mvista.com>
Date: Wed, 10 Jul 2024 09:39:48 +0530
Message-ID: <CACVbggGzEC81MPTbCcpXCN6YOuFDNpJ55-mYRr3q-EcQ_uRR2A@mail.gmail.com>
Subject: Re: [scarthgap][meta-virtualization][PATCH] libvirt: fix multiple CVEs
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dde92b061cdcd157"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 04:10:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8828

--000000000000dde92b061cdcd157
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,
Thank you for the update.
Regards,
Hitendra

On Wed, 10 Jul, 2024, 9:29=E2=80=AFam Bruce Ashfield, <bruce.ashfield@gmail=
.com>
wrote:

> On Mon, Jul 8, 2024 at 10:30=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gm=
ail.com>
> wrote:
> >
> > On Mon, Jul 8, 2024 at 12:36=E2=80=AFAM Hitendra Prajapati
> > <hprajapati@mvista.com> wrote:
> > >
> > > Hi Team/Bruce,
> > >
> > > any update on this patch ??
> > >
> >
> > I've been out of the office for the past 6 days, and unfortunately
> > couldn't get to this before I left.
> >
> > My plan before I left was to finally convert the libvirt recipe to use
> > the upstream git repository, since
> > I don't like the noise of backporting patches when they are sitting in
> > a perfectly good upstream
> > repository .. while we wait for another release tarball to cleanly
> consume them.
> >
> > Once I dig out from email, I'll get back to looking into that .. but
> > if it takes more than a day or two,
> > I'll apply these and then drop them once I get the conversion working.
>
> I've merged the CVE fixes to the release branches, and you can find
> my conversion of the libvirt recipe to gitsm on master-next.
>
> It needs a bit more testing, but once I've tested it with some
> pending package updates, I'll push it as well.
>
> Bruce
>
> >
> > Bruce
> >
> > > Regards,
> > >
> > > Hitendra Prajapati
> > >
> > > On 26/06/24 11:53 am, Hitendra Prajapati wrote:
> > >
> > > Backport fixes for:
> > >
> > > * CVE-2024-1441 - Upstream-Status: Backport from
> https://gitlab.com/libvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69=
af011c6ebb8
> > > * CVE-2024-2494 - Upstream-Status: Backport from
> https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff=
885b15557f2
> > > * CVE-2024-4418 - Upstream-Status: Backport from
> https://gitlab.com/libvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7=
428a0ce1dd1
> > >
> > > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > > ---
> > >  .../libvirt/libvirt/CVE-2024-1441.patch       |  70 ++++++
> > >  .../libvirt/libvirt/CVE-2024-2494.patch       | 220 ++++++++++++++++=
++
> > >  .../libvirt/libvirt/CVE-2024-4418.patch       |  86 +++++++
> > >  recipes-extended/libvirt/libvirt_10.0.0.bb    |   3 +
> > >  4 files changed, 379 insertions(+)
> > >  create mode 100644
> recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
> > >  create mode 100644
> recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> > >  create mode 100644
> recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
> > >
> > > diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
> b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
> > > new file mode 100644
> > > index 00000000..3fbf1d52
> > > --- /dev/null
> > > +++ b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch
> > > @@ -0,0 +1,70 @@
> > > +From c664015fe3a7bf59db26686e9ed69af011c6ebb8 Mon Sep 17 00:00:00 20=
01
> > > +From: Martin Kletzander <mkletzan@redhat.com>
> > > +Date: Tue, 27 Feb 2024 16:20:12 +0100
> > > +Subject: [PATCH] Fix off-by-one error in udevListInterfacesByStatus
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Ever since this function was introduced in 2012 it could've tried
> > > +filling in an extra interface name.  That was made worse in 2019 whe=
n
> > > +the caller functions started accepting NULL arrays of size 0.
> > > +
> > > +This is assigned CVE-2024-1441.
> > > +
> > > +Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> > > +Reported-by: Alexander Kuznetsov <kuznetsovam@altlinux.org>
> > > +Fixes: 5a33366f5c0b18c93d161bd144f9f079de4ac8ca
> > > +Fixes: d6064e2759a24e0802f363e3a810dc5a7d7ebb15
> > > +Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
> > > +
> > > +Upstream-Status: Backport [
> https://gitlab.com/libvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69=
af011c6ebb8
> ]
> > > +CVE: CVE-2024-1441
> > > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > > +---
> > > + NEWS.rst                               | 15 +++++++++++++++
> > > + src/interface/interface_backend_udev.c |  2 +-
> > > + 2 files changed, 16 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/NEWS.rst b/NEWS.rst
> > > +index d013fc7..25f2038 100644
> > > +--- a/NEWS.rst
> > > ++++ b/NEWS.rst
> > > +@@ -557,6 +557,21 @@ v9.2.0 (2023-04-01)
> > > + v9.1.0 (2023-03-01)
> > > + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > ++  * ``CVE-2024-1441``: Fix off-by-one error leading to a crash
> > > ++
> > > ++    In **libvirt-1.0.0** there were couple of interface listing API=
s
> > > ++    introduced which had an off-by-one error.  That error could lea=
d
> to a
> > > ++    very rare crash if an array was passed to those functions which
> did
> > > ++    not fit all the interfaces.
> > > ++
> > > ++    In **libvirt-5.10** a check for non-NULL arrays has been
> adjusted to
> > > ++    allow for NULL arrays with size 0 instead of rejecting all NULL
> > > ++    arrays.  However that made the above issue significantly worse
> since
> > > ++    that off-by-one error now did not write beyond an array, but
> > > ++    dereferenced said NULL pointer making the crash certain in a
> > > ++    specific scenario in which a NULL array of size 0 was passed to
> the
> > > ++    aforementioned functions.
> > > ++
> > > + * **Removed features**
> > > +
> > > +   * vbox: removed support for version 5.2 and 6.0 APIs
> > > +diff --git a/src/interface/interface_backend_udev.c
> b/src/interface/interface_backend_udev.c
> > > +index fb6799e..4091483 100644
> > > +--- a/src/interface/interface_backend_udev.c
> > > ++++ b/src/interface/interface_backend_udev.c
> > > +@@ -222,7 +222,7 @@ udevListInterfacesByStatus(virConnectPtr conn,
> > > +         g_autoptr(virInterfaceDef) def =3D NULL;
> > > +
> > > +         /* Ensure we won't exceed the size of our array */
> > > +-        if (count > names_len)
> > > ++        if (count >=3D names_len)
> > > +             break;
> > > +
> > > +         path =3D udev_list_entry_get_name(dev_entry);
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> > > new file mode 100644
> > > index 00000000..6b38f13a
> > > --- /dev/null
> > > +++ b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> > > @@ -0,0 +1,220 @@
> > > +From 8a3f8d957507c1f8223fdcf25a3ff885b15557f2 Mon Sep 17 00:00:00 20=
01
> > > +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berra=
nge@redhat.com>
> > > +Date: Fri, 15 Mar 2024 10:47:50 +0000
> > > +Subject: [PATCH] remote: check for negative array lengths before
> allocation
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +While the C API entry points will validate non-negative lengths
> > > +for various parameters, the RPC server de-serialization code
> > > +will need to allocate memory for arrays before entering the C
> > > +API. These allocations will thus happen before the non-negative
> > > +length check is performed.
> > > +
> > > +Passing a negative length to the g_new0 function will usually
> > > +result in a crash due to the negative length being treated as
> > > +a huge positive number.
> > > +
> > > +This was found and diagnosed by ALT Linux Team with AFLplusplus.
> > > +
> > > +CVE-2024-2494
> > > +Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> > > +Found-by: Alexandr Shashkin <dutyrok@altlinux.org>
> > > +Co-developed-by: Alexander Kuznetsov <kuznetsovam@altlinux.org>
> > > +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > +
> > > +Upstream-Status: Backport [
> https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff=
885b15557f2
> ]
> > > +CVE: CVE-2024-2494
> > > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > > +---
> > > + src/remote/remote_daemon_dispatch.c | 65
> +++++++++++++++++++++++++++++
> > > + src/rpc/gendispatch.pl              |  5 +++
> > > + 2 files changed, 70 insertions(+)
> > > +
> > > +diff --git a/src/remote/remote_daemon_dispatch.c
> b/src/remote/remote_daemon_dispatch.c
> > > +index 7daf503..7542caa 100644
> > > +--- a/src/remote/remote_daemon_dispatch.c
> > > ++++ b/src/remote/remote_daemon_dispatch.c
> > > +@@ -2291,6 +2291,10 @@
> remoteDispatchDomainGetSchedulerParameters(virNetServer *server
> G_GNUC_UNUSED,
> > > +     if (!conn)
> > > +         goto cleanup;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -2339,6 +2343,10 @@
> remoteDispatchDomainGetSchedulerParametersFlags(virNetServer *server
> G_GNUC_UNUS
> > > +     if (!conn)
> > > +         goto cleanup;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -2497,6 +2505,10 @@
> remoteDispatchDomainBlockStatsFlags(virNetServer *server G_GNUC_UNUSED,
> > > +         goto cleanup;
> > > +     flags =3D args->flags;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_DOMAIN_BLOCK_STATS_PARAMETERS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -2717,6 +2729,14 @@
> remoteDispatchDomainGetVcpuPinInfo(virNetServer *server G_GNUC_UNUSED,
> > > +     if (!(dom =3D get_nonnull_domain(conn, args->dom)))
> > > +         goto cleanup;
> > > +
> > > ++    if (args->ncpumaps < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps
> must be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > ++    if (args->maplen < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->ncpumaps > REMOTE_VCPUINFO_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps >
> REMOTE_VCPUINFO_MAX"));
> > > +         goto cleanup;
> > > +@@ -2811,6 +2831,11 @@
> remoteDispatchDomainGetEmulatorPinInfo(virNetServer *server G_GNUC_UNUSED=
,
> > > +     if (!(dom =3D get_nonnull_domain(conn, args->dom)))
> > > +         goto cleanup;
> > > +
> > > ++    if (args->maplen < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > ++
> > > +     /* Allocate buffers to take the results */
> > > +     if (args->maplen > 0)
> > > +         cpumaps =3D g_new0(unsigned char, args->maplen);
> > > +@@ -2858,6 +2883,14 @@ remoteDispatchDomainGetVcpus(virNetServer
> *server G_GNUC_UNUSED,
> > > +     if (!(dom =3D get_nonnull_domain(conn, args->dom)))
> > > +         goto cleanup;
> > > +
> > > ++    if (args->maxinfo < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > ++    if (args->maplen < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->maxinfo > REMOTE_VCPUINFO_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo >
> REMOTE_VCPUINFO_MAX"));
> > > +         goto cleanup;
> > > +@@ -3096,6 +3129,10 @@
> remoteDispatchDomainGetMemoryParameters(virNetServer *server G_GNUC_UNUSE=
D,
> > > +
> > > +     flags =3D args->flags;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_DOMAIN_MEMORY_PARAMETERS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -3156,6 +3193,10 @@
> remoteDispatchDomainGetNumaParameters(virNetServer *server G_GNUC_UNUSED,
> > > +
> > > +     flags =3D args->flags;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_DOMAIN_NUMA_PARAMETERS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -3216,6 +3257,10 @@
> remoteDispatchDomainGetBlkioParameters(virNetServer *server G_GNUC_UNUSED=
,
> > > +
> > > +     flags =3D args->flags;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_DOMAIN_BLKIO_PARAMETERS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -3277,6 +3322,10 @@ remoteDispatchNodeGetCPUStats(virNetServer
> *server G_GNUC_UNUSED,
> > > +
> > > +     flags =3D args->flags;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_NODE_CPU_STATS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -3339,6 +3388,10 @@ remoteDispatchNodeGetMemoryStats(virNetServer
> *server G_GNUC_UNUSED,
> > > +
> > > +     flags =3D args->flags;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_NODE_MEMORY_STATS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -3514,6 +3567,10 @@
> remoteDispatchDomainGetBlockIoTune(virNetServer *server G_GNUC_UNUSED,
> > > +     if (!conn)
> > > +         goto cleanup;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_DOMAIN_BLOCK_IO_TUNE_PARAMETERS_MAX)=
 {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -5079,6 +5136,10 @@
> remoteDispatchDomainGetInterfaceParameters(virNetServer *server
> G_GNUC_UNUSED,
> > > +
> > > +     flags =3D args->flags;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_DOMAIN_INTERFACE_PARAMETERS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +@@ -5299,6 +5360,10 @@
> remoteDispatchNodeGetMemoryParameters(virNetServer *server G_GNUC_UNUSED,
> > > +
> > > +     flags =3D args->flags;
> > > +
> > > ++    if (args->nparams < 0) {
> > > ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams mus=
t
> be non-negative"));
> > > ++        goto cleanup;
> > > ++    }
> > > +     if (args->nparams > REMOTE_NODE_MEMORY_PARAMETERS_MAX) {
> > > +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> > > +         goto cleanup;
> > > +diff --git a/src/rpc/gendispatch.pl b/src/rpc/gendispatch.pl
> > > +index ea46a9d..17abadc 100755
> > > +--- a/src/rpc/gendispatch.pl
> > > ++++ b/src/rpc/gendispatch.pl
> > > +@@ -1070,6 +1070,11 @@ elsif ($mode eq "server") {
> > > +         print "\n";
> > > +
> > > +         if ($single_ret_as_list) {
> > > ++            print "    if (args->$single_ret_list_max_var < 0) {\n"=
;
> > > ++            print "        virReportError(VIR_ERR_RPC,\n";
> > > ++            print "                       \"%s\",
> _(\"max$single_ret_list_name must be non-negative\"));\n";
> > > ++            print "        goto cleanup;\n";
> > > ++            print "    }\n";
> > > +             print "    if (args->$single_ret_list_max_var >
> $single_ret_list_max_define) {\n";
> > > +             print "        virReportError(VIR_ERR_RPC,\n";
> > > +             print "                       \"%s\",
> _(\"max$single_ret_list_name > $single_ret_list_max_define\"));\n";
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
> b/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
> > > new file mode 100644
> > > index 00000000..81189abb
> > > --- /dev/null
> > > +++ b/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch
> > > @@ -0,0 +1,86 @@
> > > +From 8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1 Mon Sep 17 00:00:00 20=
01
> > > +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berra=
nge@redhat.com>
> > > +Date: Tue, 30 Apr 2024 11:51:15 +0100
> > > +Subject: [PATCH] rpc: ensure temporary GSource is removed from clien=
t
> event
> > > + loop
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Users are seeing periodic segfaults from libvirt client apps,
> > > +especially thread heavy ones like virt-manager. A typical
> > > +stack trace would end up in the virNetClientIOEventFD method,
> > > +with illegal access to stale stack data. eg
> > > +The root cause is a bad assumption in the virNetClientIOEventLoop
> > > +method. This method is run by whichever thread currently owns the
> > > +buck, and is responsible for handling I/O. Inside a for(;;) loop,
> > > +this method creates a temporary GSource, adds it to the event loop
> > > +and runs g_main_loop_run(). When I/O is ready, the GSource callback
> > > +(virNetClientIOEventFD) will fire and call g_main_loop_quit(), and
> > > +return G_SOURCE_REMOVE which results in the temporary GSource being
> > > +destroyed. A g_autoptr() will then remove the last reference.
> > > +
> > > +What was overlooked, is that a second thread can come along and
> > > +while it can't enter virNetClientIOEventLoop, it will register an
> > > +idle source that uses virNetClientIOWakeup to interrupt the
> > > +original thread's 'g_main_loop_run' call. When this happens the
> > > +virNetClientIOEventFD callback never runs, and so the temporary
> > > +GSource is not destroyed. The g_autoptr() will remove a reference,
> > > +but by virtue of still being attached to the event context, there
> > > +is an extra reference held causing GSource to be leaked. The
> > > +next time 'g_main_loop_run' is called, the original GSource will
> > > +trigger its callback, and access data that was allocated on the
> > > +stack by the previous thread, and likely SEGV.
> > > +
> > > +To solve this, the thread calling 'g_main_loop_run' must call
> > > +g_source_destroy, immediately upon return, to guarantee that
> > > +the temporary GSource is removed.
> > > +
> > > +CVE-2024-4418
> > > +Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
> > > +Reported-by: Martin Shirokov <shirokovmartin@gmail.com>
> > > +Tested-by: Martin Shirokov <shirokovmartin@gmail.com>
> > > +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > +
> > > +Upstream-Status: Backport [
> https://gitlab.com/libvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7=
428a0ce1dd1
> ]
> > > +CVE: CVE-2024-4418
> > > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > > +---
> > > + src/rpc/virnetclient.c | 14 +++++++++++++-
> > > + 1 file changed, 13 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/src/rpc/virnetclient.c b/src/rpc/virnetclient.c
> > > +index 68098b1..147b0d6 100644
> > > +--- a/src/rpc/virnetclient.c
> > > ++++ b/src/rpc/virnetclient.c
> > > +@@ -1657,7 +1657,7 @@ static int virNetClientIOEventLoop(virNetClien=
t
> *client,
> > > + #endif /* !WIN32 */
> > > +         int timeout =3D -1;
> > > +         virNetMessage *msg =3D NULL;
> > > +-        g_autoptr(GSource) G_GNUC_UNUSED source =3D NULL;
> > > ++        g_autoptr(GSource) source =3D NULL;
> > > +         GIOCondition ev =3D 0;
> > > +         struct virNetClientIOEventData data =3D {
> > > +             .client =3D client,
> > > +@@ -1721,6 +1721,18 @@ static int
> virNetClientIOEventLoop(virNetClient *client,
> > > +
> > > +         g_main_loop_run(client->eventLoop);
> > > +
> > > ++        /*
> > > ++         * If virNetClientIOEventFD ran, this GSource will already =
be
> > > ++         * destroyed due to G_SOURCE_REMOVE. It is harmless to
> re-destroy
> > > ++         * it, since we still own a reference.
> > > ++         *
> > > ++         * If virNetClientIOWakeup ran, it will have interrupted th=
e
> > > ++         * g_main_loop_run call, before virNetClientIOEventFD could
> > > ++         * run, and thus the GSource is still registered, and we ne=
ed
> > > ++         * to destroy it since it is referencing stack memory for
> 'data'
> > > ++         */
> > > ++        g_source_destroy(source);
> > > ++
> > > + #ifndef WIN32
> > > +         ignore_value(pthread_sigmask(SIG_SETMASK, &oldmask, NULL));
> > > + #endif /* !WIN32 */
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb
> b/recipes-extended/libvirt/libvirt_10.0.0.bb
> > > index 6b19b700..a33b6980 100644
> > > --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> > > +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> > > @@ -32,6 +32,9 @@ SRC_URI =3D "
> http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=3Dlibvirt \
> > >             file://gnutls-helper.py \
> > >
>  file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
> > >
>  file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
> > > +           file://CVE-2024-1441.patch \
> > > +           file://CVE-2024-2494.patch \
> > > +           file://CVE-2024-4418.patch \
> > >            "
> > >
> > >  SRC_URI[libvirt.sha256sum] =3D
> "8ba2e72ec8bdd2418554a1474c42c35704c30174b7611eaf9a16544b71bcf00a"
> > >
> > > --
> > > Regards,
> > > Hitendra Prajapati
> > > MontaVista Software LLC
> > > Mo: +91 9998906483
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000dde92b061cdcd157
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi=C2=A0Bruce,<div dir=3D"auto">Thank you for the=C2=A0up=
date.</div><div dir=3D"auto">Regards,</div><div dir=3D"auto">Hitendra=C2=A0=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, 10 Jul, 2024, 9:29=E2=80=AFam Bruce Ashfield, &lt;<a href=3D"=
mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Mon, Jul 8, 2024 at 10:30=E2=80=AF=
AM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D=
"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Jul 8, 2024 at 12:36=E2=80=AFAM Hitendra Prajapati<br>
&gt; &lt;<a href=3D"mailto:hprajapati@mvista.com" target=3D"_blank" rel=3D"=
noreferrer">hprajapati@mvista.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Team/Bruce,<br>
&gt; &gt;<br>
&gt; &gt; any update on this patch ??<br>
&gt; &gt;<br>
&gt;<br>
&gt; I&#39;ve been out of the office for the past 6 days, and unfortunately=
<br>
&gt; couldn&#39;t get to this before I left.<br>
&gt;<br>
&gt; My plan before I left was to finally convert the libvirt recipe to use=
<br>
&gt; the upstream git repository, since<br>
&gt; I don&#39;t like the noise of backporting patches when they are sittin=
g in<br>
&gt; a perfectly good upstream<br>
&gt; repository .. while we wait for another release tarball to cleanly con=
sume them.<br>
&gt;<br>
&gt; Once I dig out from email, I&#39;ll get back to looking into that .. b=
ut<br>
&gt; if it takes more than a day or two,<br>
&gt; I&#39;ll apply these and then drop them once I get the conversion work=
ing.<br>
<br>
I&#39;ve merged the CVE fixes to the release branches, and you can find<br>
my conversion of the libvirt recipe to gitsm on master-next.<br>
<br>
It needs a bit more testing, but once I&#39;ve tested it with some<br>
pending package updates, I&#39;ll push it as well.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt;<br>
&gt; &gt; Hitendra Prajapati<br>
&gt; &gt;<br>
&gt; &gt; On 26/06/24 11:53 am, Hitendra Prajapati wrote:<br>
&gt; &gt;<br>
&gt; &gt; Backport fixes for:<br>
&gt; &gt;<br>
&gt; &gt; * CVE-2024-1441 - Upstream-Status: Backport from <a href=3D"https=
://gitlab.com/libvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6=
ebb8" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/li=
bvirt/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6ebb8</a><br>
&gt; &gt; * CVE-2024-2494 - Upstream-Status: Backport from <a href=3D"https=
://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b155=
57f2" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/li=
bvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2</a><br>
&gt; &gt; * CVE-2024-4418 - Upstream-Status: Backport from <a href=3D"https=
://gitlab.com/libvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce=
1dd1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/li=
bvirt/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapat=
i@mvista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a=
>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../libvirt/libvirt/CVE-2024-1441.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 70 ++++++<br>
&gt; &gt;=C2=A0 .../libvirt/libvirt/CVE-2024-2494.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 220 ++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../libvirt/libvirt/CVE-2024-4418.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 86 +++++++<br>
&gt; &gt;=C2=A0 recipes-extended/libvirt/<a href=3D"http://libvirt_10.0.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">libvirt_10.0.0.bb</a>=C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt; &gt;=C2=A0 4 files changed, 379 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 recipes-extended/libvirt/libvirt/CVE-202=
4-1441.patch<br>
&gt; &gt;=C2=A0 create mode 100644 recipes-extended/libvirt/libvirt/CVE-202=
4-2494.patch<br>
&gt; &gt;=C2=A0 create mode 100644 recipes-extended/libvirt/libvirt/CVE-202=
4-4418.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch=
 b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000..3fbf1d52<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/recipes-extended/libvirt/libvirt/CVE-2024-1441.patch<br>
&gt; &gt; @@ -0,0 +1,70 @@<br>
&gt; &gt; +From c664015fe3a7bf59db26686e9ed69af011c6ebb8 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Martin Kletzander &lt;<a href=3D"mailto:mkletzan@redhat.co=
m" target=3D"_blank" rel=3D"noreferrer">mkletzan@redhat.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 27 Feb 2024 16:20:12 +0100<br>
&gt; &gt; +Subject: [PATCH] Fix off-by-one error in udevListInterfacesBySta=
tus<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +Ever since this function was introduced in 2012 it could&#39;ve =
tried<br>
&gt; &gt; +filling in an extra interface name.=C2=A0 That was made worse in=
 2019 when<br>
&gt; &gt; +the caller functions started accepting NULL arrays of size 0.<br=
>
&gt; &gt; +<br>
&gt; &gt; +This is assigned CVE-2024-1441.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Martin Kletzander &lt;<a href=3D"mailto:mkletzan@=
redhat.com" target=3D"_blank" rel=3D"noreferrer">mkletzan@redhat.com</a>&gt=
;<br>
&gt; &gt; +Reported-by: Alexander Kuznetsov &lt;<a href=3D"mailto:kuznetsov=
am@altlinux.org" target=3D"_blank" rel=3D"noreferrer">kuznetsovam@altlinux.=
org</a>&gt;<br>
&gt; &gt; +Fixes: 5a33366f5c0b18c93d161bd144f9f079de4ac8ca<br>
&gt; &gt; +Fixes: d6064e2759a24e0802f363e3a810dc5a7d7ebb15<br>
&gt; &gt; +Reviewed-by: J=C3=A1n Tomko &lt;<a href=3D"mailto:jtomko@redhat.=
com" target=3D"_blank" rel=3D"noreferrer">jtomko@redhat.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/libvirt=
/libvirt/-/commit/c664015fe3a7bf59db26686e9ed69af011c6ebb8" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://gitlab.com/libvirt/libvirt/-/commi=
t/c664015fe3a7bf59db26686e9ed69af011c6ebb8</a>]<br>
&gt; &gt; +CVE: CVE-2024-1441<br>
&gt; &gt; +Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapa=
ti@mvista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</=
a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + NEWS.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 ++++++++++++++=
+<br>
&gt; &gt; + src/interface/interface_backend_udev.c |=C2=A0 2 +-<br>
&gt; &gt; + 2 files changed, 16 insertions(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/NEWS.rst b/NEWS.rst<br>
&gt; &gt; +index d013fc7..25f2038 100644<br>
&gt; &gt; +--- a/NEWS.rst<br>
&gt; &gt; ++++ b/NEWS.rst<br>
&gt; &gt; +@@ -557,6 +557,21 @@ v9.2.0 (2023-04-01)<br>
&gt; &gt; + v9.1.0 (2023-03-01)<br>
&gt; &gt; + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 * ``CVE-2024-1441``: Fix off-by-one error leading to a c=
rash<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 In **libvirt-1.0.0** there were couple of interfa=
ce listing APIs<br>
&gt; &gt; ++=C2=A0 =C2=A0 introduced which had an off-by-one error.=C2=A0 T=
hat error could lead to a<br>
&gt; &gt; ++=C2=A0 =C2=A0 very rare crash if an array was passed to those f=
unctions which did<br>
&gt; &gt; ++=C2=A0 =C2=A0 not fit all the interfaces.<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 In **libvirt-5.10** a check for non-NULL arrays h=
as been adjusted to<br>
&gt; &gt; ++=C2=A0 =C2=A0 allow for NULL arrays with size 0 instead of reje=
cting all NULL<br>
&gt; &gt; ++=C2=A0 =C2=A0 arrays.=C2=A0 However that made the above issue s=
ignificantly worse since<br>
&gt; &gt; ++=C2=A0 =C2=A0 that off-by-one error now did not write beyond an=
 array, but<br>
&gt; &gt; ++=C2=A0 =C2=A0 dereferenced said NULL pointer making the crash c=
ertain in a<br>
&gt; &gt; ++=C2=A0 =C2=A0 specific scenario in which a NULL array of size 0=
 was passed to the<br>
&gt; &gt; ++=C2=A0 =C2=A0 aforementioned functions.<br>
&gt; &gt; ++<br>
&gt; &gt; + * **Removed features**<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0* vbox: removed support for version 5.2 and 6.0 API=
s<br>
&gt; &gt; +diff --git a/src/interface/interface_backend_udev.c b/src/interf=
ace/interface_backend_udev.c<br>
&gt; &gt; +index fb6799e..4091483 100644<br>
&gt; &gt; +--- a/src/interface/interface_backend_udev.c<br>
&gt; &gt; ++++ b/src/interface/interface_backend_udev.c<br>
&gt; &gt; +@@ -222,7 +222,7 @@ udevListInterfacesByStatus(virConnectPtr con=
n,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_autoptr(virInterfaceDef) def=
 =3D NULL;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Ensure we won&#39;t exceed =
the size of our array */<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (count &gt; names_len)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (count &gt;=3D names_len)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D udev_list_entry_get_n=
ame(dev_entry);<br>
&gt; &gt; +--<br>
&gt; &gt; +2.25.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch=
 b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000..6b38f13a<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch<br>
&gt; &gt; @@ -0,0 +1,220 @@<br>
&gt; &gt; +From 8a3f8d957507c1f8223fdcf25a3ff885b15557f2 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D &l=
t;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferre=
r">berrange@redhat.com</a>&gt;<br>
&gt; &gt; +Date: Fri, 15 Mar 2024 10:47:50 +0000<br>
&gt; &gt; +Subject: [PATCH] remote: check for negative array lengths before=
 allocation<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +While the C API entry points will validate non-negative lengths<=
br>
&gt; &gt; +for various parameters, the RPC server de-serialization code<br>
&gt; &gt; +will need to allocate memory for arrays before entering the C<br=
>
&gt; &gt; +API. These allocations will thus happen before the non-negative<=
br>
&gt; &gt; +length check is performed.<br>
&gt; &gt; +<br>
&gt; &gt; +Passing a negative length to the g_new0 function will usually<br=
>
&gt; &gt; +result in a crash due to the negative length being treated as<br=
>
&gt; &gt; +a huge positive number.<br>
&gt; &gt; +<br>
&gt; &gt; +This was found and diagnosed by ALT Linux Team with AFLplusplus.=
<br>
&gt; &gt; +<br>
&gt; &gt; +CVE-2024-2494<br>
&gt; &gt; +Reviewed-by: Michal Privoznik &lt;<a href=3D"mailto:mprivozn@red=
hat.com" target=3D"_blank" rel=3D"noreferrer">mprivozn@redhat.com</a>&gt;<b=
r>
&gt; &gt; +Found-by: Alexandr Shashkin &lt;<a href=3D"mailto:dutyrok@altlin=
ux.org" target=3D"_blank" rel=3D"noreferrer">dutyrok@altlinux.org</a>&gt;<b=
r>
&gt; &gt; +Co-developed-by: Alexander Kuznetsov &lt;<a href=3D"mailto:kuzne=
tsovam@altlinux.org" target=3D"_blank" rel=3D"noreferrer">kuznetsovam@altli=
nux.org</a>&gt;<br>
&gt; &gt; +Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:ber=
range@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com<=
/a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/libvirt=
/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://gitlab.com/libvirt/libvirt/-/commi=
t/8a3f8d957507c1f8223fdcf25a3ff885b15557f2</a>]<br>
&gt; &gt; +CVE: CVE-2024-2494<br>
&gt; &gt; +Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapa=
ti@mvista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</=
a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + src/remote/remote_daemon_dispatch.c | 65 ++++++++++++++++++++++=
+++++++<br>
&gt; &gt; + src/rpc/<a href=3D"http://gendispatch.pl" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">gendispatch.pl</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++<br>
&gt; &gt; + 2 files changed, 70 insertions(+)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/remote/remote_daemon_dispatch.c b/src/remote/re=
mote_daemon_dispatch.c<br>
&gt; &gt; +index 7daf503..7542caa 100644<br>
&gt; &gt; +--- a/src/remote/remote_daemon_dispatch.c<br>
&gt; &gt; ++++ b/src/remote/remote_daemon_dispatch.c<br>
&gt; &gt; +@@ -2291,6 +2291,10 @@ remoteDispatchDomainGetSchedulerParameter=
s(virNetServer *server G_GNUC_UNUSED,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!conn)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_SCHE=
DULER_PARAMETERS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -2339,6 +2343,10 @@ remoteDispatchDomainGetSchedulerParameter=
sFlags(virNetServer *server G_GNUC_UNUS<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!conn)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_SCHE=
DULER_PARAMETERS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -2497,6 +2505,10 @@ remoteDispatchDomainBlockStatsFlags(virNe=
tServer *server G_GNUC_UNUSED,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_BLOC=
K_STATS_PARAMETERS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -2717,6 +2729,14 @@ remoteDispatchDomainGetVcpuPinInfo(virNet=
Server *server G_GNUC_UNUSED,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!(dom =3D get_nonnull_domain(conn, args-=
&gt;dom)))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;ncpumaps &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;ncpumaps must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;maplen &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;maplen must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;ncpumaps &gt; REMOTE_VCPUINFO_M=
AX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;ncpumaps &gt; REMOTE_VCPUINFO_MAX&quot;));=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -2811,6 +2831,11 @@ remoteDispatchDomainGetEmulatorPinInfo(vi=
rNetServer *server G_GNUC_UNUSED,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!(dom =3D get_nonnull_domain(conn, args-=
&gt;dom)))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;maplen &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;maplen must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Allocate buffers to take the results */<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;maplen &gt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpumaps =3D g_new0(unsigned ch=
ar, args-&gt;maplen);<br>
&gt; &gt; +@@ -2858,6 +2883,14 @@ remoteDispatchDomainGetVcpus(virNetServer=
 *server G_GNUC_UNUSED,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!(dom =3D get_nonnull_domain(conn, args-=
&gt;dom)))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;maxinfo &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;maxinfo must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;maplen &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;maxinfo must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;maxinfo &gt; REMOTE_VCPUINFO_MA=
X) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;maxinfo &gt; REMOTE_VCPUINFO_MAX&quot;));<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -3096,6 +3129,10 @@ remoteDispatchDomainGetMemoryParameters(v=
irNetServer *server G_GNUC_UNUSED,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_MEMO=
RY_PARAMETERS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -3156,6 +3193,10 @@ remoteDispatchDomainGetNumaParameters(vir=
NetServer *server G_GNUC_UNUSED,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_NUMA=
_PARAMETERS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -3216,6 +3257,10 @@ remoteDispatchDomainGetBlkioParameters(vi=
rNetServer *server G_GNUC_UNUSED,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_BLKI=
O_PARAMETERS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -3277,6 +3322,10 @@ remoteDispatchNodeGetCPUStats(virNetServe=
r *server G_GNUC_UNUSED,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_NODE_CPU_ST=
ATS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -3339,6 +3388,10 @@ remoteDispatchNodeGetMemoryStats(virNetSe=
rver *server G_GNUC_UNUSED,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_NODE_MEMORY=
_STATS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -3514,6 +3567,10 @@ remoteDispatchDomainGetBlockIoTune(virNet=
Server *server G_GNUC_UNUSED,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!conn)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_BLOC=
K_IO_TUNE_PARAMETERS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -5079,6 +5136,10 @@ remoteDispatchDomainGetInterfaceParameter=
s(virNetServer *server G_GNUC_UNUSED,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_INTE=
RFACE_PARAMETERS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +@@ -5299,6 +5360,10 @@ remoteDispatchNodeGetMemoryParameters(vir=
NetServer *server G_GNUC_UNUSED,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERR=
OR, &quot;%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_NODE_MEMORY=
_PARAMETERS_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNA=
L_ERROR, &quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +diff --git a/src/rpc/<a href=3D"http://gendispatch.pl" rel=3D"no=
referrer noreferrer" target=3D"_blank">gendispatch.pl</a> b/src/rpc/<a href=
=3D"http://gendispatch.pl" rel=3D"noreferrer noreferrer" target=3D"_blank">=
gendispatch.pl</a><br>
&gt; &gt; +index ea46a9d..17abadc 100755<br>
&gt; &gt; +--- a/src/rpc/<a href=3D"http://gendispatch.pl" rel=3D"noreferre=
r noreferrer" target=3D"_blank">gendispatch.pl</a><br>
&gt; &gt; ++++ b/src/rpc/<a href=3D"http://gendispatch.pl" rel=3D"noreferre=
r noreferrer" target=3D"_blank">gendispatch.pl</a><br>
&gt; &gt; +@@ -1070,6 +1070,11 @@ elsif ($mode eq &quot;server&quot;) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;\n&quot;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($single_ret_as_list) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =
=C2=A0 if (args-&gt;$single_ret_list_max_var &lt; 0) {\n&quot;;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_RPC,\n&quot;;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\&quot;%s\&quot;, _(\&quot;max$single_ret_list_name must be non-negative=
\&quot;));\n&quot;;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 goto cleanup;\n&quot;;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =
=C2=A0 }\n&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;=C2=
=A0 =C2=A0 if (args-&gt;$single_ret_list_max_var &gt; $single_ret_list_max_=
define) {\n&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_RPC,\n&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\&quot;%s\&quot;, _(\&quot;max$single_ret_list_name &gt; $single_ret_=
list_max_define\&quot;));\n&quot;;<br>
&gt; &gt; +--<br>
&gt; &gt; +2.25.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch=
 b/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000..81189abb<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/recipes-extended/libvirt/libvirt/CVE-2024-4418.patch<br>
&gt; &gt; @@ -0,0 +1,86 @@<br>
&gt; &gt; +From 8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D &l=
t;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferre=
r">berrange@redhat.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 30 Apr 2024 11:51:15 +0100<br>
&gt; &gt; +Subject: [PATCH] rpc: ensure temporary GSource is removed from c=
lient event<br>
&gt; &gt; + loop<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +Users are seeing periodic segfaults from libvirt client apps,<br=
>
&gt; &gt; +especially thread heavy ones like virt-manager. A typical<br>
&gt; &gt; +stack trace would end up in the virNetClientIOEventFD method,<br=
>
&gt; &gt; +with illegal access to stale stack data. eg<br>
&gt; &gt; +The root cause is a bad assumption in the virNetClientIOEventLoo=
p<br>
&gt; &gt; +method. This method is run by whichever thread currently owns th=
e<br>
&gt; &gt; +buck, and is responsible for handling I/O. Inside a for(;;) loop=
,<br>
&gt; &gt; +this method creates a temporary GSource, adds it to the event lo=
op<br>
&gt; &gt; +and runs g_main_loop_run(). When I/O is ready, the GSource callb=
ack<br>
&gt; &gt; +(virNetClientIOEventFD) will fire and call g_main_loop_quit(), a=
nd<br>
&gt; &gt; +return G_SOURCE_REMOVE which results in the temporary GSource be=
ing<br>
&gt; &gt; +destroyed. A g_autoptr() will then remove the last reference.<br=
>
&gt; &gt; +<br>
&gt; &gt; +What was overlooked, is that a second thread can come along and<=
br>
&gt; &gt; +while it can&#39;t enter virNetClientIOEventLoop, it will regist=
er an<br>
&gt; &gt; +idle source that uses virNetClientIOWakeup to interrupt the<br>
&gt; &gt; +original thread&#39;s &#39;g_main_loop_run&#39; call. When this =
happens the<br>
&gt; &gt; +virNetClientIOEventFD callback never runs, and so the temporary<=
br>
&gt; &gt; +GSource is not destroyed. The g_autoptr() will remove a referenc=
e,<br>
&gt; &gt; +but by virtue of still being attached to the event context, ther=
e<br>
&gt; &gt; +is an extra reference held causing GSource to be leaked. The<br>
&gt; &gt; +next time &#39;g_main_loop_run&#39; is called, the original GSou=
rce will<br>
&gt; &gt; +trigger its callback, and access data that was allocated on the<=
br>
&gt; &gt; +stack by the previous thread, and likely SEGV.<br>
&gt; &gt; +<br>
&gt; &gt; +To solve this, the thread calling &#39;g_main_loop_run&#39; must=
 call<br>
&gt; &gt; +g_source_destroy, immediately upon return, to guarantee that<br>
&gt; &gt; +the temporary GSource is removed.<br>
&gt; &gt; +<br>
&gt; &gt; +CVE-2024-4418<br>
&gt; &gt; +Reviewed-by: J=C3=A1n Tomko &lt;<a href=3D"mailto:jtomko@redhat.=
com" target=3D"_blank" rel=3D"noreferrer">jtomko@redhat.com</a>&gt;<br>
&gt; &gt; +Reported-by: Martin Shirokov &lt;<a href=3D"mailto:shirokovmarti=
n@gmail.com" target=3D"_blank" rel=3D"noreferrer">shirokovmartin@gmail.com<=
/a>&gt;<br>
&gt; &gt; +Tested-by: Martin Shirokov &lt;<a href=3D"mailto:shirokovmartin@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">shirokovmartin@gmail.com</a=
>&gt;<br>
&gt; &gt; +Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:ber=
range@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com<=
/a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/libvirt=
/libvirt/-/commit/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://gitlab.com/libvirt/libvirt/-/commi=
t/8074d64dc2eca846d6a61efe1a9b7428a0ce1dd1</a>]<br>
&gt; &gt; +CVE: CVE-2024-4418<br>
&gt; &gt; +Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapa=
ti@mvista.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</=
a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + src/rpc/virnetclient.c | 14 +++++++++++++-<br>
&gt; &gt; + 1 file changed, 13 insertions(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/rpc/virnetclient.c b/src/rpc/virnetclient.c<br>
&gt; &gt; +index 68098b1..147b0d6 100644<br>
&gt; &gt; +--- a/src/rpc/virnetclient.c<br>
&gt; &gt; ++++ b/src/rpc/virnetclient.c<br>
&gt; &gt; +@@ -1657,7 +1657,7 @@ static int virNetClientIOEventLoop(virNetC=
lient *client,<br>
&gt; &gt; + #endif /* !WIN32 */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int timeout =3D -1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virNetMessage *msg =3D NULL;<b=
r>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autoptr(GSource) G_GNUC_UNUSED so=
urce =3D NULL;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autoptr(GSource) source =3D NULL;=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIOCondition ev =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virNetClientIOEventData=
 data =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.client =3D clie=
nt,<br>
&gt; &gt; +@@ -1721,6 +1721,18 @@ static int virNetClientIOEventLoop(virNet=
Client *client,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_main_loop_run(client-&gt;eve=
ntLoop);<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If virNetClientIOEventFD ra=
n, this GSource will already be<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* destroyed due to G_SOURCE_R=
EMOVE. It is harmless to re-destroy<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* it, since we still own a re=
ference.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If virNetClientIOWakeup ran=
, it will have interrupted the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* g_main_loop_run call, befor=
e virNetClientIOEventFD could<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* run, and thus the GSource i=
s still registered, and we need<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to destroy it since it is r=
eferencing stack memory for &#39;data&#39;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_source_destroy(source);<br>
&gt; &gt; ++<br>
&gt; &gt; + #ifndef WIN32<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignore_value(pthread_sigmask(S=
IG_SETMASK, &amp;oldmask, NULL));<br>
&gt; &gt; + #endif /* !WIN32 */<br>
&gt; &gt; +--<br>
&gt; &gt; +2.25.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1=
0.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libvirt_10.0.0.bb=
</a> b/recipes-extended/libvirt/<a href=3D"http://libvirt_10.0.0.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libvirt_10.0.0.bb</a><br>
&gt; &gt; index 6b19b700..a33b6980 100644<br>
&gt; &gt; --- a/recipes-extended/libvirt/<a href=3D"http://libvirt_10.0.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">libvirt_10.0.0.bb</a><br=
>
&gt; &gt; +++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_10.0.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">libvirt_10.0.0.bb</a><br=
>
&gt; &gt; @@ -32,6 +32,9 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org=
/sources/libvirt-$%7BPV%7D.tar.xz;name=3Dlibvirt" rel=3D"noreferrer norefer=
rer" target=3D"_blank">http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=
=3Dlibvirt</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gnutls-help=
er.py \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-preven=
t-gendispatch.pl-generating-build-path-in-code.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-messon=
.build-remove-build-path-information-to-avoid-.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-1441.pa=
tch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-2494.pa=
tch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-4418.pa=
tch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI[libvirt.sha256sum] =3D &quot;8ba2e72ec8bdd2418554a1=
474c42c35704c30174b7611eaf9a16544b71bcf00a&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Regards,<br>
&gt; &gt; Hitendra Prajapati<br>
&gt; &gt; MontaVista Software LLC<br>
&gt; &gt; Mo: +91 9998906483<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000dde92b061cdcd157--

