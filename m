Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.2268.1615337428064401846
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 16:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12A0oBRY019799
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 9 Mar 2021 16:50:17 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 16:50:11 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 9 Mar 2021 16:50:10 -0800
From: "Changqing Li" <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] nagios-core: update RDEPENDS
Date: Wed, 10 Mar 2021 08:50:09 +0800
Message-ID: <20210310005009.23279-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix following error during do_rootfs:
nothing provides php needed by nagios-core-4.4.6-r0.corei7_64
(try to add '--skip-broken' to skip uninstallable packages)

Since commit c4ffcaa2 [php: split out phpdbg into a separate package],
package php is empty.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-extended/nagios/nagios-core_4.4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/nagios/nagios-core_4.4.6.bb b/recipes-extended/nagios/nagios-core_4.4.6.bb
index 4cbec2b..8bcd6c0 100644
--- a/recipes-extended/nagios/nagios-core_4.4.6.bb
+++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
@@ -34,7 +34,7 @@ RDEPENDS_${PN} += "\
     libpng \
     fontconfig \
     apache2 \
-    php \
+    php-cli \
     nagios-base \
 "
 
-- 
2.17.1

