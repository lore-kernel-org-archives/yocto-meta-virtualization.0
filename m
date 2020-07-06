Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.53753.1594024665427355533
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 01:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D10DE01E0B; Mon,  6 Jul 2020 01:37:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7ED42E01E06
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 01:37:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; 
   d="scan'208";a="95816835"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 16:36:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 475444CE4BD0
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 16:36:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 16:36:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-pyflakes: Remove recipe
Date: Mon, 6 Jul 2020 16:36:26 +0800
Message-ID: <1594024588-6636-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594024588-6636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1594024588-6636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 475444CE4BD0.A19D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

This recipe already exists in meta-openembedded, the path is:
/meta-openembedded/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pyflakes.inc    | 14 --------------
 .../python/python3-pyflakes_0.7.3.bb               |  2 --
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pyflakes.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pyflakes.inc b/meta-openstack/recipes-devtools/python/python-pyflakes.inc
deleted file mode 100644
index df92d80..0000000
--- a/meta-openstack/recipes-devtools/python/python-pyflakes.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "passive checker of Python programs"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=1815018ebbbfc8659a9df33681a0936e"
-
-SRC_URI[md5sum] = "ec94ac11cb110e6e72cca23c104b66b1"
-SRC_URI[sha256sum] = "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b66aa624097d9b5e3"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
-            ${PYTHON_PN}-cmd2 \
-            ${PYTHON_PN}-pyparsing"
diff --git a/meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb b/meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb
deleted file mode 100644
index cc9e864..0000000
--- a/meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pyflakes.inc
-inherit setuptools3
-- 
2.17.1



