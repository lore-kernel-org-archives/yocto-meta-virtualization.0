Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2372E00BC4; Fri, 26 Oct 2018 02:44:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 728D3E00AD8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Oct 2018 02:44:54 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9Q9irm8005085
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Oct 2018 02:44:53 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 26 Oct 2018 02:43:40 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 26 Oct 2018 17:43:53 +0800
Message-ID: <1540547033-12369-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] ceph: fix Distutils.cmake installation for cross compile
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
X-List-Received-Date: Fri, 26 Oct 2018 09:44:55 -0000
Content-Type: text/plain

1. Remove the detection for build host and correct the install destination
   for cross compile.
2. Delete the build host information in the results files.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...tect-init-correct-the-installation-for-OE.patch | 36 ++++++++++++++++++++++
 recipes-extended/ceph/ceph_13.2.2.bb               | 30 +++++++++++++-----
 2 files changed, 58 insertions(+), 8 deletions(-)
 create mode 100644 recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch

diff --git a/recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch b/recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch
new file mode 100644
index 0000000..875501b
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch
@@ -0,0 +1,36 @@
+From 6aaf04036f0affbeddda123bff111990c4d5fd72 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Fri, 26 Oct 2018 14:31:10 +0800
+Subject: [PATCH] ceph-detect-init: correct the installation for OE
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+Upstream-Status: Inappropriate [oe specific]
+---
+ cmake/modules/Distutils.cmake | 11 ++---------
+ 1 file changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
+index 3091d97..c50fe77 100644
+--- a/cmake/modules/Distutils.cmake
++++ b/cmake/modules/Distutils.cmake
+@@ -16,15 +16,8 @@ function(distutils_install_module name)
+   cmake_parse_arguments(DU "" INSTALL_SCRIPT "" ${ARGN})
+   install(CODE "
+     set(options --prefix=${CMAKE_INSTALL_PREFIX})
+-    if(DEFINED ENV{DESTDIR})
+-      if(EXISTS /etc/debian_version)
+-        list(APPEND options --install-layout=deb)
+-      endif()
+-      list(APPEND options --root=\$ENV{DESTDIR})
+-      if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
+-        list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
+-      endif()
+-    endif()
++    list(APPEND options --root=${CMAKE_DESTDIR})
++    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
+     execute_process(
+     COMMAND ${PYTHON${PYTHON_VERSION}_EXECUTABLE}
+         setup.py install \${options}
+-- 
+2.7.4
+
diff --git a/recipes-extended/ceph/ceph_13.2.2.bb b/recipes-extended/ceph/ceph_13.2.2.bb
index 6c6da41..3d9faae 100644
--- a/recipes-extended/ceph/ceph_13.2.2.bb
+++ b/recipes-extended/ceph/ceph_13.2.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-Correct-the-path-to-find-version.h-in-rocksdb.patch \
            file://0001-zstd-fix-error-for-cross-compile.patch \
            file://0001-ceph-add-pybind-support-in-OE.patch \
+           file://0001-ceph-detect-init-correct-the-installation-for-OE.patch \
            file://ceph.conf \
 "
 SRC_URI[md5sum] = "ce118be451dcb6b89e9e0a45057827dd"
@@ -24,12 +25,25 @@ DEPENDS = "boost bzip2 curl expat gperf-native \
            python python-cython-native rocksdb snappy udev \
            valgrind xfsprogs zlib \
 "
-SYSTEMD_SERVICE_${PN} = "ceph-radosgw@.service \
+SYSTEMD_SERVICE_${PN} = " \
+	ceph-radosgw@.service \
+	ceph-radosgw.target \
         ceph-mon@.service \
+	ceph-mon.target \
         ceph-mds@.service \
+	ceph-mds.target \
         ceph-disk@.service \
         ceph-osd@.service \
+	ceph-osd.target \
         ceph.target \
+	ceph-fuse@.service \
+	ceph-fuse.target \
+	ceph-rbd-mirror@.service \
+	ceph-rbd-mirror.target \
+	ceph-volume@.service \
+	ceph-mgr@.service \
+	ceph-mgr.target \
+	rbdmap.service \
 "
 OECMAKE_GENERATOR = "Unix Makefiles"
 
@@ -54,15 +68,15 @@ do_configure_prepend () {
 
 do_install_append () {
 	sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph
+	sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph-disk
+	sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph-detect-init
+	find ${D} -name SOURCES.txt | xargs sed -i -e 's:${WORKDIR}::'
 	install -d ${D}${sysconfdir}/ceph
 	install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
-	install -d ${D}${systemd_unitdir}/system
-	mv ${D}${libexecdir}/systemd/system/ceph-radosgw@.service ${D}${systemd_unitdir}/system/ceph-radosgw@.service
-	mv ${D}${libexecdir}/systemd/system/ceph-mon@.service ${D}${systemd_unitdir}/system/ceph-mon@.service
-	mv ${D}${libexecdir}/systemd/system/ceph-mds@.service ${D}${systemd_unitdir}/system/ceph-mds@.service
-	mv ${D}${libexecdir}/systemd/system/ceph-disk@.service ${D}${systemd_unitdir}/system/ceph-disk@.service
-	mv ${D}${libexecdir}/systemd/system/ceph-osd@.service ${D}${systemd_unitdir}/system/ceph-osd@.service
-	mv ${D}${libexecdir}/systemd/system/ceph.target ${D}${systemd_unitdir}/system/ceph.target
+	install -d ${D}${systemd_unitdir}
+	mv ${D}${libexecdir}/systemd/system ${D}${systemd_unitdir}
+	mv ${D}${libexecdir}/ceph/ceph-osd-prestart.sh ${D}${libdir}/ceph
+	mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
 }
 
 FILES_${PN} += "\
-- 
2.7.4


