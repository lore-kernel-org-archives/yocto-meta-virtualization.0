Return-Path: <yao.zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5861AE0146E
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Apr 2013 09:01:42 -0700 (PDT)
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3JG1c2i026760
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Apr 2013 09:01:40 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 19 Apr 2013 12:00:26 -0400
Message-Id: <1366387226-20157-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] meta-virt/libvirt: fix libvirt-python QA warnings
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
X-List-Received-Date: Fri, 19 Apr 2013 16:01:42 -0000

remove python_incdir.patch and inherit pythonnative.
use PACKAGECONFIG instead of EXTRA_OECONF.
enable python in full PACKAGECONFIG.
put *.la into ${PN}-dev and *.a into ${PN}-staticdev.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc        |   21 +++---
 .../libvirt/libvirt/python_incdir.patch            |   68 --------------------
 recipes-extended/libvirt/libvirt_1.0.3.bb          |   18 ++++--
 3 files changed, 26 insertions(+), 81 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt/python_incdir.patch

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 49d15fb..d4cc5f3 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -1,14 +1,17 @@
-inherit python-dir
+inherit pythonnative python-dir
 
-# Enable the Python tool support
-EXTRA_OECONF += "--with-python=yes --with-python-inc-dir=-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
+export STAGING_INCDIR
+export STAGING_LIBDIR
+export BUILD_SYS 
+export HOST_SYS
 
-SRC_URI += " file://python_incdir.patch"
-
-DEPENDS  += "python python-native"
+PACKAGECONFIG += "python"
+PACKAGECONFIG[python] = "--with-python,--without-python,python,"
 RDEPENDS_${PN}-python += "python"
 PACKAGECONFIG_${PN}-python[xen] = ",,,xen-python"
 
-PACKAGES += "${PN}-python-dbg ${PN}-python"
-FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/.debug/"
-FILES_${PN}-python += "${libdir}/${PYTHON_DIR}/dist-packages"
+PACKAGES += "${PN}-python-staticdev ${PN}-python-dev ${PN}-python-dbg ${PN}-python"
+FILES_${PN}-python-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
+FILES_${PN}-python-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
+FILES_${PN}-python-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
+FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
diff --git a/recipes-extended/libvirt/libvirt/python_incdir.patch b/recipes-extended/libvirt/libvirt/python_incdir.patch
deleted file mode 100644
index 6c77b09..0000000
--- a/recipes-extended/libvirt/libvirt/python_incdir.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Index: libvirt-0.10.2/configure.ac
-===================================================================
---- libvirt-0.10.2.orig/configure.ac	2012-10-29 11:59:27.091615491 +0200
-+++ libvirt-0.10.2/configure.ac	2012-10-29 12:09:50.067603647 +0200
-@@ -2397,6 +2397,11 @@
- 
- PYTHON_VERSION=
- PYTHON_INCLUDES=
-+
-+AC_ARG_WITH(python-inc-dir,
-+  AS_HELP_STRING([--with-python-inc-dir=DIR], [directory with Python include files]),
-+   [PYTHON_INCLUDES="${withval}"], [])
-+   
- if test "$with_python" != "no" ; then
-     if test -x "$with_python/bin/python"
-     then
-@@ -2422,29 +2427,30 @@
-         AM_PATH_PYTHON(,, [:])
- 
-         if test "$PYTHON" != : ; then
--            PYTHON_CONFIG="$PYTHON-config"
--
--            if test -x "$PYTHON_CONFIG"
--            then
--                PYTHON_INCLUDES=`$PYTHON_CONFIG --includes`
--            else
--                if test -r $PYTHON_EXEC_PREFIX/include/python$PYTHON_VERSION/Python.h
--                then
--                    PYTHON_INCLUDES=-I$PYTHON_EXEC_PREFIX/include/python$PYTHON_VERSION
--                else
--                    if test -r $prefix/include/python$PYTHON_VERSION/Python.h
--                    then
--                        PYTHON_INCLUDES=-I$prefix/include/python$PYTHON_VERSION
--                    else
--                        if test -r /usr/include/python$PYTHON_VERSION/Python.h
--                        then
--                            PYTHON_INCLUDES=-I/usr/include/python$PYTHON_VERSION
--                        else
--                            AC_MSG_ERROR([You must install python-devel to build Python bindings])
--                        fi
-+            if ! test -n "$PYTHON_INCLUDES"; then
-+              PYTHON_CONFIG="$PYTHON-config"
-+              if test -x "$PYTHON_CONFIG"
-+              then
-+                  PYTHON_INCLUDES=`$PYTHON_CONFIG --includes`
-+              else
-+                  if test -r $PYTHON_EXEC_PREFIX/include/python$PYTHON_VERSION/Python.h
-+                  then
-+                      PYTHON_INCLUDES=-I$PYTHON_EXEC_PREFIX/include/python$PYTHON_VERSION
-+                  else
-+                      if test -r $prefix/include/python$PYTHON_VERSION/Python.h
-+                      then
-+                          PYTHON_INCLUDES=-I$prefix/include/python$PYTHON_VERSION
-+                      else
-+                          if test -r /usr/include/python$PYTHON_VERSION/Python.h
-+                          then
-+                              PYTHON_INCLUDES=-I/usr/include/python$PYTHON_VERSION
-+                          else
-+                              AC_MSG_ERROR([You must install python-devel to build Python bindings])
-+                          fi
-+                       fi
-                     fi
-                 fi
--            fi
-+             fi
-         else
-             AC_MSG_ERROR([You must install python to build Python bindings])
-         fi
diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index 497d194..9d32fe0 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 SECTION = "console/tools"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
 	   iptables ebtables dnsmasq readline"
@@ -94,8 +94,18 @@ FILES_${PN} += "${libdir}/libvirt/connection-driver \
 	    ${datadir}/augeas \
 	    ${datadir}/polkit-1"
 
-FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug"
-FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a"
+FILES_${PN}-dbg += "\
+	${libdir}/libvirt/connection-driver/.debug \
+	${libdir}/libvirt/lock-driver/.debug \
+"
+FILES_${PN}-staticdev += "${libdir}/*.a \
+	${libdir}/libvirt/connection-driver/*.a \
+	${libdir}/libvirt/lock-driver/*.a \
+"
+FILES_${PN}-dev += "\
+	${libdir}/libvirt/connection-driver/*.la \
+	${libdir}/libvirt/lock-driver/*.la \
+"
 
 INITSCRIPT_PACKAGES = "${PN}-libvirtd"
 INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
@@ -106,7 +116,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
 # full config
 PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
-	           polkit lxc test remote macvtap libvirtd netcf"
+	           polkit lxc test remote macvtap libvirtd netcf python"
 
 # enable,disable,depends,rdepends
 #
-- 
1.7.10.4


