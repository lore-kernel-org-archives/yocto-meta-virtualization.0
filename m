Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03807CD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 14:07:32 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.137226.1712671642616570895
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 07:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQsgLnZy;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ecd957f949so5458889b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712671642; x=1713276442; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nOUsQQzUHSvTdcfMXSv58+u9yu9CdrjVqmx8AxuTMWU=;
        b=mQsgLnZyFig4TAkLFqu4ecMHZ+yi/95X5XyEspR3uXjQrEHN1J6jmhWgyIwBP2vogP
         Vcv6IPa7bcWJSGMM/jKdkvB0Oe4iVJEu4KHaAo0HoXM4KGUymghWUE3doWwtOKi7vdRg
         W7CEqUrN4zTKc4gYPi2GokmL24cWdPSGaIxFl9Fyv2hkfrjvWLMZD8o5IPQPQ8KeGARw
         TaCipvuE34Lou24XOUDxSms34UvhbH9qCMBwC8r8C5cqqjWCAbRtW9RblMwmsHtIiZ6G
         0jpUpVf/yKGdmiOOq5n+BfFK0XO7jfrwt3dDfAyYJqUInK0XCO5CgpNGcRN1fbgi2hEJ
         FFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712671642; x=1713276442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOUsQQzUHSvTdcfMXSv58+u9yu9CdrjVqmx8AxuTMWU=;
        b=K16uAUEKeo2tJD/qDNQKI2bJ37Chfl2N7w40fFPVWCRtjKUk5Wrg4aTLlp/GvoNbjs
         X7/FraDGWwszKTYxmBxWVdc0nN3KQjMB5k/1mXpL0pIVWobDzMVklrhjCSCdXnQ1GLOt
         g+D81jndoDQuoRM5nwtacZviQSC1Ipnff3+NVOb4Zphi5N1OkCJCTeAlYcmWeErN0j7c
         CmzFG8C2uHoBovuo5jRL136NfHMaPv+Ec/+/MEIVo7COb6yd6cNRJCd6bbBz6tRuLnk0
         V1iXUzArWLNeQ+iAVbpgvglU6XzHbyStgV3zhFb9TtFr+C1yBYr/kQBXYH6R+rpKXzHr
         u6Tw==
X-Gm-Message-State: AOJu0YxryAlrw/5BJQITwda2NXofN1QfnhWIanRcW17UjfoZfMUUmQzW
	cRVvT5ojmUxgERxgvbgLOd5vAGVmkesvIeTajODaC3HlSw09csqZMMQi1EukokiQpltiRPgoqym
	KnnCZM2SByXtlljeej0rN2JgLuJSrxm/eWjI=
X-Google-Smtp-Source: AGHT+IFb23Adn5c+pa95TbYNqiTGRmYTWL5CukwEO5+MAxHcwUpPuszOHxwfX5BDmLUENUJ9NzEdMq5xq5W2QtPT5ec=
X-Received: by 2002:a17:902:b287:b0:1e2:3e08:2c2f with SMTP id
 u7-20020a170902b28700b001e23e082c2fmr10726128plr.25.1712671641777; Tue, 09
 Apr 2024 07:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240326083521.28230-1-asharma@mvista.com>
In-Reply-To: <20240326083521.28230-1-asharma@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Apr 2024 10:07:10 -0400
Message-ID: <CADkTA4P19ohN04CgO1oxss74F1WkC051S=_FWYNEFXLs0BFK_w@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH] libvirt: Backport fix for CVE-2024-2494
To: asharma@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d3404e0615aa7061"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 14:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8666

--000000000000d3404e0615aa7061
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Your git and mail client are misconfigured:

remote: ##############################################
remote: Invalid author Ashish Sharma via lists.yoctoproject.org
remote: ##############################################
To ssh://push.yoctoproject.org/meta-virtualization
! [remote rejected] kirkstone -> kirkstone (pre-receive hook declined)

Information on how to fix it is here:

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#tro=
ubleshooting-email-issues

Send a v2 with a fixed up author and I'll get it merged.

Bruce

On Tue, Mar 26, 2024 at 4:35=E2=80=AFAM Ashish Sharma via lists.yoctoprojec=
t.org
<asharma=3Dmvista.com@lists.yoctoproject.org> wrote:

