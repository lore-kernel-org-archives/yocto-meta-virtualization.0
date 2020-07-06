Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.53749.1594024663291753657
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 01:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9A83E01E0B; Mon,  6 Jul 2020 01:37:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
X-Greylist: delayed 65 seconds by postgrey-1.32 at yocto-www; Mon, 06 Jul 2020 01:37:40 PDT
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AF8CE01E06
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 01:37:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; 
   d="scan'208";a="95816833"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 16:36:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 226F44CE4B3C
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 16:36:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 16:36:32 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-fasteners: Remove recipe
Date: Mon, 6 Jul 2020 16:36:24 +0800
Message-ID: <1594024588-6636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 226F44CE4B3C.A2054
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

This recipe already exists in meta-openembedded, the path is:
/meta-openembedded/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-fasteners.inc               | 24 -------------------
 .../python/python3-fasteners_git.bb           |  2 --
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-fasteners.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-fasteners_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-fasteners.inc b/meta-openstack/recipes-devtools/python/python-fasteners.inc
deleted file mode 100644
index 6e5e5f0..0000000
--- a/meta-openstack/recipes-devtools/python/python-fasteners.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "A python package that provides useful locks."
-HOMEPAGE = "https://github.com/harlowja/fasteners"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
-
-SRCNAME = "fasteners"
-
-PV = "0.15+git${SRCPV}"
-SRCREV = "75148cb679c351966cd4ad5e9d177048a0ea8380"
-
-SRC_URI = "git://github.com/harlowja/${SRCNAME}.git"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        ${PYTHON_PN}-pbr \
-        "
-
-# RDEPENDS_default:
-RDEPENDS_${PN} += " \
-        ${PYTHON_PN}-pbr \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-fasteners_git.bb b/meta-openstack/recipes-devtools/python/python3-fasteners_git.bb
deleted file mode 100644
index 9b2053c..0000000
--- a/meta-openstack/recipes-devtools/python/python3-fasteners_git.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-fasteners.inc
-- 
2.17.1



