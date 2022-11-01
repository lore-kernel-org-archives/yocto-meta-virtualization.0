Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD69C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 16:30:51 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.8658.1667320244991182106
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 09:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id 8D764172EA
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  1 Nov 2022 17:30:28 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.78]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1opu9k-1N80jB0; Tue, 1 Nov 2022 17:30:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-virtualization][PATCHv2 1/2] libvirt-glib: add recipe
Date: Tue,  1 Nov 2022 17:30:17 +0100
Message-Id: <20221101163018.741907-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667320228-F37F2ECF-F67FE1B1/0/0 CLEAN NORMAL
X-TOI-MSGID: 87d640fc-8313-4e82-a936-c8f38e0d67eb
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Nov 2022 16:30:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7671

libvirt-glib wraps libvirt to provide a high-level object-oriented API be=
tter
suited for glib-based applications, via three libraries:

  - libvirt-glib - GLib main loop integration & misc helper APIs
  - libvirt-gconfig - GObjects for manipulating libvirt XML documents
  - libvirt-gobject - GObjects for managing libvirt objects

It is needed as a dependency for glib based projects that make use of lib=
virt e.g.
virt-manager, virt-viewer or gnome boxes.

Compilation was tested for x86_64, aarch64 and qemumips

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-extended/libvirt/libvirt-glib_4.0.0.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt-glib_4.0.0.bb

diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-ext=
ended/libvirt/libvirt-glib_4.0.0.bb
new file mode 100644
index 0000000..11ad84a
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "A toolkit to interact with the virtualization capabilit=
ies of recent versions of Linux."
+HOMEPAGE =3D "http://libvirt.org"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+DEPENDS =3D "glib-2.0 libvirt libxml2"
+
+SRC_URI =3D "git://gitlab.com/libvirt/libvirt-glib;protocol=3Dhttps;bran=
ch=3Dmaster"
+
+SRCREV =3D "940bd9ccbfe419573ddec4383e3def4aac1f0e1f"
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig gobject-introspection vala
+GIR_MESON_OPTION =3D ''
--=20
2.34.1


