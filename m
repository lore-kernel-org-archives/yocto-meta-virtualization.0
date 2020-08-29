Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2651.1598661167059995700
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Aug 2020 17:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07T0WFhX030959
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Aug 2020 17:32:36 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 28 Aug 2020
 17:32:06 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 220DF20035;
 Fri, 28 Aug 2020 20:32:06 -0400 (EDT)
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] ceph: add missing include for atomic<bool>
Date: Fri, 28 Aug 2020 20:31:58 -0400
Message-ID: <20200829003158.3798-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

ceph do_compile failed with error:
src/tools/rbd/action/Bench.cc:20:26: error: aggregate 'std::atomic<bool>
terminating' has incomplete type and cannot be defined

Add missing include to fix it.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...-add-missing-include-for-atomic-bool.patch | 25 +++++++++++++++++++
 recipes-extended/ceph/ceph_15.2.0.bb          |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch

diff --git a/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch b/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
new file mode 100644
index 0000000..ffcbc58
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
@@ -0,0 +1,25 @@
+From 502be73be3c3645094525aa552f5e53d8782a004 Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Fri, 28 Aug 2020 19:36:19 -0400
+Subject: [PATCH] add missing include for atomic<bool>
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/tools/rbd/action/Bench.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/tools/rbd/action/Bench.cc b/src/tools/rbd/action/Bench.cc
+index aa6edbc1..90c551c1 100644
+--- a/src/tools/rbd/action/Bench.cc
++++ b/src/tools/rbd/action/Bench.cc
+@@ -9,6 +9,7 @@
+ #include "common/ceph_mutex.h"
+ #include "include/types.h"
+ #include "global/signal_handler.h"
++#include <atomic>
+ #include <iostream>
+ #include <boost/accumulators/accumulators.hpp>
+ #include <boost/accumulators/statistics/stats.hpp>
+-- 
+2.27.0
+
diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
index 223a74e..bdc794f 100644
--- a/recipes-extended/ceph/ceph_15.2.0.bb
+++ b/recipes-extended/ceph/ceph_15.2.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch \ 
            file://0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch \
            file://0003-PendingReleaseNotes-note-about-security-fix.patch \
+           file://0001-add-missing-include-for-atomic-bool.patch \
 "
 
 SRC_URI[md5sum] = "1f9af648b4c6d19975aab2583ab99710"
-- 
2.26.2

