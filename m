Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABCCEE49AE
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 21:55:56 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.8902.1692741352896193936
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 14:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout06.t-online.de (Postfix) with SMTP id 2A5271E7F1
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Aug 2023 23:55:50 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.228.72]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYZLn-1mND6o0; Tue, 22 Aug 2023 23:55:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/2] libvirt: update from fuse2 to fuse3
Date: Tue, 22 Aug 2023 23:55:34 +0200
Message-ID: <20230822215534.475219-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822215534.475219-1-f_l_k@t-online.de>
References: <20230822215534.475219-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692741347-7C9A9E98-6C405232/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c778414-0f70-43af-a83f-63bd48f8f2b4
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Aug 2023 21:55:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8220

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