> Upstream-Status: Backport [
> https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff=
885b15557f2
> ]
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../libvirt/libvirt/CVE-2024-2494.patch       | 220 ++++++++++++++++++
>  recipes-extended/libvirt/libvirt_8.1.0.bb     |   1 +
>  2 files changed, 221 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> new file mode 100644
> index 000000000..99c5eec98
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch
> @@ -0,0 +1,220 @@
> +From 8a3f8d957507c1f8223fdcf25a3ff885b15557f2 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
> +Date: Fri, 15 Mar 2024 10:47:50 +0000
> +Subject: [PATCH] remote: check for negative array lengths before
> allocation
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
> +CVE: CVE-2024-2494
> +Upstream-Status: Backport [
> https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff=
885b15557f2
> ]
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + src/remote/remote_daemon_dispatch.c | 65 +++++++++++++++++++++++++++++
> + src/rpc/gendispatch.pl              |  5 +++
> + 2 files changed, 70 insertions(+)
> +
> +diff --git a/src/remote/remote_daemon_dispatch.c
> b/src/remote/remote_daemon_dispatch.c
> +index aaabd1e56c..01dcac4b12 100644
> +--- a/src/remote/remote_daemon_dispatch.c
> ++++ b/src/remote/remote_daemon_dispatch.c
> +@@ -2291,6 +2291,10 @@
> remoteDispatchDomainGetSchedulerParameters(virNetServer *server
> G_GNUC_UNUSED,
> +     if (!conn)
> +         goto cleanup;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -2339,6 +2343,10 @@
> remoteDispatchDomainGetSchedulerParametersFlags(virNetServer *server
> G_GNUC_UNUS
> +     if (!conn)
> +         goto cleanup;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_SCHEDULER_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -2497,6 +2505,10 @@ remoteDispatchDomainBlockStatsFlags(virNetServer
> *server G_GNUC_UNUSED,
> +         goto cleanup;
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_BLOCK_STATS_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -2717,6 +2729,14 @@ remoteDispatchDomainGetVcpuPinInfo(virNetServer
> *server G_GNUC_UNUSED,
> +     if (!(dom =3D get_nonnull_domain(conn, args->dom)))
> +         goto cleanup;
> +
> ++    if (args->ncpumaps < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps must b=
e
> non-negative"));
> ++        goto cleanup;
> ++    }
> ++    if (args->maplen < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->ncpumaps > REMOTE_VCPUINFO_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("ncpumaps >
> REMOTE_VCPUINFO_MAX"));
> +         goto cleanup;
> +@@ -2811,6 +2831,11 @@
> remoteDispatchDomainGetEmulatorPinInfo(virNetServer *server G_GNUC_UNUSED=
,
> +     if (!(dom =3D get_nonnull_domain(conn, args->dom)))
> +         goto cleanup;
> +
> ++    if (args->maplen < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maplen must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> ++
> +     /* Allocate buffers to take the results */
> +     if (args->maplen > 0)
> +         cpumaps =3D g_new0(unsigned char, args->maplen);
> +@@ -2858,6 +2883,14 @@ remoteDispatchDomainGetVcpus(virNetServer *server
> G_GNUC_UNUSED,
> +     if (!(dom =3D get_nonnull_domain(conn, args->dom)))
> +         goto cleanup;
> +
> ++    if (args->maxinfo < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> ++    if (args->maplen < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->maxinfo > REMOTE_VCPUINFO_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("maxinfo >
> REMOTE_VCPUINFO_MAX"));
> +         goto cleanup;
> +@@ -3096,6 +3129,10 @@
> remoteDispatchDomainGetMemoryParameters(virNetServer *server G_GNUC_UNUSE=
D,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_MEMORY_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -3156,6 +3193,10 @@ remoteDispatchDomainGetNumaParameters(virNetServe=
r
> *server G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_NUMA_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -3216,6 +3257,10 @@
> remoteDispatchDomainGetBlkioParameters(virNetServer *server G_GNUC_UNUSED=
,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_BLKIO_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -3277,6 +3322,10 @@ remoteDispatchNodeGetCPUStats(virNetServer *serve=
r
> G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_NODE_CPU_STATS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -3339,6 +3388,10 @@ remoteDispatchNodeGetMemoryStats(virNetServer
> *server G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_NODE_MEMORY_STATS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -3514,6 +3567,10 @@ remoteDispatchDomainGetBlockIoTune(virNetServer
> *server G_GNUC_UNUSED,
> +     if (!conn)
> +         goto cleanup;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_BLOCK_IO_TUNE_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -5081,6 +5138,10 @@
> remoteDispatchDomainGetInterfaceParameters(virNetServer *server
> G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_DOMAIN_INTERFACE_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
> +         goto cleanup;
> +@@ -5301,6 +5362,10 @@ remoteDispatchNodeGetMemoryParameters(virNetServe=
r
> *server G_GNUC_UNUSED,
> +
> +     flags =3D args->flags;
> +
> ++    if (args->nparams < 0) {
> ++        virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams must be
> non-negative"));
> ++        goto cleanup;
> ++    }
> +     if (args->nparams > REMOTE_NODE_MEMORY_PARAMETERS_MAX) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s", _("nparams too
> large"));
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
> ++            print "                       \"%s\",
> _(\"max$single_ret_list_name must be non-negative\"));\n";
> ++            print "        goto cleanup;\n";
> ++            print "    }\n";
> +             print "    if (args->$single_ret_list_max_var >
> $single_ret_list_max_define) {\n";
> +             print "        virReportError(VIR_ERR_RPC,\n";
> +             print "                       \"%s\",
> _(\"max$single_ret_list_name > $single_ret_list_max_define\"));\n";
> +--
> +GitLab
> +
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb
> b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index 63cf49146..a88e0ee31 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -30,6 +30,7 @@ SRC_URI =3D "
> http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=3Dlibvirt \
>             file://gnutls-helper.py \
>
> file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
>             file://CVE-2023-2700.patch \
> +           file://CVE-2024-2494.patch \
>            "
>
>  SRC_URI[libvirt.sha256sum] =3D
> "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
> --
> 2.35.7
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8655):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8655
> Mute This Topic: https://lists.yoctoproject.org/mt/105154754/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d3404e0615aa7061
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">You=
r git and mail client are misconfigured:</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">remote: ##############################################<br>r=
emote: Invalid author Ashish Sharma via <a href=3D"http://lists.yoctoprojec=
t.org" target=3D"_blank">lists.yoctoproject.org</a><br>remote: ############=
##################################<br>To ssh://<a href=3D"http://push.yocto=
project.org/meta-virtualization" target=3D"_blank">push.yoctoproject.org/me=
ta-virtualization</a><br>! [remote rejected] kirkstone -&gt; kirkstone (pre=
-receive hook declined)<br></div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Information on how to fix it is here:</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><a href=3D"https://docs.yoctoproject.org/dev/contributor-gu=
ide/submit-changes.html#troubleshooting-email-issues" rel=3D"noreferrer" ta=
rget=3D"_blank">https://docs.yoctoproject.org/dev/contributor-guide/submit-=
changes.html#troubleshooting-email-issues</a><br></div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Send a v2 with a fixed up author and I&#39;ll get =
it merged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Mar 26, 2024 at 4:35=E2=80=AFAM Ashish Sharma via <a href=3D"http://li=
sts.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;asha=
rma=3D<a href=3D"mailto:mvista.com@lists.yoctoproject.org" target=3D"_blank=
">mvista.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Upstream-Status: Backport [<a href=3D"ht=
tps://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b=
15557f2" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/libvirt/li=
bvirt/-/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2</a>]<br>
Signed-off-by: Ashish Sharma &lt;<a href=3D"mailto:asharma@mvista.com" targ=
et=3D"_blank">asharma@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../libvirt/libvirt/CVE-2024-2494.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
20 ++++++++++++++++++<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A02 files changed, 221 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/libvirt/CVE-2024-2494.pat=
ch<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch b/recipes=
-extended/libvirt/libvirt/CVE-2024-2494.patch<br>
new file mode 100644<br>
index 000000000..99c5eec98<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/libvirt/CVE-2024-2494.patch<br>
@@ -0,0 +1,220 @@<br>
+From 8a3f8d957507c1f8223fdcf25a3ff885b15557f2 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D &lt;<a href=
=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&g=
t;<br>
+Date: Fri, 15 Mar 2024 10:47:50 +0000<br>
+Subject: [PATCH] remote: check for negative array lengths before allocatio=
n<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+While the C API entry points will validate non-negative lengths<br>
+for various parameters, the RPC server de-serialization code<br>
+will need to allocate memory for arrays before entering the C<br>
+API. These allocations will thus happen before the non-negative<br>
+length check is performed.<br>
+<br>
+Passing a negative length to the g_new0 function will usually<br>
+result in a crash due to the negative length being treated as<br>
+a huge positive number.<br>
+<br>
+This was found and diagnosed by ALT Linux Team with AFLplusplus.<br>
+<br>
+CVE-2024-2494<br>
+Reviewed-by: Michal Privoznik &lt;<a href=3D"mailto:mprivozn@redhat.com" t=
arget=3D"_blank">mprivozn@redhat.com</a>&gt;<br>
+Found-by: Alexandr Shashkin &lt;<a href=3D"mailto:dutyrok@altlinux.org" ta=
rget=3D"_blank">dutyrok@altlinux.org</a>&gt;<br>
+Co-developed-by: Alexander Kuznetsov &lt;<a href=3D"mailto:kuznetsovam@alt=
linux.org" target=3D"_blank">kuznetsovam@altlinux.org</a>&gt;<br>
+Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redh=
at.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
+<br>
+CVE: CVE-2024-2494<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.com/libvirt/libvirt/-=
/commit/8a3f8d957507c1f8223fdcf25a3ff885b15557f2" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/libvirt/libvirt/-/commit/8a3f8d957507c1f8223=
fdcf25a3ff885b15557f2</a>]<br>
+Signed-off-by: Ashish Sharma &lt;<a href=3D"mailto:asharma@mvista.com" tar=
get=3D"_blank">asharma@mvista.com</a>&gt;<br>
+<br>
+ src/remote/remote_daemon_dispatch.c | 65 +++++++++++++++++++++++++++++<br=
>
+ src/rpc/<a href=3D"http://gendispatch.pl" rel=3D"noreferrer" target=3D"_b=
lank">gendispatch.pl</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 5 +++<br>
+ 2 files changed, 70 insertions(+)<br>
+<br>
+diff --git a/src/remote/remote_daemon_dispatch.c b/src/remote/remote_daemo=
n_dispatch.c<br>
+index aaabd1e56c..01dcac4b12 100644<br>
+--- a/src/remote/remote_daemon_dispatch.c<br>
++++ b/src/remote/remote_daemon_dispatch.c<br>
+@@ -2291,6 +2291,10 @@ remoteDispatchDomainGetSchedulerParameters(virNetSe=
rver *server G_GNUC_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0if (!conn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_SCHEDULER_PARA=
METERS_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -2339,6 +2343,10 @@ remoteDispatchDomainGetSchedulerParametersFlags(vir=
NetServer *server G_GNUC_UNUS<br>
+=C2=A0 =C2=A0 =C2=A0if (!conn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_SCHEDULER_PARA=
METERS_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -2497,6 +2505,10 @@ remoteDispatchDomainBlockStatsFlags(virNetServer *s=
erver G_GNUC_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_BLOCK_STATS_PA=
RAMETERS_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -2717,6 +2729,14 @@ remoteDispatchDomainGetVcpuPinInfo(virNetServer *se=
rver G_GNUC_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0if (!(dom =3D get_nonnull_domain(conn, args-&gt;dom)))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;ncpumaps &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;ncpumaps must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 if (args-&gt;maplen &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;maplen must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;ncpumaps &gt; REMOTE_VCPUINFO_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;ncpumaps &gt; REMOTE_VCPUINFO_MAX&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -2811,6 +2831,11 @@ remoteDispatchDomainGetEmulatorPinInfo(virNetServer=
 *server G_GNUC_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0if (!(dom =3D get_nonnull_domain(conn, args-&gt;dom)))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;maplen &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;maplen must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0/* Allocate buffers to take the results */<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;maplen &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpumaps =3D g_new0(unsigned char, args-&=
gt;maplen);<br>
+@@ -2858,6 +2883,14 @@ remoteDispatchDomainGetVcpus(virNetServer *server G=
_GNUC_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0if (!(dom =3D get_nonnull_domain(conn, args-&gt;dom)))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;maxinfo &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;maxinfo must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 if (args-&gt;maplen &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;maxinfo must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;maxinfo &gt; REMOTE_VCPUINFO_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;maxinfo &gt; REMOTE_VCPUINFO_MAX&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -3096,6 +3129,10 @@ remoteDispatchDomainGetMemoryParameters(virNetServe=
r *server G_GNUC_UNUSED,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_MEMORY_PARAMET=
ERS_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -3156,6 +3193,10 @@ remoteDispatchDomainGetNumaParameters(virNetServer =
*server G_GNUC_UNUSED,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_NUMA_PARAMETER=
S_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -3216,6 +3257,10 @@ remoteDispatchDomainGetBlkioParameters(virNetServer=
 *server G_GNUC_UNUSED,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_BLKIO_PARAMETE=
RS_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -3277,6 +3322,10 @@ remoteDispatchNodeGetCPUStats(virNetServer *server =
G_GNUC_UNUSED,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_NODE_CPU_STATS_MAX) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -3339,6 +3388,10 @@ remoteDispatchNodeGetMemoryStats(virNetServer *serv=
er G_GNUC_UNUSED,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_NODE_MEMORY_STATS_MAX=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -3514,6 +3567,10 @@ remoteDispatchDomainGetBlockIoTune(virNetServer *se=
rver G_GNUC_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0if (!conn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_BLOCK_IO_TUNE_=
PARAMETERS_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -5081,6 +5138,10 @@ remoteDispatchDomainGetInterfaceParameters(virNetSe=
rver *server G_GNUC_UNUSED,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_DOMAIN_INTERFACE_PARA=
METERS_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+@@ -5301,6 +5362,10 @@ remoteDispatchNodeGetMemoryParameters(virNetServer =
*server G_GNUC_UNUSED,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0flags =3D args-&gt;flags;<br>
+ <br>
++=C2=A0 =C2=A0 if (args-&gt;nparams &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virReportError(VIR_ERR_INTERNAL_ERROR, &quot;=
%s&quot;, _(&quot;nparams must be non-negative&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (args-&gt;nparams &gt; REMOTE_NODE_MEMORY_PARAMETER=
S_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virReportError(VIR_ERR_INTERNAL_ERROR, &=
quot;%s&quot;, _(&quot;nparams too large&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
+diff --git a/src/rpc/<a href=3D"http://gendispatch.pl" rel=3D"noreferrer" =
target=3D"_blank">gendispatch.pl</a> b/src/rpc/<a href=3D"http://gendispatc=
h.pl" rel=3D"noreferrer" target=3D"_blank">gendispatch.pl</a><br>
+index 5ce988c5ae..c5842dc796 100755<br>
+--- a/src/rpc/<a href=3D"http://gendispatch.pl" rel=3D"noreferrer" target=
=3D"_blank">gendispatch.pl</a><br>
++++ b/src/rpc/<a href=3D"http://gendispatch.pl" rel=3D"noreferrer" target=
=3D"_blank">gendispatch.pl</a><br>
+@@ -1070,6 +1070,11 @@ elsif ($mode eq &quot;server&quot;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;\n&quot;;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($single_ret_as_list) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =C2=A0 if (a=
rgs-&gt;$single_ret_list_max_var &lt; 0) {\n&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 virReportError(VIR_ERR_RPC,\n&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\&quot;%s=
\&quot;, _(\&quot;max$single_ret_list_name must be non-negative\&quot;));\n=
&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto cleanup;\n&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=C2=A0 =C2=A0 }\n&q=
uot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;=C2=A0 =C2=A0 =
if (args-&gt;$single_ret_list_max_var &gt; $single_ret_list_max_define) {\n=
&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 virReportError(VIR_ERR_RPC,\n&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\&quot=
;%s\&quot;, _(\&quot;max$single_ret_list_name &gt; $single_ret_list_max_def=
ine\&quot;));\n&quot;;<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_8.1.0.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_8.1.0.bb</a><br>
index 63cf49146..a88e0ee31 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a><br>
@@ -30,6 +30,7 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/l=
ibvirt-$%7BPV%7D.tar.xz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank=
">http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=3Dlibvirt</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gnutls-helper.py \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-qemu-segmentation-fau=
lt-in-virtqemud-executing-qemuD.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-2700.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-2494.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[libvirt.sha256sum] =3D &quot;3c6c43becffeb34a3f397c616206aa69=
a893ff8bf5e8208393c84e8e75352934&quot;<br>
-- <br>
2.35.7<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8655): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8655" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8655</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105154754/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105154754/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--000000000000d3404e0615aa7061--

