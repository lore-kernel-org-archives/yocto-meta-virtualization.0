Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AFDC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 16:43:04 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.1393.1669221775667757424
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 08:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout12.t-online.de (Postfix) with SMTP id 94B6193AB
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 17:42:53 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.78]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oxspm-0q9F3J0; Wed, 23 Nov 2022 17:42:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-virtualization][PATCH] libvirt-glib: fix pointer-sign issue
Date: Wed, 23 Nov 2022 17:42:41 +0100
Message-Id: <20221123164241.28213-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669221770-2D8B7EA1-AFF1312C/0/0 CLEAN NORMAL
X-TOI-MSGID: 189633ea-417f-4fa0-9330-cbaddbc79d83
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 16:43:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7696

This issue is probably caused by latest glib-2.0 update.
AThe patch has also been submitted upstream.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...domain-capabilities-os.c-fix-pointer.patch | 29 +++++++++++++++++++
 .../libvirt/libvirt-glib_4.0.0.bb             |  5 +++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/libvirt/libvirt-glib/0001-libvirt-gc=
onfig-domain-capabilities-os.c-fix-pointer.patch

diff --git a/recipes-extended/libvirt/libvirt-glib/0001-libvirt-gconfig-d=
omain-capabilities-os.c-fix-pointer.patch b/recipes-extended/libvirt/libv=
irt-glib/0001-libvirt-gconfig-domain-capabilities-os.c-fix-pointer.patch
new file mode 100644
index 0000000..e9f9c26
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-glib/0001-libvirt-gconfig-domain-c=
apabilities-os.c-fix-pointer.patch
@@ -0,0 +1,29 @@
+From 67ebf4c854085c451069d87798ebce79501c53b1 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 23 Nov 2022 16:47:52 +0100
+Subject: [PATCH] libvirt-gconfig-domain-capabilities-os.c: fix pointer-s=
ign
+ issue
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Patch-Status: Submitted [https://gitlab.com/libvirt/libvirt-glib/-/merge=
_requests/40]
+---
+ libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c b/=
libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c
+index 98a1bff..e70d22d 100644
+--- a/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c
++++ b/libvirt-gconfig/libvirt-gconfig-domain-capabilities-os.c
+@@ -67,7 +67,7 @@ static gboolean search_firmwares(xmlNodePtr node, gpoi=
nter opaque)
+ {
+     const gchar *content;
+=20
+-    if (!g_str_equal(node->name, "enum"))
++    if (!g_str_equal((const gchar *)node->name, "enum"))
+         return TRUE;
+=20
+     content =3D gvir_config_xml_get_attribute_content(node, "name");
+--=20
+2.34.1
+
diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-ext=
ended/libvirt/libvirt-glib_4.0.0.bb
index 11ad84a..e2a9f2a 100644
--- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
+++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd2=
55951079008b364516c"
=20
 DEPENDS =3D "glib-2.0 libvirt libxml2"
=20
-SRC_URI =3D "git://gitlab.com/libvirt/libvirt-glib;protocol=3Dhttps;bran=
ch=3Dmaster"
+SRC_URI =3D " \
+	git://gitlab.com/libvirt/libvirt-glib;protocol=3Dhttps;branch=3Dmaster =
\
+	file://0001-libvirt-gconfig-domain-capabilities-os.c-fix-pointer.patch =
\
+"
=20
 SRCREV =3D "940bd9ccbfe419573ddec4383e3def4aac1f0e1f"
 S =3D "${WORKDIR}/git"
--=20
2.34.1


