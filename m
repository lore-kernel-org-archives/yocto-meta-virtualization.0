Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.30347.1606108780234323892
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id A738038C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:19:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101644680"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:19:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AFE324CE5474
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:19:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:19:39 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-mox: Remove recipe
Date: Mon, 23 Nov 2020 23:00:43 +0800
Message-ID: <1606143643-97548-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AFE324CE5474.A3719
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

This package only supports python2.

New uses of this library are discouraged.

People are encouraged to use https://pypi.python.org/pypi/mock instead which matches the unittest.mock library available in Python 3.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-mox_0.5.3.bb   | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb b/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb
deleted file mode 100644
index bdd5fbee..00000000
--- a/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Mock object framework"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI[md5sum] = "6de7371e7e8bd9e2dad3fef2646f4a43"
-SRC_URI[sha256sum] = "424ee725ee12652802b4e86571f816059b0d392401ceae70bf6487d65602cba9"
-
-inherit distutils3 pypi
-
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
-- 
2.25.1



