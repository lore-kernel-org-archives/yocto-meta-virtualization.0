Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.30539.1595214845484930462
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Jul 2020 20:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4810E01EC6; Sun, 19 Jul 2020 20:14:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46DC1E01EC6
	for <meta-virtualization@yoctoproject.org>; Sun, 19 Jul 2020 20:14:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,373,1589212800"; 
   d="scan'208";a="96593017"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 11:13:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E643E4CE3F17
	for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:13:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 11:13:59 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-deprecation: upgrade 1.0.1 -> 2.1.0
Date: Mon, 20 Jul 2020 22:36:54 +0800
Message-ID: <1595255817-77606-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E643E4CE3F17.A38BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-deprecation_1.0.1.bb                |  2 --
 ...on-deprecation.inc => python3-deprecation_2.1.0.bb} | 10 +++++++---
 2 files changed, 7 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-deprecation_1.0.1.bb
 rename meta-openstack/recipes-devtools/python/{python-deprecation.inc => python3-deprecation_2.1.0.bb} (53%)

diff --git a/meta-openstack/recipes-devtools/python/python3-deprecation_1.0.1.bb b/meta-openstack/recipes-devtools/python/python3-deprecation_1.0.1.bb
deleted file mode 100644
index d2e0f1c..0000000
--- a/meta-openstack/recipes-devtools/python/python3-deprecation_1.0.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-deprecation.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-deprecation.inc b/meta-openstack/recipes-devtools/python/python3-deprecation_2.1.0.bb
similarity index 53%
rename from meta-openstack/recipes-devtools/python/python-deprecation.inc
rename to meta-openstack/recipes-devtools/python/python3-deprecation_2.1.0.bb
index eec4dd1..c819529 100644
--- a/meta-openstack/recipes-devtools/python/python-deprecation.inc
+++ b/meta-openstack/recipes-devtools/python/python3-deprecation_2.1.0.bb
@@ -4,7 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
-SRC_URI[md5sum] = "d8a318c66d442dc4b900e070267ed9aa"
-SRC_URI[sha256sum] = "b9bff5cc91f601ef2a8a0200bc6cde3f18a48c2ed3d1ecbfc16076b14b3ad935"
+SRC_URI[md5sum] = "6b79c6572fb241e3cecbbd7d539bb66b"
+SRC_URI[sha256sum] = "72b3bde64e5d778694b0cf68178aed03d15e15477116add3fb773e581f9518ff"
 
-inherit pypi
+RDEPENDS_${PN} += "\
+	python3-packaging \
+"
+
+inherit setuptools3 pypi
-- 
2.25.1



