Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.2255.1581623314181464025
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 11:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: nathan.hartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01DJmWDe025429
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 13 Feb 2020 11:48:32 -0800 (PST)
Received: from yow-nhartman-lx.wrs.com (128.224.146.238) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Thu, 13 Feb 2020 11:48:31 -0800
From: nathan.hartman@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>,
        Nathan Hartman
	<nathan.hartman@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH 1/3] tox: Add python3 version
Date: Thu, 13 Feb 2020 14:48:14 -0500
Message-ID: <20200213194816.31473-1-nathan.hartman@windriver.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [128.224.146.238]
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nathan Hartman <hnathan918@gmail.com>

Signed-off-by: Nathan Hartman <nathan.hartman@windriver.com>
---
 .../{python-tox_1.9.2.bb => python-tox.inc}     | 17 +++++++----------
 .../python/python3-tox_3.14.3.bb                |  5 +++++
 2 files changed, 12 insertions(+), 10 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tox_1.9.2.bb => python-tox.inc} (56%)
 create mode 100644 meta-openstack/recipes-devtools/python/python3-tox_3.14.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb b/meta-openstack/recipes-devtools/python/python-tox.inc
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
rename to meta-openstack/recipes-devtools/python/python-tox.inc
index 8184fb5..66b1355 100644
--- a/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-tox.inc
@@ -2,21 +2,18 @@ DESCRIPTION = "virtualenv-based automation of test activities"
 HOMEPAGE = "http://tox.testrun.org"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2d0fc2c2c954dc4d41043e67d4a8d8e7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f24505dfbdd8c22c61de6383f2e74bf9"
 
-SRC_URI[md5sum] = "f4db4d6a82d6a651e457ba55ef370258"
-SRC_URI[sha256sum] = "3125a15da7381f59f835a25bd259a84acb7a69858c81e386c50027bd842bb91b"
-
-inherit setuptools3 pypi
+inherit pypi
 
 DEPENDS += " \
-        python-pip \
+        ${PYTHON_PN}-pip \
         "
 
 RDEPENDS_${PN} += " \
-        python-virtualenv \
-        python-py \
-        python-pytest \
+        ${PYTHON_PN}-virtualenv \
+        ${PYTHON_PN}-py \
+        ${PYTHON_PN}-pytest \
         "
 
 do_install_append() {
@@ -24,7 +21,7 @@ do_install_append() {
     install -d ${D}/${sysconfdir}/${SRCNAME}
     cp ${S}/tox.ini    ${D}/${sysconfdir}/${SRCNAME}
     cp ${S}/setup.py   ${D}/${sysconfdir}/${SRCNAME}
-    cp ${S}/README.rst ${D}/${sysconfdir}/${SRCNAME}
+    cp ${S}/README.md ${D}/${sysconfdir}/${SRCNAME}
 
     ln -s ${PYTHON_SITEPACKAGES_DIR}/tox ${D}/${sysconfdir}/${SRCNAME}/tox
 }
diff --git a/meta-openstack/recipes-devtools/python/python3-tox_3.14.3.bb b/meta-openstack/recipes-devtools/python/python3-tox_3.14.3.bb
new file mode 100644
index 0000000..678413a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-tox_3.14.3.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-tox.inc
+
+SRC_URI[md5sum] = "8b695d482786dd51643e10953bbd8c89"
+SRC_URI[sha256sum] = "06ba73b149bf838d5cd25dc30c2dd2671ae5b2757cf98e5c41a35fe449f131b3"
-- 
2.20.1

