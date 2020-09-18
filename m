Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8946.1600420854354753372
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8BBA838C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:20:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403781"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:20:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 220064CE34D6
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:20:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:20:52 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-kafka: upgrade 1.4.7 -> 2.0.1
Date: Sat, 19 Sep 2020 05:20:55 +0800
Message-ID: <1600464055-31349-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 220064CE34D6.AF2FB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-kafka.inc  | 23 ----------------
 .../python/python3-kafka_git.bb               | 26 ++++++++++++++++++-
 2 files changed, 25 insertions(+), 24 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-kafka.inc

diff --git a/meta-openstack/recipes-devtools/python/python-kafka.inc b/meta-openstack/recipes-devtools/python/python-kafka.inc
deleted file mode 100644
index 0b360c1..0000000
--- a/meta-openstack/recipes-devtools/python/python-kafka.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Python client for Apache Kafka"
-HOMEPAGE = "https://github.com/mumrah/kafka-python"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-
-PV = "1.4.7+git${SRCPV}"
-SRCREV = "0552b04326c73be29f209c12920ef4cbaceb9818"
-
-SRCNAME = "kafka-python"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=22efebb1e053dcc946f4b9d17f3cbbea"
-SRC_URI = "git://github.com/mumrah/${SRCNAME}.git"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += " \
-	${PYTHON_PN}-pbr \
-	"
-
-RDEPENDS_${PN} += " \
-        ${PYTHON_PN}-six \
-	"
-
diff --git a/meta-openstack/recipes-devtools/python/python3-kafka_git.bb b/meta-openstack/recipes-devtools/python/python3-kafka_git.bb
index 55c9fcb..4fa5c2f 100644
--- a/meta-openstack/recipes-devtools/python/python3-kafka_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-kafka_git.bb
@@ -1,3 +1,27 @@
-require python-kafka.inc
+SUMMARY = "Python client for Apache Kafka"
+HOMEPAGE = "https://github.com/mumrah/kafka-python"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+
+PV = "2.0.1+git${SRCPV}"
+SRCREV = "fcc9a30c62662cee7aa2c1f69c0d06a9741e2700"
+
+SRCNAME = "kafka-python"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22efebb1e053dcc946f4b9d17f3cbbea"
+SRC_URI = "git://github.com/mumrah/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
 inherit setuptools3
 
+DEPENDS += " \
+	${PYTHON_PN}-pbr \
+	"
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-six \
+        ${PYTHON_PN}-logging \
+        ${PYTHON_PN}-compression \
+	"
+
-- 
2.25.1



