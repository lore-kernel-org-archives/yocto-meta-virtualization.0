Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.32744.1600652579548283412
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Sep 2020 18:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6378938C06EF
	for <meta-virtualization@yoctoproject.org>; Sun, 20 Sep 2020 18:42:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,284,1596470400"; 
   d="scan'208";a="99447303"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Sep 2020 09:42:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3073548990CB
	for <meta-virtualization@yoctoproject.org>; Mon, 21 Sep 2020 09:42:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 21 Sep 2020 09:42:51 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-jasmine: upgrade 2.4.1.1 -> 2.4.1.2
Date: Mon, 21 Sep 2020 21:42:53 +0800
Message-ID: <1600695773-84716-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3073548990CB.A04F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-xstatic-jasmine_2.4.1.1.bb               | 2 --
 ...tatic-jasmine.inc => python3-xstatic-jasmine_2.4.1.2.bb} | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.1.bb
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jasmine.inc => python3-xstatic-jasmine_2.4.1.2.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.1.bb
deleted file mode 100644
index 86eb7e2..0000000
--- a/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-xstatic-jasmine.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine.inc b/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.2.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-xstatic-jasmine.inc
rename to meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.2.bb
index cdfb223..7e1638b 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine.inc
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jasmine_2.4.1.2.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 PYPI_PACKAGE = "XStatic-Jasmine"
 
-SRC_URI[md5sum] = "9378ce965dfcb4ddb64855cc717d4ec8"
-SRC_URI[sha256sum] = "d1e8bf3c0e1cf683cc2c0aad95f197e9e51ea747fb91291445223a2b7dbc4740"
+SRC_URI[md5sum] = "736937d16fd655d1f6f2096b97d8255b"
+SRC_URI[sha256sum] = "bf921be423c254a5cebc2156a7fd66d8210cefd251fc2fa51f792a153bf9e82b"
 
-inherit pypi
+inherit setuptools3 pypi
 
 # DEPENDS_default: python-pip
 
-- 
2.25.1



