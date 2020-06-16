Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.5691.1592292134484486696
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 00:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56688E01D04; Tue, 16 Jun 2020 00:22:14 -0700 (PDT)
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
X-Greylist: delayed 63 seconds by postgrey-1.32 at yocto-www; Tue, 16 Jun 2020 00:22:13 PDT
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C71FE01D01
	for <meta-virtualization@yoctoproject.org>; Tue, 16 Jun 2020 00:22:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.73,518,1583164800"; 
   d="scan'208";a="94566475"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jun 2020 15:21:08 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9B0D74CE30F5
	for <meta-virtualization@yoctoproject.org>; Tue, 16 Jun 2020 15:21:03 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Jun 2020 15:21:04 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization][meta-openstack][PATCH] python3-mox3: Change python to python3
Date: Tue, 16 Jun 2020 22:07:53 +0800
Message-ID: <1592316473-130293-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9B0D74CE30F5.A7D89
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

upgrade 0.28.0 -> 1.1.0

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python-mox3_0.28.0.bb => python3-mox3_1.1.0.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-mox3_0.28.0.bb => python3-mox3_1.1.0.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb b/meta-openstack/recipes-devtools/python/python3-mox3_1.1.0.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
rename to meta-openstack/recipes-devtools/python/python3-mox3_1.1.0.bb
index 770569b..9608077 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-mox3_1.1.0.bb
@@ -4,21 +4,21 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "c930d8479996541b04447a67e96e4a62"
-SRC_URI[sha256sum] = "8094868e70f814b4a526ecc592365437bc93a7dd60341321344987b3e8dba49d"
+SRC_URI[md5sum] = "0eff74d3a85ec4d4dc6acf7f524ca816"
+SRC_URI[sha256sum] = "8a526b7b9b6341f541a9aef3e08c93fd84a5373fe89d4cc51dd571f085b2363c"
 
 inherit setuptools3 pypi
 
 DEPENDS += "\
-    python-pbr \
+    python3-pbr \
     "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-    python-pbr-native \
+    python3-pbr-native \
     "
 
 RDEPENDS_${PN} += " \
-    python-pbr \
-    python-fixtures \
+    python3-pbr \
+    python3-fixtures \
 "
-- 
2.17.1



