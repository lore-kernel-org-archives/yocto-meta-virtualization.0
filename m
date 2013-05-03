Return-Path: <yao.zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95B7AE0144E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  3 May 2013 11:30:13 -0700 (PDT)
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r43IUB7o022987
	for <meta-virtualization@yoctoproject.org>;
	Fri, 3 May 2013 11:30:11 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  3 May 2013 14:28:39 -0400
Message-Id: <1367605720-26339-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] fix libvirt-python build problem
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
X-List-Received-Date: Fri, 03 May 2013 18:30:13 -0000

The current libvirt's config.log:
configure:65065: checking for python
configure:65083: found /usr/bin/python
configure:65095: result: /usr/bin/python
configure:65116: checking for python version
configure:65123: result: 2.7
configure:65137: checking for python platform
configure:65144: result: linux2
configure:65170: checking for python script directory
configure:65206: result: ${prefix}/lib/python2.7/dist-packages
configure:65215: checking for python extension module directory
configure:65251: result: ${exec_prefix}/lib/python2.7/dist-packages

so it will use host python which may quite different with target python.

remove python_incdir.patch and inherit pythonnative.
use PACKAGECONFIG instead of EXTRA_OECONF.
enable python in full PACKAGECONFIG.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc        |   21 +++---
 .../libvirt/libvirt/python_incdir.patch            |   71 --------------------
 recipes-extended/libvirt/libvirt_1.0.3.bb          |    2 +-
 3 files changed, 13 insertions(+), 81 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt/python_incdir.patch

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 297e90c..d4cc5f3 100644
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
-FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug/"
-FILES_${PN}-python += "${libdir}/${PYTHON_DIR}/site-packages"
+PACKAGES += "${PN}-python-staticdev ${PN}-python-dev ${PN}-python-dbg ${PN}-python"
+FILES_${PN}-python-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
+FILES_${PN}-python-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
+FILES_${PN}-python-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
+FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
diff --git a/recipes-extended/libvirt/libvirt/python_incdir.patch b/recipes-extended/libvirt/libvirt/python_incdir.patch
deleted file mode 100644
index 5b78c13..0000000
--- a/recipes-extended/libvirt/libvirt/python_incdir.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Index: libvirt-1.0.3/configure.ac
-===================================================================
---- libvirt-1.0.3.orig/configure.ac
-+++ libvirt-1.0.3/configure.ac
-@@ -1878,6 +1878,11 @@ fi
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
-@@ -1901,31 +1906,32 @@ if test "$with_python" != "no" ; then
- 
-     if test "$with_python" = "yes" ; then
-         AM_PATH_PYTHON(,, [:])
--
-+        pyexecdir=$prefix/lib/python$PYTHON_VERSION/site-packages
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
index f341924..88cb018 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -106,7 +106,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
 # full config
 PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
-	           polkit lxc test remote macvtap libvirtd netcf udev"
+	           polkit lxc test remote macvtap libvirtd netcf udev python"
 
 PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
-- 
1.7.10.4


