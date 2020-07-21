Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.13215.1595311285757743762
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 23:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; 
   d="scan'208";a="96683350"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Jul 2020 14:01:24 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 4A5E14CE505C
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2020 14:01:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Jul 2020 14:01:21 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH 3/6] python3-oslo.service: Change python to python3
Date: Tue, 21 Jul 2020 14:01:32 +0800
Message-ID: <1595311292-2022-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 4A5E14CE505C.A2487
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 1.25.2

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-oslo.service_git.bb         | 43 ------------------
 .../python/python3-oslo.service_git.bb        | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 43 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.service_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
deleted file mode 100644
index 392270d..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION = "oslo.service library"
-HOMEPAGE = "https://wiki.openstack.org/wiki/Oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-PV = "1.25.0"
-SRCREV = "0020bef6a503905aca5cdb70aee54e1c5f2ff472"
-
-SRCNAME = "oslo.service"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-DEPENDS += " \
-        python-pip \
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
-        python-webob \
-        python-eventlet \
-        python-greenlet \
-        python-monotonic \
-        python-oslo.utils \
-        python-oslo.concurrency \
-        python-oslo.config \
-        python-oslo.log \
-        python-six \
-        python-oslo.i18n \
-        python-pastedeploy \
-        python-paste \
-        python-routes \
-        "
-	
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.service_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.service_git.bb
new file mode 100644
index 0000000..3598ea0
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.service_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "oslo.service library"
+HOMEPAGE = "https://wiki.openstack.org/wiki/Oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+PV = "1.25.2"
+SRCREV = "8481ce67951aa1b44203c03639b79e06f65bd8bc"
+
+SRCNAME = "oslo.service"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+DEPENDS += " \
+        python3-pip \
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
+        python3-webob \
+        python3-eventlet \
+        python3-greenlet \
+        python3-monotonic \
+        python3-oslo.utils \
+        python3-oslo.concurrency \
+        python3-oslo.config \
+        python3-oslo.log \
+        python3-six \
+        python3-oslo.i18n \
+        python3-pastedeploy \
+        python3-paste \
+        python3-routes \
+        python3-dnspython \
+        "
+	
-- 
2.25.1



