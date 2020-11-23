Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.31137.1606110161376436703
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2020 21:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id DDEF938C0532
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 05:42:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,361,1599494400"; 
   d="scan'208";a="101645282"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Nov 2020 13:42:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E30C94CE1505
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Nov 2020 13:42:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Nov 2020 13:42:37 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-microversion-parse: Change to python3
Date: Mon, 23 Nov 2020 22:42:16 +0800
Message-ID: <1606142536-3715-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E30C94CE1505.A4905
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...rsion-parse_git.bb => python3-microversion-parse_git.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-microversion-parse_git.bb => python3-microversion-parse_git.bb} (82%)

diff --git a/meta-openstack/recipes-devtools/python/python-microversion-parse_git.bb b/meta-openstack/recipes-devtools/python/python3-microversion-parse_git.bb
similarity index 82%
rename from meta-openstack/recipes-devtools/python/python-microversion-parse_git.bb
rename to meta-openstack/recipes-devtools/python/python3-microversion-parse_git.bb
index c207523a..43eead66 100644
--- a/meta-openstack/recipes-devtools/python/python-microversion-parse_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-microversion-parse_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 	git://github.com/openstack/microversion-parse.git;branch=master \
 	"
 
-PV = "0.1.4+git${SRCPV}"
-SRCREV = "1f6eac7c3df048679663919f75c2bcecd3e183a2"
+PV = "1.0.1+git${SRCPV}"
+SRCREV = "2c36df6bf33e42c379fbd8228fbe63c77b3714b1"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
@@ -19,7 +19,7 @@ DEPENDS += " \
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
 	"
 
 RDEPENDS_${PN} += " \
-- 
2.25.1



