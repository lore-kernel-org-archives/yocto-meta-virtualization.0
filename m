Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6411.1624963867882964176
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 03:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EA25106F
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jun 2021 03:51:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19A123F694
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jun 2021 03:51:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 2/2] dev86: don't require dev86-native to build dev86
Date: Tue, 29 Jun 2021 11:51:04 +0100
Message-Id: <20210629105104.3692000-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629105104.3692000-1-ross.burton@arm.com>
References: <20210629105104.3692000-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of installing binaries and patching the makefiles to run external=
 commands, simply
build ifdef using BUILD_CC instead of CC.

This patch is now upstreamable, the recipe is less complicated, and nativ=
esdk works.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...efg-from-dev86-native-instead-of-tar.patch | 36 -------------------
 recipes-extended/dev86/dev86/cross.patch      | 29 +++++++++++++++
 recipes-extended/dev86/dev86_git.bb           | 12 ++-----
 3 files changed, 32 insertions(+), 45 deletions(-)
 delete mode 100644 recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg=
-from-dev86-native-instead-of-tar.patch
 create mode 100644 recipes-extended/dev86/dev86/cross.patch

diff --git a/recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-d=
ev86-native-instead-of-tar.patch b/recipes-extended/dev86/dev86/0002-Make=
file-use-ifdefg-from-dev86-native-instead-of-tar.patch
deleted file mode 100644
index 52d5d59..0000000
--- a/recipes-extended/dev86/dev86/0002-Makefile-use-ifdefg-from-dev86-na=
tive-instead-of-tar.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9b347a5ee9604d4ec972506328ee44a0d8eb1bf0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 14 May 2021 06:32:02 -0700
-Subject: [PATCH] Makefile: use ifdefg from dev86-native instead of targe=
t
-
-* recipe is restricted to:
-  COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
-  so it's less likely to reproduce invalid combination of
-  host and target, but I guess if you have aarch64 build
-  machine and build for x86 then it might fail as for Bruce:
-
-| ./ifdefg -MU  makefile.in >tmp.mak
-| /bin/sh: 1: ./ifdefg: not found
-| make[1]: *** [Makefile:46: make.fil] Error 127
-
-  use ifdefg from native build to increase chances that it
-  will be compatible with your host system
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 8a61b65..7fdf861 100644
---- a/Makefile
-+++ b/Makefile
-@@ -43,7 +43,7 @@ realclean:
- 	-for X in */; do cd $$X && make clean; cd $(WD); done
-=20
- make.fil: $(IFDEFNAME) makefile.in
--	./$(IFDEFNAME) -MU $(IFDEFOPTS) makefile.in >tmp.mak
-+	$(IFDEFNAME) -MU $(IFDEFOPTS) makefile.in >tmp.mak
- 	echo > tmp.sed
- 	[ "$(BINDIR)" !=3D "//bin" ] || echo >> tmp.sed "s:%BINDIR%:/bin:"
- 	[ "$(LIBDIR)" !=3D "//lib/bcc" ] || echo >> tmp.sed "s:%LIBDIR%:/lib/b=
cc:"
diff --git a/recipes-extended/dev86/dev86/cross.patch b/recipes-extended/=
dev86/dev86/cross.patch
new file mode 100644
index 0000000..041a8d3
--- /dev/null
+++ b/recipes-extended/dev86/dev86/cross.patch
@@ -0,0 +1,29 @@
+Build ifdef using BUILD_CC, not CC.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Makefile b/Makefile
+index 8a61b65..99f41de 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,6 +22,10 @@ CFLAGS=3D  -O
+ IFDEFNAME=3D ifdef
+ WD=3D$(shell pwd)
+=20
++BUILD_CC ?=3D $(CC)
++BUILD_CFLAGS ?=3D $(CFLAGS)
++BUILD_LDFLAGS ?=3D $(LDFLAGS)
++
+ # Some makes take the last of a list as the default ...
+ all: make.fil
+ 	PATH=3D"`pwd`/bin:$$PATH" $(MAKE) -f make.fil VERSION=3D$(VERSION) TOP=
DIR=3D`pwd` $@
+@@ -65,7 +69,7 @@ make.fil: $(IFDEFNAME) makefile.in
+ 	@rm -f tmp.mak tmp.sed
+=20
+ $(IFDEFNAME): ifdef.c
+-	$(CC) $(IFDEFARCH) $(CFLAGS) $(IFDEFFLAGS) $(LDFLAGS) -o $(IFDEFNAME) =
ifdef.c
++	$(BUILD_CC) $(IFDEFARCH) $(BUILD_CFLAGS) $(IFDEFFLAGS) $(BUILD_LDFLAGS=
) -o $(IFDEFNAME) ifdef.c
+=20
+ uninstall:
+ 	@echo 'Sorry, no go; it was just wrong.'
diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86=
/dev86_git.bb
index ad7a0df..838918a 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -11,16 +11,14 @@ SRC_URI =3D "git://github.com/jbruchon/${BPN}.git;pro=
tocol=3Dhttps \
     file://0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch=
 \
     file://0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..pat=
ch \
     file://0004-regen-token2.h-token1.h-with-gperf-3.1.patch \
-"
-SRC_URI_append_class-target =3D " \
-    file://0002-Makefile-use-ifdefg-from-dev86-native-instead-of-tar.pat=
ch \
+	file://cross.patch \
 "
=20
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "gperf-native dev86-native"
+DEPENDS =3D "gperf-native"
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
 EXTRA_OEMAKE =3D "VERSION=3D${BASE_PV} PREFIX=3D${prefix} DIST=3D${D} LD=
FLAGS=3D'${LDFLAGS}' INEXE=3D''"
=20
 do_compile() {
@@ -41,8 +39,4 @@ do_install() {
 	ln -s ../lib/bcc/bcc-cc1 ${D}${prefix}/bin/bcc-cc1
 }
=20
-do_install_append_class-native() {
-        install -v -m 755 ${B}/ifdefg ${D}${bindir}
-}
-
 FILES_${PN} +=3D "${libdir}/bcc"
--=20
2.25.1

