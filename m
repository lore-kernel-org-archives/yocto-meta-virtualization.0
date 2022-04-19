Return-Path: <michal.orzel@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D79BC4707F
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2137.1650359248458065834
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 02:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michal.orzel@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F01913D5;
	Tue, 19 Apr 2022 02:07:28 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.11.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72BCA3F5A1;
	Tue, 19 Apr 2022 02:07:26 -0700 (PDT)
From: Michal Orzel <michal.orzel@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org,
	bertrand.marquis@arm.com,
	nd@arm.com
Subject: [PATCH v2 3/3] xen: Remove 4.14 recipes and related patches
Date: Tue, 19 Apr 2022 11:07:13 +0200
Message-Id: <20220419090713.134057-4-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419090713.134057-1-michal.orzel@arm.com>
References: <20220419090713.134057-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7191

We shall only have recipes for the last two stable releases, thus
get rid of the 4.14 recipes and the corresponding patches.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
-none
---
 ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ------------------
 ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch |  66 -------
 ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 --------
 recipes-extended/xen/xen-tools_4.14.bb        |  21 ---
 recipes-extended/xen/xen_4.14.bb              |  19 --
 5 files changed, 367 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-st=
and-alone-set-of-headers-Xen-4.14.patch
 delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DI=
STUTILS-xen-4.14.patch
 delete mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-=
firmware-as-ffreestanding-Xen-4.14.patch
 delete mode 100644 recipes-extended/xen/xen-tools_4.14.bb
 delete mode 100644 recipes-extended/xen/xen_4.14.bb

