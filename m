Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3164.1595900155195060893
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 18:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 161E3E01F26; Mon, 27 Jul 2020 18:35:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30B1CE01F22
	for <meta-virtualization@yoctoproject.org>; Mon, 27 Jul 2020 18:35:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96962933"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 09:35:53 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B4C304CE505C
	for <meta-virtualization@yoctoproject.org>; Tue, 28 Jul 2020 09:35:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 09:35:51 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-websockify: upgrade 0.8.0 -> 0.9.0
Date: Tue, 28 Jul 2020 09:35:41 +0800
Message-ID: <1595900141-54751-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B4C304CE505C.A67B6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: There is no LICENSE.txt file in the new version, change to PKG-INFO.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 ...thon-websockify_0.8.0.bb => python3-websockify_0.9.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-websockify_0.8.0.bb => python3-websockify_0.9.0.bb} (52%)

diff --git a/meta-openstack/recipes-devtools/python/python-websockify_0.8.0.bb b/meta-openstack/recipes-devtools/python/python3-websockify_0.9.0.bb
similarity index 52%
rename from meta-openstack/recipes-devtools/python/python-websockify_0.8.0.bb
rename to meta-openstack/recipes-devtools/python/python3-websockify_0.9.0.bb
index c51a79b..436ee3d 100644
--- a/meta-openstack/recipes-devtools/python/python-websockify_0.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-websockify_0.9.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "WebSockets support for any application/server"
 HOMEPAGE = "https://github.com/kanaka/websockify"
 SECTION = "devel/python"
 LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a3b5f97c9d64189899b91b3728bfd774"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=eb81922f483833198eace60f1469f99d"
 
-SRC_URI[md5sum] = "8fa547ca4de84a96aa3472d55fbcdd59"
-SRC_URI[sha256sum] = "547d3d98c5081f2dc2872a2e4a3aef33e0ee5141d5f6209204aab2f4a41548d2"
+SRC_URI[md5sum] = "ff745fd67457fd077915753c9b808b2a"
+SRC_URI[sha256sum] = "c35b5b79ebc517d3b784dacfb993be413a93cda5222c6f382443ce29c1a6cada"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



