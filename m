Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1605.1603176691853230228
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5ECFA38C0694
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:51:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322377"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:51:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B0EBF48990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:51:24 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:51:23 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-rcssmin: Consolidate in a single file
Date: Tue, 20 Oct 2020 14:51:22 +0800
Message-ID: <1603176682-40793-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B0EBF48990CC.A468E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-rcssmin.inc  | 15 ---------------
 .../python/python3-rcssmin_1.0.6.bb             | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-rcssmin.inc

diff --git a/meta-openstack/recipes-devtools/python/python-rcssmin.inc b/meta-openstack/recipes-devtools/python/python-rcssmin.inc
deleted file mode 100644
index c897395..0000000
--- a/meta-openstack/recipes-devtools/python/python-rcssmin.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "RCSSmin is a CSS minifier."
-HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-
-SRC_URI[md5sum] = "467d56503ce386c0b0e52f69ac143a9a"
-SRC_URI[sha256sum] = "ca87b695d3d7864157773a61263e5abb96006e9ff0e021eff90cbe0e1ba18270"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-        "
-
-CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb b/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb
index 56347b5..7409cdc 100644
--- a/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb
@@ -1,2 +1,15 @@
-require python-rcssmin.inc
-inherit setuptools3
+DESCRIPTION = "RCSSmin is a CSS minifier."
+HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[md5sum] = "467d56503ce386c0b0e52f69ac143a9a"
+SRC_URI[sha256sum] = "ca87b695d3d7864157773a61263e5abb96006e9ff0e021eff90cbe0e1ba18270"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += " \
+        "
+
+CLEANBROKEN = "1"
-- 
2.25.1



