Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3905.1598925475292376516
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 18:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BB79E020EF; Mon, 31 Aug 2020 18:57:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 874B4E020EE
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 18:57:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98753873"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 09:57:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A9BFF48990CB
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 09:57:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 09:57:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-avahi: Consolidate in a single file
Date: Tue, 1 Sep 2020 09:57:43 +0800
Message-ID: <1598925465-78006-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A9BFF48990CB.A6EB4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-avahi.inc  | 32 -----------------
 .../python/python3-avahi_0.6.32.bb            | 34 +++++++++++++++++--
 2 files changed, 31 insertions(+), 35 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-avahi.inc

diff --git a/meta-openstack/recipes-devtools/python/python-avahi.inc b/meta-openstack/recipes-devtools/python/python-avahi.inc
deleted file mode 100644
index c235959..0000000
--- a/meta-openstack/recipes-devtools/python/python-avahi.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Python bindings for the avahi zeroconf client"
-HOMEPAGE = "https://github.com/lathiat/avahi"
-SECTION = "devel/python"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
-SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
-
-S = "${WORKDIR}/avahi-${PV}"
-
-inherit python3native
-
-# we only need the python bindings
-do_install () {
-	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/avahi
-
-	sed -i'' -e "s,@PYTHON\@,${bindir}/${PYTHON_PN},g" \
-		${S}/avahi-python/avahi/__init__.py  \
-		${S}/avahi-python/avahi-bookmarks.in
-
-	install -m 0775 ${S}/avahi-python/avahi/__init__.py \
-		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/__init__.py
-
-	install -m 0775 ${S}/avahi-python/avahi-bookmarks.in \
-		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/avahi-bookmarks
-}
-
-FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/avahi"
diff --git a/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb b/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb
index 4b85cd5..b5d3e77 100644
--- a/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb
+++ b/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb
@@ -1,5 +1,33 @@
-require python-avahi.inc
+RDEPENDS_${PN} += "python3-core python3-dbus"
+SUMMARY = "Python bindings for the avahi zeroconf client"
+HOMEPAGE = "https://github.com/lathiat/avahi"
+SECTION = "devel/python"
 
-inherit python3-dir
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-RDEPENDS_${PN} += "python3-core python3-dbus"
+SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
+SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
+
+S = "${WORKDIR}/avahi-${PV}"
+
+inherit python3native python3-dir
+
+# we only need the python bindings
+do_install () {
+	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/avahi
+
+	sed -i'' -e "s,@PYTHON\@,${bindir}/${PYTHON_PN},g" \
+		${S}/avahi-python/avahi/__init__.py  \
+		${S}/avahi-python/avahi-bookmarks.in
+
+	install -m 0775 ${S}/avahi-python/avahi/__init__.py \
+		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/__init__.py
+
+	install -m 0775 ${S}/avahi-python/avahi-bookmarks.in \
+		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/avahi-bookmarks
+}
+
+FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/avahi"
-- 
2.25.1



