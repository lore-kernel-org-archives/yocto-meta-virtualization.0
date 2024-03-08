Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD80C54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 18:30:34 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.791.1709922625896442518
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Mar 2024 10:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id B2A782B45C
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  8 Mar 2024 19:30:23 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.68]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1riez4-4V0riL0; Fri, 8 Mar 2024 19:30:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCHv2] libvirt-glib: update 4.0.0 -> 5.0.0
Date: Fri,  8 Mar 2024 19:30:29 +0100
Message-ID: <20240308183029.2280173-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709922618-44F7E877-35CB1133/0/0 CLEAN NORMAL
X-TOI-MSGID: 3178b9d1-3e3b-47ba-8f38-7e34981255df
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 18:30:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8613

5.0.0 - Nov 28, 2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix compatiblity with libxml2 >=3D 2.12.0
- Bump min libvirt version to 2.3.0
- Bump min meson to 0.56.0
- Require use of GCC >=3D 4.8 / CLang > 3.4 / XCode CLang > 5.1
- Mark USB disks as removable by default
- Add support for audio device backend config
- Add support for DBus graphics backend config
- Add support for controlling firmware feature flags
- Improve compiler flag handling in meson
- Extend library version script handling to FreeBSD
- Fix pointer sign issue in capabilities config API
- Fix compat with gnome.mkenums() in Meson 0.60.0
- Avoid compiler warnings from gi-ir-scanner generated
  code by not setting glib version constraints
- Be more robust about NULL GError parameters
- Disable unimportant cast alignment compiler warnings
- Use 'pragma once' in all header files
- Updated translations

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


