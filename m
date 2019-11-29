Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.5066.1575005673449596041
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2019 21:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAT5YWZ8019965
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Nov 2019 21:34:32 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.468.0; Thu, 28 Nov 2019 21:34:31 -0800
From: "Changqing Li" <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][meta-openstack][PATCH] python-sqlparse: move this recipe to meta-python
Date: Fri, 29 Nov 2019 13:34:30 +0800
Message-ID: <1575005670-87337-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

After python3-django upgrade to 2.2, it RDEPEND on python3-sqlparse,
so move this to meta-python

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-devtools/python/python-sqlparse.inc    | 22 ----------------------
 .../python/python-sqlparse_0.3.0.bb                |  2 --
 .../python/python3-sqlparse_0.3.0.bb               |  2 --
 3 files changed, 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse.inc
 delete mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse.inc b/meta-openstack/recipes-devtools/python/python-sqlparse.inc
deleted file mode 100644
index cc55ff7..0000000
--- a/meta-openstack/recipes-devtools/python/python-sqlparse.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Non-validating SQL parser module"
-HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
-
-SRC_URI[md5sum] = "2ce34181d6b7b234c9f3c0ecd1ffb93e"
-SRC_URI[sha256sum] = "7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873"
-
-export BUILD_SYS
-export HOST_SYS
-
-inherit pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
deleted file mode 100644
index 2b7773f..0000000
--- a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-sqlparse.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb b/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
deleted file mode 100644
index 7b3bcf6..0000000
--- a/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-sqlparse.inc
-- 
2.7.4

