Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64283C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:10:24 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.6132.1692864615545912885
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 01:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 808A02B92C
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 10:10:12 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.18]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZ5Pt-2i1hr70; Thu, 24 Aug 2023 10:10:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to fuse3
Date: Thu, 24 Aug 2023 10:10:02 +0200
Message-ID: <20230824081002.6730-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692864609-366FC16C-0DE9D21B/0/0 CLEAN NORMAL
X-TOI-MSGID: 5d2df3e4-d79a-4458-8f02-f169c3628a96
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 08:10:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8226

Using fuse2 and fuse3 in the same environment can be problematic. Most
projects I know of now support fuse3. ostree, flatpak, xdg-desktop-portal
and some other recipes in meta-openembedded are configured to use fuse3 a=
nd
libvirt is also able to do so.

This commit switches libvirt to fuse3 to reduce the number of recipes tha=
t still use
the old version.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-extended/libvirt/libvirt_9.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended=
/libvirt/libvirt_9.2.0.bb
index 5e70470..9b5b2de 100644
--- a/recipes-extended/libvirt/libvirt_9.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_9.2.0.bb
@@ -156,7 +156,7 @@ PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dsel=
inux=3Ddisabled,libselinux,"
 PACKAGECONFIG[python] =3D ",,python3,"
 PACKAGECONFIG[sasl] =3D "-Dsasl=3Denabled,-Dsasl=3Ddisabled,cyrus-sasl,c=
yrus-sasl"
 PACKAGECONFIG[numactl] =3D "-Dnumactl=3Denabled,-Dnumactl=3Ddisabled,num=
actl,"
-PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse,"
+PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse3,"
 PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
 PACKAGECONFIG[libcap-ng] =3D "-Dcapng=3Denabled,-Dcapng=3Ddisabled,libca=
p-ng,"
 PACKAGECONFIG[wireshark] =3D "-Dwireshark_dissector=3Denabled,-Dwireshar=
k_dissector=3Ddisabled,wireshark libwsutil,"
--=20
2.41.0


