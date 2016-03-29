Return-Path: <Yunguo.Wei@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E151E00B30; Tue, 29 Mar 2016 01:36:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2D5FE008EE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 01:36:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2T8apdt019467
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 01:36:51 -0700 (PDT)
Received: from pek-bsp-build5.wrs.com (128.224.179.117) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 29 Mar 2016 01:36:50 -0700
From: Yunguo Wei <yunguo.wei@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 29 Mar 2016 16:32:32 +0800
Message-ID: <1459240352-138480-1-git-send-email-yunguo.wei@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libvirt: uprev to 1.3.2
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
X-List-Received-Date: Tue, 29 Mar 2016 08:36:56 -0000
Content-Type: text/plain

Release notes here http://libvirt.org/news.html.

Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
---
 .../libvirt-1.2.19/0001-to-fix-build-error.patch   |  44 ----
 ...-split-to-properly-retrieve-cflags-and-ld.patch |  41 +++
 .../libvirt-1.3.2/0001-to-fix-build-error.patch    |  46 ++++
 recipes-extended/libvirt/libvirt-python.inc        |   5 +-
 ...vert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch |  52 ++--
 .../libvirt-use-pkg-config-to-locate-libcap.patch  |  11 +-
 .../libvirt/libvirt/libvirt_api_xml_path.patch     |   4 +-
 recipes-extended/libvirt/libvirt/runptest.patch    |   2 +-
 .../tests-allow-separated-src-and-build-dirs.patch |  13 +-
 ...ibvirt-net-rpc-to-virt-host-validate-when.patch | 107 +++-----
 recipes-extended/libvirt/libvirt_1.2.19.bb         | 287 ---------------------
 recipes-extended/libvirt/libvirt_1.3.2.bb          | 287 +++++++++++++++++++++
 12 files changed, 451 insertions(+), 448 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch
 create mode 100644 recipes-extended/libvirt/libvirt-1.3.2/0001-Add-missing-split-to-properly-retrieve-cflags-and-ld.patch
 create mode 100644 recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.patch
 delete mode 100644 recipes-extended/libvirt/libvirt_1.2.19.bb
 create mode 100644 recipes-extended/libvirt/libvirt_1.3.2.bb

