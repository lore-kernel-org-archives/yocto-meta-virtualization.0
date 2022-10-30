Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CACFA3742
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 16:13:55 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web09.9587.1667146425961173300
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 30 Oct 2022 09:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id 3E7B623F28
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 30 Oct 2022 17:13:44 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.64]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1opAwQ-2k9hKc0; Sun, 30 Oct 2022 17:13:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
Date: Sun, 30 Oct 2022 17:13:33 +0100
Message-Id: <20221030161333.12430-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221030161333.12430-1-f_l_k@t-online.de>
References: <20221030161333.12430-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667146422-F37F2ECF-1F48BDC5/0/0 CLEAN NORMAL
X-TOI-MSGID: 002c3170-9ffc-4614-85d9-ac910d7be250
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 30 Oct 2022 16:13:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7666

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ata-meson.build-fix-for-recent-meson.patch | 44 +++++++++++++++++++
 .../virt-viewer/virt-viewer_11.0.bb           | 30 +++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 recipes-extended/virt-viewer/virt-viewer/0001-data-me=
son.build-fix-for-recent-meson.patch
 create mode 100644 recipes-extended/virt-viewer/virt-viewer_11.0.bb

diff --git a/recipes-extended/virt-viewer/virt-viewer/0001-data-meson.bui=
ld-fix-for-recent-meson.patch b/recipes-extended/virt-viewer/virt-viewer/=
0001-data-meson.build-fix-for-recent-meson.patch
new file mode 100644
index 0000000..5a4fe77
--- /dev/null
+++ b/recipes-extended/virt-viewer/virt-viewer/0001-data-meson.build-fix-=
for-recent-meson.patch
@@ -0,0 +1,44 @@
+From b2d3cde0ff9816c468986f2d62c67d0713a4c49e Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sat, 29 Oct 2022 15:35:23 +0200
+Subject: [PATCH] data/meson.build: fix for recent meson
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Patch-Status: Backport
+
+---
+ data/meson.build | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index d718491..4325108 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -2,7 +2,6 @@ if host_machine.system() !=3D 'windows'
+   desktop =3D 'remote-viewer.desktop'
+=20
+   i18n.merge_file (
+-    desktop,
+     type: 'desktop',
+     input: desktop + '.in',
+     output: desktop,
+@@ -14,7 +13,6 @@ if host_machine.system() !=3D 'windows'
+   mimetypes =3D 'virt-viewer-mime.xml'
+=20
+   i18n.merge_file (
+-    mimetypes,
+     type: 'xml',
+     input: mimetypes + '.in',
+     output: mimetypes,
+@@ -27,7 +25,6 @@ if host_machine.system() !=3D 'windows'
+   metainfo =3D 'remote-viewer.appdata.xml'
+=20
+   i18n.merge_file (
+-    metainfo,
+     type: 'xml',
+     input: metainfo + '.in',
+     output: metainfo,
+--=20
+2.34.1
+
diff --git a/recipes-extended/virt-viewer/virt-viewer_11.0.bb b/recipes-e=
xtended/virt-viewer/virt-viewer_11.0.bb
new file mode 100644
index 0000000..a09f0cf
--- /dev/null
+++ b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
@@ -0,0 +1,30 @@
+SUMMARY =3D "Virtual Machine Viewer"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
+
+# for librest support rest_0.7 would be needed
+DEPENDS =3D " \
+	desktop-file-utils-native \
+	glib-2.0 \
+	gtk+3 \
+	gtk-vnc \
+	libvirt \
+	libvirt-glib \
+	libxml2 \
+	spice-gtk \
+	spice-protocol \
+	vte \
+"
+
+SRC_URI =3D " \
+	git://gitlab.com/virt-viewer/virt-viewer.git;protocol=3Dhttps;branch=3D=
master \
+	file://0001-data-meson.build-fix-for-recent-meson.patch \
+"
+
+SRCREV =3D "8d8923d259b79c7c9ad3560a49be81dc0f38b88b"
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspecti=
on
+
+FILES:${PN} +=3D "${datadir}"
+GIR_MESON_OPTION =3D ''
--=20
2.34.1


