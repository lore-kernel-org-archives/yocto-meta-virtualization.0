Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1044.1596528609147039952
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 01:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF9B5E01F80; Tue,  4 Aug 2020 01:10:08 -0700 (PDT)
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
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9E43E01F7C
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 01:10:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,433,1589212800"; 
   d="scan'208";a="97579809"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Aug 2020 16:09:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 82E2D4CE4B09
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 16:09:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 4 Aug 2020 16:09:58 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-setuptools-git: Remove python recipe
Date: Wed, 5 Aug 2020 01:09:43 +0800
Message-ID: <1596560983-7709-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 82E2D4CE4B09.AB317
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../python/python-setuptools-git.inc           | 16 ----------------
 .../python/python-setuptools-git_1.2.bb        |  2 --
 .../python/python3-setuptools-git_1.2.bb       | 18 ++++++++++++++++--
 3 files changed, 16 insertions(+), 20 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-setuptools-git.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git.inc b/meta-openstack/recipes-devtools/python/python-setuptools-git.inc
deleted file mode 100644
index 18bc1dc..0000000
--- a/meta-openstack/recipes-devtools/python/python-setuptools-git.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Plugin for setuptools that enables git integration"
-HOMEPAGE = "https://github.com/wichert/setuptools-git"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
-
-SRC_URI[md5sum] = "40b2ef7687a384ea144503c2e5bc67e2"
-SRC_URI[sha256sum] = "ff64136da01aabba76ae88b050e7197918d8b2139ccbf6144e14d472b9c40445"
-
-inherit pypi
-
-# conflicting file prevention
-do_install_append() {
-	rm -f ${D}${libdir}/python*/site-packages/site.py*
-}
-BBCLASSEXTEND = "native"
diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
deleted file mode 100644
index 5dd6804..0000000
--- a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-setuptools-git.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
index 5dd6804..34b40de 100644
--- a/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-setuptools-git.inc
+DESCRIPTION = "Plugin for setuptools that enables git integration"
+HOMEPAGE = "https://github.com/wichert/setuptools-git"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
+
+SRC_URI[md5sum] = "40b2ef7687a384ea144503c2e5bc67e2"
+SRC_URI[sha256sum] = "ff64136da01aabba76ae88b050e7197918d8b2139ccbf6144e14d472b9c40445"
+
+inherit setuptools3 pypi
+
+# conflicting file prevention
+do_install_append() {
+	rm -f ${D}${libdir}/python*/site-packages/site.py*
+}
+BBCLASSEXTEND = "native"
-- 
2.25.1



