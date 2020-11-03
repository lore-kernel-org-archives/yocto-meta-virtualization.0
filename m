Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.920.1604388589527257290
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 23:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 97EE438C0869
	for <meta-virtualization@yoctoproject.org>; Mon,  2 Nov 2020 23:29:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,447,1596470400"; 
   d="scan'208";a="100858894"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Nov 2020 15:29:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C1D4948990D3
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 15:29:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 3 Nov 2020 15:29:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-flake8: upgrade 3.8.3 -> 3.8.4
Date: Tue, 3 Nov 2020 15:29:13 +0800
Message-ID: <1604388553-74387-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C1D4948990D3.A2819
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python3-flake8_3.8.3.bb => python3-flake8_3.8.4.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-flake8_3.8.3.bb => python3-flake8_3.8.4.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb b/meta-openstack/recipes-devtools/python/python3-flake8_3.8.4.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb
rename to meta-openstack/recipes-devtools/python/python3-flake8_3.8.4.bb
index 9385c80..cc860c4 100644
--- a/meta-openstack/recipes-devtools/python/python3-flake8_3.8.3.bb
+++ b/meta-openstack/recipes-devtools/python/python3-flake8_3.8.4.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=75b26781f1adf1aa310bda6098937878"
 
-SRC_URI[md5sum] = "b11380b47468c3dc7323396d4b8c1746"
-SRC_URI[sha256sum] = "f04b9fcbac03b0a3e58c0ab3a0ecc462e023a9faf046d57794184028123aa208"
+SRC_URI[md5sum] = "6ab0ad6630b6917fafabded7f80344b4"
+SRC_URI[sha256sum] = "aadae8761ec651813c24be05c6f7b4680857ef6afaae4651a4eccaef97ce6c3b"
 
 inherit setuptools3 pypi
 
@@ -14,4 +14,5 @@ RDEPENDS_${PN} += "python3-prettytable \
             python3-pyparsing \
             python3-mccabe \
             python3-pep8 \
+            python3-logging \
             python3-pyflakes"
-- 
2.25.1



