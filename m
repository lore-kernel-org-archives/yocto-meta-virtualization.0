Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.10998.1594887280081711596
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 01:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5809E01E8C; Thu, 16 Jul 2020 01:14:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA25DE01E8A
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 01:14:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427889"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:14:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E26934CE3F17
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 16:14:36 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:14:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-boto: Change to python3
Date: Fri, 17 Jul 2020 03:41:26 +0800
Message-ID: <1594928486-4335-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E26934CE3F17.A467D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

-License-Update: There is no LICENSE file in the package provided by pypi, and it is changed to PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-boto_git.bb                 | 20 ------------------
 .../python/python3-boto_2.49.0.bb             | 21 +++++++++++++++++++
 2 files changed, 21 insertions(+), 20 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-boto_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-boto_2.49.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-boto_git.bb b/meta-openstack/recipes-devtools/python/python-boto_git.bb
deleted file mode 100644
index 77e2043..0000000
--- a/meta-openstack/recipes-devtools/python/python-boto_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Amazon Web Services API"
-HOMEPAGE = "https://github.com/boto/boto"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=348302dddd421665d3c9b636a2e55832"
-
-SRCREV = "b5852b0aa5ac91f462b28ac9decee33d872dec4d"
-PV = "2.8.0+git${SRCPV}"
-PR = "r0"
-SRCNAME = "boto"
-
-SRC_URI = "git://github.com/boto/boto.git;protocol=git"
-
-SRC_URI[md5sum] = "5528f3010c42dd0ed7b188a6917295f1"
-SRC_URI[sha256sum] = "4d6d38aa8e9e536a27a9737eb4222f896417841fed9a12eedcb619ba8fb68a39"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
diff --git a/meta-openstack/recipes-devtools/python/python3-boto_2.49.0.bb b/meta-openstack/recipes-devtools/python/python3-boto_2.49.0.bb
new file mode 100644
index 0000000..fe09e9f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-boto_2.49.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Amazon Web Services API"
+HOMEPAGE = "https://github.com/boto/boto"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a1067d091272fcce8cc3d88d7e6fdc01"
+
+SRC_URI[md5sum] = "e9b79f80198da059d9a8055a5352fd6d"
+SRC_URI[sha256sum] = "ea0d3b40a2d852767be77ca343b58a9e3a4b00d9db440efb8da74b4e58025e5a"
+
+RDEPENDS_${PN} += "\
+	python3-json \
+	python3-netclient \
+	python3-threading \
+	python3-xml \
+	python3-logging \
+	python3-pickle \
+	python3-netserver \
+"
+
+inherit setuptools3 pypi
+
-- 
2.25.1



