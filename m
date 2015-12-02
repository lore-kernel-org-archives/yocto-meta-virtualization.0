Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03D11E00B76; Wed,  2 Dec 2015 08:34:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 1A1F8E00B76
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:47 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:46 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:44 +0100
Message-ID: <1449073966-29707-39-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 38/40] python-lesscpy: remove recipe
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Dec 2015 16:34:30 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../0001-lesscpy-remove-explicit-python3.patch     | 23 ----------------
 ...02-Description-Fixup-for-python3.3-compat.patch | 31 ----------------------
 .../recipes-devtools/python/python-lesscpy_0.9j.bb | 28 -------------------
 3 files changed, 82 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lesscpy/0001-lesscpy-remove-explicit-python3.patch
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lesscpy/0002-Description-Fixup-for-python3.3-compat.patch
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lesscpy_0.9j.bb

diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy/0001-lesscpy-remove-explicit-python3.patch b/meta-openstack/recipes-devtools/python/python-lesscpy/0001-lesscpy-remove-explicit-python3.patch
deleted file mode 100644
index 36dc7dc..0000000
--- a/meta-openstack/recipes-devtools/python/python-lesscpy/0001-lesscpy-remove-explicit-python3.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 3331202e96593d47b8e3a253777ea94537fc08f2 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Wed, 30 Oct 2013 23:09:56 -0400
-Subject: [PATCH 1/2] lesscpy: remove explicit python3
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- bin/lesscpy |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bin/lesscpy b/bin/lesscpy
-index 4613f9e..0834996 100755
---- a/bin/lesscpy
-+++ b/bin/lesscpy
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python3
-+#!/usr/bin/env python
- """
-     Lesscpy run script
-     <jtm@robot.is>
--- 
-1.7.10.4
-
diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy/0002-Description-Fixup-for-python3.3-compat.patch b/meta-openstack/recipes-devtools/python/python-lesscpy/0002-Description-Fixup-for-python3.3-compat.patch
deleted file mode 100644
index b5da15a..0000000
--- a/meta-openstack/recipes-devtools/python/python-lesscpy/0002-Description-Fixup-for-python3.3-compat.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8b9fb203948ca752d848cee951ccde2954abcfe3 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Wed, 30 Oct 2013 23:17:28 -0400
-Subject: [PATCH 2/2] Description: Fixup for python3.3 compat Author: James
- Page <james.page@ubuntu.com> Forwarded:
- https://github.com/robotis/Lesscpy/pull/23
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- lesscpy/scripts/compiler.py |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/lesscpy/scripts/compiler.py b/lesscpy/scripts/compiler.py
-index f6b92c7..93dabd3 100644
---- a/lesscpy/scripts/compiler.py
-+++ b/lesscpy/scripts/compiler.py
-@@ -84,8 +84,9 @@ def run():
-     """Run compiler
-     """
-     aparse = argparse.ArgumentParser(description='LessCss Compiler',
--                                     epilog='<< jtm@robot.is @_o >>',
--                                     version=VERSION_STR)
-+                                     epilog='<< jtm@robot.is @_o >>')
-+    aparse.add_argument('-v', '--version', action='version',
-+                        version=VERSION_STR)
-     aparse.add_argument('-I', '--include', action="store", type=str,
-                         help="Included less-files (comma separated)")
-     aparse.add_argument('-V', '--verbose', action="store_true",
--- 
-1.7.10.4
-
diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy_0.9j.bb b/meta-openstack/recipes-devtools/python/python-lesscpy_0.9j.bb
deleted file mode 100644
index 3bee660..0000000
--- a/meta-openstack/recipes-devtools/python/python-lesscpy_0.9j.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Python lesscpy: Python LESS Compiler"
-HOMEPAGE = "https://pypi.python.org/pypi/lesscpy"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a01aae31681ac25b4c46f98d627b9b5d"
-
-PR = "r0"
-SRCNAME = "lesscpy"
-
-SRC_URI = "https://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-           file://0001-lesscpy-remove-explicit-python3.patch \
-           file://0002-Description-Fixup-for-python3.3-compat.patch \
-           "
-
-DEPENDS += "python-ply"
-RDEPENDS_${PN} += "python-ply"
-
-SRC_URI[md5sum] = "a9587da0148463d6521f386294c9d6f3"
-SRC_URI[sha256sum] = "fa01d435a1ab3abafba683519bdc7aca5e19399e96225e1a8bc1d660b566364d"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
-- 
2.1.0


