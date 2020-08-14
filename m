Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.20578.1597419941542093501
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 08:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07EFjeeA017479
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Aug 2020 08:45:40 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 14 Aug 2020
 08:45:39 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 7F34E20063;
 Fri, 14 Aug 2020 11:45:39 -0400 (EDT)
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [meta-virtualization][PATCH] ceph: fix do_compile error: 'sys_siglist' was not declared
Date: Fri, 14 Aug 2020 11:45:28 -0400
Message-ID: <20200814154528.18891-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

glibc 2.32 has deprecated sys_siglist, oe-core commit
7c19f30849e9a73a7497d8e6c4719a2e57017086, causing ceph
build to fail with error:

ceph-15.2.0/src/global/signal_handler.h:24:26: error: 'sys_siglist' was
not declared

ceph has support for using reentrant strsignal, hence use it.
See commit 82c40b67f5843162a93ebb2c1a006572d8f256a5 in upstream ceph.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 recipes-extended/ceph/ceph_15.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
index 9423faa..223a74e 100644
--- a/recipes-extended/ceph/ceph_15.2.0.bb
+++ b/recipes-extended/ceph/ceph_15.2.0.bb
@@ -73,6 +73,7 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
                  -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 \
                  -DPython3_EXECUTABLE=${PYTHON} \
                  -DWITH_RADOSGW_KAFKA_ENDPOINT=OFF \
+                 -DWITH_REENTRANT_STRSIGNAL=ON \
 "
 
 export STAGING_DIR_HOST
-- 
2.26.2

