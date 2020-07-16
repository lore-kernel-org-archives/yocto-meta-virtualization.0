Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.10991.1594887237477648269
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 01:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52921E01E8C; Thu, 16 Jul 2020 01:13:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F6E7E01E8A
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 01:13:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427856"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:13:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 79ABB4CE2808
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 16:13:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:13:52 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-debtcollector: upgrade 1.22.0 -> 2.1.0
Date: Fri, 17 Jul 2020 03:40:41 +0800
Message-ID: <1594928441-4155-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 79ABB4CE2808.A5D9E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-debtcollector_1.22.0.bb | 2 --
 ...hon-debtcollector.inc => python3-debtcollector_2.1.0.bb} | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-debtcollector_1.22.0.bb
 rename meta-openstack/recipes-devtools/python/{python-debtcollector.inc => python3-debtcollector_2.1.0.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python3-debtcollector_1.22.0.bb b/meta-openstack/recipes-devtools/python/python3-debtcollector_1.22.0.bb
deleted file mode 100644
index 7947185..0000000
--- a/meta-openstack/recipes-devtools/python/python3-debtcollector_1.22.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-debtcollector.inc
diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector.inc b/meta-openstack/recipes-devtools/python/python3-debtcollector_2.1.0.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-debtcollector.inc
rename to meta-openstack/recipes-devtools/python/python3-debtcollector_2.1.0.bb
index d6d18e3..fbf4626 100644
--- a/meta-openstack/recipes-devtools/python/python-debtcollector.inc
+++ b/meta-openstack/recipes-devtools/python/python3-debtcollector_2.1.0.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[md5sum] = "0d12694a93a16824b1c67bece341229e"
-SRC_URI[sha256sum] = "d1756440d25a50e3eca2fc399c9e5f1ca2f9e6b837570a80b9450999f4290525"
+SRC_URI[md5sum] = "9a1014f18abbc565b8e149fd70048c22"
+SRC_URI[sha256sum] = "a25fc6215560d81cb9f2a0b58d6c834f2a24010987027bde169599e138a205af"
 
-inherit pypi
+inherit setuptools3 pypi
 
 DEPENDS += " \
         ${PYTHON_PN}-pip \
-- 
2.25.1