diff --git a/recipes-extended/xen/files/0001-firmware-provide-a-stand-alo=
ne-set-of-headers-Xen-4.14.patch b/recipes-extended/xen/files/0001-firmwa=
re-provide-a-stand-alone-set-of-headers-Xen-4.14.patch
deleted file mode 100644
index 7b062b7..0000000
--- a/recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-=
of-headers-Xen-4.14.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From 73b13705af7c3bb8fdf11932eb68788d090a443f Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Roger=3D20Pau=3D20Monn=3DC3=3DA9?=3D <roger.pau@citrix=
.com>
-Date: Thu, 4 Mar 2021 16:49:00 +0100
-Subject: [PATCH] firmware: provide a stand alone set of headers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-The current build of the firmware relies on having 32bit compatible
-headers installed in order to build some of the 32bit firmware.
-Usually this can be solved by using the -ffreestanding compiler option
-which drops the usage of the system headers in favor of a private set
-of freestanding headers provided by the compiler itself that are not
-tied to libc.
-
-However such option is broken at least in the gcc compiler provided in
-Alpine Linux, as the system include path (ie: /usr/include) takes
-precedence over the gcc private include path:
-
-#include <...> search starts here:
- /usr/include
- /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
-
-And the headers in /usr/include are exclusively 64bit.
-
-Since -ffreestanding is currently broken on at least that distro, and
-for resilience against future compilers also having the option broken
-provide a set of stand alone 32bit headers required for the firmware
-build.
-
-Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
-Reviewed-by: Jan Beulich <jbeulich@suse.com>
-Release-Acked-by: Ian Jackson <iwj@xenproject.org>
-Applied to Xen 4.14 by: Christopher Clark <christopher.w.clark@gmail.com=
>
----
- tools/firmware/Rules.mk                       | 13 +++++++
- tools/firmware/include/stdarg.h               | 10 +++++
- tools/firmware/include/stdbool.h              |  9 +++++
- tools/firmware/include/stddef.h               | 10 +++++
- tools/firmware/include/stdint.h               | 39 +++++++++++++++++++
- tools/firmware/rombios/32bit/rombios_compat.h |  4 +-
- 6 files changed, 82 insertions(+), 3 deletions(-)
- create mode 100644 tools/firmware/include/stdarg.h
- create mode 100644 tools/firmware/include/stdbool.h
- create mode 100644 tools/firmware/include/stddef.h
- create mode 100644 tools/firmware/include/stdint.h
-
-diff --git a/tools/firmware/include/stdarg.h b/tools/firmware/include/st=
darg.h
-new file mode 100644
-index 0000000000..c5e3761cd2
---- /dev/null
-+++ b/tools/firmware/include/stdarg.h
-@@ -0,0 +1,10 @@
-+#ifndef _STDARG_H_
-+#define _STDARG_H_
-+
-+typedef __builtin_va_list va_list;
-+#define va_copy(dest, src) __builtin_va_copy(dest, src)
-+#define va_start(ap, last) __builtin_va_start(ap, last)
-+#define va_end(ap) __builtin_va_end(ap)
-+#define va_arg __builtin_va_arg
-+
-+#endif
-diff --git a/tools/firmware/include/stdbool.h b/tools/firmware/include/s=
tdbool.h
-new file mode 100644
-index 0000000000..0cf76b106c
---- /dev/null
-+++ b/tools/firmware/include/stdbool.h
-@@ -0,0 +1,9 @@
-+#ifndef _STDBOOL_H_
-+#define _STDBOOL_H_
-+
-+#define bool _Bool
-+#define true 1
-+#define false 0
-+#define __bool_true_false_are_defined 1
-+
-+#endif
-diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/st=
ddef.h
-new file mode 100644
-index 0000000000..c7f974608a
---- /dev/null
-+++ b/tools/firmware/include/stddef.h
-@@ -0,0 +1,10 @@
-+#ifndef _STDDEF_H_
-+#define _STDDEF_H_
-+
-+typedef __SIZE_TYPE__ size_t;
-+
-+#define NULL ((void*)0)
-+
-+#define offsetof(t, m) __builtin_offsetof(t, m)
-+
-+#endif
-diff --git a/tools/firmware/include/stdint.h b/tools/firmware/include/st=
dint.h
-new file mode 100644
-index 0000000000..16a0b6de19
---- /dev/null
-+++ b/tools/firmware/include/stdint.h
-@@ -0,0 +1,39 @@
-+#ifndef _STDINT_H_
-+#define _STDINT_H_
-+
-+#if defined(__LP64__) || defined(__P64__)
-+#error "32bit only header"
-+#endif
-+
-+typedef unsigned char uint8_t;
-+typedef signed char int8_t;
-+
-+typedef unsigned short uint16_t;
-+typedef signed short int16_t;
-+
-+typedef unsigned int uint32_t;
-+typedef signed int int32_t;
-+
-+typedef unsigned long long uint64_t;
-+typedef signed long long int64_t;
-+
-+#define INT8_MIN        (-0x7f-1)
-+#define INT16_MIN       (-0x7fff-1)
-+#define INT32_MIN       (-0x7fffffff-1)
-+#define INT64_MIN       (-0x7fffffffffffffffll-1)
-+
-+#define INT8_MAX        0x7f
-+#define INT16_MAX       0x7fff
-+#define INT32_MAX       0x7fffffff
-+#define INT64_MAX       0x7fffffffffffffffll
-+
-+#define UINT8_MAX       0xff
-+#define UINT16_MAX      0xffff
-+#define UINT32_MAX      0xffffffffu
-+#define UINT64_MAX      0xffffffffffffffffull
-+
-+typedef uint32_t uintptr_t;
-+
-+#define UINTPTR_MAX     UINT32_MAX
-+
-+#endif
-diff --git a/tools/firmware/rombios/32bit/rombios_compat.h b/tools/firmw=
are/rombios/32bit/rombios_compat.h
-index 3fe7d67721..8ba4c17ffd 100644
---- a/tools/firmware/rombios/32bit/rombios_compat.h
-+++ b/tools/firmware/rombios/32bit/rombios_compat.h
-@@ -8,9 +8,7 @@
-=20
- #define ADDR_FROM_SEG_OFF(seg, off)  (void *)((((uint32_t)(seg)) << 4) =
+ (off))
-=20
--typedef unsigned char uint8_t;
--typedef unsigned short int uint16_t;
--typedef unsigned int uint32_t;
-+#include <stdint.h>
-=20
- typedef uint8_t  Bit8u;
- typedef uint16_t Bit16u;
-diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
-index 26bbddccd4..cb388b7011 100644
---- a/tools/firmware/Rules.mk
-+++ b/tools/firmware/Rules.mk
-@@ -17,3 +17,16 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLA=
GS))
-=20
- # Extra CFLAGS suitable for an embedded type of environment.
- CFLAGS +=3D -fno-builtin -msoft-float
-+
-+# Use our own set of stand alone headers to build firmware.
-+#
-+# Ideally using -ffreestanding should be enough, but that relies on the
-+# compiler having the right order for include paths (ie: compiler priva=
te
-+# headers before system ones) or the libc headers having proper arch-ag=
nostic
-+# freestanding support. This is not the case in Alpine at least which s=
earches
-+# system headers before compiler ones and has arch-specific libc header=
s. This
-+# has been reported upstream:
-+# https://gitlab.alpinelinux.org/alpine/aports/-/issues/12477
-+# In the meantime (and for resilience against broken systems) use our o=
wn set
-+# of headers that provide what's needed for the firmware build.
-+CFLAGS +=3D -nostdinc -I$(XEN_ROOT)/tools/firmware/include
---=20
-2.25.1
-
diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS=
-xen-4.14.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DIST=
UTILS-xen-4.14.patch
deleted file mode 100644
index f0688fd..0000000
--- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.=
14.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 2001
-From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
-Date: Fri, 19 Oct 2018 11:01:37 +0200
-Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py args
-
-Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
-as well as other parameters set by the OpenEmbedded build system.
-This is especially useful when the target libdir is not the default one
-(/usr/lib), but for example /usr/lib64.
-
-Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
-
-Forward-ported to Xen 4.12.0
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-
-Modified to support pygrub installation with python 3
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-
-Forward-ported to Xen 4.14.0
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
-index 3063c49..513314b 100644
---- a/tools/pygrub/Makefile
-+++ b/tools/pygrub/Makefile
-@@ -10,14 +10,17 @@ INSTALL_LOG =3D build/installed_files.txt
- all: build
- .PHONY: build
- build:
--	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHO=
N) setup.py build
-+	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHO=
N) setup.py build $(DISTUTILS_BUILD_ARGS)
-=20
- .PHONY: install
- install: all
- 	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
- 	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHO=
N) \
- 		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
--		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
-+		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force \
-+		 $(DISTUTILS_INSTALL_ARGS)
-+	rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
-+	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
- 	set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
- 	             "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
- 	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
-diff --git a/tools/python/Makefile b/tools/python/Makefile
-index 541858e..4d4a344 100644
---- a/tools/python/Makefile
-+++ b/tools/python/Makefile
-@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
-=20
- .PHONY: build
- build:
--	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build
-+	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build $(DISTUT=
ILS_BUILD_ARGS)
-=20
- .PHONY: install
- install:
-@@ -18,7 +18,7 @@ install:
-=20
- 	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHO=
N) \
- 		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
--		--root=3D"$(DESTDIR)" --force
-+		--root=3D"$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
-=20
- 	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEX=
EC_BIN)
- 	$(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BI=
N)
diff --git a/recipes-extended/xen/files/0001-tools-firmware-Build-firmwar=
e-as-ffreestanding-Xen-4.14.patch b/recipes-extended/xen/files/0001-tools=
-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch
deleted file mode 100644
index 001b196..0000000
--- a/recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ff=
reestanding-Xen-4.14.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 0eae016b6e3dce69e3fb86aca5c4f221591a2f12 Mon Sep 17 00:00:00 2001
-From: Andrew Cooper <andrew.cooper3@citrix.com>
-Date: Thu, 25 Feb 2021 19:15:08 +0000
-Subject: [PATCH] tools/firmware: Build firmware as -ffreestanding
-
-firmware should always have been -ffreestanding, as it doesn't execute i=
n the
-host environment.  -ffreestanding implies -fno-builtin, so replace the o=
ption.
-
-inttypes.h isn't a freestanding header, but the 32bitbios_support.c only=
 wants
