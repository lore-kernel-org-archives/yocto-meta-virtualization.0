Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12893.1634039816902865900
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 04:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03A401FB
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Oct 2021 04:56:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A27CD3F70D
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Oct 2021 04:56:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] xen: add missing pkgconfig inherit
Date: Tue, 12 Oct 2021 12:56:50 +0100
Message-Id: <20211012115650.960242-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

New oe-core pulls in less default dependencies[1], so add an explicit
inherit of pkgconfig as it is needed to configure Xen.

[1] https://lists.openembedded.org/g/openembedded-core/message/156185

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index c0a087e..d3c7a7d 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -2,7 +2,7 @@ HOMEPAGE =3D "http://xen.org"
 LICENSE =3D "GPLv2"
 SECTION =3D "console/tools"
=20
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
=20
 require xen-arch.inc
=20
--=20
2.25.1

