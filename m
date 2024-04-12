Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBA1C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 09:18:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.42354.1712913490248406934
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 02:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F6Wer45S;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-417db45fe01so5053025e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Apr 2024 02:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913488; x=1713518288; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxJu1CvEgqBGNUmytj2brTevDKjbFFL6f0YTHsWjPLI=;
        b=F6Wer45Sv4iaXef4SoCk4T3sW130MnB+co4GI9t7zgKYSOoxu28smrm2eJBqjgWG7V
         JnIeazrRS+kOCPjBCQmeb6q1e4k74PvBLpWhnnOZtp9Ipl+4awHIsc/lCQt4C4YTlBrg
         fOTXUqxDB6arqGDmmW62jXd/ZSf72HJjdEXFfJxrFrfCv9U5lIY9s0UTpBVEgYqNcQc6
         M5Vm8bleyw2nydpYkvIOiXm/FFyujTQvf8LCYQUrqLv/hvIfAeHTz03nFgt8poROXD0+
         AjDSJ77wuhTMSORsFmhmucYMsulCOneIKVhdtgwriMQKUp9FlFtePmJXx/FJrF5pD+XS
         y7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913488; x=1713518288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxJu1CvEgqBGNUmytj2brTevDKjbFFL6f0YTHsWjPLI=;
        b=Ic/pFfN2+1P8bg2Ygx3L0rqHsYwNDhNhEwO5ab81P/1ZK5SUKLAOrb8aGiu9DUatnF
         ZbUoR+FN8dUNmqA++hjoEaOVU1i2rCGOzLjj2YWBZQomnvBAxJRj9xC58SUwFvd6rB8H
         feD+2NwYNYVh1LUmlcHGlgv93ySq0hMMgspsQyzdruyYvcCHrmb6jgP4L4z8IX66oBYn
         b7aMllnEsDJia+BNX1XpY+UP9y9O7XWD6sFbLzOpzt2s/D47sX2IHbmpRS1JP5AVZ5No
         t6x/vNzQT79b0pAHGcaq0szNsfAJTfE09YRGQ6yBHglsteeIAKvd3VgNhxWxkRA8DXH/
         nN6A==
X-Forwarded-Encrypted: i=1; AJvYcCUt4NqT/shJ3zmhkvU3vOgfdAe/WCHf+yeFQqTOiLwHNty/IocOq9nCgOSfi5AKuGgV2WznT3l1AZK2jDE3j6g9L1YO/8BEKFTib57xtFnlTA9GAEePLT2qRDI=
X-Gm-Message-State: AOJu0Ywu8XCidDHdqn5Dqya41nHy1n2CoB6q34umaaHq7FpqpvlqH4tQ
	r3CLaCTxeEDD7xa/7kH2lkuSs5nRHxJZNJAWmfZr50l4aDTZlTMcqjQlGzQRQZtDcb+LSmvWEIl
	wsEWCM2N8d5jGC1C7TInGZO03ZAs=
X-Google-Smtp-Source: AGHT+IE4dHimuBpIvoEHs1erCyhjZt2V/roHdpb10H9/FD1GFtIisLAwO52ZKoyLvVBGOTe7H4ibOG2cA0Q8OPHsT9U=
X-Received: by 2002:a5d:6483:0:b0:346:bbd8:e924 with SMTP id
 o3-20020a5d6483000000b00346bbd8e924mr1427326wri.4.1712913487983; Fri, 12 Apr
 2024 02:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240311145709.2526951-1-olani@axis.com> <ZfEbTwArbLLgSee7@gmail.com>
In-Reply-To: <ZfEbTwArbLLgSee7@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 12 Apr 2024 11:17:55 +0200
Message-ID: <CA+chaQeXc94uOpc+3gCCh750sBg8=+VvxEqyQv9scSyGGXTBYw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] diod: Update to b4b5e8e00ed11b21d7fcf05a080dc054a8eac2d6
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ola x Nilsson <ola.x.nilsson@axis.com>, meta-virtualization@lists.yoctoproject.org, 
	Ola x Nilsson <olani@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Apr 2024 09:18:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8674

