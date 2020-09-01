Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4627.1598928435355444315
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 19:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34354E020F0; Mon, 31 Aug 2020 19:47:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3ED40E020EE
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 19:47:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98755798"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 10:47:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E28D548990D9
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 10:47:11 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 10:47:10 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-dogpile.core: Consolidate in a single file
Date: Tue, 1 Sep 2020 10:47:10 +0800
Message-ID: <1598928430-124427-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E28D548990D9.A8D67
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-dogpile.core.inc  | 12 ------------
 .../python/python3-dogpile.core_0.4.1.bb             | 12 ++++++++++--
 2 files changed, 10 insertions(+), 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-dogpile.core.inc

diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.core.inc b/meta-openstack/recipes-devtools/python/python-dogpile.core.inc
deleted file mode 100644
index 9824321..0000000
--- a/meta-openstack/recipes-devtools/python/python-dogpile.core.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Python Dogpile Core: Dogpile is basically the locking code extracted from the Beaker package, for simple and generic usage."
-HOMEPAGE = "https://pypi.python.org/pypi/dogpile.core"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0401fd56584d7b3d4be91690672ec433"
-
-SRC_URI[md5sum] = "01cb19f52bba3e95c9b560f39341f045"
-SRC_URI[sha256sum] = "be652fb11a8eaf66f7e5c94d418d2eaa60a2fe81dae500f3743a863cc9dbed76"
-
-inherit pypi
-
-
diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.core_0.4.1.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.core_0.4.1.bb
index d81698f..9592660 100644
--- a/meta-openstack/recipes-devtools/python/python3-dogpile.core_0.4.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-dogpile.core_0.4.1.bb
@@ -1,4 +1,12 @@
-require python-dogpile.core.inc
-inherit setuptools3
+DESCRIPTION = "Python Dogpile Core: Dogpile is basically the locking code extracted from the Beaker package, for simple and generic usage."
+HOMEPAGE = "https://pypi.python.org/pypi/dogpile.core"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0401fd56584d7b3d4be91690672ec433"
+
+SRC_URI[md5sum] = "01cb19f52bba3e95c9b560f39341f045"
+SRC_URI[sha256sum] = "be652fb11a8eaf66f7e5c94d418d2eaa60a2fe81dae500f3743a863cc9dbed76"
+
+inherit setuptools3 pypi
 
 
-- 
2.25.1