diff --git a/recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch b/recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch
deleted file mode 100644
index 61a54e1..0000000
--- a/recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 62514c8c2925e48a4f20ce3d7d48387851cb76a5 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Fri, 31 Jul 2015 03:17:07 +0900
-Subject: [PATCH] to fix build error
-
-The error likes as following
-
-| Generating internals/command.html.tmp
-| /bin/sh: line 3: internals/command.html.tmp: No such file or directory
-| rm: Generating internals/locking.html.tmp
-| cannot remove `internals/command.html.tmp': No such file or directory
-| make[3]: *** [internals/command.html.tmp] Error 1
-| make[3]: *** Waiting for unfinished jobs....
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- docs/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/docs/Makefile.am b/docs/Makefile.am
-index daf37b6..125c5fd 100644
---- a/docs/Makefile.am
-+++ b/docs/Makefile.am
-@@ -162,7 +162,7 @@ EXTRA_DIST=					\
-   sitemap.html.in aclperms.htmlinc \
-   todo.pl hvsupport.pl todo.cfg-example
- 
--acl_generated = aclperms.htmlinc
-+acl.html:: $(srcdir)/aclperms.htmlinc
- 
- $(srcdir)/aclperms.htmlinc: $(top_srcdir)/src/access/viraccessperm.h \
-         $(srcdir)/genaclperms.pl Makefile.am
-@@ -227,7 +227,7 @@ internals/%.html.tmp: internals/%.html.in subsite.xsl page.xsl sitemap.html.in
- 	    $(top_srcdir)/docs/subsite.xsl $< > $@ \
- 	    || { rm $@ && exit 1; }; fi
- 
--%.html.tmp: %.html.in site.xsl page.xsl sitemap.html.in $(acl_generated)
-+%.html.tmp: %.html.in site.xsl page.xsl sitemap.html.in 
- 	@if [ -x $(XSLTPROC) ] ; then \
- 	  echo "Generating $@"; \
- 	  name=`echo $@ | sed -e 's/.tmp//'`; \
--- 
-1.8.4.2
-
diff --git a/recipes-extended/libvirt/libvirt-1.3.2/0001-Add-missing-split-to-properly-retrieve-cflags-and-ld.patch b/recipes-extended/libvirt/libvirt-1.3.2/0001-Add-missing-split-to-properly-retrieve-cflags-and-ld.patch
new file mode 100644
index 0000000..89ad16b
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-1.3.2/0001-Add-missing-split-to-properly-retrieve-cflags-and-ld.patch
@@ -0,0 +1,41 @@
+From acda8ce282c68eff364992c518127e21968b07cd Mon Sep 17 00:00:00 2001
+From: Yunguo Wei <yunguo.wei@windriver.com>
+Date: Mon, 28 Mar 2016 16:19:09 +0800
+Subject: [PATCH] Add missing split() to properly retrieve cflags and ldflags
+
+commit a265fddf5d70ce(setup: Use cflags and ldflags properly) is not
+fully merged in 1.3.2 tar ball, as the split() was missed, so add it
+during retrieving cflags and ldflags.
+
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
+---
+ setup.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 386b6fc..eb84fd4 100755
+--- a/setup.py
++++ b/setup.py
+@@ -94,15 +94,15 @@ def get_module_lists():
+     py_modules = []
+     libvirt_cflags = os.getenv("LIBVIRT_CFLAGS")
+     if libvirt_cflags:
+-        cflags = libvirt_cflags
++        cflags = libvirt_cflags.split()
+     else:
+-        cflags = get_pkgconfig_data(["--cflags"], "libvirt", False)
++        cflags = get_pkgconfig_data(["--cflags"], "libvirt", False).split()
+ 
+     libvirt_libs = os.getenv("LIBVIRT_LIBS")
+     if libvirt_libs:
+-        ldflags = libvirt_libs
++        ldflags = libvirt_libs.split()
+     else:
+-        ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False)
++        ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False).split()
+ 
+     module = Extension('libvirtmod',
+                        sources = ['libvirt-override.c', 'build/libvirt.c', 'typewrappers.c', 'libvirt-utils.c'],
+-- 
+1.9.1
+
diff --git a/recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.patch b/recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.patch
new file mode 100644
index 0000000..8ffd8cb
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.patch
@@ -0,0 +1,46 @@
+From 8353dc1e642011199c3b3ba057d51d8768e4cd54 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 31 Jul 2015 03:17:07 +0900
+Subject: [PATCH 5/6] to fix build error
+
+The error likes as following
+
+| Generating internals/command.html.tmp
+| /bin/sh: line 3: internals/command.html.tmp: No such file or directory
+| rm: Generating internals/locking.html.tmp
+| cannot remove `internals/command.html.tmp': No such file or directory
+| make[3]: *** [internals/command.html.tmp] Error 1
+| make[3]: *** Waiting for unfinished jobs....
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+[ywei: rebased to libvirt-1.3.2]
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
+---
+ docs/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/docs/Makefile.am b/docs/Makefile.am
+index 1b4353b..c199551 100644
+--- a/docs/Makefile.am
++++ b/docs/Makefile.am
+@@ -164,7 +164,7 @@ EXTRA_DIST=					\
+   todo.pl hvsupport.pl todo.cfg-example \
+   $(schema_DATA)
+ 
+-acl_generated = aclperms.htmlinc
++acl.html:: $(srcdir)/aclperms.htmlinc
+ 
+ $(srcdir)/aclperms.htmlinc: $(top_srcdir)/src/access/viraccessperm.h \
+         $(srcdir)/genaclperms.pl Makefile.am
+@@ -221,7 +221,7 @@ $(srcdir)/hvsupport.html.in: $(srcdir)/hvsupport.pl $(api_DATA) \
+ 	convert -rotate 90 $< $@
+ 
+ %.html.tmp: %.html.in site.xsl subsite.xsl page.xsl \
+-		sitemap.html.in $(acl_generated)
++		sitemap.html.in
+ 	@if [ -x $(XSLTPROC) ] ; then \
+ 	  echo "Generating $@"; \
+ 	  name=`echo $@ | sed -e 's/.tmp//'`; \
+-- 
+1.9.1
+
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 015b4b6..a0fdcd6 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -17,9 +17,10 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
+SRC_URI += "file://0001-Add-missing-split-to-properly-retrieve-cflags-and-ld.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "429e328028fc59b62404a4163004f2ae"
-SRC_URI[libvirt_python.sha256sum] = "88ab63b0c53e435bd2c6e8551805fe273353708efd4dfab908257dc5f37bec49"
+SRC_URI[libvirt_python.md5sum] = "ed018c714d7ddbe93221c796dff283ed"
+SRC_URI[libvirt_python.sha256sum] = "6d35ae9e7801573393b9c92471f39e6700d479f10b641df81d041b469f160bf8"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch b/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
index c2606bd..16c3a16 100644
--- a/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
+++ b/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
@@ -1,4 +1,4 @@
-From 171fc890bb5972e566bd7b3d87a40ac434a5b3e6 Mon Sep 17 00:00:00 2001
+From dd915e7f70e676aea93f750c75d16ce646e71e4b Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Wed, 9 Sep 2015 11:52:44 -0400
 Subject: [PATCH] Revert "build: add $(prefix) to SYSTEMD_UNIT_DIR"
@@ -12,25 +12,19 @@ SYSTEMD_UNIT_DIR which is not flexible we have to resort to reverting
 this upstream commit to avoid having ${prefix} added to the path.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+[ywei: rebased to libvirt-1.3.2]
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
 ---
- daemon/Makefile.am | 4 ++--
- src/Makefile.am    | 4 ++--
- tools/Makefile.am  | 4 ++--
- 3 files changed, 6 insertions(+), 6 deletions(-)
+ daemon/Makefile.am | 2 +-
+ src/Makefile.am    | 2 +-
+ tools/Makefile.am  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/daemon/Makefile.am b/daemon/Makefile.am
-index 00221ab..e5c5db8 100644
+index 2dbe81b..41ea2db 100644
 --- a/daemon/Makefile.am
 +++ b/daemon/Makefile.am
-@@ -1,6 +1,6 @@
- ## Process this file with automake to produce Makefile.in
- 
--## Copyright (C) 2005-2015 Red Hat, Inc.
-+## Copyright (C) 2005-2015 Red Hat, Inc.
- ##
- ## This library is free software; you can redistribute it and/or
- ## modify it under the terms of the GNU Lesser General Public
-@@ -387,7 +387,7 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART
+@@ -445,7 +445,7 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART
  
  if LIBVIRT_INIT_SCRIPT_SYSTEMD
  
@@ -38,39 +32,25 @@ index 00221ab..e5c5db8 100644
 +SYSTEMD_UNIT_DIR = /lib/systemd/system
  BUILT_SOURCES += libvirtd.service libvirtd.socket
  
- install-init-systemd: install-sysconfig libvirtd.service
+ install-init-systemd: install-sysconfig libvirtd.service libvirtd.socket
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 8f77658..57e163f 100644
+index a316b4d..d271291 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -1,6 +1,6 @@
- ## Process this file with automake to produce Makefile.in
- 
--## Copyright (C) 2005-2015 Red Hat, Inc.
-+## Copyright (C) 2005-2015 Red Hat, Inc.
- ##
- ## This library is free software; you can redistribute it and/or
- ## modify it under the terms of the GNU Lesser General Public
-@@ -2220,7 +2220,7 @@ EXTRA_DIST += \
+@@ -2594,7 +2594,7 @@ EXTRA_DIST += \
  if WITH_LIBVIRTD
  if LIBVIRT_INIT_SCRIPT_SYSTEMD
  
 -SYSTEMD_UNIT_DIR = $(prefix)/lib/systemd/system
 +SYSTEMD_UNIT_DIR = /lib/systemd/system
  
