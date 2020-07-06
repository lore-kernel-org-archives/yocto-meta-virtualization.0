Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.53752.1594024664542138382
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 01:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67C28E01E0A; Mon,  6 Jul 2020 01:37:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 042ECE01E06
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 01:37:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; 
   d="scan'208";a="95816836"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 16:36:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4F58A4CE4B3C
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 16:36:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 16:36:36 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-uritemplate: Remove recipe
Date: Mon, 6 Jul 2020 16:36:27 +0800
Message-ID: <1594024588-6636-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594024588-6636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1594024588-6636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4F58A4CE4B3C.A53B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

This recipe already exists in meta-openembedded, the path is:
/meta-openembedded/meta-python/recipes-devtools/python/python3-uritemplate_3.0.1.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-uritemplate.inc       | 9 ---------
 .../recipes-devtools/python/python3-uritemplate_3.0.0.bb | 2 --
 2 files changed, 11 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-uritemplate.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-uritemplate_3.0.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-uritemplate.inc b/meta-openstack/recipes-devtools/python/python-uritemplate.inc
deleted file mode 100644
index e0c53e7..0000000
--- a/meta-openstack/recipes-devtools/python/python-uritemplate.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Simple python library to deal with URI Templates."
-AUTHOR = "Ian Cordasco"
-LICENSE = "Apache-2.0 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f2e14cc8f5f696fd9d47092e992265c1"
-
-inherit pypi
-
-SRC_URI[md5sum] = "1ec31e0d8a2eec72357b2cef4bce5945"
-SRC_URI[sha256sum] = "c02643cebe23fc8adb5e6becffe201185bf06c40bda5c0b4028a93f1527d011d"
diff --git a/meta-openstack/recipes-devtools/python/python3-uritemplate_3.0.0.bb b/meta-openstack/recipes-devtools/python/python3-uritemplate_3.0.0.bb
deleted file mode 100644
index eac83dc..0000000
--- a/meta-openstack/recipes-devtools/python/python3-uritemplate_3.0.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-uritemplate.inc
-inherit setuptools3
-- 
2.17.1



