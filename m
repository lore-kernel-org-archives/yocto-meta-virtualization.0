Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.16250.1584541307005862237
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Mar 2020 07:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: daniel.dragomir@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02IELk1i010908
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Mar 2020 07:21:46 -0700 (PDT)
Received: from otp-ps-s1.wrs.com (128.224.124.60) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 18 Mar 2020
 07:21:45 -0700
From: "Daniel Dragomir" <Daniel.Dragomir@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] go-build: drop distro_features_check
Date: Wed, 18 Mar 2020 16:12:30 +0000
Message-ID: <20200318161231.62892-1-Daniel.Dragomir@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Replace distro_features_check bbclass which is deprecated, with
features_check bbclass.

Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
---
 recipes-devtools/go/go-build_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/go-build_git.bb
index 4ea800f..c11ad99 100644
--- a/recipes-devtools/go/go-build_git.bb
+++ b/recipes-devtools/go/go-build_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=945fc9aa694796a6337395cc291ddd
 S = "${WORKDIR}/git"
 PV = "0.1-git${SRCREV_runx}"
 
-inherit distro_features_check
+inherit features_check
 REQUIRED_DISTRO_FEATURES = "vmsep"
 
 inherit pkgconfig
-- 
2.17.1