- BUILT_SOURCES += virtlockd.service virtlockd.socket
- DISTCLEANFILES += virtlockd.service virtlockd.socket
+ BUILT_SOURCES += virtlockd.service virtlockd.socket \
+ 		 virtlogd.service virtlogd.socket
 diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 6847f13..256a8f3 100644
+index b3227a7..0e58f73 100644
 --- a/tools/Makefile.am
 +++ b/tools/Makefile.am
-@@ -1,4 +1,4 @@
--## Copyright (C) 2005-2014 Red Hat, Inc.
-+## Copyright (C) 2005-2013 Red Hat, Inc.
- ##
- ## This library is free software; you can redistribute it and/or
- ## modify it under the terms of the GNU Lesser General Public
-@@ -306,7 +306,7 @@ libvirt-guests.init: libvirt-guests.init.in libvirt-guests.sh
+@@ -356,7 +356,7 @@ libvirt-guests.init: libvirt-guests.init.in libvirt-guests.sh
  
  
  EXTRA_DIST += libvirt-guests.service.in
diff --git a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch b/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
index 65b046e..bd365bb 100644
--- a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
+++ b/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
@@ -1,4 +1,4 @@
-From 3e271f6db12ffe34843428ec2f0bca7a8fe3aa65 Mon Sep 17 00:00:00 2001
+From 94896695475ea8aca56245fac2cf24540c62f6d8 Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date: Wed, 8 Apr 2015 13:03:03 -0400
 Subject: [PATCH] libvirt: use pkg-config to locate libcap
@@ -12,15 +12,16 @@ To fix this issue, we patch configure to use 'pkg-config libcap' to
 locate the correct libraries.
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
 ---
  configure.ac | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f37047599b76..5f9b84363b96 100644
+index 93d347c..e1bb1f8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1553,7 +1553,7 @@ fi
+@@ -1545,7 +1545,7 @@ fi
  AM_CONDITIONAL([HAVE_NUMAD], [test "$with_numad" != "no"])
  
  dnl pcap lib
@@ -29,7 +30,7 @@ index f37047599b76..5f9b84363b96 100644
  LIBPCAP_CFLAGS=""
  LIBPCAP_LIBS=""
  LIBPCAP_FOUND="no"
