Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B202DE00D2A; Thu,  9 May 2019 02:53:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11172E00C14
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 May 2019 02:53:11 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x499qZrv005919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 9 May 2019 02:53:01 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 9 May 2019 02:52:37 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 9 May 2019 17:53:28 +0800
Message-ID: <1557395608-10447-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: upgrade to 5.3.0
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
X-List-Received-Date: Thu, 09 May 2019 09:53:13 -0000
Content-Type: text/plain

1. remove the uml configure option because new version libvirt drop it
2. rebase three patches for new source codes

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc        |  4 +-
 .../libvirt/libvirt/install-missing-file.patch     | 17 +++----
 recipes-extended/libvirt/libvirt/runptest.patch    | 56 ++++++++--------------
 ...ibvirt-net-rpc-to-virt-host-validate-when.patch | 33 ++++++-------
 .../libvirt/{libvirt_4.9.0.bb => libvirt_5.3.0.bb} |  8 ++--
 5 files changed, 52 insertions(+), 66 deletions(-)
 rename recipes-extended/libvirt/{libvirt_4.9.0.bb => libvirt_5.3.0.bb} (97%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index ae43ba8..9554328 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "cba7dc90d564aa8c267c38d452b83f80"
-SRC_URI[libvirt_python.sha256sum] = "01c4becf50b521a9e3d1b48a3a79d83cb389d86d760b895d911d78f5b6ae7b60"
+SRC_URI[libvirt_python.md5sum] = "b7e086e080e5681bece9e87db5a88afa"
+SRC_URI[libvirt_python.sha256sum] = "5213f995cb55a2f770aa36704b60313958c7ff1fde8cca39028ea889cc9f30ff"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch b/recipes-extended/libvirt/libvirt/install-missing-file.patch
index cb5a20e..94c7299 100644
--- a/recipes-extended/libvirt/libvirt/install-missing-file.patch
+++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch
@@ -1,6 +1,6 @@
-From 0780181a3285511f166487a54ebc231fc657edfe Mon Sep 17 00:00:00 2001
-From: Catalin Enache <catalin.enache@windriver.com>
-Date: Mon, 25 Jul 2016 16:38:51 +0300
+From 4aea9dbeb7f7990ac5a2227d80251570b4a5bca1 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 8 May 2019 17:24:17 +0800
 Subject: [PATCH] Install missing conf file
 
 openvzutilstest.conf file is needed by openvzutilstest test.
@@ -12,15 +12,17 @@ Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 [MA: Update context for v4.3.0]
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+[DDU: Update context for v5.3.0]
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
  tests/Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 65f776e..8a6fd44 100644
+index 7d0387e..68c3561 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -173,6 +173,7 @@ EXTRA_DIST = \
+@@ -168,6 +168,7 @@ EXTRA_DIST = \
  	$(NULL)
  
  test_helpers = commandhelper ssh
@@ -28,7 +30,7 @@ index 65f776e..8a6fd44 100644
  test_programs = virshtest sockettest \
  	virhostcputest virbuftest \
  	commandtest seclabeltest \
-@@ -305,6 +306,7 @@ endif WITH_LXC
+@@ -303,6 +304,7 @@ endif WITH_LXC
  
  if WITH_OPENVZ
  test_programs += openvzutilstest
@@ -36,7 +38,7 @@ index 65f776e..8a6fd44 100644
  endif WITH_OPENVZ
  
  if WITH_ESX
-@@ -1488,7 +1490,7 @@ endif ! WITH_CIL
+@@ -1539,7 +1541,7 @@ endif ! WITH_CIL
  
  buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
  
@@ -45,7 +47,6 @@ index 65f776e..8a6fd44 100644
  
  install-ptest:
  	list='$(TESTS) $(test_helpers) test-lib.sh virschematest'
-
 -- 
 2.7.4
 
diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
index 457e821..bc97ba6 100644
--- a/recipes-extended/libvirt/libvirt/runptest.patch
+++ b/recipes-extended/libvirt/libvirt/runptest.patch
@@ -1,7 +1,7 @@
-From 94478517c4f9950b28be3a348387db6ede3db812 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Mon, 4 Jun 2018 11:55:37 -0400
-Subject: [PATCH] Add 'install-ptest' rule.
+From 52fc46b4f8cfd36476f59c0796f4f39686b53953 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 8 May 2019 10:20:47 +0800
+Subject: [PATCH] Add 'install-ptest' rule
 
 Change TESTS_ENVIRONMENT to allow running outside build dir.
 
@@ -15,15 +15,17 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 [MA: Update context for v4.3.0]
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+[DDU: Update context for v5.3.0]
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
- tests/Makefile.am | 74 +++++++++++++++++++++++++++++++++++++++++++++----------
- 1 file changed, 61 insertions(+), 13 deletions(-)
+ tests/Makefile.am | 68 ++++++++++++++++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 60 insertions(+), 8 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 7b93fbd..edc1eb9 100644
+index 46d94d2..7d0387e 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -35,11 +35,13 @@ INCLUDES = \
+@@ -29,11 +29,13 @@ AM_CPPFLAGS = \
  
  WARN_CFLAGS += $(RELAXED_FRAME_LIMIT_CFLAGS)
  
@@ -31,50 +33,32 @@ index 7b93fbd..edc1eb9 100644
 +
  AM_CFLAGS = \
 -	-Dabs_builddir="\"$(abs_builddir)\"" \
--	-Dabs_topbuilddir="\"$(abs_topbuilddir)\"" \
+-	-Dabs_top_builddir="\"$(abs_top_builddir)\"" \
 -	-Dabs_srcdir="\"$(abs_srcdir)\"" \
--	-Dabs_topsrcdir="\"$(abs_topsrcdir)\"" \
+-	-Dabs_top_srcdir="\"$(abs_top_srcdir)\"" \
 +	-Dabs_builddir="\"$(PTEST_DIR)/tests\"" \
-+	-Dabs_topbuilddir="\"$(PTEST_DIR)\"" \
++	-Dabs_top_builddir="\"$(PTEST_DIR)\"" \
 +	-Dabs_srcdir="\"$(PTEST_DIR)/tests\"" \
-+	-Dabs_topsrcdir="\"$(PTEST_DIR)\"" \
++	-Dabs_top_srcdir="\"$(PTEST_DIR)\"" \
  	$(LIBXML_CFLAGS) \
  	$(LIBNL_CFLAGS) \
  	$(GNUTLS_CFLAGS) \
-@@ -64,7 +66,7 @@ QEMULIB_LDFLAGS = \
- 	$(MINGW_EXTRA_LDFLAGS)
+@@ -465,10 +467,10 @@ TESTS = $(test_programs) \
  
- INCLUDES += \
--	-DTEST_DRIVER_DIR=\"$(top_builddir)/src/.libs\"
-+	-DTEST_DRIVER_DIR=\"$(PTEST_DIR)/src/.libs\"
- 
- PROBES_O =
- if WITH_DTRACE_PROBES
-@@ -466,17 +468,15 @@ TESTS = $(test_programs) \
- # Also, BSD sh doesn't like 'a=b b=$$a', so we can't use an
- # intermediate shell variable, but must do all the expansion in make
- 
--lv_abs_top_builddir=$(shell cd '$(top_builddir)' && pwd)
--
  VIR_TEST_EXPENSIVE ?= $(VIR_TEST_EXPENSIVE_DEFAULT)
  TESTS_ENVIRONMENT = \
--  abs_top_builddir=$(lv_abs_top_builddir) \
--  abs_top_srcdir=`cd '$(top_srcdir)'; pwd` \
--  abs_builddir=$(abs_builddir) \
--  abs_srcdir=$(abs_srcdir) \
--  CONFIG_HEADER="$(lv_abs_top_builddir)/config.h" \
+-  abs_top_builddir="$(abs_top_builddir)" \
+-  abs_top_srcdir="$(abs_top_srcdir)" \
+-  abs_builddir="$(abs_builddir)" \
+-  abs_srcdir="$(abs_srcdir)" \
 +  abs_top_builddir="$(PTEST_DIR)" \
 +  abs_top_srcdir="$(PTEST_DIR)" \
 +  abs_builddir="$(PTEST_DIR)/tests" \
 +  abs_srcdir="$(PTEST_DIR)/tests" \
-+  CONFIG_HEADER="$(PTEST_DIR)/config.h" \
    SHELL="$(SHELL)" \
--  LIBVIRT_DRIVER_DIR="$(lv_abs_top_builddir)/src/.libs" \
-+  LIBVIRT_DRIVER_DIR="$(PTEST_DIR)/src/.libs" \
    LIBVIRT_AUTOSTART=0 \
    LC_ALL=C \
-   VIR_TEST_EXPENSIVE=$(VIR_TEST_EXPENSIVE) \
-@@ -1486,5 +1486,55 @@ else ! WITH_CIL
+@@ -1535,5 +1537,55 @@ else ! WITH_CIL
  EXTRA_DIST += objectlocking.ml
  endif ! WITH_CIL
  
diff --git a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
index 5f6f950..d49776c 100644
--- a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
+++ b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
@@ -1,6 +1,6 @@
-From f73c5c61c921bf773dcba5e4234e23afce5dbe7f Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Fri, 2 Aug 2013 11:38:43 -0400
+From ae4b40a1b3cb63a322716b6ad1762d53ada249e1 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 7 May 2019 15:26:32 +0800
 Subject: [PATCH] tools: add libvirt-net-rpc to virt-host-validate when TLS is
  enabled
 
@@ -13,17 +13,19 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
 [MA: rebase to v4.3.0]
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+[ddu: rebase to v5.3.0]
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
  examples/Makefile.am | 19 +++++++++++++++++++
- tools/Makefile.am    | 13 +++++++++++++
- 2 files changed, 32 insertions(+)
+ tools/Makefile.am    | 12 ++++++++++++
+ 2 files changed, 31 insertions(+)
 
 diff --git a/examples/Makefile.am b/examples/Makefile.am
-index 7069d74..c8893e3 100644
+index ee7d3e6..7a5fd73 100644
 --- a/examples/Makefile.am
 +++ b/examples/Makefile.am
-@@ -39,6 +39,10 @@ LDADD = $(STATIC_BINARIES) $(WARN_CFLAGS) $(COVERAGE_LDFLAGS) \
- 	$(top_builddir)/src/libvirt.la $(top_builddir)/gnulib/lib/libgnu.la \
+@@ -34,6 +34,10 @@ LDADD = $(STATIC_BINARIES) $(WARN_CFLAGS) \
+ 	$(top_builddir)/src/libvirt.la \
  	$(top_builddir)/src/libvirt-admin.la
  
 +if WITH_GNUTLS
@@ -33,7 +35,7 @@ index 7069d74..c8893e3 100644
  noinst_PROGRAMS=dominfo/info1 dommigrate/dommigrate domsuspend/suspend \
  	domtop/domtop hellolibvirt/hellolibvirt object-events/event-test \
  	openauth/openauth rename/rename admin/list_servers admin/list_clients \
-@@ -70,6 +74,21 @@ admin_logging_SOURCES = admin/logging.c
+@@ -65,6 +69,21 @@ admin_logging_SOURCES = admin/logging.c
  INSTALL_DATA_LOCAL =
  UNINSTALL_LOCAL =
  
@@ -52,14 +54,14 @@ index 7069d74..c8893e3 100644
 +               $(NULL)
 +endif
 +
- if WITH_APPARMOR_PROFILES
- apparmordir = $(sysconfdir)/apparmor.d/
- apparmor_DATA = \
+ if WITH_NWFILTER
+ NWFILTER_DIR = "$(DESTDIR)$(sysconfdir)/libvirt/nwfilter"
+ 
 diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 1452d98..204e772 100644
+index c6064de..1ac8445 100644
 --- a/tools/Makefile.am
 +++ b/tools/Makefile.am
-@@ -188,6 +188,13 @@ virt_host_validate_LDADD = \
+@@ -188,6 +188,12 @@ virt_host_validate_LDADD = \
  		../gnulib/lib/libgnu.la \
  		$(NULL)
  
@@ -69,11 +71,10 @@ index 1452d98..204e772 100644
 +                            $(NULL)
 +endif
 +
-+
  virt_host_validate_CFLAGS = \
  		$(AM_CFLAGS) \
  		$(NULL)
-@@ -268,6 +275,12 @@ virt_admin_CFLAGS = \
+@@ -265,6 +271,12 @@ virt_admin_CFLAGS = \
  		$(READLINE_CFLAGS)
  BUILT_SOURCES =
  
diff --git a/recipes-extended/libvirt/libvirt_4.9.0.bb b/recipes-extended/libvirt/libvirt_5.3.0.bb
similarity index 97%
rename from recipes-extended/libvirt/libvirt_4.9.0.bb
rename to recipes-extended/libvirt/libvirt_5.3.0.bb
index 813d95e..c54a99e 100644
--- a/recipes-extended/libvirt/libvirt_4.9.0.bb
+++ b/recipes-extended/libvirt/libvirt_5.3.0.bb
@@ -38,8 +38,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://hook_support.py \
           "
 
-SRC_URI[libvirt.md5sum] = "aaf7b265ac2013d6eb184a86b5f7eeb9"
-SRC_URI[libvirt.sha256sum] = "4fd4bfe7312b7996a817c7919cf0062de0d5b3c400c93bd30855a46c40dd455a"
+SRC_URI[libvirt.md5sum] = "1cfaaf3717783ba19850b5ac04f7e76a"
+SRC_URI[libvirt.sha256sum] = "8564bdd506817b3957fa67e4f06b217922d30f19e416c4dc620995fd155dc101"
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd
 USERADD_PACKAGES = "${PN}"
@@ -131,6 +131,7 @@ FILES_${PN} += "${libdir}/libvirt/connection-driver \
 	    ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${datadir}/polkit-1', '', d)} \
 	    ${datadir}/bash-completion/completions/vsh \
 	    ${datadir}/bash-completion/completions/virt-admin \
+	    /usr/lib/firewalld/zones/libvirt.xml \
 	    "
 
 FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
@@ -182,7 +183,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
 #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
 
 # full config
-PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
+PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx iproute2 lxc test \
                    remote macvtap libvirtd netcf udev python ebtables \
                    fuse iproute2 firewalld libpcap \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
@@ -201,7 +202,6 @@ PACKAGECONFIG[qemu] = "--with-qemu --with-qemu-user=qemu --with-qemu-group=qemu,
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
 PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
 PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
-PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
 PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
 PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
 PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp,,"
-- 
2.7.4


