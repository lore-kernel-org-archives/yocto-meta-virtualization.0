Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3157.1595900128404306425
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 18:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42783E01F26; Mon, 27 Jul 2020 18:35:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E854E01F22
	for <meta-virtualization@yoctoproject.org>; Mon, 27 Jul 2020 18:35:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96962908"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 09:35:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id C24884CE5059
	for <meta-virtualization@yoctoproject.org>; Tue, 28 Jul 2020 09:35:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 09:35:24 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-unicodecsv: Change to python3
Date: Tue, 28 Jul 2020 09:35:20 +0800
Message-ID: <1595900120-54689-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: C24884CE5059.A76D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python/python-unicodecsv_git.bb           | 24 -------------------
 .../python/python3-unicodecsv_0.14.1.bb       | 18 ++++++++++++++
 2 files changed, 18 insertions(+), 24 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-unicodecsv_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-unicodecsv_0.14.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-unicodecsv_git.bb b/meta-openstack/recipes-devtools/python/python-unicodecsv_git.bb
deleted file mode 100644
index 548543e..0000000
--- a/meta-openstack/recipes-devtools/python/python-unicodecsv_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Python2's stdlib csv module replacement with unicode support"
-HOMEPAGE = "https://github.com/jdunck/python-unicodecsv"
-SECTION = "devel/python"
-LICENSE = "BSD"
-
-PV = "0.14.1+git${SRCPV}"
-SRCREV = "4563e33ce322f5e2dea41e76cb33dc0e008ad341"
-
-SRCNAME = "unicodecsv"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e71cdeaa2d2d59b225b8dfb9363fa590"
-SRC_URI = "git://github.com/jdunck/${BPN}.git"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-DEPENDS += " \
-	python-pbr \
-	"
-
-RDEPENDS_${PN} += " \
-	"
-
diff --git a/meta-openstack/recipes-devtools/python/python3-unicodecsv_0.14.1.bb b/meta-openstack/recipes-devtools/python/python3-unicodecsv_0.14.1.bb
new file mode 100644
index 0000000..ca8c069
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-unicodecsv_0.14.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python2's stdlib csv module replacement with unicode support"
+HOMEPAGE = "https://github.com/jdunck/python-unicodecsv"
+SECTION = "devel/python"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=776dee90d219355b4ffd5c06fda5a39d"
+
+SRC_URI[sha256sum] = "018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+	python3-pbr \
+	"
+
+RDEPENDS_${PN} += " \
+	"
+
-- 
2.25.1



