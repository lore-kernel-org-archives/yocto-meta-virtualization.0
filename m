Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ED3C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 14:57:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web11.65057.1710169037518349574
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 07:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UbikYLzj;
 spf=pass (domain: axis.com, ip: 40.107.22.77, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TryKezc+WrajiHAZ/V31q2MaI71R6adolIvMNzma4tQWv6o8cQGmSzVU5QUiY6OZMctAj3hqaXWl8pkyhJUiQfLCcIzK0yPb40YarHv7GsUQSuzPMM0I+hEUY/0+0Y9VE3XnJeWWTwkeiH5LggVA1EQVV6ri+Ay63JJpRWVFHOfgFphGz4VaHBH9grXPpZgOwgOC8xbFspyEXP5mlsoGwj1wa2WSccD0fSt8LqpAYc6yPXFz5a2Ebv3x9vE/mEvCJ6rdupUWJQWrdqqaFwmv9KDt0KuSQEgUk9FYa6ztWrLm3BBAn3uC9FAfr5mQBOYe2ROMyAUM5FdelQBrewOwow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z/nVjCIhpRm884iyirnu4Ol9zH74Drfmll1XKK+4kE=;
 b=lRA8zkb3F8ri+F/edVVJ0jRzCO+okqU+gAOXO0Q6QKf4hpuawas+aDLWst0SZvNef3e90jvnw200mn/Vso9QIApV9wlheATwSzEZqHqqCLezs58XrzNiEayoWTMxgYmZ6VSQ1oBkUGPsQ/7/rRkNrjXjIp29hqC+ZIfGC8W94cyOxwEQ3MPMpSuoUBK8wM3I3woLOlIcDRJ94Oxum1jmC2DyhZP9b+9hSPucnTYmCih7MMwBcXOYnpENld0T2sEfOfqCNQL+jnQEC68mdzj9/Uj766pbWiFIqAKpuBqpCA2Lmoa5Y3WRp4mPReRT0id8uJPfcTAGx5H4rG4h1KkUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z/nVjCIhpRm884iyirnu4Ol9zH74Drfmll1XKK+4kE=;
 b=UbikYLzjNnnVcti8C/AspDMI4rWbVRi0PQImPVnDdvohmEEX95a/Dqix+caw2qWbbhJAguSOWe1ObkAPjRTnuIPixPpnnffznQqF30dapsllx6Bs82qtsy9fh5P9qc8rRwJ+Mt4e05GgToWVkMJW2HDnnJJXEeBoYdYF537kLVk=
Received: from AS9PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:20b:530::21)
 by VI1PR02MB5758.eurprd02.prod.outlook.com (2603:10a6:803:130::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 14:57:11 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:530:cafe::8f) by AS9PR04CA0179.outlook.office365.com
 (2603:10a6:20b:530::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Mon, 11 Mar 2024 14:57:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 14:57:10 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 11 Mar
 2024 15:57:09 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 11 Mar 2024 15:57:09 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id BFB1F16182;
	Mon, 11 Mar 2024 15:57:09 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id C000310395B; Mon, 11 Mar 2024 15:57:09 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Ola x Nilsson <olani@axis.com>
Subject: [meta-virtualization][PATCH v2] diod: Update to b4b5e8e00ed11b21d7fcf05a080dc054a8eac2d6
Date: Mon, 11 Mar 2024 15:57:09 +0100
Message-ID: <20240311145709.2526951-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|VI1PR02MB5758:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c7b719-9c2e-400c-cd2d-08dc41db8745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AXecPkShDXy7l3gzX2GW/8Quoxkgkv3s7KnQEceJEh1AMMezKqJWY2kcXA7HQyoVJTenejkh94Uz+y+wPMP6hqVQlorZd/mYOIjnG7I3FXoHoapYDc5fy/0Utrq2U3LNnFuWuzmEVwg+Ooke+h8V2Luhol7Af4MPfTmZBWT2tYi0Cx83SnGLaHRc2zI76dF/w3cqvoFDmecaZZ71SsQla+svhGu1yBvuZoyaZaUJy1855VVdcvXShtLCdGrTF5JqG+Eo0A63L3O56FATML62z58mmZrnsnn52qDUjEG5z8um+VqTiZtmXOE2I1gXbF/b6nXUH1ZdYZwnptJpgO6hGiYtou9a78LEhb+BTeXtxh2eufhEhtFa1/RCvGsTh576vTs/dVpYCQVK1LQJb+5FIU3EtlCXeq0gEgjo1vgc6nvV8x/na32VXTBFlJVX88rFNEeJVkrmeAG9BAgAd5LkVoQP4/40mnfBLoDGpQfLhE9pbkFya2ryJ5RNedxAMoJTKelPPwGJyDm+R42Qmp3Ja9RKBI1A0Z6NUBhlSXvbF1ovvVkhEIa3QBu300sjXUvoOPfnh+7qTFeR6SUmcg6caeFvAGZ157X9IHPYZsAHIBiyEmRDGzJEoigPZAhEToqL0E7+GXb5YME/QTdh8DySpugn0jYC82u+WsdPLRA01EXPpXJcUx7bFIr8ByumG+ufDYjTtN1sB/U2aKi4z3DzuDmUgT6+8AQbJb03rw3aietDwZVsBMMAqe7Rfv2QjFQr
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 14:57:10.2440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c7b719-9c2e-400c-cd2d-08dc41db8745
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5758
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 14:57:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8622

Just needs a single patch to handle the lua feature in configure when
cross-compiling.

f732f19 auto.diod.in: remove bashisms
7e0df4c build: Update ax_compiler_vendor.m4 from autoconf-archive 2023.02.2=
0
7e56831 build: Update ax_lua.m4 from autoconf-archive 2023.02.20
76c7c18 build: Install diod.service and auto.diod without install-data-loca=
l
af5972f build: Add missing , to AS_CASE in configure.ac
6cbbacf diodmount: update man page with privport option
3777ea1 libdiod: Support ipv6 in diod_sock_connect
ddf6071 libdiod: Set global options on exports specified on
1db9e57 libdiod: support privport on ipv6
ae7c536 diodmount: Add option to set privport
66652bf diod: allow walk on open fids
2822ea6 tests: disable open-walk test
56f24b2 diod: fix incompatible-pointer-types warning
ab03b7f utils/diodls: fix error-format warnings
84d4e51 github: extend build matrix to include ubuntu18
203b4c7 README: reference SPDX identifier
d5444ce license: update 9p.h kernel header
0a5c80e license: update npfs source headers
88350f3 license: update license header to abbreivated one
57a621d protocol: fix plan9 manual links
ee95dd9 tests/misc: fix distcheck problems
d8e1e67 README: update dependencies
5425713 ci: install lua interpreter as prereq
25bebfb build: add configure --disable-config
e7f9df9 build: fix lua detection
3eabd5d ci: create build matrix with clang, gcc
20ca897 build: conditional use of gcc warning flags is broken
16f8da4 build: turn all compiler warnings into errors
59bdaa1 tests/kern/tfcntl3: drop dead code
7a0f557 tests/kern/tfcntl2: drop dead code
dd4d4c0 tests/kern/misc: ignore stringop-truncation warnings
3a05837 tests/kern/fsx: ignore unused-result warnings
c918476 tests/kern/postmark: ignore format-overflow warn
b20268c tests/kern/fsx: fix incorrect message
7ee5b68 tests/kern/pathwalk: check snprintf return value
657dc10 diod: use readdir(3) in ioctx_readdir()
cba3834 diod: normalize whitespace in ioctx_readdir_r()
3e8ed95 diod: use readdir() not deprecated readdir_r()
194416d diod: define _DEFAULT_SOURCE not _BSD_SOURCE
ddcbd3b diodmount: initialized variable
698d055 diodmount: check system() return value
787994e build: suppress liblsd errors
192229f build: enable automake "maintainer mode"
0086b9b libnpfs: don't call snprintf() with NULL %s arg
620792d ci: add basic github workflow
530e2d5 move main.yml into the correct directory
783cb8c ci: add github workflow stub
c7eccf9 ci: drop travis config
ff26333 Use PKG_CHECK_MODULES for ncurses, drop legacy curses
91d8966 Silence warnings when compiling with clang
3bb5798 Increase diod server maximum msize setting to 1MB
896f37c Add option to disable hostname lookups
cdd12f2 Remove empty README
c2cd87c Document IPv6 address format
899306b diod: Add support for IPv6 addresses
1878ce9 diodmount: Add support for IPv6 addresses
82b819f Splits the package in diod, and diod-utils.
cf33c8e Fixes spec file for systemd build on CentOS 7.
9af7d94 Travis-ci: added support for ppc64le
550ba49 document the FreeBSD changes
bfe6c4b implement impersonation on FreeBSD
c28286f restore user-linux.c from user-linux-0.c
2624b4f copy user-linux.c to user-freebsd.c
f4ae6ef save a copy of user-linux.c as user-linux-0.c
228c2d2 minor cleanup in liblsd/hostlist.c
f325ad5 fix the help message
e20572a finish the split of user.c
11ed83c remove non-shared code from user.c
929276d move common code from user.c out of the way
7d3d01a leave only a stub in user-stub.c
d7abf6f create user-stub.c from user.c
828cf89 remove non-Linux bits from user-linux.c
3eb807c create user-linux.c from user.c
490d7bc add a setting to configure access=3Duser API
243b0b3 disable diodmount and tests except on Linux
1ece6d7 make building tests configurable
a3610ca make building diodmount configurable
13eace1 do not special-case Linux to do the same thing
33cd2b0 FreeBSD does not have ENODATA
e6ecd06 remove unused ifdefs
42958d2 check for missing defines directly
244adc7 use autoconf to detect headers
f3b9cae small fixes for FreeBSD
73fe9a6 Update protocol.md
f0f7d0d Fix systemd unit dir and file permissions
81eef82 Fix autoconf failure: Ensure m4 macro inclusion
ca1b0f5 Place systemd unit into $(libdir)/systemd/system
5551dbc libnpclient/read.c: fix out-of-bounds write
50bc4ea libdiod/diod_sock.c: zero initialize sockaddr
1d40ba5 diod/ops.c: distinguish opened and unopened Fids in {set,get}attr
d1d31c9 diod/ioctx.c: add stat, chmod, chown, truncate, utimensat
6749db3 diod/ops.c: disallow walk on opened fids
f1f1b38 tests/user: add tests for operations on opened fids
6fbe656 tests: fix xattr test build
d3946ca tests: check for daemon user
ff730b1 Fix typo in P9_TRENAME format
9690086 add git to debian dependencies
0498089 diod/ops.c: add header file for makedev
043f1ea cleanup: remove files that should not have been committed
0dd51c5 travis-ci: begin building under travis
fb191b7 tests/kern: avoid use of relative paths
47c63b0 tests/user: avoid use of relative paths
320eb5a tests/misc: avoid use of relative paths
74bfd84 test/misc: include test.h in dist target
89fb32d tests/kern/dbench: fix distcheck problem
d6881e0 build: fix source references in tests/misc
2379e20 build: include from $(srcdir) not relative path
f86b24e test/user: skip t18,19 if xattr not enabled
fc02397 test/user/attach: reduce number of threads
2f92e04 cleanup: drop trailing whitespace from test source
f958117 build: drop META
f33d72a libnpfs: use PACKAGE_NAME-PACKAGE_VERSION not META_ALIAS
5add7d2 dtop: show PACKAGE_VERSION not META_VERSION.RELEASE
3a51ec0 man: use PACKAGE not META macros
1fd1b11 spec: use PACKAGE not META macros
cf3247a cleanup: drop trailing whitespace from source
7ca7f56 protocol.md: fix typos and markdown errors
d04c39e README.md: trivial fixes
9d37f4a protocol.md: fix typos

Change-Id: I5f06ccaa86f935d5f32a0800c0edb49b9d17b0ff
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


