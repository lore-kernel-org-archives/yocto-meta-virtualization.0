Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02840C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 12:11:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9331.1651234304012887284
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 05:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D27891063;
	Fri, 29 Apr 2022 05:11:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6078C3F73B;
	Fri, 29 Apr 2022 05:11:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] vgabios: upgrade to 0.8a and cleanup recipe
Date: Fri, 29 Apr 2022 13:11:35 +0100
Message-Id: <20220429121136.2287359-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Apr 2022 12:11:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7230

Upgrade to 0.8a.

License checksum updated as the FSF street address changed.

Apply a patch to use the correct host compiler when building biossums,
removing the need for a separate biossums-native recipe.

Don't hardcode /usr/share, use ${datadir}.

Install all found firmware (including the new Banshee BIOS in 0.8a) and
the debug files which were not installed but intended to be packaged.

Remove redundant PR and S assignments, as these are the default values.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-extended/vgabios/biossums_0.7a.bb     | 37 -------------------
 recipes-extended/vgabios/files/build-cc.patch | 30 +++++++++++++++
 recipes-extended/vgabios/vgabios_0.7a.bb      | 33 -----------------
 recipes-extended/vgabios/vgabios_0.8a.bb      | 25 +++++++++++++
 4 files changed, 55 insertions(+), 70 deletions(-)
 delete mode 100644 recipes-extended/vgabios/biossums_0.7a.bb
 create mode 100644 recipes-extended/vgabios/files/build-cc.patch
 delete mode 100644 recipes-extended/vgabios/vgabios_0.7a.bb
 create mode 100644 recipes-extended/vgabios/vgabios_0.8a.bb

