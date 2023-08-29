Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52047C6FA8F
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 06:08:08 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.11534.1693289287244710009
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 23:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout04.t-online.de (Postfix) with SMTP id 29F9F14374
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 08:08:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.90]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qartU-3Z5Jw10; Tue, 29 Aug 2023 08:08:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCHv2] libvirt-glib: fix introspection and documentation build
Date: Tue, 29 Aug 2023 08:07:59 +0200
Message-ID: <20230829060759.80856-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693289285-D25C12DD-9635907E/0/0 CLEAN NORMAL
X-TOI-MSGID: 43e1eeaf-2771-4986-8722-f525544a6390
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 06:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8259

Building Gobject introspection during cross-compilation is not an easy ta=
sk.
Therefore, the meson.build file disables the build for introspection and
also for gtkdoc by default.
This commit adds a patch to enable this, as introspection can be easily b=
uilt
on newer platforms with yocto/oe.

The options to enable/disable introspection/doc are defined as feature
while the corresponding bbclass defines it as a boolean.
Override this so that it should be possible to be enabled/disabled by usi=
ng DISTRO_FEATURES.

Inherit  gettext bbclass as used in libvirt-glib.

Add a missing dependency on libxslt.
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ild-allow-crosscompiling-gir-and-doc.patch | 37 +++++++++++++++++++
 .../libvirt/libvirt-glib_4.0.0.bb             | 15 ++++++--
 2 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 recipes-extended/libvirt/libvirt-glib/0001-meson.buil=
d-allow-crosscompiling-gir-and-doc.patch

diff --git a/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow=
-crosscompiling-gir-and-doc.patch b/recipes-extended/libvirt/libvirt-glib=
/0001-meson.build-allow-crosscompiling-gir-and-doc.patch
new file mode 100644
index 00000000..cd17bbbf
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crossc=
ompiling-gir-and-doc.patch
@@ -0,0 +1,37 @@
+From 019d727990d41b5d7911895b75bcb021e4cca3c6 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Aug 2023 10:23:08 +0200
+Subject: [PATCH] meson.build: allow crosscompiling gir and doc
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 134feb6..a089f42 100644
+--- a/meson.build
++++ b/meson.build
+@@ -58,7 +58,7 @@ includedir =3D join_paths(prefix, get_option('included=
ir'))
+=20
+ # gobject introspection
+ gir =3D find_program('g-ir-scanner', required: get_option('introspectio=
n'))
+-enable_introspection =3D gir.found() and not meson.is_cross_build()
++enable_introspection =3D gir.found()
+=20
+ # vala
+ vapi_opt =3D get_option('vapi')
+@@ -73,7 +73,7 @@ endif
+ # gtk-doc
+ if not get_option('docs').disabled()
+   gtk_doc =3D find_program('gtkdoc-scan', required: get_option('docs'))
+-  enable_doc =3D gtk_doc.found() and not meson.is_cross_build()
++  enable_doc =3D gtk_doc.found()
+ else
+   enable_doc =3D false
+ endif
+--=20
+2.41.0
+
diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-ext=
ended/libvirt/libvirt-glib_4.0.0.bb
index a5cd8276..7ca65a95 100644
--- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
+++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
@@ -3,12 +3,19 @@ HOMEPAGE =3D "http://libvirt.org"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
-DEPENDS =3D "glib-2.0 libvirt libxml2"
+DEPENDS =3D "glib-2.0 libvirt libxml2 libxslt"
=20
-SRC_URI =3D "git://gitlab.com/libvirt/libvirt-glib;protocol=3Dhttps;bran=
ch=3Dmaster"
+SRC_URI =3D " \
+	git://gitlab.com/libvirt/libvirt-glib;protocol=3Dhttps;branch=3Dmaster =
\
+	file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch \
+"
=20
 SRCREV =3D "e0bfc34682744a74b850fa217e9c206a9eb80612"
 S =3D "${WORKDIR}/git"
=20
-inherit meson pkgconfig gobject-introspection vala
-GIR_MESON_OPTION =3D ''
+inherit meson pkgconfig gobject-introspection gettext vala gtk-doc
+
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
+GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.41.0


