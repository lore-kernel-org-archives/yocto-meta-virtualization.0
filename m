Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D1BC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 14:59:31 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web10.64973.1710169162784687471
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 07:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=X8jWZfrp;
 spf=pass (domain: axis.com, ip: 40.107.22.64, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4z09B6JPylkHQUq2EQI/lF9JfOHsz0NduhG2nrRxPmZ8oXDUBfD/4l2/DgMbiqRxiLbMdtbkNQhFr0t2m6dEMVM5C7+D6VhL6dBLUS3EbF85+dJsYmmkU6abDNJ7PU0+fcT1iPjaYw6MNbRSUo61FOwzYfRR+U8ApUcX1CieJe2e0OkaGRO7DvFChWS5IEvYo1Zx2FgaxSK+a2qykaaKC598R+NisHOROmwgfcjClKKOmTLXv2uKWRHr2af88Wfht/jwjG0bv3EcUMC3ua5djM7XLAyijIiil+TWKRvcK3K7rrPT4ybzhJo1MD3c9AceeiPdRXwTfnjaExsJ9YCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEYbI/VJfiWj9vTRo4/hjqbmtxOIJHLAEPG11qw1auw=;
 b=gO5GsjeuDECN6Jg2VIkHLZjoKy1flTqqVyGJwSzabeWXNnl6h3HBoqeQckEk+QpvYeEzwpoqJwuEX1c/HiRHCsCIgMZ91ppqy3X8LTLGOoR0/S6TLBR7jyp2MVw9ftahqZa+ejQLiuDNshxJfOxUZtPQtlzxd0NP4TaD+kAannDGD9l8qkmXQSsq7+83ouxz+kMeSwRhqIAE5rMiBBbookP1p8gQ8BAa9t+Fw4jATXTl8DHoaOhQ9rq61vSqvmwPuHTB39UOp39THd10Hzhfxm4Mp/K84mr0TMz1o2JZcgDvInKaMXIewN6tU8HY+XyIk5GmMQT+y7nMY8S2hjKqfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEYbI/VJfiWj9vTRo4/hjqbmtxOIJHLAEPG11qw1auw=;
 b=X8jWZfrpNHePlRA3hdIB45EJrctzHQ12aLG7R74Gm/O6IkP71SFW2nZzGVRrootwaudYZf+4g185XJDtJRsfP/glmcH36X681O2lzq5AaaqQ4eKdmJKLCRseKfop+N/EGNJZi5pMAKL2ubOp+w96DgAfcM/G10x9RezLqTgRhIo=
Received: from DB9PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:10:1da::31)
 by AS8PR02MB7256.eurprd02.prod.outlook.com (2603:10a6:20b:3f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 14:59:19 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::ed) by DB9PR05CA0026.outlook.office365.com
 (2603:10a6:10:1da::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Mon, 11 Mar 2024 14:59:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 14:59:18 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 11 Mar
 2024 15:59:18 +0100
Received: from lnxolani1 (10.0.5.60) by se-mail02w.axis.com (10.20.40.8) with
 Microsoft SMTP Server id 15.1.2375.34 via Frontend Transport; Mon, 11 Mar
 2024 15:59:18 +0100
References: <20240311122435.1480985-1-olani@axis.com>
 <CADkTA4N+WcqAx9ofBHR+Mn=8fcFGb=O112qRPdqfNmEnJCxd8A@mail.gmail.com>
User-agent: mu4e 1.10.8; emacs 30.0.50
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] diod: Update to
 b4b5e8e00ed11b21d7fcf05a080dc054a8eac2d6
