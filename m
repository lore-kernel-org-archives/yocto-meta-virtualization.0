Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1604.1578040311158855507
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jan 2020 00:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: wangmy@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C798E013E7; Fri,  3 Jan 2020 00:31:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_03_06,
	RCVD_IN_DNSWL_MED autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  3.0 DATE_IN_FUTURE_03_06 Date: is 3 to 6 hours after Received: date
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B396E0136E
	for <meta-virtualization@yoctoproject.org>; Fri,  3 Jan 2020 00:31:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,390,1571673600"; 
   d="scan'208";a="81266720"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 16:31:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 7FCDB49E931C
	for <meta-virtualization@yoctoproject.org>; Fri,  3 Jan 2020 16:22:49 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 16:31:45 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 3 Jan 2020 16:31:47 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization] [PATCH]python-pyyaml: Remove the recipe
Date: Fri, 3 Jan 2020 05:00:39 -0800
Message-ID: <1578056439-94495-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7FCDB49E931C.A6B20
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
Content-Type: text/plain

Because they already exist in meta-openembedded, remove the recipe.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-pyyaml_5.1.2.bb             | 32 -------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 recipes-devtools/python/python-pyyaml_5.1.2.bb

diff --git a/recipes-devtools/python/python-pyyaml_5.1.2.bb b/recipes-devtools/python/python-pyyaml_5.1.2.bb
deleted file mode 100644
index 711675b..0000000
--- a/recipes-devtools/python/python-pyyaml_5.1.2.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-HOMEPAGE = "http://www.pyyaml.org"
-SUMMARY = "Python support for YAML"
-DESCRIPTION = "\
-  YAML is a data serialization format designed for human readability \
-  and interaction with scripting languages.  PyYAML is a YAML parser \
-  and emitter for Python. \
-  .       \
-  PyYAML features a complete YAML 1.1 parser, Unicode support, pickle \
-  support, capable extension API, and sensible error messages.  PyYAML \
-  supports standard YAML tags and provides Python-specific tags that \
-  allow to represent an arbitrary Python object. \
-  .       \
-  PyYAML is applicable for a broad range of tasks from complex \
-  configuration files to object serialization and persistance. \
-  "
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
-
-SRCNAME = "PyYAML"
-SRC_URI = "http://pyyaml.org/download/pyyaml/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "20f87ab421b0271dbf371dc5c1cddb5c"
-SRC_URI[sha256sum] = "01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-DEFAULT_PREFERENCE = "-1"
-
-inherit setuptools
-
-DEPENDS += "libyaml python-cython-native"
-- 
2.17.1



