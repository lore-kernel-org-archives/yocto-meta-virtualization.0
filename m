Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2265.1581623366263193068
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 11:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: nathan.hartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01DJmm5n027400
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 13 Feb 2020 11:48:58 -0800
Received: from yow-nhartman-lx.wrs.com (128.224.146.238) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Thu, 13 Feb 2020 11:48:38 -0800
From: "Nathan Hartman" <nathan.hartman@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>,
        Nathan Hartman
	<nathan.hartman@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH 2/3] pep8: Add python3 version
Date: Thu, 13 Feb 2020 14:48:15 -0500
Message-ID: <20200213194816.31473-2-nathan.hartman@windriver.com>
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
 .../python/{python-pep8_1.6.2.bb => python-pep8.inc}   | 10 +++++-----
 .../recipes-devtools/python/python3-pep8_1.7.1.bb      |  5 +++++
 2 files changed, 10 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pep8_1.6.2.bb => python-pep8.inc} (58%)
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pep8_1.7.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pep8_1.6.2.bb b/meta-openstack/recipes-devtools/python/python-pep8.inc
similarity index 58%
rename from meta-openstack/recipes-devtools/python/python-pep8_1.6.2.bb
rename to meta-openstack/recipes-devtools/python/python-pep8.inc
index 7a131d7..959c3d1 100644
--- a/meta-openstack/recipes-devtools/python/python-pep8_1.6.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-pep8.inc
@@ -2,13 +2,13 @@ DESCRIPTION = "Python style guide checker"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=b0d37793ab91ca25ad5c200e9ea22331"
+LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
 
 SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
 SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
 
-inherit setuptools3 pypi
+inherit pypi
 
-RDEPENDS_${PN} += "python-prettytable \
-            python-cmd2 \
-            python-pyparsing"
\ No newline at end of file
+RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
+            ${PYTHON_PN}-cmd2 \
+            ${PYTHON_PN}-pyparsing"
\ No newline at end of file
diff --git a/meta-openstack/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-openstack/recipes-devtools/python/python3-pep8_1.7.1.bb
new file mode 100644
index 0000000..64fd154
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pep8.inc
+
+SRC_URI[md5sum] = "603821d06db945c71d811b5a8d78423c"
+SRC_URI[sha256sum] = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"
\ No newline at end of file
-- 
2.20.1