diff --git a/recipes-extended/vgabios/biossums_0.7a.bb b/recipes-extended=
/vgabios/biossums_0.7a.bb
deleted file mode 100644
index 95483ff..0000000
--- a/recipes-extended/vgabios/biossums_0.7a.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION =3D "biossums tool for building Plex86/Bochs LGPL VGABios"
-HOMEPAGE =3D "http://www.nongnu.org/vgabios/"
-LICENSE =3D "LGPL-2.1-only"
-SECTION =3D "firmware"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcf3c825659e82539645da41a7908=
589"
-
-SRC_URI =3D  "http://savannah.gnu.org/download/vgabios/vgabios-${PV}.tgz=
"
-
-SRC_URI[md5sum] =3D "2c0fe5c0ca08082a9293e3a7b23dc900"
-SRC_URI[sha256sum] =3D "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b=
54ce2ea30881b865"
-
-BBCLASSEXTEND =3D "native"
-
-FILES:${PN} =3D "${bindir}/biossums"
-
-S =3D "${WORKDIR}/vgabios-${PV}"
-
-do_configure() {
-    # Don't override the compiler or its flags:
-    sed 's,^CC,DISABLED_CC,' -i Makefile
-    sed 's,^CFLAGS,DISABLED_CFLAGS,' -i Makefile
-    sed 's,^LDFLAGS,DISABLED_LDFLAGS,' -i Makefile
-    # Supply the C flags to the compiler:
-    sed 's,-o biossums,$(CFLAGS) -o biossums,' -i Makefile
-}
-
-do_compile() {
-    # clean removes binaries distributed with source
-    oe_runmake clean
-    oe_runmake biossums
-}
-
-do_install() {
-    mkdir -p "${D}${bindir}"
-    install -m 0755 biossums "${D}${bindir}"
-}
diff --git a/recipes-extended/vgabios/files/build-cc.patch b/recipes-exte=
nded/vgabios/files/build-cc.patch
new file mode 100644
index 0000000..b64e5ef
--- /dev/null
+++ b/recipes-extended/vgabios/files/build-cc.patch
@@ -0,0 +1,30 @@
+Use the host compiler to build the tools we need at runtime.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+Index: Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/Makefile	(revision 298)
++++ b/Makefile	(working copy)
+@@ -5,6 +5,7 @@
+ SHELL =3D /bin/sh
+=20
+ CC      =3D gcc
++HOSTCC =3D gcc
+ CFLAGS  =3D -g -O2 -Wall -Wstrict-prototypes
+ LDFLAGS =3D=20
+=20
+@@ -79,10 +80,10 @@
+ 	tar czvf ../$(RELEASE).tgz --exclude .svn -C .. $(RELEASE)/
+=20
+ biossums: biossums.c
+-	$(CC) -o biossums biossums.c
++	$(HOSTCC) -o biossums biossums.c
+=20
+ vbetables-gen: vbetables-gen.c
+-	$(CC) -o vbetables-gen vbetables-gen.c
++	$(HOSTCC) -o vbetables-gen vbetables-gen.c
+=20
+ vbetables.h: vbetables-gen
+ 	./vbetables-gen > $@
diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb b/recipes-extended/=
vgabios/vgabios_0.7a.bb
deleted file mode 100644
index f443aed..0000000
--- a/recipes-extended/vgabios/vgabios_0.7a.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION =3D "Plex86/Bochs LGPL VGABios"
-HOMEPAGE =3D "http://www.nongnu.org/vgabios/"
-LICENSE =3D "LGPL-2.1-only"
-SECTION =3D "firmware"
-
-DEPENDS =3D "dev86-native biossums-native"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcf3c825659e82539645da41a7908=
589"
-
-SRC_URI =3D  "http://savannah.gnu.org/download/vgabios/${BPN}-${PV}.tgz"
-
-SRC_URI[md5sum] =3D "2c0fe5c0ca08082a9293e3a7b23dc900"
-SRC_URI[sha256sum] =3D "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b=
54ce2ea30881b865"
-
-PR =3D "r0"
-
-FILES:${PN} =3D "/usr/share/firmware/${PN}-${PV}*.bin"
-FILES:${PN}-dbg =3D "/usr/share/firmware/${PN}-${PV}*.debug.bin"
-
-S =3D "${WORKDIR}/${PN}-${PV}"
-
-do_configure() {
-    # Override to use the native-built biossums tool:
-    sed 's,./biossums,biossums,' -i Makefile
-    sed 's,$(CC) -o biossums biossums.c,touch biossums,' -i Makefile
-}
-
-do_install() {
-    install -d ${D}/usr/share/firmware
-    install -m 0644 VGABIOS-lgpl-latest.bin ${D}/usr/share/firmware/${PN=
}-${PV}.bin
-    install -m 0644 VGABIOS-lgpl-latest.cirrus.bin ${D}/usr/share/firmwa=
re/${PN}-${PV}.cirrus.bin
-}
-
diff --git a/recipes-extended/vgabios/vgabios_0.8a.bb b/recipes-extended/=
vgabios/vgabios_0.8a.bb
new file mode 100644
index 0000000..044bb4e
--- /dev/null
+++ b/recipes-extended/vgabios/vgabios_0.8a.bb
@@ -0,0 +1,25 @@
+DESCRIPTION =3D "Plex86/Bochs LGPL VGABios"
+HOMEPAGE =3D "http://www.nongnu.org/vgabios/"
+LICENSE =3D "LGPL-2.1-only"
+SECTION =3D "firmware"
+
+DEPENDS =3D "dev86-native"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfae731a3adbc92fd8bb1730d1f245=
5bc"
+
+SRC_URI =3D  "http://savannah.gnu.org/download/vgabios/${BP}.tgz \
+            file://build-cc.patch"
+SRC_URI[sha256sum] =3D "481042240ef0f1c918780c92a6bb42ad4d3f5d989b29502f=
a7ee7faf13a041b9"
+
+EXTRA_OEMAKE =3D "HOSTCC=3D"${BUILD_CC}""
+
+do_install() {
+    install -d ${D}${datadir}/firmware
+    for file in VGABIOS*.bin; do
+        target=3D$(echo $file | sed s/VGABIOS-lgpl-latest/${BP}/)
+        install -m0644 $file ${D}${datadir}/firmware/$target
+    done
+}
+
+FILES:${PN} =3D "${datadir}/firmware/${BP}*.bin"
+FILES:${PN}-dbg =3D "${datadir}/firmware/${BP}*.debug.bin"
--=20
2.25.1


