Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.9535.1603775104817528242
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5116C38C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:05:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100541524"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:05:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1874348990DE
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:05:02 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:05:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-pysnmp: upgrade 4.2.5 -> 4.4.12
Date: Tue, 27 Oct 2020 13:05:02 +0800
Message-ID: <1603775102-49438-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1874348990DE.A062C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Renamed to LICENSE.rst and Copyright year updated to 2019.

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pysnmp.inc      | 14 --------------
 .../python/python3-pysnmp_4.2.5.bb                 |  2 --
 .../python/python3-pysnmp_4.4.12.bb                | 14 ++++++++++++++
 3 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pysnmp.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pysnmp.inc b/meta-openstack/recipes-devtools/python/python-pysnmp.inc
deleted file mode 100644
index 1a9ca0f..0000000
--- a/meta-openstack/recipes-devtools/python/python-pysnmp.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "A pure-Python SNMPv1/v2c/v3 library"
-HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ae098273b2cf8b4af164ac20e32bddf7"
-
-SRC_URI[md5sum] = "1f75d3e392a050e84348904fc1be3212"
-SRC_URI[sha256sum] = "c46e65d99a604f690b3d5800e2f6e26e1ed9a3c7f7e17e7b4b4d897150f7077f"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-pycrypto \
-                   ${PYTHON_PN}-pyasn1 \
-"
diff --git a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
deleted file mode 100644
index b31eb5a..0000000
--- a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pysnmp.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb
new file mode 100644
index 0000000..06ea97a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.4.12.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A pure-Python SNMPv1/v2c/v3 library"
+HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b15d29f500f748d1c2a15709769090a8"
+
+SRC_URI[md5sum] = "2222880259daf6e2cb322e938c818276"
+SRC_URI[sha256sum] = "0c3dbef2f958caca96071fe5c19de43e9c1b0484ab02a0cf08b190bcee768ba9"
+
+inherit setuptools3 pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pycrypto \
+                   ${PYTHON_PN}-pyasn1 \
+"
-- 
2.25.1



