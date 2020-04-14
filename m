Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.6564.1586847181659171045
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 23:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03E6r1a0025599
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2020 23:53:01 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Apr 2020
 23:52:47 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/3] cni: mark as incompatible with mips for 0.7.1 version
Date: Mon, 13 Apr 2020 23:52:45 -0700
Message-ID: <20200414065247.57911-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 03E6r1a0025599
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Chen Qi <Qi.Chen@windriver.com>

Issue: LINUXEXEC-6667

This version does not build successfully for mips. So mark
it as incompatible to make things clear.

(LOCAL REV: NOT UPSTREAM) =E2=80=93- wrlinux specific

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/cni/cni_0.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-networking/cni/cni_0.7.1.bb b/recipes-networking/cni=
/cni_0.7.1.bb
index fdcc084..a37d0c3 100644
--- a/recipes-networking/cni/cni_0.7.1.bb
+++ b/recipes-networking/cni/cni_0.7.1.bb
@@ -27,6 +27,8 @@ GO_IMPORT =3D "import"
=20
 PV =3D "0.7.1"
=20
+COMPATIBLE_HOST_mips =3D "null"
+
 inherit go
 inherit goarch
=20
--=20
2.21.0

