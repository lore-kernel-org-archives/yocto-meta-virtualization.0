Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.10995.1594887262465993124
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 01:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FE9CE01E8C; Thu, 16 Jul 2020 01:14:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFC15E01E8A
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 01:14:20 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427877"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:14:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E88A44CE2808
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 16:14:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:14:16 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-arrow: upgrade 0.15.2 -> 0.15.7
Date: Fri, 17 Jul 2020 03:41:05 +0800
Message-ID: <1594928465-4255-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E88A44CE2808.A3672
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: Copy the complete Apache License to the license file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-arrow_0.15.2.bb       | 2 --
 .../python/{python-arrow.inc => python3-arrow_0.15.7.bb}  | 8 ++++----
 2 files changed, 4 insertions(+), 6 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-arrow_0.15.2.bb
 rename meta-openstack/recipes-devtools/python/{python-arrow.inc => python3-arrow_0.15.7.bb} (52%)

diff --git a/meta-openstack/recipes-devtools/python/python3-arrow_0.15.2.bb b/meta-openstack/recipes-devtools/python/python3-arrow_0.15.2.bb
deleted file mode 100644
index 99196ea..0000000
--- a/meta-openstack/recipes-devtools/python/python3-arrow_0.15.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-arrow.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-arrow.inc b/meta-openstack/recipes-devtools/python/python3-arrow_0.15.7.bb
similarity index 52%
rename from meta-openstack/recipes-devtools/python/python-arrow.inc
rename to meta-openstack/recipes-devtools/python/python3-arrow_0.15.7.bb
index 9556a6d..b37086c 100644
--- a/meta-openstack/recipes-devtools/python/python-arrow.inc
+++ b/meta-openstack/recipes-devtools/python/python3-arrow_0.15.7.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Better dates and times for Python"
 HOMEPAGE = "https://github.com/crsmithdev/arrow"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=458d41a4064e4dc109666cfd941a29e4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=62e977be69cd001d6545038b6bb1575c"
 
-SRC_URI[md5sum] = "554f18b0e23182ee0e8cb2a882d2f607"
-SRC_URI[sha256sum] = "10257c5daba1a88db34afa284823382f4963feca7733b9107956bed041aff24f"
+SRC_URI[md5sum] = "2176ce6e28a1c43bbdb2ccc79886f420"
+SRC_URI[sha256sum] = "3f1a92b25bbee5f80cc8f6bdecfeade9028219229137c559c37335b4f574a292"
 
-inherit pypi
+inherit setuptools3 pypi
 
 RDEPENDS_${PN} += " \
         ${PYTHON_PN}-dateutil \
-- 
2.17.1



