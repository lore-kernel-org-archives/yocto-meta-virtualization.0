Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.31047.1606110216150085972
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id A288A38C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:43:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101645325"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:43:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 097AD4CE5464
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:43:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:43:27 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-enum: Remove recipe
Date: Mon, 23 Nov 2020 22:43:08 +0800
Message-ID: <1606142588-3870-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 097AD4CE5464.A55DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Superseded by Python standard library.

Python 3 now has in its standard library an enum implementation (also available for older Python versions as the third-party enum34 distribution) that supersedes this library.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-enum_0.4.4.bb               | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb b/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
deleted file mode 100644
index 4eb1ed5a..00000000
--- a/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Robust enumerated type support in Python"
-DESCRIPTION = "This package provides a module for robust enumerations in Python."
-HOMEPAGE = "https://pypi.python.org/pypi/enum"
-SECTION = "devel/python"
-LICENSE = "GPLv2 | PSFv2"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=4325afd396febcb659c36b49533135d4 \
-                    file://LICENSE.PSF;md5=1ad8a43fc3bbfea1585223c99f4c3e6f \
-"
-
-SRC_URI[md5sum] = "ce75c7c3c86741175a84456cc5bd531e"
-SRC_URI[sha256sum] = "9bdfacf543baf2350df7613eb37f598a802f346985ca0dc1548be6494140fdff"
-
-inherit setuptools3 pypi
-
-DEPENDS += " \
-        python-pip \
-"
-
-RDEPENDS_${PN} += " \
-"
-- 
2.25.1



