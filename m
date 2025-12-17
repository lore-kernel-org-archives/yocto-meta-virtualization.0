Return-Path: <paul.leguendekerneizon@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5FFD65C6F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:35:37 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17787.1765985734816202495
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 07:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=XbvGIQuP;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E63E23D84821
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 10:35:33 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Hkm9D1Nw6Urg; Wed, 17 Dec 2025 10:35:33 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1BAFF3D836A2;
	Wed, 17 Dec 2025 10:35:33 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 1BAFF3D836A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1765985733; bh=KwwQP5vqeU6GVZ95E+y012vVLC+G/ZHuTmOcHEqua3Q=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=XbvGIQuP+IEp/BJuS83+DWjG/u42oSc2xB0fpe0z9aenL9LHL2O1ci0+adFPn/WDn
	 DH/9XTOoKMJg5307cgCGyrpQxeW+zvtbwRjkiwNukPTU/bdxvf1raHtSo8R43kU3lM
	 n9uiZtJ/phWbYq6ZuDjwyB95sPIpoSDp6MsN+j+FBB3SGjF1zq5Vd4vAtrOVjjWunU
	 euXJvKueqEcZaUCKJCaWWZSc/Nv2n4K4kURQoHi6Gho+5s3UacayBxdyVj1sFKDtSo
	 5flUn334mv+F+33p0Oz62X/Tgd4JQpd+L4nqmICdiONPUqYOQ5sF4sUZs1bWtRP3ZC
	 wz0V7oT5hzPyQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 6AQN8IoEP_-X; Wed, 17 Dec 2025 10:35:33 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 9FB713D85347;
	Wed, 17 Dec 2025 10:35:32 -0500 (EST)
From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [PATCH v2 1/1] cockpit-machines: add recipe
Date: Wed, 17 Dec 2025 16:35:21 +0100
Message-Id: <20251217153521.51439-2-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217153521.51439-1-paul.leguendekerneizon@savoirfairelinux.com>
References: <20251217153521.51439-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 15:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9492

`cockpit-machines` is a Cockpit plugin used to provide a web interface
to manage virtual machines. Since Cockpit version 242, cockpit-machines
has been moved to a dedicated repository. This package is dependent on
cockpit package from meta-webserver layer.

To test it, access the cockpit-machines UI on the tested target at
`https://127.0.0.1:9090/machines`.

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 conf/layer.conf                               |  4 ++-
 .../cockpit-machines/cockpit-machines_346.bb  | 31 +++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/cockpit-machines/cockpit-machines_34=
6.bb

diff --git a/conf/layer.conf b/conf/layer.conf
index dbe66d8c..5ec45ee0 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -30,7 +30,9 @@ LAYERDEPENDS_virtualization-layer =3D " \
     meta-python \
 "

-# webserver: naigos requires apache2
+# webserver:
+# - naigos requires apache2
+# - cockpit-machines requires cockpit
 LAYERRECOMMENDS_virtualization-layer =3D " \
     webserver \
     selinux \
diff --git a/recipes-extended/cockpit-machines/cockpit-machines_346.bb b/=
recipes-extended/cockpit-machines/cockpit-machines_346.bb
new file mode 100644
index 00000000..feb7a97a
--- /dev/null
+++ b/recipes-extended/cockpit-machines/cockpit-machines_346.bb
@@ -0,0 +1,31 @@
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
+# systemd, which cockpit is dependent, is not compatible with musl lib
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
--
2.34.1

