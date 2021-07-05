Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.6363.1625455477167358312
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Jul 2021 20:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1653OacX014695
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 4 Jul 2021 20:24:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1653OZTq012001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 4 Jul 2021 20:24:35 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 4 Jul 2021 20:24:35 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Sun, 4 Jul 2021 20:24:34 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] Revert "nagios-nsca: blacklist recipe due to unsupported libmcrypt"
Date: Mon, 5 Jul 2021 11:24:33 +0800
Message-ID: <20210705032433.28402-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The libmcrypt build issue has been fixed by oe

This reverts commit e7a0ea3e0fc43f6c2ec8fee70ec1315014ffbec1.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/nagios/nagios-nsca_2.9.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-extended/nagios/nagios-nsca_2.9.2.bb b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
index 1fce1983..fd45d84c 100644
--- a/recipes-extended/nagios/nagios-nsca_2.9.2.bb
+++ b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
@@ -84,5 +84,3 @@ SYSTEMD_AUTO_ENABLE_${PN}-daemon = "enable"
 INITSCRIPT_PACKAGES = "${PN}-daemon"
 INITSCRIPT_NAME_${PN}-daemon = "nsca"
 INITSCRIPT_PARAMS_${PN}-daemon = "defaults"
-
-PNBLACKLIST[nagios-nsca] ?= "Depends on libmcrypt, which is considered abandonware"
-- 
2.27.0

