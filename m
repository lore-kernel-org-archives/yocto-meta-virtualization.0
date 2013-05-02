Return-Path: <yao.zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3F7AE013C9
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 May 2013 12:19:33 -0700 (PDT)
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r42JJWMg007926
	for <meta-virtualization@yoctoproject.org>;
	Thu, 2 May 2013 12:19:33 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  2 May 2013 15:18:03 -0400
Message-Id: <1367522283-26916-1-git-send-email-yao.zhao@windriver.com>
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
X-List-Received-Date: Thu, 02 May 2013 19:19:33 -0000

remove python_incdir.patch and inherit pythonnative.
use PACKAGECONFIG instead of EXTRA_OECONF.
enable python in full PACKAGECONFIG.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc |   21 ++++++++++++---------
 recipes-extended/libvirt/libvirt_1.0.3.bb   |    2 +-
 2 files changed, 13 insertions(+), 10 deletions(-)

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
diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index c1c000e..33087ce 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -106,7 +106,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
 # full config
 PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
-	           polkit lxc test remote macvtap libvirtd netcf"
+	           polkit lxc test remote macvtap libvirtd netcf python"
 
 PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
-- 
1.7.10.4


