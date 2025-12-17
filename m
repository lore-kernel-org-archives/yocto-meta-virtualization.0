Return-Path: <paul.leguendekerneizon@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BCBD6409D
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:21:55 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10414.1765963314069472841
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 01:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=q7BPrYd6;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DDFEC3D85177
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 04:21:52 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 9ZLLU780zkp7; Wed, 17 Dec 2025 04:21:52 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 230A73D84F21;
	Wed, 17 Dec 2025 04:21:52 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 230A73D84F21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1765963312; bh=fo+RJJqrqv4pj6S3mBIts33ykaFp0yztgLjE69QLKik=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=q7BPrYd6sEzTfcOkofD96lctVVuXba/hY4pkTAlEetwn5zGrIe54BoAEyvyHDTYcW
	 lYpM6KsKWBne72je8OY1wf8cbTfmf2ldY7C+d37HOw3kYsbJCo/GD4giQWylrmE8BO
	 Ch5oF+Tew48KdAo7sb8tUTvDvIq0zsj06655IOfrQAHz0jOV8Ha0s+JogyufVo1wDc
	 z0buJVHmwDbofXFtxwEqlhMmOon3uNN8jqsH8/BCRMqwZIEwXnMlGVLM/0C72RA0DU
	 XzFMYWYNqtb9XX0wBamjkvYQggc9ov6coYCOBOYzeK3GtMPCpE9ya11k1XKuI3vWSJ
	 lMd4FUKwgiYpA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id bDhDK0MaTq1Z; Wed, 17 Dec 2025 04:21:52 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A53433D85179;
	Wed, 17 Dec 2025 04:21:51 -0500 (EST)
From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [PATCH 1/1] cockpit-machines: add recipe
Date: Wed, 17 Dec 2025 10:21:32 +0100
Message-Id: <20251217092132.18256-2-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217092132.18256-1-paul.leguendekerneizon@savoirfairelinux.com>
References: <20251217092132.18256-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 09:21:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9489

`cockpit-machines` is a Cockpit plugin used to provide a web interface
to manage virtual machines. Since Cockpit version 242, cockpit-machines
has been moved to a dedicated repository.

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 .../cockpit-machines/cockpit-machines_346.bb  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 recipes-extended/cockpit-machines/cockpit-machines_34=
6.bb

diff --git a/recipes-extended/cockpit-machines/cockpit-machines_346.bb b/=
recipes-extended/cockpit-machines/cockpit-machines_346.bb
new file mode 100644
index 00000000..0bd532c4
--- /dev/null
+++ b/recipes-extended/cockpit-machines/cockpit-machines_346.bb
@@ -0,0 +1,30 @@
+# Copyright (C) 2024-2025 Savoir-faire Linux, Inc
+
+SUMMARY =3D "Cockpit UI for virtual machines"
+DESCRIPTION =3D "Cockpit-machines provides a user interface to manage vi=
rtual machines"
+
+BUGTRACKER =3D "github.com/cockpit-project/cockpit-machines/issues"
+
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+DEPENDS +=3D "cockpit"
+
+SRC_URI =3D "https://github.com/cockpit-project/cockpit-machines/release=
s/download/${PV}/cockpit-machines-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "c9d80357da2bf3ecda9698f0dc6fcb46675b3b76da9150a2=
2178071fe982fcb0"
+
+S =3D "${WORKDIR}/${PN}"
+
+inherit autotools-brokensep features_check gettext
+
+COMPATIBLE_HOST:libc-musl =3D "null"
+
+RDEPENDS:${PN} +=3D "cockpit libvirt-dbus pciutils virt-manager-install"
+
+REQUIRED_DISTRO_FEATURES =3D "systemd pam"
+
+# Default installation path of cockpit-machines is /usr/local/
+FILES:${PN} =3D "\
+    ${prefix}/local/ \
+    ${datadir}/metainfo/org.cockpit-project.cockpit-machines.metainfo.xm=
l \
+"
--=20
2.34.1


