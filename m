Return-Path: <bruce.ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA3FAE00975; Wed, 14 May 2014 07:44:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from mail.windriver.com (unknown [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10CF4E006EF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 May 2014 07:44:38 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com
	(yow-bashfiel-d3.corp.ad.wrs.com [128.224.92.171])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4EEibHn027220
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 May 2014 07:44:37 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 14 May 2014 10:44:36 -0400
Message-Id: <1400078676-681-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] libvirt: uprev to 1.2.4
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
X-List-Received-Date: Wed, 14 May 2014 14:44:43 -0000

Updating the version of libvirt to 1.2.4. Only small changes are required
to the ptest and python chnages for this new version, but otherwise, all
packaging and build optinos are the same.

Sanity tests show no regressions from 1.2.2.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc        |  4 +-
 .../libvirt/libvirt/libvirt_api_xml_path.patch     | 88 ++++++++++------------
 recipes-extended/libvirt/libvirt/runptest.patch    | 31 ++++----
 .../libvirt/{libvirt_1.2.2.bb => libvirt_1.2.4.bb} |  4 +-
 4 files changed, 61 insertions(+), 66 deletions(-)
 rename recipes-extended/libvirt/{libvirt_1.2.2.bb => libvirt_1.2.4.bb} (98%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 181e9d3cbd6c..1c95b07f5655 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "cd3b75c0eb64e933f0b648fbdca6e868"
-SRC_URI[libvirt_python.sha256sum] = "94d79d662b6010f6c688b8856b2d95077736d48ffa35feed5a339d7fafbf8c39"
+SRC_URI[libvirt_python.md5sum] = "fbcb68f898390b321cbfcbdaa8d0c1ba"
+SRC_URI[libvirt_python.sha256sum] = "a2f30059b8870b3808b2bd2f19210422a348649a8f53523c2cbfa5cd64af217e"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch b/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
index 0aa3bde221de..b0fa20e14fc5 100644
--- a/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
+++ b/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
@@ -14,41 +14,26 @@ Signed-off-by: Martin Kletzander <mkletzan redhat com>
  setup.py |   25 ++++++++++++++++++++++---
  1 file changed, 22 insertions(+), 3 deletions(-)
 
-Index: libvirt-python-1.2.1/setup.py
+Index: libvirt-python-1.2.4/setup.py
 ===================================================================
---- libvirt-python-1.2.1.orig/setup.py
-+++ libvirt-python-1.2.1/setup.py
-@@ -30,18 +30,19 @@
- if pkgcfg is None:
-     raise Exception("pkg-config binary is required to compile libvirt-python")
+--- libvirt-python-1.2.4.orig/setup.py
++++ libvirt-python-1.2.4/setup.py
+@@ -40,13 +40,7 @@
+            "libvirt"])
  
--spawn([pkgcfg,
--       "--print-errors",
--       "--atleast-version=%s" % MIN_LIBVIRT,
--       "libvirt"])
-+# spawn([pkgcfg,
-+#        "--print-errors",
-+#        "--atleast-version=%s" % MIN_LIBVIRT,
-+#        "libvirt"])
- 
- have_libvirt_lxc=True
--try:
--    spawn([pkgcfg,
--           "--atleast-version=%s" % MIN_LIBVIRT_LXC,
--         "libvirt"])
--except DistutilsExecError:
--    have_libvirt_lxc=False
-+# try:
-+#     spawn([pkgcfg,
-+#            "--atleast-version=%s" % MIN_LIBVIRT_LXC,
-+#          "libvirt"])
-+# except DistutilsExecError:
-+#     have_libvirt_lxc=False
-+have_libvirt_lxc=True
+ def have_libvirt_lxc():
+-    try:
+-        spawn([get_pkgcfg(),
+-               "--atleast-version=%s" % MIN_LIBVIRT_LXC,
+-             "libvirt"])
+-        return True
+-    except DistutilsExecError:
+-        return False
++    return True
  
  def get_pkgconfig_data(args, mod, required=True):
      """Run pkg-config to and return content associated with it"""
