Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61A1FE0146C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2013 08:10:50 -0700 (PDT)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Apr 2013 08:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,502,1363158000"; d="scan'208";a="228858483"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.150])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Apr 2013 08:10:48 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 18 Apr 2013 18:10:42 +0300
Message-Id: <1366297842-10846-2-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1366297842-10846-1-git-send-email-mihai.prica@intel.com>
References: <1366297842-10846-1-git-send-email-mihai.prica@intel.com>
Subject: [PATCH 2/2] libvirt: Changed python bindings install location
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
X-List-Received-Date: Thu, 18 Apr 2013 15:10:52 -0000

The libvirt-python files were installed to dist-packages and this
is not part of sys.path in yocto so they were not detected. Changed
this to site-packages.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-extended/libvirt/libvirt-python.inc        |    4 ++--
 .../libvirt/libvirt/python_incdir.patch            |   15 +++++++++------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 49d15fb..297e90c 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -10,5 +10,5 @@ RDEPENDS_${PN}-python += "python"
 PACKAGECONFIG_${PN}-python[xen] = ",,,xen-python"
 
 PACKAGES += "${PN}-python-dbg ${PN}-python"
-FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/.debug/"
-FILES_${PN}-python += "${libdir}/${PYTHON_DIR}/dist-packages"
+FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug/"
+FILES_${PN}-python += "${libdir}/${PYTHON_DIR}/site-packages"
diff --git a/recipes-extended/libvirt/libvirt/python_incdir.patch b/recipes-extended/libvirt/libvirt/python_incdir.patch
index 6c77b09..5b78c13 100644
--- a/recipes-extended/libvirt/libvirt/python_incdir.patch
+++ b/recipes-extended/libvirt/libvirt/python_incdir.patch
@@ -1,8 +1,8 @@
-Index: libvirt-0.10.2/configure.ac
+Index: libvirt-1.0.3/configure.ac
 ===================================================================
---- libvirt-0.10.2.orig/configure.ac	2012-10-29 11:59:27.091615491 +0200
-+++ libvirt-0.10.2/configure.ac	2012-10-29 12:09:50.067603647 +0200
-@@ -2397,6 +2397,11 @@
+--- libvirt-1.0.3.orig/configure.ac
++++ libvirt-1.0.3/configure.ac
+@@ -1878,6 +1878,11 @@ fi
  
  PYTHON_VERSION=
  PYTHON_INCLUDES=
@@ -14,9 +14,12 @@ Index: libvirt-0.10.2/configure.ac
  if test "$with_python" != "no" ; then
      if test -x "$with_python/bin/python"
      then
-@@ -2422,29 +2427,30 @@
-         AM_PATH_PYTHON(,, [:])
+@@ -1901,31 +1906,32 @@ if test "$with_python" != "no" ; then
  
+     if test "$with_python" = "yes" ; then
+         AM_PATH_PYTHON(,, [:])
+-
++        pyexecdir=$prefix/lib/python$PYTHON_VERSION/site-packages
          if test "$PYTHON" != : ; then
 -            PYTHON_CONFIG="$PYTHON-config"
 -
-- 
1.7.9.5