-@@ -1563,8 +1563,8 @@ AC_ARG_WITH([libpcap], [AS_HELP_STRING([--with-libpcap=@<:@PFX@:>@],
+@@ -1555,8 +1555,8 @@ AC_ARG_WITH([libpcap], [AS_HELP_STRING([--with-libpcap=@<:@PFX@:>@],
  if test "$with_qemu" = "yes"; then
    case $with_libpcap in
      no)     LIBPCAP_CONFIG= ;;
@@ -41,5 +42,5 @@ index f37047599b76..5f9b84363b96 100644
    AS_IF([test "x$LIBPCAP_CONFIG" != "x"], [
      AC_MSG_CHECKING(libpcap $LIBPCAP_CONFIG >= $LIBPCAP_REQUIRED )
 -- 
-2.1.0
+1.9.1
 
diff --git a/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch b/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
index 16321db..94144bf 100644
--- a/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
+++ b/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
@@ -56,8 +56,8 @@ Index: libvirt-python-1.2.4/setup.py
  
      c_modules = []
      py_modules = []
--    ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False)
--    cflags = get_pkgconfig_data(["--cflags"], "libvirt", False)
+-    ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False).split()
+-    cflags = get_pkgconfig_data(["--cflags"], "libvirt", False).split()
 +    libvirt_cflags = os.getenv("LIBVIRT_CFLAGS")
 +    if libvirt_cflags:
 +        cflags = libvirt_cflags
diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
index 873a959..a33f569 100644
--- a/recipes-extended/libvirt/libvirt/runptest.patch
+++ b/recipes-extended/libvirt/libvirt/runptest.patch
@@ -20,8 +20,8 @@ Index: libvirt-1.2.4/tests/Makefile.am
 +	-Dabs_builddir="\"$(PTEST_DIR)/tests\"" \
 +	-Dabs_srcdir="\"$(PTEST_DIR)/tests\"" \
  	$(LIBXML_CFLAGS) \
+	$(LIBNL_CFLAGS) \
  	$(GNUTLS_CFLAGS) \
- 	$(SASL_CFLAGS) \
 @@ -48,7 +50,7 @@
  
  if WITH_DRIVER_MODULES
diff --git a/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch b/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch
index 3964865..0422741 100644
--- a/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch
+++ b/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch
@@ -1,20 +1,21 @@
-From 884b6e3724b75cd92766d5386455983e3557a286 Mon Sep 17 00:00:00 2001
+From 077a2b1dd765788acac2944bc9c3dfe1135f6b87 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Fri, 2 May 2014 13:45:05 -0400
-Subject: [PATCH] tests: allow separated src and build dirs
+Subject: [PATCH 3/6] tests: allow separated src and build dirs
 
 Fixup Makefile.am to search for static files back in srcdir.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
 ---
  tests/Makefile.am | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 0da514b..b8d7c19 100644
+index f1c5996..9ba3989 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -1006,22 +1006,22 @@ install-ptest:
+@@ -1321,22 +1321,22 @@ install-ptest:
  	@(if [ -d ../tools/.libs ] ; then cd ../tools/.libs; fi; \
  	install * $(DEST_DIR)/tools)
  	install -d $(DEST_DIR)/src/network
@@ -43,7 +44,7 @@ index 0da514b..b8d7c19 100644
  	install -d $(DEST_DIR)/tests/.libs
  	find . -type d -name "*xml2xml*" -exec cp -r {} $(DEST_DIR)/tests \;
  	find . -type d -name "*data" -exec cp -r {} $(DEST_DIR)/tests \;
-@@ -1029,7 +1029,7 @@ install-ptest:
+@@ -1344,7 +1344,7 @@ install-ptest:
  		if [ -f .libs/$$file ]; then \
  			install .libs/$$file $(DEST_DIR)/tests; \
  		else \
@@ -53,5 +54,5 @@ index 0da514b..b8d7c19 100644
  	done;)
  	@(if [ -d .libs ]; then install .libs/*.so $(DEST_DIR)/tests/.libs; fi;)
 -- 
-1.8.3.2
+1.9.1
 
diff --git a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
index 9141044..a7fc727 100644
--- a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
+++ b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
@@ -1,4 +1,4 @@
-From dade75d1ce25df6ab61867250d7adb65b4912090 Mon Sep 17 00:00:00 2001
+From a790bfe8fa7b24b68cb6f9a1b7205fda2c6d558e Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date: Fri, 2 Aug 2013 11:38:43 -0400
 Subject: [PATCH] tools: add libvirt-net-rpc to virt-host-validate when TLS is
@@ -9,78 +9,55 @@ generated in libvirt. Any binaries linking against libvirt, must also
 link against libvirt-net-rpc which provides the implementation.
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+[ywei: rebased to libvirt-1.3.2]
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
 ---
- examples/dominfo/Makefile.am      |  7 +++++++
- examples/domsuspend/Makefile.am   |  7 +++++++
- examples/hellolibvirt/Makefile.am |  7 +++++++
- examples/openauth/Makefile.am     |  6 ++++++
- tools/Makefile.am                 | 13 +++++++++++++
- 5 files changed, 40 insertions(+)
+ examples/Makefile.am | 19 +++++++++++++++++++
+ tools/Makefile.am    | 13 +++++++++++++
+ 2 files changed, 32 insertions(+)
 
-diff --git a/examples/dominfo/Makefile.am b/examples/dominfo/Makefile.am
-index 4a30c7768df9..99b3e17eb741 100644
---- a/examples/dominfo/Makefile.am
-+++ b/examples/dominfo/Makefile.am
-@@ -23,3 +23,10 @@ noinst_PROGRAMS=info1
- info1_SOURCES=info1.c
- info1_LDFLAGS=
- info1_LDADD= $(LDADDS)
-+
-+if WITH_GNUTLS
-+info1_LDADD += $(top_builddir)/src/libvirt-net-rpc.la  \
-+               $(top_builddir)/gnulib/lib/libgnu.la    \
-+               $(NULL)
-+endif
-+
-diff --git a/examples/domsuspend/Makefile.am b/examples/domsuspend/Makefile.am
-index b8e65f24a28d..9553e0f1d948 100644
---- a/examples/domsuspend/Makefile.am
-+++ b/examples/domsuspend/Makefile.am
-@@ -25,3 +25,10 @@ noinst_PROGRAMS=suspend
- suspend_SOURCES=suspend.c
- suspend_LDFLAGS=
- suspend_LDADD= $(LDADDS)
-+
-+if WITH_GNUTLS
-+suspend_LDADD += $(top_builddir)/src/libvirt-net-rpc.la  \
-+                 $(top_builddir)/gnulib/lib/libgnu.la    \
-+                 $(NULL)
-+endif
-+
-diff --git a/examples/hellolibvirt/Makefile.am b/examples/hellolibvirt/Makefile.am
-index 55ea972c42f8..a5272e2bb565 100644
---- a/examples/hellolibvirt/Makefile.am
-+++ b/examples/hellolibvirt/Makefile.am
-@@ -19,3 +19,10 @@ noinst_PROGRAMS = hellolibvirt
- hellolibvirt_CFLAGS = $(WARN_CFLAGS)
- hellolibvirt_SOURCES = hellolibvirt.c
- hellolibvirt_LDADD = $(top_builddir)/src/libvirt.la
-+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index 2adcefb..fff49d4 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -39,6 +39,10 @@ INCLUDES = -I$(top_builddir)/include -I$(top_srcdir)/include -I$(top_srcdir) \
+ LDADD = $(STATIC_BINARIES) $(WARN_CFLAGS) $(COVERAGE_LDFLAGS) \
+ 	$(top_builddir)/src/libvirt.la $(top_builddir)/gnulib/lib/libgnu.la
+ 
 +if WITH_GNUTLS
-+hellolibvirt_LDADD += $(top_builddir)/src/libvirt-net-rpc.la  \
-+                      $(top_builddir)/gnulib/lib/libgnu.la    \
-+                      $(NULL)
++LDADD += $(top_builddir)/src/libvirt-net-rpc.la
 +endif
 +
-diff --git a/examples/openauth/Makefile.am b/examples/openauth/Makefile.am
-index 7bb860491e73..34e9b47f65cb 100644
---- a/examples/openauth/Makefile.am
-+++ b/examples/openauth/Makefile.am
-@@ -19,3 +19,9 @@ noinst_PROGRAMS = openauth
- openauth_CFLAGS = $(WARN_CFLAGS)
- openauth_SOURCES = openauth.c
- openauth_LDADD = $(top_builddir)/src/libvirt.la
+ noinst_PROGRAMS=dominfo/info1 dommigrate/dommigrate domsuspend/suspend \
+ 	domtop/domtop hellolibvirt/hellolibvirt object-events/event-test \
+ 	openauth/openauth rename/rename
+@@ -52,6 +56,21 @@ object_events_event_test_SOURCES = object-events/event-test.c
+ openauth_openauth_SOURCES = openauth/openauth.c
+ rename_rename_SOURCES = rename/rename.c
+ 
 +if WITH_GNUTLS
-+openauth_LDADD += $(top_builddir)/src/libvirt-net-rpc.la  \
-+                  $(top_builddir)/gnulib/lib/libgnu.la    \
-+                  $(NULL)
++dominfo_info1_LDADD = $(top_builddir)/src/libvirt-net-rpc.la  \
++               $(LDADD)    \
++               $(NULL)
++domsuspend_suspend_LDADD = $(top_builddir)/src/libvirt-net-rpc.la  \
++               $(LDADD)    \
++               $(NULL)
++hellolibvirt_hellolibvirt_LDADD = $(top_builddir)/src/libvirt-net-rpc.la  \
++               $(LDADD)    \
++               $(NULL)
++openauth_openauth_LDADD = $(top_builddir)/src/libvirt-net-rpc.la  \
++               $(LDADD)   \
++               $(NULL)
 +endif
 +
+ if WITH_APPARMOR_PROFILES
+ apparmordir = $(sysconfdir)/apparmor.d/
+ apparmor_DATA = \
 diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 256a8f37a2a9..837a83fb612a 100644
+index 0be3567..b3227a7 100644
 --- a/tools/Makefile.am
 +++ b/tools/Makefile.am
-@@ -147,6 +147,13 @@ virt_host_validate_LDADD = \
+@@ -169,6 +169,13 @@ virt_host_validate_LDADD = \
  		../gnulib/lib/libgnu.la				\
  		$(NULL)
  
@@ -92,9 +69,9 @@ index 256a8f37a2a9..837a83fb612a 100644
 +
 +
  virt_host_validate_CFLAGS = \
+ 		$(LIBXML_CFLAGS)				\
  		$(WARN_CFLAGS)					\
- 		$(PIE_CFLAGS)					\
-@@ -214,6 +221,12 @@ virsh_CFLAGS =							\
+@@ -256,6 +263,12 @@ virt_admin_CFLAGS =						\
  		$(READLINE_CFLAGS)
  BUILT_SOURCES =
  
@@ -108,5 +85,5 @@ index 256a8f37a2a9..837a83fb612a 100644
  virsh_LDADD += virsh_win_icon.$(OBJEXT)
  
 -- 
-1.8.1.2
+1.9.1
 
diff --git a/recipes-extended/libvirt/libvirt_1.2.19.bb b/recipes-extended/libvirt/libvirt_1.2.19.bb
deleted file mode 100644
index 4de284c..0000000
--- a/recipes-extended/libvirt/libvirt_1.2.19.bb
+++ /dev/null
@@ -1,287 +0,0 @@
-DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux." 
-HOMEPAGE = "http://libvirt.org"
-LICENSE = "LGPLv2.1+"
-LICENSE_${PN}-ptest = "GPLv2+ & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
-SECTION = "console/tools"
-PR = "r1"
-
-DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
-	   iptables dnsmasq readline libtasn1 libxslt-native"
-
-# libvirt-guests.sh needs gettext.sh
-#
-RDEPENDS_${PN} = "gettext-runtime"
-
-RDEPENDS_${PN}-ptest += "make gawk"
-
-RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
-RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
-RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
-
-#connman blocks the 53 port and libvirtd can't start its DNS service
-RCONFLICTS_${PN}_libvirtd = "connman"
-
-SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
-           file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
-           file://libvirtd.sh \
-           file://libvirtd.conf \
-           file://runptest.patch \
-           file://run-ptest \
-           file://tests-allow-separated-src-and-build-dirs.patch \
-           file://libvirt-use-pkg-config-to-locate-libcap.patch \
-           file://0001-to-fix-build-error.patch \
-           file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
-          "
-
-SRC_URI[libvirt.md5sum] = "bc3ab1ba5b6fabd2e4516c70ddd4d97c"
-SRC_URI[libvirt.sha256sum] = "282c141f03331d640020c15f81464b27400e0ee307ef4c5190393b021caedd6e"
-
-inherit autotools gettext update-rc.d pkgconfig ptest systemd
-
-CACHED_CONFIGUREVARS += "\
-ac_cv_path_XMLLINT=/usr/bin/xmllint \
-ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
-ac_cv_path_AUGPARSE=/usr/bin/augparse \
-ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
-ac_cv_path_BRCTL=/usr/sbin/brctl \
-ac_cv_path_TC=/sbin/tc \
-ac_cv_path_UDEVADM=/sbin/udevadm \
-ac_cv_path_MODPROBE=/sbin/modprobe \
-ac_cv_path_IP_PATH=/bin/ip \
-ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
-ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
-ac_cv_path_MOUNT=/bin/mount \
-ac_cv_path_UMOUNT=/bin/umount \
-ac_cv_path_MKFS=/usr/sbin/mkfs \
-ac_cv_path_SHOWMOUNT=/usr/sbin/showmount \
-ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
-ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
-ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
-ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
-ac_cv_path_VGREMOVE=/usr/sbin/vgremove \
-ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
-ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
-ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
-ac_cv_path_VGSCAN=/usr/sbin/vgscan \
-ac_cv_path_PVS=/usr/sbin/pvs \
-ac_cv_path_VGS=/usr/sbin/vgs \
-ac_cv_path_LVS=/usr/sbin/lvs \
-ac_cv_path_PARTED=/usr/sbin/parted \
-ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
-
-# Ensure that libvirt uses polkit rather than policykit, whether the host has
-# pkcheck installed or not, and ensure the path is correct per our config.
-CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
-
-# Some other possible paths we are not yet setting
-#ac_cv_path_RPCGEN=
-#ac_cv_path_XSLTPROC=
-#ac_cv_path_RADVD=
-#ac_cv_path_UDEVSETTLE=
-#ac_cv_path_EBTABLES_PATH=
-#ac_cv_path_PKG_CONFIG=
-#ac_cv_path_ac_pt_PKG_CONFIG
-#ac_cv_path_POLKIT_AUTH=
-#ac_cv_path_DTRACE=
-#ac_cv_path_ISCSIADM=
-#ac_cv_path_MSGFMT=
-#ac_cv_path_GMSGFMT=
-#ac_cv_path_XGETTEXT=
-#ac_cv_path_MSGMERGE=
-#ac_cv_path_SCRUB=
-#ac_cv_path_PYTHON=
-
-ALLOW_EMPTY_${PN} = "1"
-
-PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
-
-ALLOW_EMPTY_${PN}-libvirtd = "1"
-
-FILES_${PN}-libvirtd = " \
-	${sysconfdir}/init.d \
-	${sysconfdir}/sysctl.d \
-	${sysconfdir}/logrotate.d \
-	${sysconfdir}/libvirt/libvirtd.conf \
-        /usr/lib/sysctl.d/60-libvirtd.conf \
-	${sbindir}/libvirtd \
-	${systemd_unitdir}/system/* \
-	${@base_contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
-        "
-
-FILES_${PN}-virsh = "${bindir}/virsh"
-FILES_${PN} += "${libdir}/libvirt/connection-driver \
-	    ${datadir}/augeas \
-	    ${datadir}/polkit-1"
-
-FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
-FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
-
-CONFFILES_${PN} += "${sysconfdir}/libvirt/libvirt.conf \
-                    ${sysconfdir}/libvirt/lxc.conf \
-                    ${sysconfdir}/libvirt/qemu-lockd.conf \
-                    ${sysconfdir}/libvirt/qemu.conf \
-                    ${sysconfdir}/libvirt/virt-login-shell.conf \
-                    ${sysconfdir}/libvirt/virtlockd.conf"
-
-CONFFILES_${PN}-libvirtd = "${sysconfdir}/logrotate.d/libvirt ${sysconfdir}/logrotate.d/libvirt.lxc \
-                            ${sysconfdir}/logrotate.d/libvirt.qemu ${sysconfdir}/logrotate.d/libvirt.uml \
-                            ${sysconfdir}/libvirt/libvirtd.conf \
-                            /usr/lib/sysctl.d/libvirtd.conf"
-
-INITSCRIPT_PACKAGES = "${PN}-libvirtd"
-INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
-INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
-
-SYSTEMD_PACKAGES = "${PN}-libvirtd"
-SYSTEMD_SERVICE_${PN}-libvirtd = " \
-    libvirtd.socket \
-    libvirtd.service \
-    virtlockd.service \
-    libvirt-guests.service \
-    virtlockd.socket \
-    "
-
-
-PRIVATE_LIBS_${PN}-ptest = " \
-	libvirt-lxc.so.0 \
-	libvirt.so.0 \
-	libvirt-qemu.so.0 \
-	lockd.so \
-	libvirt_driver_secret.so \
-	libvirt_driver_nodedev.so \
-	libvirt_driver_vbox.so \
-	libvirt_driver_interface.so \
-	libvirt_driver_uml.so \
-	libvirt_driver_network.so \
-	libvirt_driver_nwfilter.so \
-	libvirt_driver_qemu.so \
-	libvirt_driver_storage.so \
-	libvirt_driver_lxc.so \
-    "
-
-# xen-minimal config
-#PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
-
-# full config
-PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
-                   remote macvtap libvirtd netcf udev python ebtables \
-                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
-                  "
-
-# enable,disable,depends,rdepends
-#
-PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
-PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
-PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen,"
-PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
-PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,libxl,"
-PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen,"
-PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
-PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
-PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
-PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp,,"
-PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox,,"
-PACKAGECONFIG[esx] = "--with-esx,--without-esx,,"
-PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv,,"
-PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit,polkit"
-PACKAGECONFIG[lxc] = "--with-lxc,--without-lxc, lxc,"
-PACKAGECONFIG[test] = "--with-test=yes,--with-test=no,,"
-PACKAGECONFIG[remote] = "--with-remote,--without-remote,,"
-PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
-PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd,,"
-PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
-PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
-PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciaccess,"
-PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
-PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
-PACKAGECONFIG[python] = ",,python,"
-PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
-PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
-PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
-PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
-PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
-PACKAGECONFIG[libcap-ng] = "--with-capng,--without-capng,libcap-ng,"
-
-# Enable the Python tool support
-require libvirt-python.inc
-
-do_install_append() {
-	install -d ${D}/etc/init.d
-	install -d ${D}/etc/libvirt
-
-	install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
-	install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
-
-	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-	    # This will wind up in the libvirtd package, but will NOT be invoked by default.
-	    #
-	    mv ${D}/${libexecdir}/libvirt-guests.sh ${D}/${sysconfdir}/init.d
-	fi
-
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-	    # This variable is used by libvirtd.service to start libvirtd in the right mode
-	    sed -i '/#LIBVIRTD_ARGS="--listen"/a LIBVIRTD_ARGS="--listen --daemon"' ${D}/${sysconfdir}/sysconfig/libvirtd
-
-	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
-	    sed -i -e 's/Type=notify/Type=forking/' \
-	           -e '/Type=forking/a PIDFile=${localstatedir}/run/libvirtd.pid' \
-		   ${D}/${systemd_unitdir}/system/libvirtd.service
-	fi
-
-	# The /var/run/libvirt directories created by the Makefile
-	# are wiped out in volatile, we need to create these at boot.
-	rm -rf ${D}${localstatedir}/run
-	install -d ${D}${sysconfdir}/default/volatiles
-	echo "d root root 0755 ${localstatedir}/run/libvirt none" \
-	     > ${D}${sysconfdir}/default/volatiles/99_libvirt
-	echo "d root root 0755 ${localstatedir}/run/libvirt/lockd none" \
-	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
-	echo "d root root 0755 ${localstatedir}/run/libvirt/lxc none" \
-	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
-	echo "d root root 0755 ${localstatedir}/run/libvirt/network none" \
-	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
-	echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
-	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
-
-	# Add hook support for libvirt
-	mkdir -p ${D}/etc/libvirt/hooks 
-
-	# remove .la references to our working diretory
-	for i in `find ${D}${libdir} -type f -name *.la`; do
-	    sed -i -e 's#-L${B}/src/.libs##g' $i
-	done
-}
-
-EXTRA_OECONF += " \
-    --with-init-script=systemd \
-    "
-
-EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH}"
-
-do_compile_ptest() {
-	oe_runmake -C tests buildtest-TESTS
-}
-
-do_install_ptest() {
-	oe_runmake -C tests install-ptest
-
-	# remove .la files for ptest, they aren't required and can trigger QA errors
-	for i in `find ${D}${PTEST_PATH} -type f -name *.la`; do
-                rm -f $i
-	done
-}
-
-pkg_postinst_libvirt() {
-        if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
-                /etc/init.d/populate-volatile.sh update
-        fi
-}
-
-python () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
diff --git a/recipes-extended/libvirt/libvirt_1.3.2.bb b/recipes-extended/libvirt/libvirt_1.3.2.bb
new file mode 100644
index 0000000..ddf6abe
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt_1.3.2.bb
@@ -0,0 +1,287 @@
+DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux." 
+HOMEPAGE = "http://libvirt.org"
+LICENSE = "LGPLv2.1+"
+LICENSE_${PN}-ptest = "GPLv2+ & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LESSER;md5=4b54a1fd55a448865a0b32d41598759d"
+SECTION = "console/tools"
+PR = "r1"
+
+DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
+	   iptables dnsmasq readline libtasn1 libxslt-native"
+
+# libvirt-guests.sh needs gettext.sh
+#
+RDEPENDS_${PN} = "gettext-runtime"
+
+RDEPENDS_${PN}-ptest += "make gawk"
+
+RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
+RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
+RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
+
+#connman blocks the 53 port and libvirtd can't start its DNS service
+RCONFLICTS_${PN}_libvirtd = "connman"
+
+SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
+            file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
+            file://libvirtd.sh \
+            file://libvirtd.conf \
+            file://runptest.patch \
+            file://run-ptest \
+            file://tests-allow-separated-src-and-build-dirs.patch \
+            file://libvirt-use-pkg-config-to-locate-libcap.patch \
+            file://0001-to-fix-build-error.patch \
+            file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
+          "
+
+SRC_URI[libvirt.md5sum] = "b48b06bbc7efbe9973ed0f3f223d6da2"
+SRC_URI[libvirt.sha256sum] = "e3c6fc2683178660b371efb3ac7a1103a3f4b78efac7ffe560bc5917974ccf05"
+
+inherit autotools gettext update-rc.d pkgconfig ptest systemd
+
+CACHED_CONFIGUREVARS += "\
+ac_cv_path_XMLLINT=/usr/bin/xmllint \
+ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
+ac_cv_path_AUGPARSE=/usr/bin/augparse \
+ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
+ac_cv_path_BRCTL=/usr/sbin/brctl \
+ac_cv_path_TC=/sbin/tc \
+ac_cv_path_UDEVADM=/sbin/udevadm \
+ac_cv_path_MODPROBE=/sbin/modprobe \
+ac_cv_path_IP_PATH=/bin/ip \
+ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
+ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
+ac_cv_path_MOUNT=/bin/mount \
+ac_cv_path_UMOUNT=/bin/umount \
+ac_cv_path_MKFS=/usr/sbin/mkfs \
+ac_cv_path_SHOWMOUNT=/usr/sbin/showmount \
+ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
+ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
+ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
+ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
+ac_cv_path_VGREMOVE=/usr/sbin/vgremove \
+ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
+ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
+ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
+ac_cv_path_VGSCAN=/usr/sbin/vgscan \
+ac_cv_path_PVS=/usr/sbin/pvs \
+ac_cv_path_VGS=/usr/sbin/vgs \
+ac_cv_path_LVS=/usr/sbin/lvs \
+ac_cv_path_PARTED=/usr/sbin/parted \
+ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
+
+# Ensure that libvirt uses polkit rather than policykit, whether the host has
+# pkcheck installed or not, and ensure the path is correct per our config.
+CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
+
+# Some other possible paths we are not yet setting
+#ac_cv_path_RPCGEN=
+#ac_cv_path_XSLTPROC=
+#ac_cv_path_RADVD=
+#ac_cv_path_UDEVSETTLE=
+#ac_cv_path_EBTABLES_PATH=
+#ac_cv_path_PKG_CONFIG=
+#ac_cv_path_ac_pt_PKG_CONFIG
+#ac_cv_path_POLKIT_AUTH=
+#ac_cv_path_DTRACE=
+#ac_cv_path_ISCSIADM=
+#ac_cv_path_MSGFMT=
+#ac_cv_path_GMSGFMT=
+#ac_cv_path_XGETTEXT=
+#ac_cv_path_MSGMERGE=
+#ac_cv_path_SCRUB=
+#ac_cv_path_PYTHON=
+
+ALLOW_EMPTY_${PN} = "1"
+
+PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
+
+ALLOW_EMPTY_${PN}-libvirtd = "1"
+
+FILES_${PN}-libvirtd = " \
+	${sysconfdir}/init.d \
+	${sysconfdir}/sysctl.d \
+	${sysconfdir}/logrotate.d \
+	${sysconfdir}/libvirt/libvirtd.conf \
+        /usr/lib/sysctl.d/60-libvirtd.conf \
+	${sbindir}/libvirtd \
+	${systemd_unitdir}/system/* \
+	${@base_contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
+        "
+
+FILES_${PN}-virsh = "${bindir}/virsh"
+FILES_${PN} += "${libdir}/libvirt/connection-driver \
+	    ${datadir}/augeas \
+	    ${datadir}/polkit-1"
+
+FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
+FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
+
+CONFFILES_${PN} += "${sysconfdir}/libvirt/libvirt.conf \
+                    ${sysconfdir}/libvirt/lxc.conf \
+                    ${sysconfdir}/libvirt/qemu-lockd.conf \
+                    ${sysconfdir}/libvirt/qemu.conf \
+                    ${sysconfdir}/libvirt/virt-login-shell.conf \
+                    ${sysconfdir}/libvirt/virtlockd.conf"
+
+CONFFILES_${PN}-libvirtd = "${sysconfdir}/logrotate.d/libvirt ${sysconfdir}/logrotate.d/libvirt.lxc \
+                            ${sysconfdir}/logrotate.d/libvirt.qemu ${sysconfdir}/logrotate.d/libvirt.uml \
+                            ${sysconfdir}/libvirt/libvirtd.conf \
+                            /usr/lib/sysctl.d/libvirtd.conf"
+
+INITSCRIPT_PACKAGES = "${PN}-libvirtd"
+INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
+INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
+
+SYSTEMD_PACKAGES = "${PN}-libvirtd"
+SYSTEMD_SERVICE_${PN}-libvirtd = " \
+    libvirtd.socket \
+    libvirtd.service \
+    virtlockd.service \
+    libvirt-guests.service \
+    virtlockd.socket \
+    "
+
+
+PRIVATE_LIBS_${PN}-ptest = " \
+	libvirt-lxc.so.0 \
+	libvirt.so.0 \
+	libvirt-qemu.so.0 \
+	lockd.so \
+	libvirt_driver_secret.so \
+	libvirt_driver_nodedev.so \
+	libvirt_driver_vbox.so \
+	libvirt_driver_interface.so \
+	libvirt_driver_uml.so \
+	libvirt_driver_network.so \
+	libvirt_driver_nwfilter.so \
+	libvirt_driver_qemu.so \
+	libvirt_driver_storage.so \
+	libvirt_driver_lxc.so \
+    "
+
+# xen-minimal config
+#PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
+
+# full config
+PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
+                   remote macvtap libvirtd netcf udev python ebtables \
+                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
+                  "
+
+# enable,disable,depends,rdepends
+#
+PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
+PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
+PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen,"
+PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
+PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,libxl,"
+PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen,"
+PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
+PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
+PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
+PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp,,"
+PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox,,"
+PACKAGECONFIG[esx] = "--with-esx,--without-esx,,"
+PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv,,"
+PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit,polkit"
+PACKAGECONFIG[lxc] = "--with-lxc,--without-lxc, lxc,"
+PACKAGECONFIG[test] = "--with-test=yes,--with-test=no,,"
+PACKAGECONFIG[remote] = "--with-remote,--without-remote,,"
+PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
+PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd,,"
+PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
+PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
+PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciaccess,"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
+PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
+PACKAGECONFIG[python] = ",,python,"
+PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
+PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
+PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
+PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
+PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
+PACKAGECONFIG[libcap-ng] = "--with-capng,--without-capng,libcap-ng,"
+
+# Enable the Python tool support
+require libvirt-python.inc
+
+do_install_append() {
+	install -d ${D}/etc/init.d
+	install -d ${D}/etc/libvirt
+
+	install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
+	install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+	    # This will wind up in the libvirtd package, but will NOT be invoked by default.
+	    #
+	    mv ${D}/${libexecdir}/libvirt-guests.sh ${D}/${sysconfdir}/init.d
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	    # This variable is used by libvirtd.service to start libvirtd in the right mode
+	    sed -i '/#LIBVIRTD_ARGS="--listen"/a LIBVIRTD_ARGS="--listen --daemon"' ${D}/${sysconfdir}/sysconfig/libvirtd
+
+	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
+	    sed -i -e 's/Type=notify/Type=forking/' \
+	           -e '/Type=forking/a PIDFile=${localstatedir}/run/libvirtd.pid' \
+		   ${D}/${systemd_unitdir}/system/libvirtd.service
+	fi
+
+	# The /var/run/libvirt directories created by the Makefile
+	# are wiped out in volatile, we need to create these at boot.
+	rm -rf ${D}${localstatedir}/run
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d root root 0755 ${localstatedir}/run/libvirt none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_libvirt
+	echo "d root root 0755 ${localstatedir}/run/libvirt/lockd none" \
+	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+	echo "d root root 0755 ${localstatedir}/run/libvirt/lxc none" \
+	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+	echo "d root root 0755 ${localstatedir}/run/libvirt/network none" \
+	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+	echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
+	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+
+	# Add hook support for libvirt
+	mkdir -p ${D}/etc/libvirt/hooks 
+
+	# remove .la references to our working diretory
+	for i in `find ${D}${libdir} -type f -name *.la`; do
+	    sed -i -e 's#-L${B}/src/.libs##g' $i
+	done
+}
+
+EXTRA_OECONF += " \
+    --with-init-script=systemd \
+    "
+
+EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH}"
+
+do_compile_ptest() {
+	oe_runmake -C tests buildtest-TESTS
+}
+
+do_install_ptest() {
+	oe_runmake -C tests install-ptest
+
+	# remove .la files for ptest, they aren't required and can trigger QA errors
+	for i in `find ${D}${PTEST_PATH} -type f -name *.la`; do
+                rm -f $i
+	done
+}
+
+pkg_postinst_libvirt() {
+        if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+                /etc/init.d/populate-volatile.sh update
+        fi
+}
+
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
-- 
1.9.1


