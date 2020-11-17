Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.3564.1605586534308872621
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 20:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id C09CE38C0836
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 04:15:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,484,1596470400"; 
   d="scan'208";a="101443898"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Nov 2020 12:15:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F4324CE5059
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 12:15:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Nov 2020 12:15:28 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-enum: Remove recipe
Date: Wed, 18 Nov 2020 00:15:28 +0800
Message-ID: <1605629728-107698-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3F4324CE5059.A1FBD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Important

Superseded by Python standard library.

Python 3 now has in its standard library an enum implementation (also available for older Python versions as the third-party enum34 distribution) that supersedes this library.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
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



