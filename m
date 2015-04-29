Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA5F6E009F3; Tue, 28 Apr 2015 20:09:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F22B2E009DB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:12 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39C0F009380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:12 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:12 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:26 +0800
Message-ID: <c940205412b9933d188fc273eb9d42605336b978.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 16/55] python-lesscpy: upgrade to 0.10.2
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

remove unneeded patches since they are fixed in new version.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../0001-lesscpy-remove-explicit-python3.patch     | 23 ----------------
 ...02-Description-Fixup-for-python3.3-compat.patch | 31 ----------------------
 ...on-lesscpy_0.9j.bb => python-lesscpy_0.10.2.bb} |  7 ++---
 3 files changed, 2 insertions(+), 59 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lesscpy/0001-lesscpy-remove-explicit-python3.patch
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lesscpy/0002-Description-Fixup-for-python3.3-compat.patch
 rename meta-openstack/recipes-devtools/python/{python-lesscpy_0.9j.bb => python-lesscpy_0.10.2.bb} (68%)

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
diff --git a/meta-openstack/recipes-devtools/python/python-lesscpy_0.9j.bb b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
similarity index 68%
rename from meta-openstack/recipes-devtools/python/python-lesscpy_0.9j.bb
rename to meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
index 3bee660..61ae935 100644
--- a/meta-openstack/recipes-devtools/python/python-lesscpy_0.9j.bb
+++ b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
@@ -4,19 +4,16 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a01aae31681ac25b4c46f98d627b9b5d"
 
-PR = "r0"
 SRCNAME = "lesscpy"
 
 SRC_URI = "https://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-           file://0001-lesscpy-remove-explicit-python3.patch \
-           file://0002-Description-Fixup-for-python3.3-compat.patch \
            "
 
 DEPENDS += "python-ply"
 RDEPENDS_${PN} += "python-ply"
 
-SRC_URI[md5sum] = "a9587da0148463d6521f386294c9d6f3"
-SRC_URI[sha256sum] = "fa01d435a1ab3abafba683519bdc7aca5e19399e96225e1a8bc1d660b566364d"
+SRC_URI[md5sum] = "fedbad1f4eb19c3af37f09560156246d"
+SRC_URI[sha256sum] = "ccad1ad2a89ced1875c5ca4e16e5478b791d31fb187fe29f1541859318ed9055"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


