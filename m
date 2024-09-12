Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2490BEEB566
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 08:32:01 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.43415.1726129912246070623
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 01:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout10.t-online.de (Postfix) with SMTP id 5DE713C7F
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 10:31:04 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.202]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sofEA-38b7rN0; Thu, 12 Sep 2024 10:30:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] linux-%.bbappend: fix compatibility issue with linux-intel
Date: Thu, 12 Sep 2024 10:32:39 +0200
Message-ID: <20240912083239.237361-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726129858-5F7FD85B-84255DB1/0/0 CLEAN NORMAL
X-TOI-MSGID: ffaacc94-c1ad-4953-805b-bf05f7dcad2d
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 08:32:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8886

If building linux-intel from meta-intel in combination with meta-virtuali=
zation,
build fails in:
[https://git.yoctoproject.org/meta-virtualization/tree/recipes-kernel/lin=
ux/linux-yocto_virtualization.inc?h=3Dmaster-next#n36]

ERROR: Nothing PROVIDES 'yocto-cfg-fragments-6.10+git-native'. Close matc=
hes:
  yocto-cfg-fragments-6.10
  yocto-cfg-fragments-6.10-native
  yocto-cfg-fragments-6.6-native
ERROR: Required build target 'linux-intel' has no buildable providers.
Missing or unbuildable dependency chain was: ['linux-intel', 'yocto-cfg-f=
ragments-6.10+git-native']

Be more sloppy for the sake of compatibility.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-kernel/linux/linux-%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-%.bbappend b/recipes-kernel/linux=
/linux-%.bbappend
index dbae9b14..abd5a5d5 100644
--- a/recipes-kernel/linux/linux-%.bbappend
+++ b/recipes-kernel/linux/linux-%.bbappend
@@ -1,8 +1,8 @@
 # any kernel recipe with fragment support, that sets LINUX_VERSION to on=
e of the tested
 # values, will get the appropriate fragments included in their SRC_URI
=20
-LINUX_MAJOR =3D "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[0]}"
-LINUX_MINOR =3D "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[1]}"
+LINUX_MAJOR =3D "${@("x.y").split('.')[0]}"
+LINUX_MINOR =3D "${@("x.y").split('.')[1]}"
=20
 KERNEL_META_TYPE =3D "${@'yocto' if d.getVar('SRC_URI').find('type=3Dkme=
ta') > 0 and d.getVar('SKIP_META_VIRT_KERNEL_INCLUDE') =3D=3D None else '=
none'}"
=20
--=20
2.46.0


