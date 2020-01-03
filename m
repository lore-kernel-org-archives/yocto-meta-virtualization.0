Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3663.1578021039754256898
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jan 2020 19:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 140.211.169.56, mailfrom: qi.chen@windriver.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46447E013E7; Thu,  2 Jan 2020 19:10:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B62AEE008D9
	for <meta-virtualization@yoctoproject.org>; Thu,  2 Jan 2020 19:10:37 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0033AG5D004742
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Thu, 2 Jan 2020 19:10:27 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.468.0; Thu, 2 Jan 2020 19:10:06 -0800
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization][PATCH] ceph: backport patch to fix compilation failure of boost 1.72
Date: Fri, 3 Jan 2020 11:10:05 +0800
Message-ID: <20200103031005.847-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Backport a patch to fix compliation failure caused by boost upgrading
to 1.72.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...common-rgw-workaround-for-boost-1.72.patch | 62 +++++++++++++++++++
 recipes-extended/ceph/ceph_14.2.3.bb          |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch

diff --git a/recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch b/recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch
new file mode 100644
index 0000000..44bda1a
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch
@@ -0,0 +1,62 @@
+From ea64c4909ffeae10e5d8e0a23604030e8849f803 Mon Sep 17 00:00:00 2001
+From: Kefu Chai <kchai@redhat.com>
+Date: Mon, 23 Dec 2019 16:26:13 +0800
+Subject: [PATCH] common,rgw: workaround for boost 1.72
+
+see also https://github.com/boostorg/coroutine/issues/46
+
+will need to remove this change once we require boost >= 1.73
+
+Signed-off-by: Kefu Chai <kchai@redhat.com>
+
+Upstream-Status: Backport [https://github.com/ceph/ceph/commit/ea64c4909ffeae10e5d8e0a23604030e8849f803]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/common/async/yield_context.h | 2 ++
+ src/rgw/rgw_asio_frontend.cc     | 2 ++
+ src/test/librados/asio.cc        | 2 ++
+ 3 files changed, 6 insertions(+)
+
+diff --git a/src/common/async/yield_context.h b/src/common/async/yield_context.h
+index fda9541eb4..436192c02f 100644
+--- a/src/common/async/yield_context.h
++++ b/src/common/async/yield_context.h
+@@ -14,6 +14,8 @@
+ 
+ #pragma once
+ 
++#include <boost/range/begin.hpp>
++#include <boost/range/end.hpp>
+ #include <boost/asio/io_context.hpp>
+ 
+ #include "acconfig.h"
+diff --git a/src/rgw/rgw_asio_frontend.cc b/src/rgw/rgw_asio_frontend.cc
+index 7df74225f6..deab1b0c66 100644
+--- a/src/rgw/rgw_asio_frontend.cc
++++ b/src/rgw/rgw_asio_frontend.cc
+@@ -7,6 +7,8 @@
+ 
+ #include <boost/asio.hpp>
+ #define BOOST_COROUTINES_NO_DEPRECATION_WARNING
++#include <boost/range/begin.hpp>
++#include <boost/range/end.hpp>
+ #include <boost/asio/spawn.hpp>
+ #include <boost/intrusive/list.hpp>
+ 
+diff --git a/src/test/librados/asio.cc b/src/test/librados/asio.cc
+index 9c86ad420c..8fa4bab197 100644
+--- a/src/test/librados/asio.cc
++++ b/src/test/librados/asio.cc
+@@ -21,6 +21,8 @@
+ 
+ #ifdef HAVE_BOOST_CONTEXT
+ #define BOOST_COROUTINES_NO_DEPRECATION_WARNING
++#include <boost/range/begin.hpp>
++#include <boost/range/end.hpp>
+ #include <boost/asio/spawn.hpp>
+ #endif
+ #include <boost/asio/use_future.hpp>
+-- 
+2.17.1
+
diff --git a/recipes-extended/ceph/ceph_14.2.3.bb b/recipes-extended/ceph/ceph_14.2.3.bb
index 25a8ea2..b2bf220 100644
--- a/recipes-extended/ceph/ceph_14.2.3.bb
+++ b/recipes-extended/ceph/ceph_14.2.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://ceph.conf \
            file://0001-rgw-add-executor-type-for-basic_waitable_timers.patch \
            file://0001-rgw-beast-handle_connection-takes-io_context.patch \
+           file://0001-common-rgw-workaround-for-boost-1.72.patch \
 "
 SRC_URI[md5sum] = "e4a53270fba14bf34d0b4c2a2340042e"
 SRC_URI[sha256sum] = "63d0eddab80f7bcdd4e9ac86d2b36c6cc8c9e2d34f20e8e426ff1620d66748dd"
-- 
2.17.1

