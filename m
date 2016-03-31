Return-Path: <Yunguo.Wei@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6621AE00C6E; Wed, 30 Mar 2016 23:03:18 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10EA0E00C6E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Mar 2016 23:03:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2V63BhJ015065
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Mar 2016 23:03:11 -0700 (PDT)
Received: from pek-bsp-build5.wrs.com (128.224.179.117) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 23:03:10 -0700
From: Yunguo Wei <yunguo.wei@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 31 Mar 2016 13:58:42 +0800
Message-ID: <1459403922-50740-2-git-send-email-yunguo.wei@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459403922-50740-1-git-send-email-yunguo.wei@windriver.com>
References: <1459403922-50740-1-git-send-email-yunguo.wei@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libvirt: uprev to 1.3.2
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
X-List-Received-Date: Thu, 31 Mar 2016 06:03:18 -0000
Content-Type: text/plain

Release notes here http://libvirt.org/news.html.

Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
---
 .../0001-to-fix-build-error.patch                  |  24 ++---
 recipes-extended/libvirt/libvirt-python.inc        |   4 +-
 ...vert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch |  52 +++-------
 .../libvirt/libvirt/libvirt_api_xml_path.patch     |  14 +--
 recipes-extended/libvirt/libvirt/runptest.patch    |   2 +-
 ...ibvirt-net-rpc-to-virt-host-validate-when.patch | 107 ++++++++-------------
 .../{libvirt_1.2.19.bb => libvirt_1.3.2.bb}        |   7 +-
 7 files changed, 85 insertions(+), 125 deletions(-)
 rename recipes-extended/libvirt/{libvirt-1.2.19 => libvirt-1.3.2}/0001-to-fix-build-error.patch (65%)
 rename recipes-extended/libvirt/{libvirt_1.2.19.bb => libvirt_1.3.2.bb} (97%)

diff --git a/recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch b/recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.patch
similarity index 65%
rename from recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch
rename to recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.patch
index 61a54e1..089ee33 100644
--- a/recipes-extended/libvirt/libvirt-1.2.19/0001-to-fix-build-error.patch
+++ b/recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.patch
@@ -1,4 +1,4 @@
-From 62514c8c2925e48a4f20ce3d7d48387851cb76a5 Mon Sep 17 00:00:00 2001
+From 8353dc1e642011199c3b3ba057d51d8768e4cd54 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Fri, 31 Jul 2015 03:17:07 +0900
 Subject: [PATCH] to fix build error
@@ -13,32 +13,34 @@ The error likes as following
 | make[3]: *** Waiting for unfinished jobs....
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+[ywei: rebased to libvirt-1.3.2]
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
 ---
  docs/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index daf37b6..125c5fd 100644
+index 1b4353b..c199551 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -162,7 +162,7 @@ EXTRA_DIST=					\
-   sitemap.html.in aclperms.htmlinc \
-   todo.pl hvsupport.pl todo.cfg-example
+@@ -164,7 +164,7 @@ EXTRA_DIST=					\
+   todo.pl hvsupport.pl todo.cfg-example \
+   $(schema_DATA)
  
 -acl_generated = aclperms.htmlinc
 +acl.html:: $(srcdir)/aclperms.htmlinc
  
  $(srcdir)/aclperms.htmlinc: $(top_srcdir)/src/access/viraccessperm.h \
          $(srcdir)/genaclperms.pl Makefile.am
-@@ -227,7 +227,7 @@ internals/%.html.tmp: internals/%.html.in subsite.xsl page.xsl sitemap.html.in
- 	    $(top_srcdir)/docs/subsite.xsl $< > $@ \
- 	    || { rm $@ && exit 1; }; fi
+@@ -221,7 +221,7 @@ $(srcdir)/hvsupport.html.in: $(srcdir)/hvsupport.pl $(api_DATA) \
+ 	convert -rotate 90 $< $@
  
