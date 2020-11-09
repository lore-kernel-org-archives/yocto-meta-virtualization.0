Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.8832.1604911603091532701
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 00:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 80B3038C08DD
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 00:46:42 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,463,1596470400"; 
   d="scan'208";a="101087711"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 16:46:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BB2B94CE3B67
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 16:46:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 16:46:16 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 2/2] python3-pecan: upgrade 1.3.3 -> 1.4.0
Date: Mon, 9 Nov 2020 16:46:14 +0800
Message-ID: <1604911574-65708-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BB2B94CE3B67.A24AF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-pecan_1.3.3.bb       | 2 --
 .../python/{python-pecan.inc => python3-pecan_1.4.0.bb}  | 9 ++++++---
 2 files changed, 6 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb
 rename meta-openstack/recipes-devtools/python/{python-pecan.inc => python3-pecan_1.4.0.bb} (56%)

diff --git a/meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb b/meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb
deleted file mode 100644
index 2e6a223e..00000000
--- a/meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-pecan.inc
diff --git a/meta-openstack/recipes-devtools/python/python-pecan.inc b/meta-openstack/recipes-devtools/python/python3-pecan_1.4.0.bb
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-pecan.inc
rename to meta-openstack/recipes-devtools/python/python3-pecan_1.4.0.bb
index 884ce753..ff457d69 100644
--- a/meta-openstack/recipes-devtools/python/python-pecan.inc
+++ b/meta-openstack/recipes-devtools/python/python3-pecan_1.4.0.bb
@@ -4,13 +4,16 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
 
-SRC_URI[md5sum] = "8f006ed860f7fbdf0c0bf5ad0cf2f3b4"
-SRC_URI[sha256sum] = "b5461add4e3f35a7ee377b3d7f72ff13e93f40f3823b3208ab978b29bde936ff"
+SRC_URI[md5sum] = "70667908b648043bc8a3fcb7d1e4d53a"
+SRC_URI[sha256sum] = "4b2acd6802a04b59e306d0a6ccf37701d24376f4dc044bbbafba3afdf9d3389a"
 
-inherit pypi
+inherit setuptools3 pypi
 
 RDEPENDS_${PN} = "${PYTHON_PN}-mako \
                   ${PYTHON_PN}-webtest \
                   ${PYTHON_PN}-six \
                   ${PYTHON_PN}-logutils \
+                  ${PYTHON_PN}-numbers \
+                  ${PYTHON_PN}-backlash \
+                  ${PYTHON_PN}-pprint \
 "
-- 
2.25.1



