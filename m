Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16B9C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 12:37:00 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.61742.1710160615317899728
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 05:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KYZOMaw6;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so3787280a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 05:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710160615; x=1710765415; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjXEGKelTR+ww60xrYnKVUSCHpzhjBNXIT+CKSL1E08=;
        b=KYZOMaw6jT+K5ia0ay8zNkP+GIu0sUwBr/lBzexaQuoVwDel3D4dtaA9Co+1PxjRzr
         HykC3XcCXaktovEXb/YkznDF5yyAGyMPQLAXGUv/ipOzVQMOn6Y6VqG71zrF3dN/GWfv
         YEO+flp/kNrrWpCCYDrwTQtCnkIY/oAQIOMy0OmycM+LSNi0mJEjjvaSg63T83L25NVn
         m1bAWoxF++aecZFjIQplVblnSuHM3EbSy12+7/crTcF9FnG6UaFwW74BZ8OKUKJZpqpg
         4MbadnfE4SOsRnvbAw0B7vzAdNWFfu45YwRBmnO6W7nZrozY7Hgqnp+QBBvXWQyZv2q1
         m/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710160615; x=1710765415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjXEGKelTR+ww60xrYnKVUSCHpzhjBNXIT+CKSL1E08=;
        b=tmrDK8gm5B+ZzAQ1EoMcmHHwzYtu5RjqLzILdo7jlVR7gYPdWbrWNaakx4G1mgxLWQ
         xh59CdJ0XlkA4ZgMWeu8pSMQBccCqNRxggd9dfDqULEODvd3CA8Rkh2E9zwPi08Y9akC
         dAkVQqysGtPWalrvHYxfpB8CgBJtO69ytqsZf3W0mnQlcIle8XTeDS9dq+Mz2chA6QhF
         Uvo2Rgn8F/Y2ErROJo204MLuB6x6fDa+2tWyEEiyRvVbDClJ9QU2pTWqQ7rLW2MzXkmx
         TNrXeMXchLuSvuKzPoeLJ0nrBpR61lJGE5yqLvDmSYIr5X3QsbDkKFSsxw609HvMgbS9
         m4dw==
X-Gm-Message-State: AOJu0Yw2cYUWcSCUuCfaYAKJ3rRyqd2luUEsAl5GuA9A16yC5AEQw8/3
	uQuAOzraKXDKLVcXMYd7HkydhgnXy9ufjYJwC+G4E8ZVdGppuv4U2t4RdUgsCZj9oJ6wGK62/9v
	Xgc3TqR1MjsRJrx+kDXGO0zI68KpJE2Xs9hk=
X-Google-Smtp-Source: AGHT+IGn71Y1rHXkdJvyi/clRwseZlFl3+yLV42PkbyMk4QcMOwUnUhazj2N0P7fAOfd5nhpm4PWD4Cw6ocox+VfvfM=
X-Received: by 2002:a05:6a20:6a21:b0:1a3:14b5:cad7 with SMTP id
 p33-20020a056a206a2100b001a314b5cad7mr3599006pzk.27.1710160614454; Mon, 11
 Mar 2024 05:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240311122435.1480985-1-olani@axis.com>
In-Reply-To: <20240311122435.1480985-1-olani@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2024 08:36:43 -0400
Message-ID: <CADkTA4N+WcqAx9ofBHR+Mn=8fcFGb=O112qRPdqfNmEnJCxd8A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] diod: Update to b4b5e8e00ed11b21d7fcf05a080dc054a8eac2d6
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org, Ola x Nilsson <olani@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 12:37:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8621

On Mon, Mar 11, 2024 at 8:24=E2=80=AFAM Ola x Nilsson <ola.x.nilsson@axis.c=
om> wrote:
>
> Just needs a single patch to handle the lua feature in configure when
> cross-compiling.
>

This needs a listing of the changes between the two SRCREVs.

I haven't gotten around to updating diod for the release, so I'll consider
this once ceph is working again, but for now, it will probably wait until
my round of package bumps post release.

Bruce

> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  recipes-extended/diod/diod_1.0.24.bb          |  13 +-
>  .../0001-build-Find-lua-with-pkg-config.patch |  50 +++++++
>  ...ilds-to-work-with-separate-build-dir.patch | 126 ------------------
>  ...od-ops.c-add-header-file-for-makedev.patch |  37 -----
>  ...drod-add-option-to-config-systemddir.patch |  51 -------
>  .../0002-auto.diod.in-remove-bashisms.patch   |  47 -------
>  6 files changed, 55 insertions(+), 269 deletions(-)
>  create mode 100644 recipes-extended/diod/files/0001-build-Find-lua-with-=
pkg-config.patch
>  delete mode 100644 recipes-extended/diod/files/0001-build-allow-builds-t=
o-work-with-separate-build-dir.patch
>  delete mode 100644 recipes-extended/diod/files/0001-diod-ops.c-add-heade=
r-file-for-makedev.patch
>  delete mode 100644 recipes-extended/diod/files/0001-drod-add-option-to-c=
onfig-systemddir.patch
>  delete mode 100644 recipes-extended/diod/files/0002-auto.diod.in-remove-=
bashisms.patch
>
> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod=
/diod_1.0.24.bb
> index 2b87a8ae..5e191dc0 100644
> --- a/recipes-extended/diod/diod_1.0.24.bb
> +++ b/recipes-extended/diod/diod_1.0.24.bb
> @@ -9,22 +9,19 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
>
>  PV =3D "1.0.24+git"
> -SRCREV =3D "0ea3fe3d829b5085307cd27a512708d99ef48199"
> +SRCREV =3D "b4b5e8e00ed11b21d7fcf05a080dc054a8eac2d6"
>  SRC_URI =3D "git://github.com/chaos/diod.git;protocol=3Dhttps;branch=3Dm=
aster \
>             file://diod \
>             file://diod.conf \
> -           file://0001-build-allow-builds-to-work-with-separate-build-di=
r.patch \
> -           file://0002-auto.diod.in-remove-bashisms.patch \
> -           file://0001-diod-ops.c-add-header-file-for-makedev.patch \
> -           file://0001-drod-add-option-to-config-systemddir.patch \
> -          "
> +           file://0001-build-Find-lua-with-pkg-config.patch \
> +           "
>  DEPENDS =3D "libcap ncurses tcp-wrappers lua"
>
> -EXTRA_OECONF =3D "--with-systemddir=3D${systemd_unitdir}/system"
> +EXTRA_OEMAKE +=3D "systemddir=3D${systemd_unitdir}/system"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools systemd
> +inherit autotools pkgconfig systemd
>
>  do_install:append () {
>          # install our init based on start-stop-daemon
> diff --git a/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-con=
fig.patch b/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-config=
.patch
> new file mode 100644
> index 00000000..9f61792a
> --- /dev/null
> +++ b/recipes-extended/diod/files/0001-build-Find-lua-with-pkg-config.pat=
ch
> @@ -0,0 +1,50 @@
> +From 8124eec4e59222f1c3f3dc4d7e6706e13c33755c Mon Sep 17 00:00:00 2001
> +From: Ola x Nilsson <olani@axis.com>
> +Date: Wed, 6 Mar 2024 18:40:16 +0100
> +Subject: [PATCH] build: Find lua with pkg-config
> +
> +ax_lua.m4 does not support cross compilation.
> +
> +Upstream-Status: Inappropriate (Embedded specific)
> +
> +---
> + configure.ac | 26 +++++++++++++++++++++++++-
> + 1 file changed, 25 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index e8fcdb2..f3ebdc5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -121,7 +121,31 @@ AC_ARG_ENABLE([config],
> +   [AS_HELP_STRING([--disable-config], [disable lua config file support]=
)])
> +
> + AS_IF([test "x$enable_config" !=3D "xno"], [
> +-  AX_PROG_LUA([5.1],[5.5])
> ++  dnl Use pkg_config to check for lua settings.  This is not standard
> ++  dnl as lua typically does not distribute a pc file.  The
> ++  dnl OpenEmbedded recipe adds one that can be used.  Reuse/replicate
> ++  dnl as much of AX_PROG_LUA as possible so AX_LUA_HEADERS and
> ++  dnl AX_LUA_LIBS are still usable.
> ++  PKG_CHECK_EXISTS([lua], [
> ++    AS_IF([
> ++      $PKG_CONFIG --atleast-version=3D5.1 lua && $PKG_CONFIG --max-vers=
ion=3D5.5 lua
> ++    ],[
> ++      AC_ARG_VAR([LUA], [The LUA interpreter, e.g. /usr/bin/lua5.1])
> ++        dnl should really check that the file exists ...
> ++      AC_SUBST([LUA], [${bindir}/lua])
> ++        AC_CACHE_CHECK([for $LUA version], [ax_cv_lua_version], [
> ++          ax_cv_lua_version=3D[`$PKG_CONFIG --modversion lua | $SED 's/=
^\([0-9]\+\.[0-9]\+\).*/\1/'`]
> ++      ])
> ++        AS_IF([test "x$ax_cv_lua_version" =3D 'x'],
> ++       [AC_MSG_ERROR([invalid Lua version number])])
> ++      AC_SUBST([LUA_VERSION], [$ax_cv_lua_version])
> ++      AC_SUBST([LUA_SHORT_VERSION], [`echo "$LUA_VERSION" | $SED 's|\.|=
|'`])
> ++    ],[
> ++        AC_MSG_ERROR([Incorrect lua version])
> ++      ])
> ++  ],[
> ++    AX_PROG_LUA([5.1],[5.5])
> ++  ])
> +   AX_LUA_HEADERS([],[
> +     AC_MSG_ERROR([Install lua headers or configure with --disable-confi=
g])
> +   ])
> diff --git a/recipes-extended/diod/files/0001-build-allow-builds-to-work-=
with-separate-build-dir.patch b/recipes-extended/diod/files/0001-build-allo=
w-builds-to-work-with-separate-build-dir.patch
> deleted file mode 100644
> index f40e0eb5..00000000
> --- a/recipes-extended/diod/files/0001-build-allow-builds-to-work-with-se=
parate-build-dir.patch
> +++ /dev/null
> @@ -1,126 +0,0 @@
> -From 43403468298ef4167baa5d84de2ee2eaf7f4007a Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Fri, 9 Jan 2015 18:34:04 +0000
> -Subject: [PATCH 1/2] build: allow builds to work with separate build dir
> -
> -Remove assumptions in include paths that assume the build
> -is happening in the source directories.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ----
> - diod/Makefile.am              | 2 +-
> - libdiod/Makefile.am           | 2 +-
> - liblsd/Makefile.am            | 2 +-
> - libnpclient/Makefile.am       | 2 +-
> - scripts/Makefile.am           | 6 +++---
> - tests/kern/dbench/Makefile.am | 4 ++--
> - utils/Makefile.am             | 2 +-
> - 7 files changed, 10 insertions(+), 10 deletions(-)
> -
> -diff --git a/diod/Makefile.am b/diod/Makefile.am
> -index 7644be7..fdaf130 100644
> ---- a/diod/Makefile.am
> -+++ b/diod/Makefile.am
> -@@ -1,7 +1,7 @@
> - AM_CFLAGS =3D @GCCWARN@
> -
> - AM_CPPFLAGS =3D \
> --      -I../libnpfs -I../liblsd -I../libdiod
> -+      -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libdi=
od
> -
> - sbin_PROGRAMS =3D diod
> -
> -diff --git a/libdiod/Makefile.am b/libdiod/Makefile.am
> -index 4810e14..6905cdd 100644
> ---- a/libdiod/Makefile.am
> -+++ b/libdiod/Makefile.am
> -@@ -1,7 +1,7 @@
> - AM_CFLAGS =3D @GCCWARN@
> -
> - AM_CPPFLAGS =3D \
> --      -I../libnpfs -I../libnpclient -I../liblsd
> -+      -I$(srcdir)/../libnpfs -I$(srcdir)/../libnpclient -I$(srcdir)/../=
liblsd
> -
> - noinst_LIBRARIES =3D libdiod.a
> -
> -diff --git a/liblsd/Makefile.am b/liblsd/Makefile.am
> -index c3e5658..7e18bf8 100644
> ---- a/liblsd/Makefile.am
> -+++ b/liblsd/Makefile.am
> -@@ -1,6 +1,6 @@
> - AM_CFLAGS =3D @GCCWARN@
> -
> --AM_CPPFLAGS =3D -I../libdiod
> -+AM_CPPFLAGS =3D -I$(srcdir)/../libdiod
> -
> - noinst_LIBRARIES =3D liblsd.a
> -
> -diff --git a/libnpclient/Makefile.am b/libnpclient/Makefile.am
> -index 5305df9..cbaf266 100644
> ---- a/libnpclient/Makefile.am
> -+++ b/libnpclient/Makefile.am
> -@@ -1,7 +1,7 @@
> - AM_CFLAGS =3D @GCCWARN@
> -
> - AM_CPPFLAGS =3D \
> --      -I../libnpfs
> -+      -I$(srcdir)/../libnpfs
> -
> - noinst_LIBRARIES =3D libnpclient.a
> -
> -diff --git a/scripts/Makefile.am b/scripts/Makefile.am
> -index 51c24a3..2aba728 100644
> ---- a/scripts/Makefile.am
> -+++ b/scripts/Makefile.am
> -@@ -1,9 +1,9 @@
> --systemddir=3D$(sysconfdir)/systemd/system
> -+systemddir=3D/lib/systemd/system
> -
> - install-data-local:
> --      $(top_srcdir)/config/install-sh -m 755 $(srcdir)/auto.diod \
> -+      $(top_srcdir)/config/install-sh -m 755 ./auto.diod \
> -               $(DESTDIR)$(sysconfdir)/auto.diod
> --      $(top_srcdir)/config/install-sh -m 755 $(srcdir)/diod.service \
> -+      $(top_srcdir)/config/install-sh -m 644 ./diod.service \
> -               $(DESTDIR)$(systemddir)/diod.service
> -
> - uninstall-local:
> -diff --git a/tests/kern/dbench/Makefile.am b/tests/kern/dbench/Makefile.=
am
> -index e0cdefa..1704f9f 100644
> ---- a/tests/kern/dbench/Makefile.am
> -+++ b/tests/kern/dbench/Makefile.am
> -@@ -2,7 +2,7 @@ AM_CFLAGS =3D -w
> -
> - # VERSION=3D4.00
> -
> --AM_CPPFLAGS =3D -DDATADIR=3D\"$(X_DATADIR)\"
> -+AM_CPPFLAGS =3D -I. -DDATADIR=3D\"$(X_DATADIR)\"
> -
> - LDADD =3D $(LIBPOPT)
> -
> -@@ -25,6 +25,6 @@ BUILT_SOURCES =3D proto.h
> - CLEANFILES =3D proto.h
> -
> - proto.h: $(dbench_SOURCES) mkproto.pl
> --      perl mkproto.pl $(dbench_SOURCES) > proto.h
> -+      $(srcdir)/mkproto.pl $(patsubst %,$(srcdir),$(dbench_SOURCES)) > =
proto.h
> -
> - EXTRA_DIST =3D mkproto.pl
> -diff --git a/utils/Makefile.am b/utils/Makefile.am
> -index 169b6c4..91d571d 100644
> ---- a/utils/Makefile.am
> -+++ b/utils/Makefile.am
> -@@ -1,7 +1,7 @@
> - AM_CFLAGS =3D @GCCWARN@
> -
> - AM_CPPFLAGS =3D \
> --      -I../libnpfs -I../liblsd -I../libdiod -I../libnpclient
> -+      -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libdi=
od -I$(srcdir)/../libnpclient
> -
> - sbin_PROGRAMS =3D diodmount diodcat dtop diodload diodls diodshowmount =
dioddate
> -
> ---
> -2.11.0
> -
> diff --git a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-=
for-makedev.patch b/recipes-extended/diod/files/0001-diod-ops.c-add-header-=
file-for-makedev.patch
> deleted file mode 100644
> index 49bc507b..00000000
> --- a/recipes-extended/diod/files/0001-diod-ops.c-add-header-file-for-mak=
edev.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From f75836731d6051d85e6317eb4c12465bafb4973e Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> -Date: Fri, 31 Aug 2018 05:47:02 -0400
> -Subject: [PATCH] diod/ops.c: add header file for makedev
> -
> -Error:
> -diod/ops.c:845: undefined reference to `makedev'
> -
> -Fixed:
> -Glibc removes sys/sysmacros.h which defines makedev from sys/types.h
> -since v2.28. [Commit ID: e16deca62e16f]
> -
> -And then glibc suggestions us to include <sys/sysmacros.h> directly if
> -code needs it.
> -
> -Upstream-Status: Submitted
> -
> -Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ----
> - diod/ops.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/diod/ops.c b/diod/ops.c
> -index c6c8291..469a502 100644
> ---- a/diod/ops.c
> -+++ b/diod/ops.c
> -@@ -74,6 +74,7 @@
> - #include <pthread.h>
> - #include <errno.h>
> - #include <sys/types.h>
> -+#include <sys/sysmacros.h>
> -
> - #ifdef __FreeBSD__
> - #if !__BSD_VISIBLE
> ---
> -2.8.1
> -
> diff --git a/recipes-extended/diod/files/0001-drod-add-option-to-config-s=
ystemddir.patch b/recipes-extended/diod/files/0001-drod-add-option-to-confi=
g-systemddir.patch
> deleted file mode 100644
> index 4931a19b..00000000
> --- a/recipes-extended/diod/files/0001-drod-add-option-to-config-systemdd=
ir.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 365159534b1981dfe291ecc05d2455f32652a166 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 26 Aug 2019 18:00:39 +0800
> -Subject: [PATCH] drod: add option to config systemddir
> -
> -Not need to send upstream, since upstream have refactor
> -related code, but not released. and this version release
> -4 years ago, not proper to just backport one or more
> -commits, this patch maybe could be dropped after upgrade.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - configure.ac        | 9 +++++++++
> - scripts/Makefile.am | 2 +-
> - 2 files changed, 10 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 1cb8579..3e4a5ec 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -25,6 +25,15 @@ AC_DEFINE([_GNU_SOURCE], 1,
> -           [Define _GNU_SOURCE so that we get all necessary prototypes])
> -
> - ##
> -+#Add option to config systemddir
> -+##
> -+AC_ARG_WITH([systemddir],
> -+  [AS_HELP_STRING([--with-systemddir=3DDIR], [systemd dir])],
> -+  [systemddir=3D$withval],
> -+  [systemddir=3D"/lib/systemd/system"])
> -+AC_SUBST([systemddir], [$systemddir])
> -+
> -+##
> - # Checks for programs
> - ##
> - AC_PROG_CC
> -diff --git a/scripts/Makefile.am b/scripts/Makefile.am
> -index 2aba728..40822b7 100644
> ---- a/scripts/Makefile.am
> -+++ b/scripts/Makefile.am
> -@@ -1,4 +1,4 @@
> --systemddir=3D/lib/systemd/system
> -+systemddir=3D@systemddir@
> -
> - install-data-local:
> -       $(top_srcdir)/config/install-sh -m 755 ./auto.diod \
> ---
> -2.7.4
> -
> diff --git a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashism=
s.patch b/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.pat=
ch
> deleted file mode 100644
> index 13e0a86e..00000000
> --- a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 5a9e09dc5de833db11607530351cd87cecbfd17e Mon Sep 17 00:00:00 2001
> -From: Roy Li <rongqing.li@windriver.com>
> -Date: Thu, 22 Jun 2017 06:32:30 +0000
> -Subject: [PATCH 2/2] auto.diod.in: remove bashisms
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - scripts/auto.diod.in | 14 +++++++-------
> - 1 file changed, 7 insertions(+), 7 deletions(-)
> -
> -diff --git a/scripts/auto.diod.in b/scripts/auto.diod.in
> -index f63e004..4d5fc3a 100755
> ---- a/scripts/auto.diod.in
> -+++ b/scripts/auto.diod.in
> -@@ -1,4 +1,4 @@
> --#!/bin/bash
> -+#!/bin/sh
> - #
> - # auto.diod - executable automounter map for diod file systems
> - #
> -@@ -41,15 +41,15 @@ dcatopts=3D"${DIOD_TIMEOUT:+-t $DIOD_TIMEOUT}"
> - for server in $DIOD_SERVERS; do
> -     $DIOD_DIODCAT -s $server $dcatopts exports | awk '{print $1}' |\
> -     while read path; do
> --        if [ "$path" =3D=3D "/" ]; then
> --            if [ "$key" =3D=3D "ROOT" ]; then
> -+        if [ "$path" =3D "/" ]; then
> -+            if [ "$key" =3D "ROOT" ]; then
> -                 echo "$prefix $server:$path"
> -                 exit 0
> -             fi
> --        elif [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//./g'=
)" ] \
> --          || [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//_/g'=
)" ] \
> --          || [ "$key" =3D=3D "$(echo $path|sed -e's/^\///' -e's/\//-/g'=
)" ] \
> --          || [ "$key" =3D=3D "$(basename $path)" ]; then
> -+        elif [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//./g')" =
] \
> -+          || [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//_/g')" =
] \
> -+          || [ "$key" =3D "$(echo $path|sed -e's/^\///' -e's/\//-/g')" =
] \
> -+          || [ "$key" =3D "$(basename $path)" ]; then
> -             echo "$prefix $server:$path"
> -             exit 0
> -         fi
> ---
> -2.11.0
> -
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8619): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8619
> Mute This Topic: https://lists.yoctoproject.org/mt/104861806/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