-@@ -63,7 +64,17 @@
+@@ -68,7 +62,17 @@
      """Check with pkg-config that libvirt is present and extract
      the API XML file paths we need from it"""
  
@@ -67,23 +52,32 @@ Index: libvirt-python-1.2.1/setup.py
  
      offset = libvirt_api.index("-api.xml")
      libvirt_qemu_api = libvirt_api[0:offset] + "-qemu-api.xml"
-@@ -73,8 +84,17 @@
- 
-     return (libvirt_api, libvirt_qemu_api, libvirt_lxc_api)
+@@ -88,8 +92,17 @@
  
--ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False)
--cflags = get_pkgconfig_data(["--cflags"], "libvirt", False)
-+libvirt_cflags = os.getenv("LIBVIRT_CFLAGS")
-+if libvirt_cflags:
-+    cflags = libvirt_cflags
-+else:
-+    cflags = get_pkgconfig_data(["--cflags"], "libvirt", False)
+     c_modules = []
+     py_modules = []
+-    ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False)
+-    cflags = get_pkgconfig_data(["--cflags"], "libvirt", False)
++    libvirt_cflags = os.getenv("LIBVIRT_CFLAGS")
++    if libvirt_cflags:
++        cflags = libvirt_cflags
++    else:
++        cflags = get_pkgconfig_data(["--cflags"], "libvirt", False)
 +
-+libvirt_libs = os.getenv("LIBVIRT_LIBS")
-+if libvirt_libs:
-+    ldflags = libvirt_libs
-+else:
-+    ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False)
++    libvirt_libs = os.getenv("LIBVIRT_LIBS")
++    if libvirt_libs:
++        ldflags = libvirt_libs
++    else:
++        ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False)
+ 
+     module = Extension('libvirtmod',
+                        sources = ['libvirt-override.c', 'build/libvirt.c', 'typewrappers.c', 'libvirt-utils.c'],
+@@ -138,7 +151,7 @@
+ class my_build(build):
+ 
+     def run(self):
+-        check_minimum_libvirt_version()
++#        check_minimum_libvirt_version()
+         apis = get_api_xml_files()
  
- c_modules = []
- py_modules = []
+         self.spawn([sys.executable, "generator.py", "libvirt", apis[0]])
diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
index 0c0197511a77..cdc0f65c34ad 100644
--- a/recipes-extended/libvirt/libvirt/runptest.patch
+++ b/recipes-extended/libvirt/libvirt/runptest.patch
@@ -4,24 +4,25 @@ Change TESTS_ENVIRONMENT to allow running outside build dir.
 Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
 Upstream-status: Pending
 
-diff -uNr a/tests/Makefile.am b/tests/Makefile.am
---- a/tests/Makefile.am	2014-03-11 11:37:31.497605736 +0200
-+++ b/tests/Makefile.am	2014-03-17 15:57:35.515268399 +0200
-@@ -27,9 +27,11 @@
+Index: libvirt-1.2.4/tests/Makefile.am
+===================================================================
+--- libvirt-1.2.4.orig/tests/Makefile.am
++++ libvirt-1.2.4/tests/Makefile.am
+@@ -31,9 +31,11 @@
  	-I$(top_srcdir)/src/conf \
  	$(GETTEXT_CPPFLAGS)
  
 +PTEST_DIR ?= /usr/lib/libvirt/ptest
 +
  AM_CFLAGS = \
--	-Dabs_builddir="\"`pwd`\"" \
--	-Dabs_srcdir="\"`cd '$(srcdir)'; pwd`\"" \
+-	-Dabs_builddir="\"$(abs_builddir)\"" \
+-	-Dabs_srcdir="\"$(abs_srcdir)\"" \
 +	-Dabs_builddir="\"$(PTEST_DIR)/tests\"" \
 +	-Dabs_srcdir="\"$(PTEST_DIR)/tests\"" \
  	$(LIBXML_CFLAGS) \
  	$(GNUTLS_CFLAGS) \
  	$(SASL_CFLAGS) \
-@@ -41,7 +43,7 @@
+@@ -48,7 +50,7 @@
  
  if WITH_DRIVER_MODULES
  INCLUDES += \
@@ -30,11 +31,11 @@ diff -uNr a/tests/Makefile.am b/tests/Makefile.am
  endif WITH_DRIVER_MODULES
  
  PROBES_O =
-@@ -344,20 +346,19 @@
+@@ -409,20 +411,19 @@
  # Also, BSD sh doesn't like 'a=b b=$$a', so we can't use an
  # intermediate shell variable, but must do all the expansion in make
  
--lv_abs_top_builddir=`cd '$(top_builddir)'; pwd`
+-lv_abs_top_builddir=$(shell cd '$(top_builddir)' && pwd)
  path_add = $(subst :,$(PATH_SEPARATOR),\
 -	$(subst !,$(lv_abs_top_builddir)/,!daemon:!tools:!tests))
 +	$(subst !,$(PTEST_DIR)/,!daemon:!tools:!tests))
