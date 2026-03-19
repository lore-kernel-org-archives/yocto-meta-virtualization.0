Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498DF1090240
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 15:16:42 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13757.1773933394774562124
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 08:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=LllKJrDs;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 038901A3F
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Mar 2026 16:16:02 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.227.5]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w3F6P-4OwgoD0; Thu, 19 Mar 2026 16:16:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: disable netcf backend by default
Date: Thu, 19 Mar 2026 16:15:52 +0100
Message-ID: <20260319151552.313063-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1773933361-38FF68C4-DC93F9DE/0/0 CLEAN NORMAL
X-TOI-MSGID: bcf6069c-328b-47fd-b993-aa76a8b39c0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1773933361; i=f_l_k@t-online.de;
	bh=G7+qxecUk9u+l0pnzccBsGk6yLr0wXTkDDeKoEsXhlA=;
	h=From:To:Subject:Date;
	b=LllKJrDsi9iZHD45M8+41Fk5381Ou1LomvR+N4j/VbZTDacPMhWTdPZqtkTU4Gn4H
	 PHLeWICat3WRsiOmF8yyxbJq55H5e94JDv/qoFDiejA8yqXz2ifmSnNutvr5gcJ+iW
	 uQZS3wU0rbSVth8R+uyigYpmZKs8vU753Yrtu5UlfocLuv2TrQQQsiScRe0l/rV02U
	 Wc6Yh4EoFCD9ZoFf5+5C/xCN6w7j/lf31jzgB7sNIoMigMe9+/E98975r+uwVXlFcw
	 36kr3t8opKY16sI5T1GHjDJmn1eP+ss2OuGMMJSerskrA3Of1G338lQR3UV6X8ZgaT
	 uiuizdUfM591w==
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Mar 2026 15:16:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9668

I see a failure in netcf:
| ./bootstrap: .gnulib/gnulib-tool  --import --no-changelog --aux-dir bui=
ld-aux --doc-base doc --lib libgnu --m4-base gnulib/m4/ --source-base gnu=
lib/lib/ --tests-base gnulib/tests --local-dir gl  --lgpl=3D2 --with-test=
s --makefile-name=3Dgnulib.mk --libtool --import ...
| python3: can't open file '/home/flk/bitbake-builds/poky/build/tmp/work/=
corei7-64-oe-linux/netcf/0.2.8+git/sources/netcf-0.2.8+git/.gnulib/.gnuli=
b-tool.py': [Errno 2] No such file or directory
| ./bootstrap: gnulib-tool failed

Since the code hasn't been updated in over seven years, and after reading=
 this discussion, perhaps the best solution would be to disable netcf sup=
port by default?

https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/message/7=
55CCFUFUW6OTN7CAHB77H7YXQNE5WGG/

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-extended/libvirt/libvirt_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/l=
ibvirt/libvirt_git.bb
index 63f882ee..db600b92 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -131,7 +131,7 @@ SYSTEMD_SERVICE:${PN}-libvirtd =3D " \
=20
 # full config
 PACKAGECONFIG ??=3D "gnutls qemu openvz vmware vbox esx lxc test remote =
\
-                   libvirtd netcf udev python fuse firewalld libpcap \
+                   libvirtd udev python fuse firewalld libpcap \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 's=
elinux audit libcap-ng', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl=
', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'po=
lkit', '', d)} \
--=20
2.53.0


