Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C74C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 18:18:54 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.499.1709921927067434256
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Mar 2024 10:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout12.t-online.de (Postfix) with SMTP id EAA3712AE4
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  8 Mar 2024 19:18:43 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.68]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rienn-0bBS2T0; Fri, 8 Mar 2024 19:18:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt-glib: update 4.0.0 -> 5.0.0
Date: Fri,  8 Mar 2024 19:18:50 +0100
Message-ID: <20240308181850.2161010-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709921919-5CF5D979-B2270097/0/0 CLEAN NORMAL
X-TOI-MSGID: 83977d01-d073-4e19-a21d-1bd5008f878b
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 18:18:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8611

This fixes build after libxml update:
../git/libvirt-gconfig/libvirt-gconfig-object.c:200:37: error: passing ar=
gument 2 of 'xmlSetStructuredErrorFunc' from incompatible pointer type [-=
Werror=3Dincompatible-pointer-types]
  200 |     xmlSetStructuredErrorFunc(NULL, gvir_xml_structured_error_nop=
);
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                     |
      |                                     void (*)(void *, xmlError *) =
{aka void (*)(void *, struct _xmlError *)}
In file included from /home/flk/poky/build/tmp/work/corei7-64-poky-linux/=
libvirt-glib/4.0.0/recipe-sysroot/usr/include/libxml2/libxml/relaxng.h:14=
,

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libvirt/{libvirt-glib_4.0.0.bb =3D> libvirt-glib_5.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-extended/libvirt/{libvirt-glib_4.0.0.bb =3D> libvirt-glib=
_5.0.0.bb} (92%)

diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-ext=
ended/libvirt/libvirt-glib_5.0.0.bb
similarity index 92%
rename from recipes-extended/libvirt/libvirt-glib_4.0.0.bb
rename to recipes-extended/libvirt/libvirt-glib_5.0.0.bb
index 7ca65a95..4435ca0b 100644
--- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
+++ b/recipes-extended/libvirt/libvirt-glib_5.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI =3D " \
 	file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch \
 "
=20
-SRCREV =3D "e0bfc34682744a74b850fa217e9c206a9eb80612"
+SRCREV =3D "9b26bec8828a38fcb3bc0e5f6f33b03fa99c4b68"
 S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig gobject-introspection gettext vala gtk-doc
--=20
2.44.0


