Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991A4ECAAA1
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 16:13:55 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web08.9545.1667146426616449921
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 30 Oct 2022 09:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id 0898723F2C
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 30 Oct 2022 17:13:44 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.64]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1opAwO-2k9hKb0; Sun, 30 Oct 2022 17:13:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-virtualization][PATCH 1/2] libvirt-glib: add recipe
Date: Sun, 30 Oct 2022 17:13:32 +0100
Message-Id: <20221030161333.12430-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667146421-F37F2ECF-5DA07409/0/0 CLEAN NORMAL
X-TOI-MSGID: 3a4eda06-7de7-4a7a-ad67-10032cf24593
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 30 Oct 2022 16:13:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7667

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


