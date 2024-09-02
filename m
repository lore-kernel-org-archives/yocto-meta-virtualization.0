Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AEFCA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 06:12:46 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.32561.1725257560627000049
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Sep 2024 23:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout11.t-online.de (Postfix) with SMTP id 4AA661EB77
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  2 Sep 2024 08:12:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.228.144]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sl0Ih-0VBOrp0; Mon, 2 Sep 2024 08:12:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: dont set polkit permissions manually
Date: Mon,  2 Sep 2024 08:14:03 +0200
Message-ID: <20240902061403.4581-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1725257551-967FB8F4-79D589C3/0/0 CLEAN NORMAL
X-TOI-MSGID: 973e0729-5e6c-4cb6-95e4-be7509dae32b
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Sep 2024 06:12:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8865

According to this commit polkit rules should go to ${datadir} instead of =
${sysconfdir}:
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3Dd5e90541f8e35916abc930b2da6de037b23d51a1
Theres no need to adjust the permissions for ${datadir} anymore:
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D6da0fd21c900e32a0693a6b27d38182f19c8c76c

This commit fixes build after:
https://git.yoctoproject.org/poky/commit/?id=3Def9a927a3af1dd817fe298bbe4=
5470b738d9ce2f

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-extended/libvirt/libvirt_git.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/l=
ibvirt/libvirt_git.bb
index 706d4a40..8af09d71 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -243,15 +243,6 @@ do_install:append() {
 	echo "d root root 0755 /run/libvirt/qemu none" \
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
=20
-	# Manually set permissions and ownership to match polkit recipe
-	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}=
; then
-		install -d -m 0700 ${D}/${datadir}/polkit-1/rules.d
-		chown polkitd ${D}/${datadir}/polkit-1/rules.d
-		chgrp root ${D}/${datadir}/polkit-1/rules.d
-	else
-		rm -rf ${D}/${datadir}/polkit-1
-	fi
-
 	# disable seccomp_sandbox
         if [ -e ${D}${sysconfdir}/libvirt/qemu.conf ] ; then
 	   sed -i '/^#seccomp_sandbox =3D 1/aseccomp_sandbox =3D 0' \
--=20
2.45.2


