Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11EEC43217
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 13:51:40 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.24146.1669297898297445284
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Nov 2022 05:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 705786DA1
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Nov 2022 14:51:30 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.89]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oyCdS-1IAJ050; Thu, 24 Nov 2022 14:51:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-virtualization][PATCHv2] libvirt-glib: fix pointer-sign issue
Date: Thu, 24 Nov 2022 14:51:13 +0100
Message-Id: <20221124135113.4385-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669297886-00E07ECF-7FBAB68E/0/0 CLEAN NORMAL
X-TOI-MSGID: f17cd761-8144-4ce4-88bb-5c48d9edf80b
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Nov 2022 13:51:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7698

Update to latest commit to fix a build issue with latest glib-2-0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-extended/libvirt/libvirt-glib_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-ext=
ended/libvirt/libvirt-glib_4.0.0.bb
index 11ad84a..a5cd827 100644
--- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
+++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
@@ -7,7 +7,7 @@ DEPENDS =3D "glib-2.0 libvirt libxml2"
=20
 SRC_URI =3D "git://gitlab.com/libvirt/libvirt-glib;protocol=3Dhttps;bran=
ch=3Dmaster"
=20
-SRCREV =3D "940bd9ccbfe419573ddec4383e3def4aac1f0e1f"
+SRCREV =3D "e0bfc34682744a74b850fa217e9c206a9eb80612"
 S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig gobject-introspection vala
--=20
2.34.1


