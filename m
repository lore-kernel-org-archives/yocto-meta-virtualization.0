Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.42944.1624254070883478033
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Jun 2021 22:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 15L5f9hH012746
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Jun 2021 22:41:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 15L5f8CM029652
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Jun 2021 22:41:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 20 Jun 2021 22:41:08 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Sun, 20 Jun 2021 22:41:07 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] conmon: switch to main branch
Date: Mon, 21 Jun 2021 13:40:46 +0800
Message-ID: <20210621054046.15518-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Switch to main branch to fix do_fetch error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-containers/conmon/conmon_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/conmon/conmon_git.bb b/recipes-containers/conmon/conmon_git.bb
index 74f5bfa..974eb07 100644
--- a/recipes-containers/conmon/conmon_git.bb
+++ b/recipes-containers/conmon/conmon_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 go-md2man-native"
 
 SRCREV = "31614525ebc5fd9668a6e084b5638d71b903bf6d"
 SRC_URI = "\
-    git://github.com/containers/conmon.git \
+    git://github.com/containers/conmon.git;branch=main \
 "
 
 PV = "2.0.28+git${SRCPV}"
-- 
2.29.2

