Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.6563.1586847176116934956
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 23:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03E6qsTb029881
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2020 23:52:55 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Apr 2020
 23:52:54 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/2] ceph: fix installed-vs-shipped QA issue
Date: Mon, 13 Apr 2020 23:52:53 -0700
Message-ID: <20200414065254.64863-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

...
|ERROR: ceph-15.2.0-r0 do_package: QA Issue: ceph: Files/directories
were installed but not shipped in any package:
|  /lib/systemd/system/ceph-immutable-object-cache@.service
|  /lib/systemd/system/ceph-immutable-object-cache.target
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/ceph/ceph_15.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
index 2b7b2c1..1893086 100644
--- a/recipes-extended/ceph/ceph_15.2.0.bb
+++ b/recipes-extended/ceph/ceph_15.2.0.bb
@@ -43,6 +43,8 @@ SYSTEMD_SERVICE_${PN} = " \
         ceph-mgr.target \
         ceph-crash.service \
         rbdmap.service \
+        ceph-immutable-object-cache@.service \
+        ceph-immutable-object-cache.target \
 "
 OECMAKE_GENERATOR = "Unix Makefiles"
 
-- 
2.21.0

