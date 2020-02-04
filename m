Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.946.1580783927219357021
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 Feb 2020 18:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0142cjiI013997
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 3 Feb 2020 18:38:46 -0800 (PST)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0; Mon, 3 Feb 2020
 18:38:32 -0800
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] glusterfs: change pythnon2 dependencies to python3 ones
Date: Mon, 3 Feb 2020 18:38:32 -0800
Message-ID: <20200204023832.59416-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Change python2 deps to python3 ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/glusterfs/glusterfs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 4eb325f1..a5677840 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -119,7 +119,7 @@ INSANE_SKIP_${PN}-server += "dev-so"
 PACKAGES += "${PN}-rdma ${PN}-geo-replication ${PN}-fuse ${PN}-server \
              ${PN}-api ${PN}-ocf"
 
-RDEPENDS_${PN} += "python3-core python-json python-ctypes bash"
+RDEPENDS_${PN} += "python3-core python3-json python3-ctypes bash"
 RDEPENDS_${PN}-ocf += "bash"
 RDEPENDS_${PN}-server += "bash"
 RDEPENDS_${PN}-geo-replication += "python3-core bash"
-- 
2.21.0

