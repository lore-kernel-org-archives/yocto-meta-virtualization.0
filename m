Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.53857.1594025217995034746
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 01:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D66B7E01E0A; Mon,  6 Jul 2020 01:46:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8834E01E06
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 01:46:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; 
   d="scan'208";a="95817555"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 16:46:55 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D3DE4CE4BDE
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 16:46:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 16:46:54 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-croniter: Remove recipe
Date: Mon, 6 Jul 2020 16:46:48 +0800
Message-ID: <1594025208-53366-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4D3DE4CE4BDE.A9502
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

This recipe already exists in meta-openembedded, the path is:
meta-openembedded/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-croniter.inc                | 19 -------------------
 .../python/python3-croniter_0.3.30.bb         |  2 --
 2 files changed, 21 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-croniter.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb

diff --git a/meta-openstack/recipes-devtools/python/python-croniter.inc b/meta-openstack/recipes-devtools/python/python-croniter.inc
deleted file mode 100644
index 885aa9e..0000000
--- a/meta-openstack/recipes-devtools/python/python-croniter.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "croniter provides iteration for datetime object with cron like format"
-HOMEPAGE = "https://pypi.python.org/pypi/croniter/0.3.4"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
-
-# Archived version so we have to overwrite what the pypi class will derive
-PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "e4a8987521b144c4c2149d4adde8f55c"
-SRC_URI[sha256sum] = "538adeb3a7f7816c3cdec6db974c441620d764c25ff4ed0146ee7296b8a50590"
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        ${PYTHON_PN}-dateutil \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb b/meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb
deleted file mode 100644
index 6ec5a00..0000000
--- a/meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3 pypi
-require python-croniter.inc
-- 
2.17.1