--%.html.tmp: %.html.in site.xsl page.xsl sitemap.html.in $(acl_generated)
-+%.html.tmp: %.html.in site.xsl page.xsl sitemap.html.in 
+ %.html.tmp: %.html.in site.xsl subsite.xsl page.xsl \
+-		sitemap.html.in $(acl_generated)
++		sitemap.html.in
  	@if [ -x $(XSLTPROC) ] ; then \
  	  echo "Generating $@"; \
  	  name=`echo $@ | sed -e 's/.tmp//'`; \
 -- 
-1.8.4.2
+1.9.1
 
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 015b4b6..c1dafe9 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
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
diff --git a/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch b/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
index 16321db..3c2622c 100644
--- a/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
+++ b/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
@@ -10,6 +10,8 @@ one installed in the system.  This may be used for example in autotest
 or by packagers without the need to install libvirt into the system.
 
 Signed-off-by: Martin Kletzander <mkletzan redhat com>
+[ywei: rebased to 1.3.2]
+Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
 ---
  setup.py |   25 ++++++++++++++++++++++---
  1 file changed, 22 insertions(+), 3 deletions(-)
@@ -56,19 +58,19 @@ Index: libvirt-python-1.2.4/setup.py
  
      c_modules = []
      py_modules = []
--    ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False)
--    cflags = get_pkgconfig_data(["--cflags"], "libvirt", False)
+-    ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False).split()
+-    cflags = get_pkgconfig_data(["--cflags"], "libvirt", False).split()
 +    libvirt_cflags = os.getenv("LIBVIRT_CFLAGS")
 +    if libvirt_cflags:
-+        cflags = libvirt_cflags
++        cflags = libvirt_cflags.split()
 +    else:
-+        cflags = get_pkgconfig_data(["--cflags"], "libvirt", False)
++        cflags = get_pkgconfig_data(["--cflags"], "libvirt", False).split()
 +
 +    libvirt_libs = os.getenv("LIBVIRT_LIBS")
 +    if libvirt_libs:
-+        ldflags = libvirt_libs
++        ldflags = libvirt_libs.split()
 +    else:
-+        ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False)
++        ldflags = get_pkgconfig_data(["--libs-only-L"], "libvirt", False).split()
  
      module = Extension('libvirtmod',
                         sources = ['libvirt-override.c', 'build/libvirt.c', 'typewrappers.c', 'libvirt-utils.c'],
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
 
diff --git a/recipes-extended/libvirt/libvirt_1.2.19.bb b/recipes-extended/libvirt/libvirt_1.3.2.bb
similarity index 97%
rename from recipes-extended/libvirt/libvirt_1.2.19.bb
rename to recipes-extended/libvirt/libvirt_1.3.2.bb
index 4de284c..58ed3de 100644
--- a/recipes-extended/libvirt/libvirt_1.2.19.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
 LICENSE = "LGPLv2.1+"
 LICENSE_${PN}-ptest = "GPLv2+ & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+                    file://COPYING.LESSER;md5=4b54a1fd55a448865a0b32d41598759d"
 SECTION = "console/tools"
 PR = "r1"
 
@@ -30,13 +30,12 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://runptest.patch \
            file://run-ptest \
            file://tests-allow-separated-src-and-build-dirs.patch \
-           file://libvirt-use-pkg-config-to-locate-libcap.patch \
            file://0001-to-fix-build-error.patch \
            file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "bc3ab1ba5b6fabd2e4516c70ddd4d97c"
-SRC_URI[libvirt.sha256sum] = "282c141f03331d640020c15f81464b27400e0ee307ef4c5190393b021caedd6e"
+SRC_URI[libvirt.md5sum] = "b48b06bbc7efbe9973ed0f3f223d6da2"
+SRC_URI[libvirt.sha256sum] = "e3c6fc2683178660b371efb3ac7a1103a3f4b78efac7ffe560bc5917974ccf05"
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd
 
-- 
1.9.1