@@ -43,9 +44,9 @@ diff -uNr a/tests/Makefile.am b/tests/Makefile.am
  TESTS_ENVIRONMENT =				\
 -  abs_top_builddir=$(lv_abs_top_builddir)	\
 -  abs_top_srcdir=`cd '$(top_srcdir)'; pwd`	\
--  abs_builddir=`pwd`				\
--  abs_srcdir=`cd '$(srcdir)'; pwd`		\
--  CONFIG_HEADER="`cd '$(top_builddir)'; pwd`/config.h"	\
+-  abs_builddir=$(abs_builddir)			\
+-  abs_srcdir=$(abs_srcdir)			\
+-  CONFIG_HEADER="$(lv_abs_top_builddir)/config.h"	\
 +  abs_top_builddir="$(PTEST_DIR)"             \
 +  abs_top_srcdir="$(PTEST_DIR)"               \
 +  abs_builddir="$(PTEST_DIR)/tests"           \
@@ -58,8 +59,8 @@ diff -uNr a/tests/Makefile.am b/tests/Makefile.am
    LIBVIRT_AUTOSTART=0				\
    LC_ALL=C					\
    VIR_TEST_EXPENSIVE=$(VIR_TEST_EXPENSIVE)	\
-@@ -933,5 +934,51 @@
- EXTRA_DIST += object-locking.ml
+@@ -1137,5 +1138,51 @@
+ EXTRA_DIST += objectlocking.ml
  endif ! WITH_CIL
  
 +buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
@@ -109,4 +110,4 @@ diff -uNr a/tests/Makefile.am b/tests/Makefile.am
 +	sed -i -e 's|^\(.*\.log:\) \(.*EXEEXT.*\)|\1|g' $(DEST_DIR)/tests/Makefile
 +
  CLEANFILES = *.cov *.gcov .libs/*.gcda .libs/*.gcno *.gcno *.gcda *.cmi *.cmx \
- 	object-locking-files.txt
+ 	objectlocking-files.txt
diff --git a/recipes-extended/libvirt/libvirt_1.2.2.bb b/recipes-extended/libvirt/libvirt_1.2.4.bb
similarity index 98%
rename from recipes-extended/libvirt/libvirt_1.2.2.bb
rename to recipes-extended/libvirt/libvirt_1.2.4.bb
index 22ae2c7a0ad5..c2eea495682e 100644
--- a/recipes-extended/libvirt/libvirt_1.2.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.4.bb
@@ -32,8 +32,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://tests-allow-separated-src-and-build-dirs.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "592958ad1ddce7574d8cb0a31e635acd"
-SRC_URI[libvirt.sha256sum] = "a48377e307c5c21b67e43db99af909a23c33aff8cbbaa3361fd389eb047cbbc3"
+SRC_URI[libvirt.md5sum] = "da7a9ca519df45a460659189fe0024e6"
+SRC_URI[libvirt.sha256sum] = "e43ac5f6b2baeafcd01777be03a897e636f8d48c0cdfb4c4cbb80d45faa9e875"
 
 inherit autotools gettext update-rc.d pkgconfig ptest
 
-- 
1.8.1.2


