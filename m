Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.3832.1598925425009874015
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 18:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB834E020ED; Mon, 31 Aug 2020 18:57:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCDDAE020ED
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 18:57:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98753841"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 09:57:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 695C348990D9
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 09:56:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 09:56:56 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-amqplib: Consolidate in a single file
Date: Tue, 1 Sep 2020 09:56:52 +0800
Message-ID: <1598925412-77883-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598925412-77883-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598925412-77883-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 695C348990D9.A149A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-amqplib.inc  | 16 ----------------
 .../python/python3-amqplib_1.0.2.bb             | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 17 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-amqplib.inc

diff --git a/meta-openstack/recipes-devtools/python/python-amqplib.inc b/meta-openstack/recipes-devtools/python/python-amqplib.inc
deleted file mode 100644
index d9f22cb..0000000
--- a/meta-openstack/recipes-devtools/python/python-amqplib.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Python client for the Advanced Message Queuing Procotol (AMQP)"
-HOMEPAGE = "http://code.google.com/p/py-amqplib/"
-SECTION = "devel/python"
-LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
-
-PR = "r1"
-SRCNAME = "amqplib"
-
-SRC_URI = "https://github.com/barryp/py-amqplib/archive/${PV}.tar.gz"
-
-SRC_URI[md5sum] = "ff405a7b57aa98cdf07d02bd8090fa29"
-SRC_URI[sha256sum] = "9461d73f75ca704e6b656738b5dad42a1948e61dfbc8233077d84d00f74c3936"
-
-S = "${WORKDIR}/py-amqplib-${PV}"
-
diff --git a/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb
index 7623d17..218d92b 100644
--- a/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb
@@ -1,2 +1,17 @@
+DESCRIPTION = "Python client for the Advanced Message Queuing Procotol (AMQP)"
+HOMEPAGE = "http://code.google.com/p/py-amqplib/"
+SECTION = "devel/python"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
+
+PR = "r1"
+SRCNAME = "amqplib"
+
+SRC_URI = "https://github.com/barryp/py-amqplib/archive/${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ff405a7b57aa98cdf07d02bd8090fa29"
+SRC_URI[sha256sum] = "9461d73f75ca704e6b656738b5dad42a1948e61dfbc8233077d84d00f74c3936"
+
+S = "${WORKDIR}/py-amqplib-${PV}"
+
 inherit setuptools3
-require python-amqplib.inc
-- 
2.25.1



