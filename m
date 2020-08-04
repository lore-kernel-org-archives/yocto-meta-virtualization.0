Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.11357.1596508843469417167
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 Aug 2020 19:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5213EE01F81; Mon,  3 Aug 2020 19:40:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED,TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8B14E01F7D
	for <meta-virtualization@yoctoproject.org>; Mon,  3 Aug 2020 19:40:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,432,1589212800"; 
   d="scan'208";a="97568835"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Aug 2020 10:40:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 077AC4CE5449
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 10:40:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 4 Aug 2020 10:40:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-pika-pool: Remove python recipe
Date: Tue, 4 Aug 2020 22:40:31 +0800
Message-ID: <1596552033-78898-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596552033-78898-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596552033-78898-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 077AC4CE5449.A366D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-pika-pool.inc                 | 15 ---------------
 .../python/python-pika-pool_0.1.3.bb            |  2 --
 .../python/python3-pika-pool_0.1.3.bb           | 17 +++++++++++++++--
 3 files changed, 15 insertions(+), 19 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pika-pool.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pika-pool.inc b/meta-openstack/recipes-devtools/python/python-pika-pool.inc
deleted file mode 100644
index c87d744..0000000
--- a/meta-openstack/recipes-devtools/python/python-pika-pool.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "pools for your pikas"
-HOMEPAGE = "https://github.com/bninja/pika-pool"
-SECTION = "devel/python"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
-
-SRC_URI[md5sum] = "0a3897e991aa3da948e03660313c1980"
-SRC_URI[sha256sum] = "f3985888cc2788cdbd293a68a8b5702a9c955db6f7b8b551aeac91e7f32da397"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-pika \
-    "
diff --git a/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb b/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
deleted file mode 100644
index 049e521..0000000
--- a/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3 
-require python-pika-pool.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-pika-pool_0.1.3.bb b/meta-openstack/recipes-devtools/python/python3-pika-pool_0.1.3.bb
index 049e521..b9d36ec 100644
--- a/meta-openstack/recipes-devtools/python/python3-pika-pool_0.1.3.bb
+++ b/meta-openstack/recipes-devtools/python/python3-pika-pool_0.1.3.bb
@@ -1,2 +1,15 @@
-inherit setuptools3 
-require python-pika-pool.inc
+SUMMARY = "pools for your pikas"
+HOMEPAGE = "https://github.com/bninja/pika-pool"
+SECTION = "devel/python"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+SRC_URI[md5sum] = "0a3897e991aa3da948e03660313c1980"
+SRC_URI[sha256sum] = "f3985888cc2788cdbd293a68a8b5702a9c955db6f7b8b551aeac91e7f32da397"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pika \
+    "
-- 
2.25.1