-the stdint.h types so switch to the more appropriate include.
-
-This removes the build time dependency on a 32bit libc just to compile t=
he
-hvmloader and friends.
-
-Update README and the TravisCI configuration.
-
-Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
-Reviewed-by: Jan Beulich <jbeulich@suse.com>
-Reviewed-by: Ian Jackson <iwj@xenproject.org>
-Release-Acked-by: Ian Jackson <iwj@xenproject.org>
-Applied to m-v Xen 4.14 series: Christopher Clark <christopher.w.clark@g=
mail.com>
----
- .travis.yml                                  | 1 -
- README                                       | 3 ---
- tools/firmware/Rules.mk                      | 2 +-
- tools/firmware/hvmloader/32bitbios_support.c | 2 +-
- 4 files changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/.travis.yml b/.travis.yml
-index 15ca9e9047..2362475f7a 100644
---- a/.travis.yml
-+++ b/.travis.yml
-@@ -58,7 +58,6 @@ addons:
-             - acpica-tools
-             - bin86
-             - bcc
--            - libc6-dev-i386
-             - libnl-3-dev
-             - ocaml-nox
-             - libfindlib-ocaml-dev
-diff --git a/README b/README
-index 6e15242ae1..8c99c30986 100644
---- a/README
-+++ b/README
-@@ -62,9 +62,6 @@ provided by your OS distributor:
-     * GNU bison and GNU flex
-     * GNU gettext
-     * ACPI ASL compiler (iasl)
--    * Libc multiarch package (e.g. libc6-dev-i386 / glibc-devel.i686).
--      Required when building on a 64-bit platform to build
--      32-bit components which are enabled on a default build.
-=20
- In addition to the above there are a number of optional build
- prerequisites. Omitting these will cause the related features to be
-diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
-index cb388b7011..9f78a7dec9 100644
---- a/tools/firmware/Rules.mk
-+++ b/tools/firmware/Rules.mk
-@@ -16,7 +16,7 @@ CFLAGS +=3D -Werror
- $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
-=20
- # Extra CFLAGS suitable for an embedded type of environment.
--CFLAGS +=3D -fno-builtin -msoft-float
-+CFLAGS +=3D -ffreestanding -msoft-float
-=20
- # Use our own set of stand alone headers to build firmware.
- #
-diff --git a/tools/firmware/hvmloader/32bitbios_support.c b/tools/firmwa=
re/hvmloader/32bitbios_support.c
-index 114135022e..ef681d4f57 100644
---- a/tools/firmware/hvmloader/32bitbios_support.c
-+++ b/tools/firmware/hvmloader/32bitbios_support.c
-@@ -20,7 +20,7 @@
-  * this program; If not, see <http://www.gnu.org/licenses/>.
-  */
-=20
--#include <inttypes.h>
-+#include <stdint.h>
- #include <elf.h>
- #ifdef __sun__
- #include <sys/machelf.h>
---=20
-2.25.1
-
diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xe=
n/xen-tools_4.14.bb
deleted file mode 100644
index 9d78e44..0000000
--- a/recipes-extended/xen/xen-tools_4.14.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-# 4.14.3 release SHA
-SRCREV ?=3D "9f2b6c5ec2ded4c1caf149743e862c5f15d6d083"
-
-XEN_REL ?=3D "4.14"
-XEN_BRANCH ?=3D "stable-${XEN_REL}"
-
-SRC_URI =3D " \
-    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
-    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
-    file://0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.p=
atch \
-    file://0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.=
patch \
-    "
-
-LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
-
-PV =3D "${XEN_REL}+stable${SRCPV}"
-
-S =3D "${WORKDIR}/git"
-
-require xen.inc
-require xen-tools.inc
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_=
4.14.bb
deleted file mode 100644
index 267db16..0000000
--- a/recipes-extended/xen/xen_4.14.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# 4.14.3 release SHA
-SRCREV ?=3D "9f2b6c5ec2ded4c1caf149743e862c5f15d6d083"
-
-XEN_REL ?=3D "4.14"
-XEN_BRANCH ?=3D "stable-${XEN_REL}"
-
-SRC_URI =3D " \
-    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
-    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-loca=
tion.patch \
-    "
-
-LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
-
-PV =3D "${XEN_REL}+stable${SRCPV}"
-
-S =3D "${WORKDIR}/git"
-
-require xen.inc
-require xen-hypervisor.inc
--=20
2.25.1


