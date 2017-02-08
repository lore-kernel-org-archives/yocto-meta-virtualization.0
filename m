Return-Path: <amarnath.valluri@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 106E8E006C6; Wed,  8 Feb 2017 08:57:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [134.134.136.100 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D71D7E00566
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 08:57:15 -0800 (PST)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 08 Feb 2017 08:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,348,1477983600"; d="scan'208";a="1123845986"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2017 08:57:13 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  8 Feb 2017 18:57:51 +0200
Message-Id: <1486573071-2022-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] libvirt: Place systemd units at appropriate location.
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
X-List-Received-Date: Wed, 08 Feb 2017 16:57:19 -0000

Systemd untis should be placed as per ${systemd_system_unitdir}.

Patched the source code to support configure variable to set the systemd units
directory.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 ...gure-variable-for-placing-systemd-untis-l.patch | 55 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.3.5.bb          |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch

diff --git a/recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch b/recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch
new file mode 100644
index 0000000..a64739c
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch
@@ -0,0 +1,55 @@
+From 531178d7fbb5d4b3404766cfd0fc999398cccd58 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Wed, 8 Feb 2017 18:39:48 +0200
+Subject: [PATCH] Added configure variable for placing systemd untis location
+
+Upstream-Status: Pending
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+---
+ configure.ac       | 3 +++
+ daemon/Makefile.am | 1 -
+ tools/Makefile.am  | 1 -
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0e5b8e3..5a6408c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2687,6 +2687,9 @@ AC_DEFINE_UNQUOTED([isbase64],[libvirt_gl_isbase64],[Hack to avoid symbol clash]
+ AC_DEFINE_UNQUOTED([base64_encode],[libvirt_gl_base64_encode],[Hack to avoid symbol clash])
+ AC_DEFINE_UNQUOTED([base64_encode_alloc],[libvirt_gl_base64_encode_alloc],[Hack to avoid symbol clash])
+ 
++AC_ARG_VAR(SYSTEMD_UNIT_DIR, 'location for systemd units, defautls to /lib/systemd/system')
++AS_IF([test "x$SYSTEMD_UNIT_DIR" = "x"], [SYSTEMD_UNIT_DIR="/lib/systemd/system"])
++
+ AC_CONFIG_FILES([run],
+                 [chmod +x,-w run])
+ AC_CONFIG_FILES([\
+diff --git a/daemon/Makefile.am b/daemon/Makefile.am
+index edb75e8..2ab42a6 100644
+--- a/daemon/Makefile.am
++++ b/daemon/Makefile.am
+@@ -449,7 +449,6 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART
+ 
+ if LIBVIRT_INIT_SCRIPT_SYSTEMD
+ 
+-SYSTEMD_UNIT_DIR = /lib/systemd/system
+ BUILT_SOURCES += libvirtd.service
+ 
+ install-init-systemd: install-sysconfig libvirtd.service
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 27ecbf1..8cefe1a 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -380,7 +380,6 @@ libvirt-guests.init: libvirt-guests.init.in libvirt-guests.sh
+ 
+ 
+ EXTRA_DIST += libvirt-guests.service.in
+-SYSTEMD_UNIT_DIR = /lib/systemd/system
+ 
+ if LIBVIRT_INIT_SCRIPT_SYSTEMD
+ install-systemd: libvirt-guests.service install-sysconfig libvirt-guests.sh
+-- 
+2.7.4
+
diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index c848c99..152130d 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://0001-qemu-Let-empty-default-VNC-password-work-as-document.patch \
            file://0001-ptest-add-missing-test_helper-files.patch \
            file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
+	   file://0001-Added-configure-variable-for-placing-systemd-untis-l.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
@@ -264,7 +265,7 @@ EXTRA_OECONF += " \
     --with-init-script=systemd \
     "
 
-EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH}"
+EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
 
 do_compile_ptest() {
 	oe_runmake -C tests buildtest-TESTS
-- 
2.7.4


