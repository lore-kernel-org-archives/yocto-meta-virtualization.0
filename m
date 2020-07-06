Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.53705.1594025249356541015
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 01:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A39AE01E0A; Mon,  6 Jul 2020 01:47:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,PDS_BTC_ID,
	RCVD_IN_DNSWL_MED,TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  0.5 PDS_BTC_ID FP reduced Bitcoin ID
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9D93E01E06
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 01:47:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; 
   d="scan'208";a="95817593"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 16:47:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 230BF4CE5057
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 16:47:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 16:47:20 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-coverage: Remove recipe
Date: Mon, 6 Jul 2020 16:47:18 +0800
Message-ID: <1594025238-53404-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 230BF4CE5057.A5B72
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

This recipe already exists in meta-openembedded, the path is:
meta-openembedded/meta-python/recipes-devtools/python/python3-coverage_5.1.bb

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-coverage.inc                 | 18 ------------------
 .../python/python3-coverage_4.0a5.bb           |  2 --
 2 files changed, 20 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-coverage.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-coverage.inc b/meta-openstack/recipes-devtools/python/python-coverage.inc
deleted file mode 100644
index f1c5022..0000000
--- a/meta-openstack/recipes-devtools/python/python-coverage.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-DESCRIPTION = "Code coverage measurement for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/coverage"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
-
-SRC_URI[md5sum] = "37f4d8ae679b2c43a87da8d519817a3b"
-SRC_URI[sha256sum] = "07a36ac3c82f5961c45565fd5575b4c568a8fc59e8d5d29a5b04dc8597a07e0e"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
diff --git a/meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb b/meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb
deleted file mode 100644
index 917a06c..0000000
--- a/meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-coverage.inc
-inherit setuptools3
-- 
2.17.1



