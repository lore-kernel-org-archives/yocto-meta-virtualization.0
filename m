Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1555.1603176289916624671
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5565A38C0694
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:44:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322130"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:44:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id BA8C44CE1A07
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:44:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:44:46 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-webtest: upgrade 2.0.33 -> 2.0.35
Date: Tue, 20 Oct 2020 14:44:45 +0800
Message-ID: <1603176285-40793-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: BA8C44CE1A07.A9C9B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python3-webtest_2.0.33.bb                 |  2 --
 ...{python-webtest.inc => python3-webtest_2.0.35.bb} | 12 ++++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb
 rename meta-openstack/recipes-devtools/python/{python-webtest.inc => python3-webtest_2.0.35.bb} (55%)

diff --git a/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb b/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb
deleted file mode 100644
index aaf0b42..0000000
--- a/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3 pypi
-require python-webtest.inc
diff --git a/meta-openstack/recipes-devtools/python/python-webtest.inc b/meta-openstack/recipes-devtools/python/python3-webtest_2.0.35.bb
similarity index 55%
rename from meta-openstack/recipes-devtools/python/python-webtest.inc
rename to meta-openstack/recipes-devtools/python/python3-webtest_2.0.35.bb
index d4e9e07..5fd4f5a 100644
--- a/meta-openstack/recipes-devtools/python/python-webtest.inc
+++ b/meta-openstack/recipes-devtools/python/python3-webtest_2.0.35.bb
@@ -8,5 +8,13 @@ PYPI_PACKAGE = "WebTest"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-beautifulsoup4"
 
-SRC_URI[md5sum] = "dd0385c725b85ac1e8079f38d2acd7b1"
-SRC_URI[sha256sum] = "41348efe4323a647a239c31cde84e5e440d726ca4f449859264e538d39037fd0"
+SRC_URI[md5sum] = "a5d027ffa0991fdf20e305c62bd37791"
+SRC_URI[sha256sum] = "aac168b5b2b4f200af4e35867cf316712210e3d5db81c1cbdff38722647bb087"
+
+RDEPENDS_${PN} += " \
+	python3-html \
+	python3-logging \
+	python3-webob \
+"
+
+inherit setuptools3 pypi
-- 
2.25.1



