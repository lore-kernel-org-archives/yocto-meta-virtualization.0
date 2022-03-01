Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DAAC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:52:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7203.1646135571709318203
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 03:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B6BAED1
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue,  1 Mar 2022 03:52:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA1123F70D
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue,  1 Mar 2022 03:52:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] python3-dtc: fix missing files in sysroot
Date: Tue,  1 Mar 2022 11:52:48 +0000
Message-Id: <20220301115248.1782156-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Mar 2022 11:52:52 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7069

There is a bug in SWIG/setuptools where 'pip install' doesn't build
libfdt.py unless the build tree is already dirty, which makes using
the library impossible.

Bump the SRCREV to incorporate the upstream workaround for this issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-kernel/dtc/python3-dtc_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc=
/python3-dtc_1.6.1.bb
index 671d280..a868bd0 100644
--- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
+++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
@@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 LIC_FILES_CHKSUM =3D "file://pylibfdt/libfdt.i;beginline=3D1;endline=3D6=
;md5=3Dafda088c974174a29108c8d80b5dce90"
=20
-SRCREV =3D "4048aed12b81c5a0154b9af438edc99ec7d2b6a1"
+SRCREV =3D "c001fc01a43e7a06447c06ea3d50bd60641322b8"
=20
 PV =3D "1.6.1+git${SRCPV}"
 S =3D "${WORKDIR}/git"
--=20
2.25.1


