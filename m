Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4169.1607403085335250549
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 20:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 337BD38C0858
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 04:51:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163227"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 12:51:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 13B374CE600B
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 12:51:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 12:51:08 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-hgtools: upgrade 8.2.0 -> 8.2.1
Date: Tue, 8 Dec 2020 12:51:07 +0800
Message-ID: <1607403067-8740-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 13B374CE600B.AFA04
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python3-hgtools_8.2.0.bb => python3-hgtools_8.2.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-hgtools_8.2.0.bb => python3-hgtools_8.2.1.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python3-hgtools_8.2.0.bb b/meta-openstack/recipes-devtools/python/python3-hgtools_8.2.1.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python3-hgtools_8.2.0.bb
rename to meta-openstack/recipes-devtools/python/python3-hgtools_8.2.1.bb
index cfaf034a..b37ffbf0 100644
--- a/meta-openstack/recipes-devtools/python/python3-hgtools_8.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-hgtools_8.2.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "200c967071c63efeb869470d24f250e3"
-SRC_URI[sha256sum] = "5f30e3e7729f67e414b63ae91697743bb2ec72f3cac0c514d16fd3c21bd25300"
+SRC_URI[md5sum] = "5234d6ea4987f1ccdd1aa87235550c81"
+SRC_URI[sha256sum] = "6d0aa3eb4b73e937d6e1f928a011911621b54a95cee8d999839362039dfe8d4b"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.25.1



