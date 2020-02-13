Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2332.1581623390318976187
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 11:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: nathan.hartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01DJmm5q027400
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 13 Feb 2020 11:49:24 -0800
Received: from yow-nhartman-lx.wrs.com (128.224.146.238) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Thu, 13 Feb 2020 11:49:21 -0800
From: "Nathan Hartman" <nathan.hartman@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>,
        Nathan Hartman
	<nathan.hartman@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH 3/3] mock: Add python3 version
Date: Thu, 13 Feb 2020 14:48:17 -0500
Message-ID: <20200213194816.31473-3-nathan.hartman@windriver.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213194816.31473-1-nathan.hartman@windriver.com>
References: <20200213194816.31473-1-nathan.hartman@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.238]
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nathan Hartman <hnathan918@gmail.com>

Signed-off-by: Nathan Hartman <nathan.hartman@windriver.com>
---
 .../recipes-devtools/python/python-mock.inc     | 14 ++++++++++++++
 .../python/python-mock_1.0.1.bb                 | 17 -----------------
 .../python/python3-mock_4.0.1.bb                |  5 +++++
 3 files changed, 19 insertions(+), 17 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-mock.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-mock_4.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-mock.inc b/meta-openstack/recipes-devtools/python/python-mock.inc
new file mode 100644
index 0000000..f05061f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-mock.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "A Python Mocking and Patching Library for Testing"
+HOMEPAGE = "https://pypi.python.org/pypi/mock"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
+            ${PYTHON_PN}-cmd2 \
+            ${PYTHON_PN}-pyparsing \
+            ${PYTHON_PN}-mccabe \
+            ${PYTHON_PN}-pep8 \
+            ${PYTHON_PN}-pyflakes"
diff --git a/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
deleted file mode 100644
index badb21c..0000000
--- a/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "A Python Mocking and Patching Library for Testing"
-HOMEPAGE = "https://pypi.python.org/pypi/mock"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e5ba73891255687dff3bee2b4cbb16"
-
-SRC_URI[md5sum] = "c3971991738caa55ec7c356bbc154ee2"
-SRC_URI[sha256sum] = "b839dd2d9c117c701430c149956918a423a9863b48b09c90e30a6013e7d2f44f"
-
-inherit setuptools3 pypi
-
-RDEPENDS_${PN} += "python-prettytable \
-            python-cmd2 \
-            python-pyparsing \
-            python-mccabe \
-            python-pep8 \
-            python-pyflakes"
diff --git a/meta-openstack/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-openstack/recipes-devtools/python/python3-mock_4.0.1.bb
new file mode 100644
index 0000000..3dcb028
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-mock_4.0.1.bb
@@ -0,0 +1,5 @@
+require python-mock.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "8f48ba3fd059e7cfad92f8354064adfd"
+SRC_URI[sha256sum] = "2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3"
\ No newline at end of file
-- 
2.20.1

