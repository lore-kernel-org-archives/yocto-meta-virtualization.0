Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.53742.1594025205831605956
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 01:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6138EE01E0A; Mon,  6 Jul 2020 01:46:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E52BE01E06
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 01:46:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; 
   d="scan'208";a="95817531"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 16:46:41 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EEA114CE4BDE
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 16:46:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 16:46:38 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-colorama: Remove recipe
Date: Mon, 6 Jul 2020 16:46:35 +0800
Message-ID: <1594025195-53329-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: EEA114CE4BDE.AB237
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

This recipe already exists in meta-openembedded, the path is:
meta-openembedded/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-colorama.inc                 | 18 ------------------
 .../python/python3-colorama_0.4.1.bb           |  3 ---
 2 files changed, 21 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-colorama.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-colorama_0.4.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-colorama.inc b/meta-openstack/recipes-devtools/python/python-colorama.inc
deleted file mode 100644
index 4b5dc79..0000000
--- a/meta-openstack/recipes-devtools/python/python-colorama.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-DESCRIPTION = "Simple cross-platform colored terminal text in Python"
-HOMEPAGE = "http://pypi.python.org/pypi/colorama"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
-
-SRC_URI[md5sum] = "f927529cd1735f6f50ee2c61628e9c1f"
-SRC_URI[sha256sum] = "05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d"
-
-inherit pypi
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
diff --git a/meta-openstack/recipes-devtools/python/python3-colorama_0.4.1.bb b/meta-openstack/recipes-devtools/python/python3-colorama_0.4.1.bb
deleted file mode 100644
index 89c2fea..0000000
--- a/meta-openstack/recipes-devtools/python/python3-colorama_0.4.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require python-colorama.inc
-inherit setuptools3
-
-- 
2.17.1