Date: Mon, 11 Mar 2024 15:57:21 +0100
Organization: Axis Communications AB
In-Reply-To: <CADkTA4N+WcqAx9ofBHR+Mn=8fcFGb=O112qRPdqfNmEnJCxd8A@mail.gmail.com>
Message-ID: <jwqmsr47r21.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9E:EE_|AS8PR02MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: d753198b-c6e9-4b98-82eb-08dc41dbd3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WDz0wUFnAr0xGdAlDMqKzFhI2c7OCR7EKoJnp6x/YsXJ0oBWIQ7rKvg9NBn/jZG9IXe3LVU2z5jRg6LssVPO8c0bwFQYDrkxcx+aqPazntpi2/lVH70URfWLqmX4H/QI3r68dunyI0bqymc1aP2MwcNL6LoTZa059iAI9XBB7k5wzf4D5Qf+4QefhWG9Tl7PDdnh4zd4jsfXjAl/aor3IzwG44rBHNALOV+GNELHXz4Le6iwUHmHKLxWi9gnOLFyY5JxQgsXNpsKqsCMquWjnMJqCsKe6Zw42if9mOskvooNfhyqgRZqJIhYW0jPgALIvvejWIsvrsPCfD/HYU9Ewpd73feA0Hkay+eFZaOVyuqV6wycr73pRisydLpVAuxld0mShswkDWc3Halpxiu/ftYmMkGPVq+7S4PGMt9eRrCwrDYTHyCxOYzmMoIWP2FpKG5Z2k0QwNCoViU+ICjG8nYjD1cYwTubSNwo9KNpo/RpWeTZ6q9UOsKCuLflcoGIjbeVgWHfCdeBB+cK7P8uT7R45JIYEOj5lmXFC46ERlDHzUKGr9UC1PWuiKWO6iqoBfcw6nEJiks9PmEQPUnJr6FI8UccJ9FrXKbDj1TtP/59dqQVytHxF1aIrtj4jSEXKtrVw02Z5ZDG1uAgMHYJOAn9NPUo+oqaIvyOiFf8a8edpx0un6zwlH1tXUnFvxO/xAGVIpaSQMb/GIo8DMg9C9WOpCvce39jHfLF03COmroM01NoInsM9cO3JqIVB+fx
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 14:59:18.8777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d753198b-c6e9-4b98-82eb-08dc41dbd3f6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7256
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 14:59:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8623




On Mon, Mar 11 2024, Bruce Ashfield wrote:

> On Mon, Mar 11, 2024 at 8:24=E2=80=AFAM Ola x Nilsson <ola.x.nilsson@axis=
.com> wrote:
>>
>> Just needs a single patch to handle the lua feature in configure when
>> cross-compiling.
>>
>
> This needs a listing of the changes between the two SRCREVs.

I've sent a v2.

> I haven't gotten around to updating diod for the release, so I'll consider
> this once ceph is working again, but for now, it will probably wait until
> my round of package bumps post release.

That's fine with me.

/Ola