FWIW: this is failing in some (possibly when
conf/distro/include/security_flags.inc with SECURITY_STRINGFORMAT and
conf/distro/include/time64.inc are used on arm or x86) world builds
with:
git/libnpfs/conn.c:135:44: error: format '%lu' expects argument of
type 'long unsigned int', but argument 3 has type '__time64_t' {aka
'long long int'} [-Werror=3Dformat=3D]
git/libnpfs/conn.c:135:50: error: format '%lu' expects argument of
type 'long unsigned int', but argument 4 has type '__suseconds64_t'
{aka 'long long int'} [-Werror=3Dformat=3D]
git/libnpfs/ctl.c:294:32: error: format '%lu' expects argument of type
'long unsigned int', but argument 4 has type '__time64_t' {aka 'long
long int'} [-Werror=3Dformat=3D]
git/libnpfs/ctl.c:294:36: error: format '%lu' expects argument of type
'long unsigned int', but argument 5 has type '__suseconds64_t' {aka
'long long int'} [-Werror=3Dformat=3D]

Cheers,

On Wed, Mar 13, 2024 at 4:19=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> Staged on master-next (it will be in the upcoming release branch)
>
> Bruce
>
> In message: [meta-virtualization][PATCH v2] diod: Update to b4b5e8e00ed11=
b21d7fcf05a080dc054a8eac2d6
> on 11/03/2024 Ola x Nilsson wrote:
>
> > Just needs a single patch to handle the lua feature in configure when
> > cross-compiling.
> >
> > f732f19 auto.diod.in: remove bashisms
> > 7e0df4c build: Update ax_compiler_vendor.m4 from autoconf-archive 2023.=
02.20
> > 7e56831 build: Update ax_lua.m4 from autoconf-archive 2023.02.20
> > 76c7c18 build: Install diod.service and auto.diod without install-data-=
local
> > af5972f build: Add missing , to AS_CASE in configure.ac
> > 6cbbacf diodmount: update man page with privport option
> > 3777ea1 libdiod: Support ipv6 in diod_sock_connect
> > ddf6071 libdiod: Set global options on exports specified on
> > 1db9e57 libdiod: support privport on ipv6
> > ae7c536 diodmount: Add option to set privport
> > 66652bf diod: allow walk on open fids
> > 2822ea6 tests: disable open-walk test
> > 56f24b2 diod: fix incompatible-pointer-types warning
> > ab03b7f utils/diodls: fix error-format warnings
> > 84d4e51 github: extend build matrix to include ubuntu18
> > 203b4c7 README: reference SPDX identifier
> > d5444ce license: update 9p.h kernel header
> > 0a5c80e license: update npfs source headers
> > 88350f3 license: update license header to abbreivated one
> > 57a621d protocol: fix plan9 manual links
> > ee95dd9 tests/misc: fix distcheck problems
> > d8e1e67 README: update dependencies
> > 5425713 ci: install lua interpreter as prereq
> > 25bebfb build: add configure --disable-config
> > e7f9df9 build: fix lua detection
> > 3eabd5d ci: create build matrix with clang, gcc
> > 20ca897 build: conditional use of gcc warning flags is broken
> > 16f8da4 build: turn all compiler warnings into errors
> > 59bdaa1 tests/kern/tfcntl3: drop dead code
> > 7a0f557 tests/kern/tfcntl2: drop dead code
> > dd4d4c0 tests/kern/misc: ignore stringop-truncation warnings
> > 3a05837 tests/kern/fsx: ignore unused-result warnings
> > c918476 tests/kern/postmark: ignore format-overflow warn
> > b20268c tests/kern/fsx: fix incorrect message
> > 7ee5b68 tests/kern/pathwalk: check snprintf return value
> > 657dc10 diod: use readdir(3) in ioctx_readdir()
> > cba3834 diod: normalize whitespace in ioctx_readdir_r()
> > 3e8ed95 diod: use readdir() not deprecated readdir_r()
> > 194416d diod: define _DEFAULT_SOURCE not _BSD_SOURCE
> > ddcbd3b diodmount: initialized variable
> > 698d055 diodmount: check system() return value
> > 787994e build: suppress liblsd errors
> > 192229f build: enable automake "maintainer mode"
> > 0086b9b libnpfs: don't call snprintf() with NULL %s arg
> > 620792d ci: add basic github workflow
> > 530e2d5 move main.yml into the correct directory
> > 783cb8c ci: add github workflow stub
> > c7eccf9 ci: drop travis config
> > ff26333 Use PKG_CHECK_MODULES for ncurses, drop legacy curses
> > 91d8966 Silence warnings when compiling with clang
> > 3bb5798 Increase diod server maximum msize setting to 1MB
> > 896f37c Add option to disable hostname lookups
> > cdd12f2 Remove empty README
> > c2cd87c Document IPv6 address format
> > 899306b diod: Add support for IPv6 addresses
> > 1878ce9 diodmount: Add support for IPv6 addresses
> > 82b819f Splits the package in diod, and diod-utils.
> > cf33c8e Fixes spec file for systemd build on CentOS 7.
> > 9af7d94 Travis-ci: added support for ppc64le
> > 550ba49 document the FreeBSD changes
> > bfe6c4b implement impersonation on FreeBSD
> > c28286f restore user-linux.c from user-linux-0.c
> > 2624b4f copy user-linux.c to user-freebsd.c
> > f4ae6ef save a copy of user-linux.c as user-linux-0.c
> > 228c2d2 minor cleanup in liblsd/hostlist.c
> > f325ad5 fix the help message
> > e20572a finish the split of user.c
> > 11ed83c remove non-shared code from user.c
> > 929276d move common code from user.c out of the way
> > 7d3d01a leave only a stub in user-stub.c
> > d7abf6f create user-stub.c from user.c
> > 828cf89 remove non-Linux bits from user-linux.c
> > 3eb807c create user-linux.c from user.c
> > 490d7bc add a setting to configure access=3Duser API
> > 243b0b3 disable diodmount and tests except on Linux
> > 1ece6d7 make building tests configurable
> > a3610ca make building diodmount configurable
> > 13eace1 do not special-case Linux to do the same thing
> > 33cd2b0 FreeBSD does not have ENODATA
> > e6ecd06 remove unused ifdefs
> > 42958d2 check for missing defines directly
> > 244adc7 use autoconf to detect headers
> > f3b9cae small fixes for FreeBSD
> > 73fe9a6 Update protocol.md
> > f0f7d0d Fix systemd unit dir and file permissions
> > 81eef82 Fix autoconf failure: Ensure m4 macro inclusion
> > ca1b0f5 Place systemd unit into $(libdir)/systemd/system
> > 5551dbc libnpclient/read.c: fix out-of-bounds write
> > 50bc4ea libdiod/diod_sock.c: zero initialize sockaddr
> > 1d40ba5 diod/ops.c: distinguish opened and unopened Fids in {set,get}at=
tr
> > d1d31c9 diod/ioctx.c: add stat, chmod, chown, truncate, utimensat
> > 6749db3 diod/ops.c: disallow walk on opened fids
> > f1f1b38 tests/user: add tests for operations on opened fids
> > 6fbe656 tests: fix xattr test build
> > d3946ca tests: check for daemon user
> > ff730b1 Fix typo in P9_TRENAME format
> > 9690086 add git to debian dependencies
> > 0498089 diod/ops.c: add header file for makedev
> > 043f1ea cleanup: remove files that should not have been committed
> > 0dd51c5 travis-ci: begin building under travis
> > fb191b7 tests/kern: avoid use of relative paths
> > 47c63b0 tests/user: avoid use of relative paths
> > 320eb5a tests/misc: avoid use of relative paths
> > 74bfd84 test/misc: include test.h in dist target
> > 89fb32d tests/kern/dbench: fix distcheck problem
> > d6881e0 build: fix source references in tests/misc
> > 2379e20 build: include from $(srcdir) not relative path
> > f86b24e test/user: skip t18,19 if xattr not enabled
> > fc02397 test/user/attach: reduce number of threads
> > 2f92e04 cleanup: drop trailing whitespace from test source
> > f958117 build: drop META
> > f33d72a libnpfs: use PACKAGE_NAME-PACKAGE_VERSION not META_ALIAS
> > 5add7d2 dtop: show PACKAGE_VERSION not META_VERSION.RELEASE
> > 3a51ec0 man: use PACKAGE not META macros
> > 1fd1b11 spec: use PACKAGE not META macros
> > cf3247a cleanup: drop trailing whitespace from source
> > 7ca7f56 protocol.md: fix typos and markdown errors
> > d04c39e README.md: trivial fixes
> > 9d37f4a protocol.md: fix typos
> >
> > Change-Id: I5f06ccaa86f935d5f32a0800c0edb49b9d17b0ff
> > Signed-off-by: Ola x Nilsson <olani@axis.com>
> > ---
> >  recipes-extended/diod/diod_1.0.24.bb          |  13 +-
> >  .../0001-build-Find-lua-with-pkg-config.patch |  50 +++++++
> >  ...ilds-to-work-with-separate-build-dir.patch | 126 ------------------
> >  ...od-ops.c-add-header-file-for-makedev.patch |  37 -----
> >  ...drod-add-option-to-config-systemddir.patch |  51 -------
> >  .../0002-auto.diod.in-remove-bashisms.patch   |  47 -------
> >  6 files changed, 55 insertions(+), 269 deletions(-)
> >  create mode 100644 recipes-extended/diod/files/0001-build-Find-lua-wit=
h-pkg-config.patch
> >  delete mode 100644 recipes-extended/diod/files/0001-build-allow-builds=
-to-work-with-separate-build-dir.patch
> >  delete mode 100644 recipes-extended/diod/files/0001-diod-ops.c-add-hea=
der-file-for-makedev.patch
> >  delete mode 100644 recipes-extended/diod/files/0001-drod-add-option-to=
-config-systemddir.patch
> >  delete mode 100644 recipes-extended/diod/files/0002-auto.diod.in-remov=
e-bashisms.patch
> >
> > diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/di=
od/diod_1.0.24.bb
> > index 2b87a8ae..5e191dc0 100644
> > --- a/recipes-extended/diod/diod_1.0.24.bb
> > +++ b/recipes-extended/diod/diod_1.0.24.bb
> > @@ -9,22 +9,19 @@ LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9=
f6552"
> >
> >  PV =3D "1.0.24+git"
> > -SRCREV =3D "0ea3fe3d829b5085307cd27a512708d99ef48199"
> > +SRCREV =3D "b4b5e8e00ed11b21d7fcf05a080dc054a8eac2d6"
> >  SRC_URI =3D "git://github.com/chaos/diod.git;protocol=3Dhttps;branch=
=3Dmaster \
> >             file://diod \
> >             file://diod.conf \
> > -           file://0001-build-allow-builds-to-work-with-separate-build-=
dir.patch \
> > -           file://0002-auto.diod.in-remove-bashisms.patch \
> > -           file://0001-diod-ops.c-add-header-file-for-makedev.patch \
> > -           file://0001-drod-add-option-to-config-systemddir.patch \
> > -          "
> > +           file://0001-build-Find-lua-with-pkg-config.patch \
> > +           "
> >  DEPENDS =3D "libcap ncurses tcp-wrappers lua"
> >
> > -EXTRA_OECONF =3D "--with-systemddir=3D${systemd_unitdir}/system"
> > +EXTRA_OEMAKE +=3D "systemddir=3D${systemd_unitdir}/system"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -inherit autotools systemd
> > +inherit autotools pkgconfig systemd
> >
> >  do_install:append () {
> >          # install our init based on start-stop-daemon
> > diff --git a/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-c=
onfig.patch b/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-conf=
ig.patch
> > new file mode 100644
> > index 00000000..9f61792a
> > --- /dev/null
> > +++ b/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-config.p=
atch
> > @@ -0,0 +1,50 @@
> > +From 8124eec4e59222f1c3f3dc4d7e6706e13c33755c Mon Sep 17 00:00:00 2001
> > +From: Ola x Nilsson <olani@axis.com>
> > +Date: Wed, 6 Mar 2024 18:40:16 +0100
> > +Subject: [PATCH] build: Find lua with pkg-config
> > +
> > +ax_lua.m4 does not support cross compilation.
> > +
> > +Upstream-Status: Inappropriate (Embedded specific)
> > +
> > +---
> > + configure.ac | 26 +++++++++++++++++++++++++-
> > + 1 file changed, 25 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index e8fcdb2..f3ebdc5 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -121,7 +121,31 @@ AC_ARG_ENABLE([config],
> > +   [AS_HELP_STRING([--disable-config], [disable lua config file suppor=
t])])
> > +
> > + AS_IF([test "x$enable_config" !=3D "xno"], [
> > +-  AX_PROG_LUA([5.1],[5.5])
> > ++  dnl Use pkg_config to check for lua settings.  This is not standard
> > ++  dnl as lua typically does not distribute a pc file.  The
> > ++  dnl OpenEmbedded recipe adds one that can be used.  Reuse/replicate
> > ++  dnl as much of AX_PROG_LUA as possible so AX_LUA_HEADERS and
> > ++  dnl AX_LUA_LIBS are still usable.
> > ++  PKG_CHECK_EXISTS([lua], [
> > ++    AS_IF([
> > ++      $PKG_CONFIG --atleast-version=3D5.1 lua && $PKG_CONFIG --max-ve=
rsion=3D5.5 lua
> > ++    ],[
> > ++      AC_ARG_VAR([LUA], [The LUA interpreter, e.g. /usr/bin/lua5.1])
> > ++      dnl should really check that the file exists ...
> > ++      AC_SUBST([LUA], [${bindir}/lua])
> > ++      AC_CACHE_CHECK([for $LUA version], [ax_cv_lua_version], [
> > ++        ax_cv_lua_version=3D[`$PKG_CONFIG --modversion lua | $SED 's/=
^\([0-9]\+\.[0-9]\+\).*/\1/'`]
> > ++      ])
> > ++      AS_IF([test "x$ax_cv_lua_version" =3D 'x'],
> > ++       [AC_MSG_ERROR([invalid Lua version number])])
> > ++      AC_SUBST([LUA_VERSION], [$ax_cv_lua_version])
> > ++      AC_SUBST([LUA_SHORT_VERSION], [`echo "$LUA_VERSION" | $SED 's|\=
.||'`])
> > ++    ],[
> > ++      AC_MSG_ERROR([Incorrect lua version])
> > ++    ])
> > ++  ],[
> > ++    AX_PROG_LUA([5.1],[5.5])
> > ++  ])
> > +   AX_LUA_HEADERS([],[
> > +     AC_MSG_ERROR([Install lua headers or configure with --disable-con=
fig])
> > +   ])
> > diff --git a/recipes-extended/diod/files/0001-build-allow-builds-to-wor=
k-with-separate-build-dir.patch b/recipes-extended/diod/files/0001-build-al=
low-builds-to-work-with-separate-build-dir.patch
> > deleted file mode 100644
> > index f40e0eb5..00000000
> > --- a/recipes-extended/diod/files/0001-build-allow-builds-to-work-with-=
separate-build-dir.patch
> > +++ /dev/null
> > @@ -1,126 +0,0 @@
> > -From 43403468298ef4167baa5d84de2ee2eaf7f4007a Mon Sep 17 00:00:00 2001
> > -From: Mark Asselstine <mark.asselstine@windriver.com>
> > -Date: Fri, 9 Jan 2015 18:34:04 +0000
> > -Subject: [PATCH 1/2] build: allow builds to work with separate build d=
ir
> > -
> > -Remove assumptions in include paths that assume the build
> > -is happening in the source directories.
> > -
> > -Upstream-Status: Inappropriate [embedded specific]
> > -
> > -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ----
> > - diod/Makefile.am              | 2 +-
> > - libdiod/Makefile.am           | 2 +-
> > - liblsd/Makefile.am            | 2 +-
> > - libnpclient/Makefile.am       | 2 +-
> > - scripts/Makefile.am           | 6 +++---
> > - tests/kern/dbench/Makefile.am | 4 ++--
> > - utils/Makefile.am             | 2 +-
> > - 7 files changed, 10 insertions(+), 10 deletions(-)
> > -
> > -diff --git a/diod/Makefile.am b/diod/Makefile.am
> > -index 7644be7..fdaf130 100644
> > ---- a/diod/Makefile.am
> > -+++ b/diod/Makefile.am
> > -@@ -1,7 +1,7 @@
> > - AM_CFLAGS =3D @GCCWARN@
> > -
> > - AM_CPPFLAGS =3D \
> > --    -I../libnpfs -I../liblsd -I../libdiod
> > -+    -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libdi=
od
> > -
> > - sbin_PROGRAMS =3D diod
> > -
> > -diff --git a/libdiod/Makefile.am b/libdiod/Makefile.am
> > -index 4810e14..6905cdd 100644
> > ---- a/libdiod/Makefile.am
> > -+++ b/libdiod/Makefile.am
> > -@@ -1,7 +1,7 @@
> > - AM_CFLAGS =3D @GCCWARN@
> > -
> > - AM_CPPFLAGS =3D \
> > --    -I../libnpfs -I../libnpclient -I../liblsd
> > -+    -I$(srcdir)/../libnpfs -I$(srcdir)/../libnpclient -I$(srcdir)/../=
liblsd
> > -
> > - noinst_LIBRARIES =3D libdiod.a
> > -
> > -diff --git a/liblsd/Makefile.am b/liblsd/Makefile.am
> > -index c3e5658..7e18bf8 100644
> > ---- a/liblsd/Makefile.am
> > -+++ b/liblsd/Makefile.am
> > -@@ -1,6 +1,6 @@
> > - AM_CFLAGS =3D @GCCWARN@
> > -
> > --AM_CPPFLAGS =3D -I../libdiod
> > -+AM_CPPFLAGS =3D -I$(srcdir)/../libdiod
> > -
> > - noinst_LIBRARIES =3D liblsd.a
> > -
> > -diff --git a/libnpclient/Makefile.am b/libnpclient/Makefile.am
> > -index 5305df9..cbaf266 100644
> > ---- a/libnpclient/Makefile.am
> > -+++ b/libnpclient/Makefile.am
> > -@@ -1,7 +1,7 @@
> > - AM_CFLAGS =3D @GCCWARN@
> > -
> > - AM_CPPFLAGS =3D \
> > --    -I../libnpfs
> > -+    -I$(srcdir)/../libnpfs
> > -
> > - noinst_LIBRARIES =3D libnpclient.a
> > -
> > -diff --git a/scripts/Makefile.am b/scripts/Makefile.am
> > -index 51c24a3..2aba728 100644
> > ---- a/scripts/Makefile.am
> > -+++ b/scripts/Makefile.am
> > -@@ -1,9 +1,9 @@
> > --systemddir=3D$(sysconfdir)/systemd/system
> > -+systemddir=3D/lib/systemd/system
> > -
> > - install-data-local:
> > --    $(top_srcdir)/config/install-sh -m 755 $(srcdir)/auto.diod \
> > -+    $(top_srcdir)/config/install-sh -m 755 ./auto.diod \
> > -             $(DESTDIR)$(sysconfdir)/auto.diod
> > --    $(top_srcdir)/config/install-sh -m 755 $(srcdir)/diod.service \
> > -+    $(top_srcdir)/config/install-sh -m 644 ./diod.service \
> > -             $(DESTDIR)$(systemddir)/diod.service
> > -
> > - uninstall-local:
> > -diff --git a/tests/kern/dbench/Makefile.am b/tests/kern/dbench/Makefil=
e.am
> > -index e0cdefa..1704f9f 100644
> > ---- a/tests/kern/dbench/Makefile.am
> > -+++ b/tests/kern/dbench/Makefile.am
> > -@@ -2,7 +2,7 @@ AM_CFLAGS =3D -w
> > -
> > - # VERSION=3D4.00
> > -
> > --AM_CPPFLAGS =3D -DDATADIR=3D\"$(X_DATADIR)\"
> > -+AM_CPPFLAGS =3D -I. -DDATADIR=3D\"$(X_DATADIR)\"
> > -
> > - LDADD =3D $(LIBPOPT)
> > -
> > -@@ -25,6 +25,6 @@ BUILT_SOURCES =3D proto.h
> > - CLEANFILES =3D proto.h
> > -
> > - proto.h: $(dbench_SOURCES) mkproto.pl
> > --    perl mkproto.pl $(dbench_SOURCES) > proto.h
> > -+    $(srcdir)/mkproto.pl $(patsubst %,$(srcdir),$(dbench_SOURCES)) > =
proto.h
> > -
> > - EXTRA_DIST =3D mkproto.pl
> > -diff --git a/utils/Makefile.am b/utils/Makefile.am
> > -index 169b6c4..91d571d 100644
> > ---- a/utils/Makefile.am
> > -+++ b/utils/Makefile.am
> > -@@ -1,7 +1,7 @@
> > - AM_CFLAGS =3D @GCCWARN@
> > -
> > - AM_CPPFLAGS =3D \
> > --    -I../libnpfs -I../liblsd -I../libdiod -I../libnpclient
> > -+    -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libdi=
od -I$(srcdir)/../libnpclient
> > -
> > - sbin_PROGRAMS =3D diodmount diodcat dtop diodload diodls diodshowmoun=
t dioddate
> > -
> > ---
> > -2.11.0
> > -
> > diff --git a/recipes-extended/diod/files/0001-diod-ops.c-add-header-fil=
e-for-makedev.patch b/recipes-extended/diod/files/0001-diod-ops.c-add-heade=
r-file-for-makedev.patch
> > deleted file mode 100644
> > index 49bc507b..00000000
> > --- a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-m=
akedev.patch
> > +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -From f75836731d6051d85e6317eb4c12465bafb4973e Mon Sep 17 00:00:00 2001
> > -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> > -Date: Fri, 31 Aug 2018 05:47:02 -0400
> > -Subject: [PATCH] diod/ops.c: add header file for makedev
> > -
> > -Error:
> > -diod/ops.c:845: undefined reference to `makedev'
> > -
> > -Fixed:
> > -Glibc removes sys/sysmacros.h which defines makedev from sys/types.h
> > -since v2.28. [Commit ID: e16deca62e16f]
> > -
> > -And then glibc suggestions us to include <sys/sysmacros.h> directly if
> > -code needs it.
> > -
> > -Upstream-Status: Submitted
> > -
> > -Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> > ----
> > - diod/ops.c | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/diod/ops.c b/diod/ops.c
> > -index c6c8291..469a502 100644
> > ---- a/diod/ops.c
> > -+++ b/diod/ops.c
> > -@@ -74,6 +74,7 @@
> > - #include <pthread.h>
> > - #include <errno.h>
> > - #include <sys/types.h>
> > -+#include <sys/sysmacros.h>
> > -
> > - #ifdef __FreeBSD__
> > - #if !__BSD_VISIBLE
> > ---
> > -2.8.1
> > -
> > diff --git a/recipes-extended/diod/files/0001-drod-add-option-to-config=
-systemddir.patch b/recipes-extended/diod/files/0001-drod-add-option-to-con=
fig-systemddir.patch
> > deleted file mode 100644
> > index 4931a19b..00000000
> > --- a/recipes-extended/diod/files/0001-drod-add-option-to-config-system=
ddir.patch
> > +++ /dev/null
> > @@ -1,51 +0,0 @@
> > -From 365159534b1981dfe291ecc05d2455f32652a166 Mon Sep 17 00:00:00 2001
> > -From: Changqing Li <changqing.li@windriver.com>
> > -Date: Mon, 26 Aug 2019 18:00:39 +0800
> > -Subject: [PATCH] drod: add option to config systemddir
> > -
> > -Not need to send upstream, since upstream have refactor
> > -related code, but not released. and this version release
> > -4 years ago, not proper to just backport one or more
> > -commits, this patch maybe could be dropped after upgrade.
> > -
> > -Upstream-Status: Inappropriate [embedded specific]
> > -
> > -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ----
> > - configure.ac        | 9 +++++++++
> > - scripts/Makefile.am | 2 +-
> > - 2 files changed, 10 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 1cb8579..3e4a5ec 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -25,6 +25,15 @@ AC_DEFINE([_GNU_SOURCE], 1,
> > -           [Define _GNU_SOURCE so that we get all necessary prototypes=
])
> > -
> > - ##
> > -+#Add option to config systemddir
> > -+##
> > -+AC_ARG_WITH([systemddir],
> > -+  [AS_HELP_STRING([--with-systemddir=3DDIR], [systemd dir])],
> > -+  [systemddir=3D$withval],
> > -+  [systemddir=3D"/lib/systemd/system"])
> > -+AC_SUBST([systemddir], [$systemddir])
> > -+
> > -+##
> > - # Checks for programs
> > - ##
> > - AC_PROG_CC
> > -diff --git a/scripts/Makefile.am b/scripts/Makefile.am
> > -index 2aba728..40822b7 100644
> > ---- a/scripts/Makefile.am
> > -+++ b/scripts/Makefile.am
> > -@@ -1,4 +1,4 @@
> > --systemddir=3D/lib/systemd/system
> > -+systemddir=3D@systemddir@
> > -
> > - install-data-local:
> > -     $(top_srcdir)/config/install-sh -m 755 ./auto.diod \
> > ---
> > -2.7.4
> > -
> > diff --git a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashi=
sms.patch b/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.p=
atch
> > deleted file mode 100644
> > index 13e0a86e..00000000
> > --- a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.pat=
ch
> > +++ /dev/null
> > @@ -1,47 +0,0 @@
> > -From 5a9e09dc5de833db11607530351cd87cecbfd17e Mon Sep 17 00:00:00 2001
> > -From: Roy Li <rongqing.li@windriver.com>
> > -Date: Thu, 22 Jun 2017 06:32:30 +0000
> > -Subject: [PATCH 2/2] auto.diod.in: remove bashisms
> > -
> > -Upstream-Status: Inappropriate [embedded specific]
> > -
> > -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > ----
> > - scripts/auto.diod.in | 14 +++++++-------
> > - 1 file changed, 7 insertions(+), 7 deletions(-)
> > -
> > -diff --git a/scripts/auto.diod.in b/scripts/auto.diod.in
> > -index f63e004..4d5fc3a 100755
> > ---- a/scripts/auto.diod.in
> > -+++ b/scripts/auto.diod.in
> > -@@ -1,4 +1,4 @@
> > --#!/bin/bash
> > -+#!/bin/sh
> > - #
> > - # auto.diod - executable automounter map for diod file systems
> > - #
> > -@@ -41,15 +41,15 @@ dcatopts=3D"${DIOD_TIMEOUT:+-t $DIOD_TIMEOUT}"
> > - for server in $DIOD_SERVERS; do
> > -     $DIOD_DIODCAT -s $server $dcatopts exports | awk '{print $1}' |\
> > -     while read path; do
> > --        if [ "$path" =3D=3D "/" ]; then
> > --            if [ "$key" =3D=3D "ROOT" ]; then
> > -+        if [ "$path" =3D "/" ]; then
> > -+            if [ "$key" =3D "ROOT" ]; then
> > -                 echo "$prefix $server:$path"
> > -                 exit 0
> > -             fi
> > --        elif [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//./=
g')" ] \
> > --          || [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//_/=
g')" ] \
> > --          || [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//-/=
g')" ] \
> > --          || [ "$key" =3D=3D "$(basename $path)" ]; then
> > -+        elif [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//./g')=
" ] \
> > -+          || [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//_/g')=
" ] \
> > -+          || [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//-/g')=
" ] \
> > -+          || [ "$key" =3D "$(basename $path)" ]; then
> > -             echo "$prefix $server:$path"
> > -             exit 0
> > -         fi
> > ---
> > -2.11.0
> > -
> > --
> > 2.39.2
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8630): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8630
> Mute This Topic: https://lists.yoctoproject.org/mt/104864596/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

