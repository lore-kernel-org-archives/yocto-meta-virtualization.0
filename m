Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.13219.1595311292693835027
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 23:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683355"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 14:01:31 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id F39904CE506F
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 14:01:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 14:01:29 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH 4/6] python3-os-win: Change python to python3
Date: Tue, 21 Jul 2020 14:01:40 +0800
Message-ID: <1595311300-2059-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: F39904CE506F.A561B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 5.1.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-os-win_git.bb               | 35 ------------------
 .../python/python3-os-win_git.bb              | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 35 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-os-win_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-os-win_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-os-win_git.bb b/meta-openstack/recipes-devtools/python/python-os-win_git.bb
deleted file mode 100644
index c17fefb..0000000
--- a/meta-openstack/recipes-devtools/python/python-os-win_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Windows / Hyper-V library for OpenStack projects."
-HOMEPAGE = "https://github.com/openstack/os-win"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-SRC_URI = "\
-	git://github.com/openstack/os-win.git;branch=stable/pike \
-	"
-
-PV = "2.2.0+git${SRCPV}"
-SRCREV = "b507ec4e7cb5eead7a008e4d002bc31b85359908"
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
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-babel \
-        python-eventlet \
-        python-oslo.concurrency \
-        python-oslo.config \
-        python-oslo.log \
-        python-oslo.utils \
-        python-oslo.i18n \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-os-win_git.bb b/meta-openstack/recipes-devtools/python/python3-os-win_git.bb
new file mode 100644
index 0000000..5a2b765
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-os-win_git.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Windows / Hyper-V library for OpenStack projects."
+HOMEPAGE = "https://github.com/openstack/os-win"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+SRC_URI = "\
+	git://github.com/openstack/os-win.git \
+	"
+
+PV = "5.1.0+git${SRCPV}"
+SRCREV = "066c1c49b52de17217edfdbefe9c96e457ad23d2"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+DEPENDS += " \
+        python3-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python3-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-babel \
+        python3-eventlet \
+        python3-oslo.concurrency \
+        python3-oslo.config \
+        python3-oslo.log \
+        python3-oslo.utils \
+        python3-oslo.i18n \
+        python3-greenlet \
+        python3-dnspython \
+        "
-- 
2.25.1



