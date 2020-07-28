Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2325.1595897103218811568
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 17:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; 
   d="scan'208";a="96959716"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 08:45:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id B04354CE2808
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2020 08:44:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 08:44:56 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python3-oslo.vmware: Change python to python3
Date: Tue, 28 Jul 2020 08:45:07 +0800
Message-ID: <1595897107-20492-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: B04354CE2808.A3768
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Version updated to 3.4.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-oslo.vmware_git.bb          | 41 -------------------
 .../python/python3-oslo.vmware_git.bb         | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 41 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.vmware_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
deleted file mode 100644
index 07345e7..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "oslo.vmware library"
-HOMEPAGE = "http://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-PV = "2.23.0+git${SRCPV}"
-SRCREV = "95a30dfa24d259fe16f0fd43eb1b67b9f3fc0397"
-
-SRCNAME = "oslo.vmware"
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
-        python-stevedore \
-        python-netaddr \
-        python-six \
-        python-oslo.i18n \
-        python-oslo.utils \
-        python-oslo.concurrency \
-        python-pyyaml \
-        python-lxml \
-        python-suds-jurko \
-        python-eventlet \
-        python-requests \
-        python-urllib3 \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.vmware_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.vmware_git.bb
new file mode 100644
index 0000000..99fd8a9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.vmware_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "oslo.vmware library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "3.4.0+git${SRCPV}"
+SRCREV = "32c8d43a20cb6a29f03324fbc2e6cad3bfb5a294"
+
+SRCNAME = "oslo.vmware"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
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
+        python3-stevedore \
+        python3-netaddr \
+        python3-six \
+        python3-oslo.i18n \
+        python3-oslo.utils \
+        python3-oslo.concurrency \
+        python3-pyyaml \
+        python3-lxml \
+        python3-suds-jurko \
+        python3-eventlet \
+        python3-requests \
+        python3-urllib3 \
+        "
-- 
2.25.1



