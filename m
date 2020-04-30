Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1068.1588290542100329040
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 16:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03UNmFou010619
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Apr 2020 16:48:51 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Apr 2020
 16:48:16 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id ACDB7900506;
 Thu, 30 Apr 2020 16:48:16 -0700 (PDT)
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] nagios-nrpe: Fix CVE-2020-6581
Date: Thu, 30 Apr 2020 16:48:15 -0700
Message-ID: <20200430234815.133152-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport fix for CVE-2020-6581

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...asty_metachars-was-not-being-returne.patch | 30 +++++++++++++++++++
 recipes-extended/nagios/nagios-nrpe_4.0.2.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch

diff --git a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch
new file mode 100644
index 0000000..7a12e73
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch
@@ -0,0 +1,30 @@
+From 4f7dd1199f1f3f72f9197e8565da339a4a2490b7 Mon Sep 17 00:00:00 2001
+From: madlohe <swolf@nagios.com>
+Date: Thu, 23 Apr 2020 15:33:18 -0500
+Subject: [PATCH] Should fix #235 (nasty_metachars was not being returned when
+ specified in cfg file
+
+CVE: CVE-2020-6581
+Upstream Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/nrpe.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/nrpe.c b/src/nrpe.c
+index 01fbd1d..bf64963 100644
+--- a/src/nrpe.c
++++ b/src/nrpe.c
+@@ -823,6 +823,8 @@ char* process_metachars(const char* input)
+ 		}
+ 	}
+ 	copy[j] = '\0';
++
++	return copy;
+ }
+ 
+ /* read in the configuration file */
+-- 
+2.20.1
+
diff --git a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
index c8875fc..d9c7b15 100644
--- a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
+++ b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
@@ -13,6 +13,7 @@ SRCNAME = "nrpe"
 SRC_URI = "https://github.com/NagiosEnterprises/nrpe/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.gz \
            file://check_nrpe.cfg \
            file://nagios-nrpe.service \
+           file://0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch \
 "
 
 SRC_URI[md5sum] = "37b9e23b3e8d75308f8b31f3b61ee8a4"
-- 
2.24.1

