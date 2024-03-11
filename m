Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EECC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 12:24:50 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.84])
 by mx.groups.io with SMTP id smtpd.web11.61497.1710159881888541871
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 05:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=EZPr//VL;
 spf=pass (domain: axis.com, ip: 40.107.13.84, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqTKGbtLgUv0gOrjRA5w41Al933V+D2hfrJx+Hpif4DB+xWnpBc58W/eS7GaGZ+Hq1nipTxVw7NXjxb07w9ak8ryZ3e5sAyBKTr7HgcP4cm1ZR0h80sfHU59s4jVHT+kOH73h8BN9I1zfeBugZdnFce0+p+99pjt3F1JW59ZNwJI9pN4m5xAEqqOF8q7IFqZh2eaBPFuYFQz1bVVwsabZv//Gqd51vuJ+ks1FIggZ3gQDjv/mTCtmJlJtDHrpnzqte1pvVbz+4xhfjPuSjQhmciVdgzaAmw3gt+XGUOVNc2DZNapYcWRtqfjWZWN1XRL8y7BH1iVoon8iU5oxIf4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Wmj6PT7gQ0MUfjgQ1jEJXWg38TMoYRvWcpP6x/O6aI=;
 b=GN3b0LqkR+1sjdnI5/OXWptSq6BnMjjxLekKicJpwOFFyKcGFzToHbd8Xd9wN56RNLBz0vuuUcaCpYQjJswud7sRKEo2LQRBkmFqeaixSG9yY1qIYMJKU9otsJDy1993E3eANoGWc8nuhfNg5j/mpQmB+AzcmdNLKuGhujbub1NkG+yeJ6l5ZCjPGlYxu80qNFNUjrdE4H38tpamSiSShcu8wYTBYnztUy/R08wnWu+yz5RlzXFR5ZUlyBVfiL/wc3oC3aWiUi7QwBJKqAwmaVwjQV3vamM/HpwnNig16GOL2dy9IVVOkmQulynSa5C+TiQZ8XiLpzfEvGADISlmPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Wmj6PT7gQ0MUfjgQ1jEJXWg38TMoYRvWcpP6x/O6aI=;
 b=EZPr//VLwTX6OVl0nJp6hD9EQWFspfB2QfxuzYEuOimrf4MYNBMqOyb3G9i/ZdEtA/NO9oGpMhcXAJvpKWD1SlNjnxUa4cgfbuHvY7Jd8HxST/G6YMolJ/cPuCt4cmWvGxocte7dc1tvByBXbPgoJ7QtTfShxoa2nH92WuvbxAY=
Received: from AM5PR0301CA0015.eurprd03.prod.outlook.com
 (2603:10a6:206:14::28) by DB3PR02MB10420.eurprd02.prod.outlook.com
 (2603:10a6:10:432::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 12:24:37 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:206:14:cafe::2b) by AM5PR0301CA0015.outlook.office365.com
 (2603:10a6:206:14::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Mon, 11 Mar 2024 12:24:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 12:24:36 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 11 Mar
 2024 13:24:36 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 11 Mar
 2024 13:24:36 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 11 Mar 2024 13:24:35 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C082C16188;
	Mon, 11 Mar 2024 13:24:35 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id E329E10395B; Mon, 11 Mar 2024 13:24:35 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Ola x Nilsson <olani@axis.com>
Subject: [meta-virtualization][PATCH] diod: Update to b4b5e8e00ed11b21d7fcf05a080dc054a8eac2d6
Date: Mon, 11 Mar 2024 13:24:35 +0100
Message-ID: <20240311122435.1480985-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AA:EE_|DB3PR02MB10420:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d9ea3e-8a58-4481-4551-08dc41c63754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4J+8dp0J/F1H/6oqrwjdqlxG/VOnyEH44pIupnAAxAybjpkq8waeebuTo8IQCBlNq3J44o0m9Gyg57SN1RN9xpdrvNbXhPH6nw2ul2CWH4aIy+FwVCjK3YncKv8QA5mlg3LjLm2pNXUbt1Vqa+T3g43iTKhXb9p8KJ0PQxKoyHXvjFzPuTahI39jKGHbwZl2/PJJQX5G76ZIPsMyd0EeS60Lt4fx9WIPyNbOhfvtXjWYKqAZpQ+pHxfTvgwFwWWQpxE5SoqfynZEhAIyQjRLDCUtM7kLERfWw5kiVFFCtaULeUq3arVzPpXsWkxbLbcokYyEXQtWNHjnJLFNnyD23CMFRM3KNSJYYteYAGwta2u5Jt9WOrrfXGWbrlfDwoBLR+6l04UrWVoUWr3KhP9upnU938r8XPSrE7JTJjyJK8Wachu11LpGn3u8Vs+Wgyi9oyytBacP6DteKwKl74GS/yxN6NKoTuiicU4e61om2ITnvDr2yuiEB7b6SCi02mnQi368Dkg/NvFhupednXE8ostYdP4ZsuGqLnbJwsgUKwM+fQUsnQkT2JW2PdB57ER/Wyi9cb5NKRSpXbwPqQFxGjVKrLYu54shygBNxIlMLhV3JzAU4GbXdr+eIuud0qP0JTL7OWeYIWblmHJFrzE05EkpmpLo1D5/OWB5TtRiVnApaknmiflVVldBsep+1gNC+elshBJN96udslKD5elpVnIz4/YTbUNV4xU22fBEpgC+LKr3pa7ayjIML9WRiwkL
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 12:24:36.4867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d9ea3e-8a58-4481-4551-08dc41c63754
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR02MB10420
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 12:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8619

Just needs a single patch to handle the lua feature in configure when
cross-compiling.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 recipes-extended/diod/diod_1.0.24.bb          |  13 +-
 .../0001-build-Find-lua-with-pkg-config.patch |  50 +++++++
 ...ilds-to-work-with-separate-build-dir.patch | 126 ------------------
 ...od-ops.c-add-header-file-for-makedev.patch |  37 -----
 ...drod-add-option-to-config-systemddir.patch |  51 -------
 .../0002-auto.diod.in-remove-bashisms.patch   |  47 -------
 6 files changed, 55 insertions(+), 269 deletions(-)
 create mode 100644 recipes-extended/diod/files/0001-build-Find-lua-with-pk=
g-config.patch
 delete mode 100644 recipes-extended/diod/files/0001-build-allow-builds-to-=
work-with-separate-build-dir.patch
 delete mode 100644 recipes-extended/diod/files/0001-diod-ops.c-add-header-=
file-for-makedev.patch
 delete mode 100644 recipes-extended/diod/files/0001-drod-add-option-to-con=
fig-systemddir.patch
 delete mode 100644 recipes-extended/diod/files/0002-auto.diod.in-remove-ba=
shisms.patch

diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/d=
iod_1.0.24.bb
index 2b87a8ae..5e191dc0 100644
--- a/recipes-extended/diod/diod_1.0.24.bb
+++ b/recipes-extended/diod/diod_1.0.24.bb
@@ -9,22 +9,19 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f655=
2"
=20
 PV =3D "1.0.24+git"
-SRCREV =3D "0ea3fe3d829b5085307cd27a512708d99ef48199"
+SRCREV =3D "b4b5e8e00ed11b21d7fcf05a080dc054a8eac2d6"
 SRC_URI =3D "git://github.com/chaos/diod.git;protocol=3Dhttps;branch=3Dmas=
ter \
            file://diod \
            file://diod.conf \
-           file://0001-build-allow-builds-to-work-with-separate-build-dir.=
patch \
-           file://0002-auto.diod.in-remove-bashisms.patch \
-           file://0001-diod-ops.c-add-header-file-for-makedev.patch \
-           file://0001-drod-add-option-to-config-systemddir.patch \
-          "
+           file://0001-build-Find-lua-with-pkg-config.patch \
+           "
 DEPENDS =3D "libcap ncurses tcp-wrappers lua"
=20
-EXTRA_OECONF =3D "--with-systemddir=3D${systemd_unitdir}/system"
+EXTRA_OEMAKE +=3D "systemddir=3D${systemd_unitdir}/system"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools systemd
+inherit autotools pkgconfig systemd
=20
 do_install:append () {
         # install our init based on start-stop-daemon
diff --git a/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-confi=
g.patch b/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-config.p=
atch
new file mode 100644
index 00000000..9f61792a
--- /dev/null
+++ b/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-config.patch
@@ -0,0 +1,50 @@
+From 8124eec4e59222f1c3f3dc4d7e6706e13c33755c Mon Sep 17 00:00:00 2001
+From: Ola x Nilsson <olani@axis.com>
+Date: Wed, 6 Mar 2024 18:40:16 +0100
+Subject: [PATCH] build: Find lua with pkg-config
+
+ax_lua.m4 does not support cross compilation.
+
+Upstream-Status: Inappropriate (Embedded specific)
+
+---
+ configure.ac | 26 +++++++++++++++++++++++++-
+ 1 file changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e8fcdb2..f3ebdc5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -121,7 +121,31 @@ AC_ARG_ENABLE([config],
+   [AS_HELP_STRING([--disable-config], [disable lua config file support])]=
)
+=20
+ AS_IF([test "x$enable_config" !=3D "xno"], [
+-  AX_PROG_LUA([5.1],[5.5])
++  dnl Use pkg_config to check for lua settings.  This is not standard
++  dnl as lua typically does not distribute a pc file.  The
++  dnl OpenEmbedded recipe adds one that can be used.  Reuse/replicate
++  dnl as much of AX_PROG_LUA as possible so AX_LUA_HEADERS and
++  dnl AX_LUA_LIBS are still usable.
++  PKG_CHECK_EXISTS([lua], [
++    AS_IF([
++      $PKG_CONFIG --atleast-version=3D5.1 lua && $PKG_CONFIG --max-versio=
n=3D5.5 lua
++    ],[
++      AC_ARG_VAR([LUA], [The LUA interpreter, e.g. /usr/bin/lua5.1])
++	  dnl should really check that the file exists ...
++      AC_SUBST([LUA], [${bindir}/lua])
++	  AC_CACHE_CHECK([for $LUA version], [ax_cv_lua_version], [
++	    ax_cv_lua_version=3D[`$PKG_CONFIG --modversion lua | $SED 's/^\([0-9=
]\+\.[0-9]\+\).*/\1/'`]
++      ])
++	  AS_IF([test "x$ax_cv_lua_version" =3D 'x'],
++       [AC_MSG_ERROR([invalid Lua version number])])
++      AC_SUBST([LUA_VERSION], [$ax_cv_lua_version])
++      AC_SUBST([LUA_SHORT_VERSION], [`echo "$LUA_VERSION" | $SED 's|\.||'=
`])
++    ],[
++	  AC_MSG_ERROR([Incorrect lua version])
++	])
++  ],[
++    AX_PROG_LUA([5.1],[5.5])
++  ])
+   AX_LUA_HEADERS([],[
+     AC_MSG_ERROR([Install lua headers or configure with --disable-config]=
)
+   ])
diff --git a/recipes-extended/diod/files/0001-build-allow-builds-to-work-wi=
th-separate-build-dir.patch b/recipes-extended/diod/files/0001-build-allow-=
builds-to-work-with-separate-build-dir.patch
deleted file mode 100644
index f40e0eb5..00000000
--- a/recipes-extended/diod/files/0001-build-allow-builds-to-work-with-sepa=
rate-build-dir.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From 43403468298ef4167baa5d84de2ee2eaf7f4007a Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Fri, 9 Jan 2015 18:34:04 +0000
-Subject: [PATCH 1/2] build: allow builds to work with separate build dir
-
-Remove assumptions in include paths that assume the build
-is happening in the source directories.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- diod/Makefile.am              | 2 +-
- libdiod/Makefile.am           | 2 +-
- liblsd/Makefile.am            | 2 +-
- libnpclient/Makefile.am       | 2 +-
- scripts/Makefile.am           | 6 +++---
- tests/kern/dbench/Makefile.am | 4 ++--
- utils/Makefile.am             | 2 +-
- 7 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/diod/Makefile.am b/diod/Makefile.am
-index 7644be7..fdaf130 100644
---- a/diod/Makefile.am
-+++ b/diod/Makefile.am
-@@ -1,7 +1,7 @@
- AM_CFLAGS =3D @GCCWARN@
-=20
- AM_CPPFLAGS =3D \
--	-I../libnpfs -I../liblsd -I../libdiod
-+	-I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libdiod
-=20
- sbin_PROGRAMS =3D diod
-=20
-diff --git a/libdiod/Makefile.am b/libdiod/Makefile.am
-index 4810e14..6905cdd 100644
---- a/libdiod/Makefile.am
-+++ b/libdiod/Makefile.am
-@@ -1,7 +1,7 @@
- AM_CFLAGS =3D @GCCWARN@
-=20
- AM_CPPFLAGS =3D \
--	-I../libnpfs -I../libnpclient -I../liblsd
-+	-I$(srcdir)/../libnpfs -I$(srcdir)/../libnpclient -I$(srcdir)/../liblsd
-=20
- noinst_LIBRARIES =3D libdiod.a
-=20
-diff --git a/liblsd/Makefile.am b/liblsd/Makefile.am
-index c3e5658..7e18bf8 100644
---- a/liblsd/Makefile.am
-+++ b/liblsd/Makefile.am
-@@ -1,6 +1,6 @@
- AM_CFLAGS =3D @GCCWARN@
-=20
--AM_CPPFLAGS =3D -I../libdiod
-+AM_CPPFLAGS =3D -I$(srcdir)/../libdiod
-=20
- noinst_LIBRARIES =3D liblsd.a
-=20
-diff --git a/libnpclient/Makefile.am b/libnpclient/Makefile.am
-index 5305df9..cbaf266 100644
---- a/libnpclient/Makefile.am
-+++ b/libnpclient/Makefile.am
-@@ -1,7 +1,7 @@
- AM_CFLAGS =3D @GCCWARN@
-=20
- AM_CPPFLAGS =3D \
--	-I../libnpfs
-+	-I$(srcdir)/../libnpfs
-=20
- noinst_LIBRARIES =3D libnpclient.a
-=20
-diff --git a/scripts/Makefile.am b/scripts/Makefile.am
-index 51c24a3..2aba728 100644
---- a/scripts/Makefile.am
-+++ b/scripts/Makefile.am
-@@ -1,9 +1,9 @@
--systemddir=3D$(sysconfdir)/systemd/system
-+systemddir=3D/lib/systemd/system
-=20
- install-data-local:
--	$(top_srcdir)/config/install-sh -m 755 $(srcdir)/auto.diod \
-+	$(top_srcdir)/config/install-sh -m 755 ./auto.diod \
- 		$(DESTDIR)$(sysconfdir)/auto.diod
--	$(top_srcdir)/config/install-sh -m 755 $(srcdir)/diod.service \
-+	$(top_srcdir)/config/install-sh -m 644 ./diod.service \
- 		$(DESTDIR)$(systemddir)/diod.service
-=20
- uninstall-local:
-diff --git a/tests/kern/dbench/Makefile.am b/tests/kern/dbench/Makefile.am
-index e0cdefa..1704f9f 100644
---- a/tests/kern/dbench/Makefile.am
-+++ b/tests/kern/dbench/Makefile.am
-@@ -2,7 +2,7 @@ AM_CFLAGS =3D -w
-=20
- # VERSION=3D4.00
-=20
--AM_CPPFLAGS =3D -DDATADIR=3D\"$(X_DATADIR)\"
-+AM_CPPFLAGS =3D -I. -DDATADIR=3D\"$(X_DATADIR)\"
-=20
- LDADD =3D $(LIBPOPT)
-=20
-@@ -25,6 +25,6 @@ BUILT_SOURCES =3D proto.h
- CLEANFILES =3D proto.h
-=20
- proto.h: $(dbench_SOURCES) mkproto.pl
--	perl mkproto.pl $(dbench_SOURCES) > proto.h
-+	$(srcdir)/mkproto.pl $(patsubst %,$(srcdir),$(dbench_SOURCES)) > proto.h
-=20
- EXTRA_DIST =3D mkproto.pl
-diff --git a/utils/Makefile.am b/utils/Makefile.am
-index 169b6c4..91d571d 100644
---- a/utils/Makefile.am
-+++ b/utils/Makefile.am
-@@ -1,7 +1,7 @@
- AM_CFLAGS =3D @GCCWARN@
-=20
- AM_CPPFLAGS =3D \
--	-I../libnpfs -I../liblsd -I../libdiod -I../libnpclient
-+	-I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libdiod -I$(=
srcdir)/../libnpclient
-=20
- sbin_PROGRAMS =3D diodmount diodcat dtop diodload diodls diodshowmount di=
oddate
-=20
---=20
-2.11.0
-
diff --git a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-fo=
r-makedev.patch b/recipes-extended/diod/files/0001-diod-ops.c-add-header-fi=
le-for-makedev.patch
deleted file mode 100644
index 49bc507b..00000000
--- a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-maked=
ev.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f75836731d6051d85e6317eb4c12465bafb4973e Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Fri, 31 Aug 2018 05:47:02 -0400
-Subject: [PATCH] diod/ops.c: add header file for makedev
-
-Error:
-diod/ops.c:845: undefined reference to `makedev'
-
-Fixed:
-Glibc removes sys/sysmacros.h which defines makedev from sys/types.h
-since v2.28. [Commit ID: e16deca62e16f]
-
-And then glibc suggestions us to include <sys/sysmacros.h> directly if
-code needs it.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- diod/ops.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/diod/ops.c b/diod/ops.c
-index c6c8291..469a502 100644
---- a/diod/ops.c
-+++ b/diod/ops.c
-@@ -74,6 +74,7 @@
- #include <pthread.h>
- #include <errno.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
-=20
- #ifdef __FreeBSD__
- #if !__BSD_VISIBLE
---=20
-2.8.1
-
diff --git a/recipes-extended/diod/files/0001-drod-add-option-to-config-sys=
temddir.patch b/recipes-extended/diod/files/0001-drod-add-option-to-config-=
systemddir.patch
deleted file mode 100644
index 4931a19b..00000000
--- a/recipes-extended/diod/files/0001-drod-add-option-to-config-systemddir=
.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 365159534b1981dfe291ecc05d2455f32652a166 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 26 Aug 2019 18:00:39 +0800
-Subject: [PATCH] drod: add option to config systemddir
-
-Not need to send upstream, since upstream have refactor
-related code, but not released. and this version release=20
-4 years ago, not proper to just backport one or more
-commits, this patch maybe could be dropped after upgrade.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- configure.ac        | 9 +++++++++
- scripts/Makefile.am | 2 +-
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1cb8579..3e4a5ec 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -25,6 +25,15 @@ AC_DEFINE([_GNU_SOURCE], 1,
-           [Define _GNU_SOURCE so that we get all necessary prototypes])
-=20
- ##
-+#Add option to config systemddir
-+##
-+AC_ARG_WITH([systemddir],
-+  [AS_HELP_STRING([--with-systemddir=3DDIR], [systemd dir])],
-+  [systemddir=3D$withval],
-+  [systemddir=3D"/lib/systemd/system"])
-+AC_SUBST([systemddir], [$systemddir])
-+
-+##
- # Checks for programs
- ##
- AC_PROG_CC
-diff --git a/scripts/Makefile.am b/scripts/Makefile.am
-index 2aba728..40822b7 100644
---- a/scripts/Makefile.am
-+++ b/scripts/Makefile.am
-@@ -1,4 +1,4 @@
--systemddir=3D/lib/systemd/system
-+systemddir=3D@systemddir@
-=20
- install-data-local:
- 	$(top_srcdir)/config/install-sh -m 755 ./auto.diod \
---=20
-2.7.4
-
diff --git a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.=
patch b/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
deleted file mode 100644
index 13e0a86e..00000000
--- a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5a9e09dc5de833db11607530351cd87cecbfd17e Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Thu, 22 Jun 2017 06:32:30 +0000
-Subject: [PATCH 2/2] auto.diod.in: remove bashisms
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- scripts/auto.diod.in | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/scripts/auto.diod.in b/scripts/auto.diod.in
-index f63e004..4d5fc3a 100755
---- a/scripts/auto.diod.in
-+++ b/scripts/auto.diod.in
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- #
- # auto.diod - executable automounter map for diod file systems
- #
-@@ -41,15 +41,15 @@ dcatopts=3D"${DIOD_TIMEOUT:+-t $DIOD_TIMEOUT}"
- for server in $DIOD_SERVERS; do
-     $DIOD_DIODCAT -s $server $dcatopts exports | awk '{print $1}' |\
-     while read path; do
--        if [ "$path" =3D=3D "/" ]; then
--            if [ "$key" =3D=3D "ROOT" ]; then
-+        if [ "$path" =3D "/" ]; then
-+            if [ "$key" =3D "ROOT" ]; then
-                 echo "$prefix $server:$path"
-                 exit 0
-             fi
--        elif [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//./g')"=
 ] \
--          || [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//_/g')"=
 ] \
--          || [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//-/g')"=
 ] \
--          || [ "$key" =3D=3D "$(basename $path)" ]; then
-+        elif [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//./g')" ] =
\
-+          || [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//_/g')" ] =
\
-+          || [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//-/g')" ] =
\
-+          || [ "$key" =3D "$(basename $path)" ]; then
-             echo "$prefix $server:$path"
-             exit 0
-         fi
---=20
-2.11.0
-
--=20
2.39.2


