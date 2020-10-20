Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1545.1603176233440291148
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id E6DE938C06C8
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:43:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322072"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:43:52 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AE24548990E8
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:43:49 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:43:47 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-tooz: upgrade 1.48.0 -> 2.7.1
Date: Tue, 20 Oct 2020 14:43:47 +0800
Message-ID: <1603176227-40638-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: AE24548990E8.A59BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-tooz_1.48.0.bb              | 37 -------------------
 .../python/python3-tooz_2.7.1.bb              | 36 ++++++++++++++++++
 2 files changed, 36 insertions(+), 37 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-tooz_2.7.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb b/meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb
deleted file mode 100644
index 14f69d1..0000000
--- a/meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Coordination library for distributed systems."
-HOMEPAGE = "https://pypi.python.org/pypi/tooz"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRC_URI[md5sum] = "8b39e07002f21c15d2a463b63d8a2952"
-SRC_URI[sha256sum] = "c1b17935207e9c4809feff91b679883928aa5bd3fce75e09b4945c261b513e60"
-
-inherit setuptools3 pypi
-
-# DEPENDS_default: python-pip
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
-# RDEPENDS_default:
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-stevedore \
-        python-six \
-        python-voluptuous \
-        python-msgpack \
-        python-fasteners \
-        python-tenacity \
-        python-futures \
-        python-futurist \
-        python-oslo.utils \
-        python-oslo.serialization \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-tooz_2.7.1.bb b/meta-openstack/recipes-devtools/python/python3-tooz_2.7.1.bb
new file mode 100644
index 0000000..cc2824c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-tooz_2.7.1.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Coordination library for distributed systems."
+HOMEPAGE = "https://pypi.python.org/pypi/tooz"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "f8afa62d566f602d63050850d4873583"
+SRC_URI[sha256sum] = "bee07684b12e9fb06adbe6b1a5ddb60ef9e8dc20f5a2d46e667d8797028bcfe5"
+
+inherit setuptools3 pypi
+
+# DEPENDS_default: python-pip
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
+# RDEPENDS_default:
+RDEPENDS_${PN} += " \
+        python3-pbr \
+        python3-stevedore \
+        python3-six \
+        python3-voluptuous \
+        python3-msgpack \
+        python3-fasteners \
+        python3-tenacity \
+        python3-futurist \
+        python3-oslo.utils \
+        python3-oslo.serialization \
+        "
-- 
2.25.1