>
>> Signed-off-by: Ola x Nilsson <olani@axis.com>
>> ---
>>  recipes-extended/diod/diod_1.0.24.bb          |  13 +-
>>  .../0001-build-Find-lua-with-pkg-config.patch |  50 +++++++
>>  ...ilds-to-work-with-separate-build-dir.patch | 126 ------------------
>>  ...od-ops.c-add-header-file-for-makedev.patch |  37 -----
>>  ...drod-add-option-to-config-systemddir.patch |  51 -------
>>  .../0002-auto.diod.in-remove-bashisms.patch   |  47 -------
>>  6 files changed, 55 insertions(+), 269 deletions(-)
>>  create mode 100644 recipes-extended/diod/files/0001-build-Find-lua-with=
-pkg-config.patch
>>  delete mode 100644 recipes-extended/diod/files/0001-build-allow-builds-=
to-work-with-separate-build-dir.patch
>>  delete mode 100644 recipes-extended/diod/files/0001-diod-ops.c-add-head=
er-file-for-makedev.patch
>>  delete mode 100644 recipes-extended/diod/files/0001-drod-add-option-to-=
config-systemddir.patch
>>  delete mode 100644 recipes-extended/diod/files/0002-auto.diod.in-remove=
-bashisms.patch
>>
>> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/dio=
d/diod_1.0.24.bb
>> index 2b87a8ae..5e191dc0 100644
>> --- a/recipes-extended/diod/diod_1.0.24.bb
>> +++ b/recipes-extended/diod/diod_1.0.24.bb
>> @@ -9,22 +9,19 @@ LICENSE =3D "GPL-2.0-only"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f=
6552"
>>
>>  PV =3D "1.0.24+git"
>> -SRCREV =3D "0ea3fe3d829b5085307cd27a512708d99ef48199"
>> +SRCREV =3D "b4b5e8e00ed11b21d7fcf05a080dc054a8eac2d6"
>>  SRC_URI =3D "git://github.com/chaos/diod.git;protocol=3Dhttps;branch=3D=
master \
>>             file://diod \
>>             file://diod.conf \
>> -           file://0001-build-allow-builds-to-work-with-separate-build-d=
ir.patch \
>> -           file://0002-auto.diod.in-remove-bashisms.patch \
>> -           file://0001-diod-ops.c-add-header-file-for-makedev.patch \
>> -           file://0001-drod-add-option-to-config-systemddir.patch \
>> -          "
>> +           file://0001-build-Find-lua-with-pkg-config.patch \
>> +           "
>>  DEPENDS =3D "libcap ncurses tcp-wrappers lua"
>>
>> -EXTRA_OECONF =3D "--with-systemddir=3D${systemd_unitdir}/system"
>> +EXTRA_OEMAKE +=3D "systemddir=3D${systemd_unitdir}/system"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> -inherit autotools systemd
>> +inherit autotools pkgconfig systemd
>>
>>  do_install:append () {
>>          # install our init based on start-stop-daemon
>> diff --git a/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-co=
nfig.patch b/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-confi=
g.patch
>> new file mode 100644
>> index 00000000..9f61792a
>> --- /dev/null
>> +++ b/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-config.pa=
tch
>> @@ -0,0 +1,50 @@
>> +From 8124eec4e59222f1c3f3dc4d7e6706e13c33755c Mon Sep 17 00:00:00 2001
>> +From: Ola x Nilsson <olani@axis.com>
>> +Date: Wed, 6 Mar 2024 18:40:16 +0100
>> +Subject: [PATCH] build: Find lua with pkg-config
>> +
>> +ax_lua.m4 does not support cross compilation.
>> +
>> +Upstream-Status: Inappropriate (Embedded specific)
>> +
>> +---
>> + configure.ac | 26 +++++++++++++++++++++++++-
>> + 1 file changed, 25 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index e8fcdb2..f3ebdc5 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -121,7 +121,31 @@ AC_ARG_ENABLE([config],
>> +   [AS_HELP_STRING([--disable-config], [disable lua config file support=
])])
>> +
>> + AS_IF([test "x$enable_config" !=3D "xno"], [
>> +-  AX_PROG_LUA([5.1],[5.5])
>> ++  dnl Use pkg_config to check for lua settings.  This is not standard
>> ++  dnl as lua typically does not distribute a pc file.  The
>> ++  dnl OpenEmbedded recipe adds one that can be used.  Reuse/replicate
>> ++  dnl as much of AX_PROG_LUA as possible so AX_LUA_HEADERS and
>> ++  dnl AX_LUA_LIBS are still usable.
>> ++  PKG_CHECK_EXISTS([lua], [
>> ++    AS_IF([
>> ++      $PKG_CONFIG --atleast-version=3D5.1 lua && $PKG_CONFIG --max-ver=
sion=3D5.5 lua
>> ++    ],[
>> ++      AC_ARG_VAR([LUA], [The LUA interpreter, e.g. /usr/bin/lua5.1])
>> ++        dnl should really check that the file exists ...
>> ++      AC_SUBST([LUA], [${bindir}/lua])
>> ++        AC_CACHE_CHECK([for $LUA version], [ax_cv_lua_version], [
>> ++          ax_cv_lua_version=3D[`$PKG_CONFIG --modversion lua | $SED 's=
/^\([0-9]\+\.[0-9]\+\).*/\1/'`]
>> ++      ])
>> ++        AS_IF([test "x$ax_cv_lua_version" =3D 'x'],
>> ++       [AC_MSG_ERROR([invalid Lua version number])])
>> ++      AC_SUBST([LUA_VERSION], [$ax_cv_lua_version])
>> ++      AC_SUBST([LUA_SHORT_VERSION], [`echo "$LUA_VERSION" | $SED 's|\.=
||'`])
>> ++    ],[
>> ++        AC_MSG_ERROR([Incorrect lua version])
>> ++      ])
>> ++  ],[
>> ++    AX_PROG_LUA([5.1],[5.5])
>> ++  ])
>> +   AX_LUA_HEADERS([],[
>> +     AC_MSG_ERROR([Install lua headers or configure with --disable-conf=
ig])
>> +   ])
>> diff --git a/recipes-extended/diod/files/0001-build-allow-builds-to-work=
-with-separate-build-dir.patch b/recipes-extended/diod/files/0001-build-all=
ow-builds-to-work-with-separate-build-dir.patch
>> deleted file mode 100644
>> index f40e0eb5..00000000
>> --- a/recipes-extended/diod/files/0001-build-allow-builds-to-work-with-s=
eparate-build-dir.patch
>> +++ /dev/null
>> @@ -1,126 +0,0 @@
>> -From 43403468298ef4167baa5d84de2ee2eaf7f4007a Mon Sep 17 00:00:00 2001
>> -From: Mark Asselstine <mark.asselstine@windriver.com>
>> -Date: Fri, 9 Jan 2015 18:34:04 +0000
>> -Subject: [PATCH 1/2] build: allow builds to work with separate build dir
>> -
>> -Remove assumptions in include paths that assume the build
>> -is happening in the source directories.
>> -
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ----
>> - diod/Makefile.am              | 2 +-
>> - libdiod/Makefile.am           | 2 +-
>> - liblsd/Makefile.am            | 2 +-
>> - libnpclient/Makefile.am       | 2 +-
>> - scripts/Makefile.am           | 6 +++---
>> - tests/kern/dbench/Makefile.am | 4 ++--
>> - utils/Makefile.am             | 2 +-
>> - 7 files changed, 10 insertions(+), 10 deletions(-)
>> -
>> -diff --git a/diod/Makefile.am b/diod/Makefile.am
>> -index 7644be7..fdaf130 100644
>> ---- a/diod/Makefile.am
>> -+++ b/diod/Makefile.am
>> -@@ -1,7 +1,7 @@
>> - AM_CFLAGS =3D @GCCWARN@
>> -
>> - AM_CPPFLAGS =3D \
>> --      -I../libnpfs -I../liblsd -I../libdiod
>> -+      -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libd=
iod
>> -
>> - sbin_PROGRAMS =3D diod
>> -
>> -diff --git a/libdiod/Makefile.am b/libdiod/Makefile.am
>> -index 4810e14..6905cdd 100644
>> ---- a/libdiod/Makefile.am
>> -+++ b/libdiod/Makefile.am
>> -@@ -1,7 +1,7 @@
>> - AM_CFLAGS =3D @GCCWARN@
>> -
>> - AM_CPPFLAGS =3D \
>> --      -I../libnpfs -I../libnpclient -I../liblsd
>> -+      -I$(srcdir)/../libnpfs -I$(srcdir)/../libnpclient -I$(srcdir)/..=
/liblsd
>> -
>> - noinst_LIBRARIES =3D libdiod.a
>> -
>> -diff --git a/liblsd/Makefile.am b/liblsd/Makefile.am
>> -index c3e5658..7e18bf8 100644
>> ---- a/liblsd/Makefile.am
>> -+++ b/liblsd/Makefile.am
>> -@@ -1,6 +1,6 @@
>> - AM_CFLAGS =3D @GCCWARN@
>> -
>> --AM_CPPFLAGS =3D -I../libdiod
>> -+AM_CPPFLAGS =3D -I$(srcdir)/../libdiod
>> -
>> - noinst_LIBRARIES =3D liblsd.a
>> -
>> -diff --git a/libnpclient/Makefile.am b/libnpclient/Makefile.am
>> -index 5305df9..cbaf266 100644
>> ---- a/libnpclient/Makefile.am
>> -+++ b/libnpclient/Makefile.am
>> -@@ -1,7 +1,7 @@
>> - AM_CFLAGS =3D @GCCWARN@
>> -
>> - AM_CPPFLAGS =3D \
>> --      -I../libnpfs
>> -+      -I$(srcdir)/../libnpfs
>> -
>> - noinst_LIBRARIES =3D libnpclient.a
>> -
>> -diff --git a/scripts/Makefile.am b/scripts/Makefile.am
>> -index 51c24a3..2aba728 100644
>> ---- a/scripts/Makefile.am
>> -+++ b/scripts/Makefile.am
>> -@@ -1,9 +1,9 @@
>> --systemddir=3D$(sysconfdir)/systemd/system
>> -+systemddir=3D/lib/systemd/system
>> -
>> - install-data-local:
>> --      $(top_srcdir)/config/install-sh -m 755 $(srcdir)/auto.diod \
>> -+      $(top_srcdir)/config/install-sh -m 755 ./auto.diod \
>> -               $(DESTDIR)$(sysconfdir)/auto.diod
>> --      $(top_srcdir)/config/install-sh -m 755 $(srcdir)/diod.service \
>> -+      $(top_srcdir)/config/install-sh -m 644 ./diod.service \
>> -               $(DESTDIR)$(systemddir)/diod.service
>> -
>> - uninstall-local:
>> -diff --git a/tests/kern/dbench/Makefile.am b/tests/kern/dbench/Makefile=
.am
>> -index e0cdefa..1704f9f 100644
>> ---- a/tests/kern/dbench/Makefile.am
>> -+++ b/tests/kern/dbench/Makefile.am
>> -@@ -2,7 +2,7 @@ AM_CFLAGS =3D -w
>> -
>> - # VERSION=3D4.00
>> -
>> --AM_CPPFLAGS =3D -DDATADIR=3D\"$(X_DATADIR)\"
>> -+AM_CPPFLAGS =3D -I. -DDATADIR=3D\"$(X_DATADIR)\"
>> -
>> - LDADD =3D $(LIBPOPT)
>> -
>> -@@ -25,6 +25,6 @@ BUILT_SOURCES =3D proto.h
>> - CLEANFILES =3D proto.h
>> -
>> - proto.h: $(dbench_SOURCES) mkproto.pl
>> --      perl mkproto.pl $(dbench_SOURCES) > proto.h
>> -+      $(srcdir)/mkproto.pl $(patsubst %,$(srcdir),$(dbench_SOURCES)) >=
 proto.h
>> -
>> - EXTRA_DIST =3D mkproto.pl
>> -diff --git a/utils/Makefile.am b/utils/Makefile.am
>> -index 169b6c4..91d571d 100644
>> ---- a/utils/Makefile.am
>> -+++ b/utils/Makefile.am
>> -@@ -1,7 +1,7 @@
>> - AM_CFLAGS =3D @GCCWARN@
>> -
>> - AM_CPPFLAGS =3D \
>> --      -I../libnpfs -I../liblsd -I../libdiod -I../libnpclient
>> -+      -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libd=
iod -I$(srcdir)/../libnpclient
>> -
>> - sbin_PROGRAMS =3D diodmount diodcat dtop diodload diodls diodshowmount=
 dioddate
>> -
>> ---
>> -2.11.0
>> -
>> diff --git a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file=
-for-makedev.patch b/recipes-extended/diod/files/0001-diod-ops.c-add-header=
-file-for-makedev.patch
>> deleted file mode 100644
>> index 49bc507b..00000000
>> --- a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-ma=
kedev.patch
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -From f75836731d6051d85e6317eb4c12465bafb4973e Mon Sep 17 00:00:00 2001
>> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
>> -Date: Fri, 31 Aug 2018 05:47:02 -0400
>> -Subject: [PATCH] diod/ops.c: add header file for makedev
>> -
>> -Error:
>> -diod/ops.c:845: undefined reference to `makedev'
>> -
>> -Fixed:
>> -Glibc removes sys/sysmacros.h which defines makedev from sys/types.h
>> -since v2.28. [Commit ID: e16deca62e16f]
>> -
>> -And then glibc suggestions us to include <sys/sysmacros.h> directly if
>> -code needs it.
>> -
>> -Upstream-Status: Submitted
>> -
>> -Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> ----
>> - diod/ops.c | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/diod/ops.c b/diod/ops.c
>> -index c6c8291..469a502 100644
>> ---- a/diod/ops.c
>> -+++ b/diod/ops.c
>> -@@ -74,6 +74,7 @@
>> - #include <pthread.h>
>> - #include <errno.h>
>> - #include <sys/types.h>
>> -+#include <sys/sysmacros.h>
>> -
>> - #ifdef __FreeBSD__
>> - #if !__BSD_VISIBLE
>> ---
>> -2.8.1
>> -
>> diff --git a/recipes-extended/diod/files/0001-drod-add-option-to-config-=
systemddir.patch b/recipes-extended/diod/files/0001-drod-add-option-to-conf=
ig-systemddir.patch
>> deleted file mode 100644
>> index 4931a19b..00000000
>> --- a/recipes-extended/diod/files/0001-drod-add-option-to-config-systemd=
dir.patch
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -From 365159534b1981dfe291ecc05d2455f32652a166 Mon Sep 17 00:00:00 2001
>> -From: Changqing Li <changqing.li@windriver.com>
>> -Date: Mon, 26 Aug 2019 18:00:39 +0800
>> -Subject: [PATCH] drod: add option to config systemddir
>> -
>> -Not need to send upstream, since upstream have refactor
>> -related code, but not released. and this version release
>> -4 years ago, not proper to just backport one or more
>> -commits, this patch maybe could be dropped after upgrade.
>> -
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ----
>> - configure.ac        | 9 +++++++++
>> - scripts/Makefile.am | 2 +-
>> - 2 files changed, 10 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 1cb8579..3e4a5ec 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -25,6 +25,15 @@ AC_DEFINE([_GNU_SOURCE], 1,
>> -           [Define _GNU_SOURCE so that we get all necessary prototypes])
>> -
>> - ##
>> -+#Add option to config systemddir
>> -+##
>> -+AC_ARG_WITH([systemddir],
>> -+  [AS_HELP_STRING([--with-systemddir=3DDIR], [systemd dir])],
>> -+  [systemddir=3D$withval],
>> -+  [systemddir=3D"/lib/systemd/system"])
>> -+AC_SUBST([systemddir], [$systemddir])
>> -+
>> -+##
>> - # Checks for programs
>> - ##
>> - AC_PROG_CC
>> -diff --git a/scripts/Makefile.am b/scripts/Makefile.am
>> -index 2aba728..40822b7 100644
>> ---- a/scripts/Makefile.am
>> -+++ b/scripts/Makefile.am
>> -@@ -1,4 +1,4 @@
>> --systemddir=3D/lib/systemd/system
>> -+systemddir=3D@systemddir@
>> -
>> - install-data-local:
>> -       $(top_srcdir)/config/install-sh -m 755 ./auto.diod \
>> ---
>> -2.7.4
>> -
>> diff --git a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashis=
ms.patch b/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.pa=
tch
>> deleted file mode 100644
>> index 13e0a86e..00000000
>> --- a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
>> +++ /dev/null
>> @@ -1,47 +0,0 @@
>> -From 5a9e09dc5de833db11607530351cd87cecbfd17e Mon Sep 17 00:00:00 2001
>> -From: Roy Li <rongqing.li@windriver.com>
>> -Date: Thu, 22 Jun 2017 06:32:30 +0000
>> -Subject: [PATCH 2/2] auto.diod.in: remove bashisms
>> -
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ----
>> - scripts/auto.diod.in | 14 +++++++-------
>> - 1 file changed, 7 insertions(+), 7 deletions(-)
>> -
>> -diff --git a/scripts/auto.diod.in b/scripts/auto.diod.in
>> -index f63e004..4d5fc3a 100755
>> ---- a/scripts/auto.diod.in
>> -+++ b/scripts/auto.diod.in
>> -@@ -1,4 +1,4 @@
>> --#!/bin/bash
>> -+#!/bin/sh
>> - #
>> - # auto.diod - executable automounter map for diod file systems
>> - #
>> -@@ -41,15 +41,15 @@ dcatopts=3D"${DIOD_TIMEOUT:+-t $DIOD_TIMEOUT}"
>> - for server in $DIOD_SERVERS; do
>> -     $DIOD_DIODCAT -s $server $dcatopts exports | awk '{print $1}' |\
>> -     while read path; do
>> --        if [ "$path" =3D=3D "/" ]; then
>> --            if [ "$key" =3D=3D "ROOT" ]; then
>> -+        if [ "$path" =3D "/" ]; then
>> -+            if [ "$key" =3D "ROOT" ]; then
>> -                 echo "$prefix $server:$path"
>> -                 exit 0
>> -             fi
>> --        elif [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//./g=
')" ] \
>> --          || [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//_/g=
')" ] \
>> --          || [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//-/g=
')" ] \
>> --          || [ "$key" =3D=3D "$(basename $path)" ]; then
>> -+        elif [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//./g')"=
 ] \
>> -+          || [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//_/g')"=
 ] \
>> -+          || [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//-/g')"=
 ] \
>> -+          || [ "$key" =3D "$(basename $path)" ]; then
>> -             echo "$prefix $server:$path"
>> -             exit 0
>> -         fi
>> ---
>> -2.11.0
>> -
>> --
>> 2.39.2
>>
>>
>>=20
>>


--=20
Ola x Nilsson

