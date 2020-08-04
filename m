Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.11356.1596508843269132427
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 Aug 2020 19:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C33A1E01F7C; Mon,  3 Aug 2020 19:40:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B296E01F7C
	for <meta-virtualization@yoctoproject.org>; Mon,  3 Aug 2020 19:40:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,432,1589212800"; 
   d="scan'208";a="97568834"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Aug 2020 10:40:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AE3BD4CE5447
	for <meta-virtualization@yoctoproject.org>; Tue,  4 Aug 2020 10:40:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 4 Aug 2020 10:40:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-os-traits: change to python3
Date: Tue, 4 Aug 2020 22:40:30 +0800
Message-ID: <1596552033-78898-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AE3BD4CE5447.A3E73
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-os-traits_git.bb            | 29 -------------------
 .../python/python3-os-traits_2.4.0.bb         | 22 ++++++++++++++
 2 files changed, 22 insertions(+), 29 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-os-traits_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-os-traits_2.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-os-traits_git.bb b/meta-openstack/recipes-devtools/python/python-os-traits_git.bb
deleted file mode 100644
index 70b7b69..0000000
--- a/meta-openstack/recipes-devtools/python/python-os-traits_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "OpenStack library containing standardized trait strings."
-HOMEPAGE = "https://github.com/openstack/os-traits"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI = "\
-	git://github.com/openstack/os-traits.git;branch=stable/pike \
-	"
-
-PV = "0.3.3+git${SRCPV}"
-SRCREV = "3e8b4a77aaf2d8b64f89ba3b479113d0b44bbe2f"
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-DEPENDS += " \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-	"
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-six \
-	"
diff --git a/meta-openstack/recipes-devtools/python/python3-os-traits_2.4.0.bb b/meta-openstack/recipes-devtools/python/python3-os-traits_2.4.0.bb
new file mode 100644
index 0000000..72bd1b2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-os-traits_2.4.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "OpenStack library containing standardized trait strings."
+HOMEPAGE = "https://github.com/openstack/os-traits"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[sha256sum] = "af1df9485a3119c2a6647639c8bb8bb852cb839ad9c12fa1d9e72f402c66af49"
+
+inherit setuptools3 pypi
+
+DEPENDS += " \
+        python3-pbr \
+        "
+
+DEPENDS += " \
+        python3-pbr-native \
+	"
+
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-six \
+	"
-- 
2.25.1



