Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC988C4167B
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 10:21:22 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.7167.1699352482172864479
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 02:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout06.t-online.de (Postfix) with SMTP id 255B8F073
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  7 Nov 2023 11:21:19 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.54]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0JCw-1nQekT0; Tue, 7 Nov 2023 11:21:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt-glib: add VALA_MESON_ENABLE_FLAG and VALA_MESON_DISABLE_FLAG
Date: Tue,  7 Nov 2023 11:21:29 +0100
Message-ID: <20231107102129.1052022-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699352478-E8D20D5E-5ED37BA8/0/0 CLEAN NORMAL
X-TOI-MSGID: cc3c2873-de76-499d-9c37-741aded4a80a
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 10:21:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8435

According to changes in vala.bbclass we need to add them

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-extended/libvirt/libvirt-glib_4.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-ext=
ended/libvirt/libvirt-glib_4.0.0.bb
index 7ca65a95..22b02d42 100644
--- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
+++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
@@ -19,3 +19,5 @@ GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
 GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
 GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
+VALA_MESON_ENABLE_FLAG =3D 'enabled'
+VALA_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.42.0


