Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.5512.1592292159789600754
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 00:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A35AFE01D04; Tue, 16 Jun 2020 00:22:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 486A3E01D01
	for <meta-virtualization@yoctoproject.org>; Tue, 16 Jun 2020 00:22:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.73,518,1583164800"; 
   d="scan'208";a="94566493"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jun 2020 15:21:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 631DB4CE3100
	for <meta-virtualization@yoctoproject.org>; Tue, 16 Jun 2020 15:21:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Jun 2020 15:21:34 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization][meta-openstack][PATCH] python3-tinyrpc: change python to python3
Date: Tue, 16 Jun 2020 22:08:22 +0800
Message-ID: <1592316502-130341-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 631DB4CE3100.A5C6D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

upgrade 0.6 -> 1.0.4

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...inyrpc_0.6.bb => python3-tinyrpc_1.0.4.bb} | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tinyrpc_0.6.bb => python3-tinyrpc_1.0.4.bb} (50%)

diff --git a/meta-openstack/recipes-devtools/python/python-tinyrpc_0.6.bb b/meta-openstack/recipes-devtools/python/python3-tinyrpc_1.0.4.bb
similarity index 50%
rename from meta-openstack/recipes-devtools/python/python-tinyrpc_0.6.bb
rename to meta-openstack/recipes-devtools/python/python3-tinyrpc_1.0.4.bb
index 9da5813..f77cebe 100644
--- a/meta-openstack/recipes-devtools/python/python-tinyrpc_0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python3-tinyrpc_1.0.4.bb
@@ -5,18 +5,18 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[md5sum] = "2663568ba3e1793da7b21003f0847fdd"
-SRC_URI[sha256sum] = "b4d64227f023f1f0736ef137bd4c901c7652563e62c7a20329222c3a0b14d84f"
+SRC_URI[md5sum] = "cd61e3cbc01ea940abc97d3a87abf4a7"
+SRC_URI[sha256sum] = "4b41fab967fb1c978f573bf0d609a3b12cc3b6ed62bd3108f43f575563746396"
 
 inherit setuptools3 pypi
 
 RDEPENDS_${PN} += " \
-        python-six \
-        python-gevent \
-        python-requests \
-        python-websocket-client \
-        python-jsonext \
-        python-gevent-websocket \
-        python-werkzeug \
-        python-pyzmq \
+        python3-six \
+        python3-gevent \
+        python3-requests \
+        python3-websocket-client \
+        python3-jsonext \
+        python3-gevent-websocket \
+        python3-werkzeug \
+        python3-pyzmq \
         "
-- 
2.17.1



