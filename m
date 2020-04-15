Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.18759.1586969555870697235
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 09:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03FGqXiQ018704
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Apr 2020 09:52:34 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 15 Apr 2020
 09:52:33 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 9CDAE9007E8;
 Wed, 15 Apr 2020 09:52:33 -0700 (PDT)
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] nagios-nrpe: uprev v3.2.1 => v4.0.2
Date: Wed, 15 Apr 2020 09:52:11 -0700
Message-ID: <20200415165211.8405-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../{nagios-nrpe_3.2.1.bb => nagios-nrpe_4.0.2.bb}       | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename recipes-extended/nagios/{nagios-nrpe_3.2.1.bb => nagios-nrpe_4.0.2.bb} (85%)

diff --git a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
similarity index 85%
rename from recipes-extended/nagios/nagios-nrpe_3.2.1.bb
rename to recipes-extended/nagios/nagios-nrpe_4.0.2.bb
index 9e1f02c..c8875fc 100644
--- a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
+++ b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
@@ -1,7 +1,7 @@
 require nagios-common.inc
 
 DESCRIPTION = "Nagios Remote Plugin Executor"
-HOMEPAGE = "http://exchange.nagios.org"
+HOMEPAGE = "http://www.nagios.com"
 SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
@@ -15,8 +15,11 @@ SRC_URI = "https://github.com/NagiosEnterprises/nrpe/releases/download/${SRCNAME
            file://nagios-nrpe.service \
 "
 
-SRC_URI[md5sum] = "8997e195fea93cdceb8c7ed8ac1d43bc"
-SRC_URI[sha256sum] = "8ad2d1846ab9011fdd2942b8fc0c99dfad9a97e57f4a3e6e394a4ead99c0f1f0"
+SRC_URI[md5sum] = "37b9e23b3e8d75308f8b31f3b61ee8a4"
+SRC_URI[sha256sum] = "c5d9d7023eaa49e6fe8cf95c6d101731f07972cf0f8818fa130c171bc9eabd55"
+SRC_URI[sha1sum] = "2150e274fc7f24905c63b8a996ed7218e2967478"
+SRC_URI[sha384sum] = "0ece79fb312c8d1ee0e6bde1be499f8090a5a86cf90b0b8dcbebb95c5f8f70b2cf9ac0a4064f726bee091c4147b61d82"
+SRC_URI[sha512sum] = "4d7cf6abc974bc79df54afc42644418e3f086a279c8c17d0fd104f19e3c21c0f3dae4fb4268dd134446ff9fe505159b0446372c5cac71cfe03a97479ed41c09b"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.24.1

