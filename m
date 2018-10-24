Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9EBFE00950; Tue, 23 Oct 2018 23:35:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1C79E008D7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Oct 2018 23:35:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9O6YeP4028223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Oct 2018 23:34:56 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 23 Oct 2018 23:34:40 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Wed, 24 Oct 2018 14:34:51 +0800
Message-ID: <1540362891-22881-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] ceph: upgrade to 13.2.2
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
X-List-Received-Date: Wed, 24 Oct 2018 06:35:24 -0000
Content-Type: text/plain

1. upgrade to 13.2.2
2. install systemd service files
3. add pybind support

testing steps:
  # ceph -h

outputs:
--------------------------------------------------------------------------
 General usage:
 ==============
usage: ceph [-h] [-c CEPHCONF] [-i INPUT_FILE] [-o OUTPUT_FILE]
            [--id CLIENT_ID] [--name CLIENT_NAME] [--cluster CLUSTER]
            [--admin-daemon ADMIN_SOCKET] [-s] [-w] [--watch-debug]
            [--watch-info] [--watch-sec] [--watch-warn] [--watch-error]
            [--watch-channel {cluster,audit,*}] [--version] [--verbose]
            [--concise] [-f {json,json-pretty,xml,xml-pretty,plain}]
            [--connect-timeout CLUSTER_TIMEOUT] [--block] [--period PERIOD]

Ceph administration tool

optional arguments:
  -h, --help            request mon help
  -c CEPHCONF, --conf CEPHCONF
  ......
--------------------------------------------------------------------------

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../ceph/0001-ceph-add-pybind-support-in-OE.patch  | 129 +++++++++++++++++++++
 .../ceph/ceph/0001-ceph-disable-pybind.patch       |  28 -----
 recipes-extended/ceph/ceph/ceph.conf               |  70 +++++++++++
 .../ceph/{ceph_13.2.1.bb => ceph_13.2.2.bb}        |  45 +++++--
 4 files changed, 235 insertions(+), 37 deletions(-)
 create mode 100644 recipes-extended/ceph/ceph/0001-ceph-add-pybind-support-in-OE.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-ceph-disable-pybind.patch
 create mode 100644 recipes-extended/ceph/ceph/ceph.conf
 rename recipes-extended/ceph/{ceph_13.2.1.bb => ceph_13.2.2.bb} (50%)

diff --git a/recipes-extended/ceph/ceph/0001-ceph-add-pybind-support-in-OE.patch b/recipes-extended/ceph/ceph/0001-ceph-add-pybind-support-in-OE.patch
new file mode 100644
index 0000000..f9c5340
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-ceph-add-pybind-support-in-OE.patch
@@ -0,0 +1,129 @@
+From 00d44940c2e83bf73101a05d2aa8f88c2e2fca58 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 23 Oct 2018 15:34:53 +0800
+Subject: [PATCH] ceph: add pybind support in OE
+
+1. add sysroot to CFLAGS when cross compiling pybind
+2. change the pybind's INSTALL path to OE's INSTALL path
+3. delete the check for header files, because the check method using
+   host compiler.
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+Upstream-Status: Inappropriate [oe specific]
+---
+ cmake/modules/Distutils.cmake | 12 +++---------
+ src/pybind/cephfs/setup.py    |  8 --------
+ src/pybind/rados/setup.py     |  8 --------
+ src/pybind/rbd/setup.py       |  8 --------
+ src/pybind/rgw/setup.py       |  8 --------
+ 5 files changed, 3 insertions(+), 41 deletions(-)
+
+diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
+index d6e9f38..3091d97 100644
+--- a/cmake/modules/Distutils.cmake
++++ b/cmake/modules/Distutils.cmake
+@@ -47,7 +47,7 @@ function(distutils_add_cython_module name src)
+     LDFLAGS=-L${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
+     CYTHON_BUILD_DIR=${CMAKE_CURRENT_BINARY_DIR}
+     CEPH_LIBDIR=${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
+-    CFLAGS=\"-iquote${CMAKE_SOURCE_DIR}/src/include -w\"
++    CFLAGS=\"-iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT}\"
+     ${PYTHON${PYTHON_VERSION}_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
+     build --verbose --build-base ${CYTHON_MODULE_DIR}
+     --build-platlib ${CYTHON_MODULE_DIR}/lib.${PYTHON${PYTHON_VERSION}_VERSION_MAJOR}
+@@ -69,14 +69,8 @@ function(distutils_install_cython_module name)
+     set(ENV{CEPH_LIBDIR} \"${CMAKE_LIBRARY_OUTPUT_DIRECTORY}\")
+ 
+     set(options --prefix=${CMAKE_INSTALL_PREFIX})
+-    if(DEFINED ENV{DESTDIR})
+-      if(EXISTS /etc/debian_version)
+-        list(APPEND options --install-layout=deb)
+-      endif()
+-      list(APPEND options --root=\$ENV{DESTDIR})
+-    else()
+-      list(APPEND options --root=/)
+-    endif()
++    list(APPEND options --root=${CMAKE_DESTDIR})
++    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
+     execute_process(
+        COMMAND
+            ${PYTHON${PYTHON_VERSION}_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
+diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
+index 6533f41..1ee4a59 100755
+--- a/src/pybind/cephfs/setup.py
++++ b/src/pybind/cephfs/setup.py
+@@ -121,14 +121,6 @@ def check_sanity():
+     finally:
+         shutil.rmtree(tmp_dir)
+ 
+-
+-if 'BUILD_DOC' in os.environ.keys():
+-    pass
+-elif check_sanity():
+-    pass
+-else:
+-    sys.exit(1)
+-
+ cmdclass = {}
+ try:
+     from Cython.Build import cythonize
+diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
+index ef7c307..5204017 100755
+--- a/src/pybind/rados/setup.py
++++ b/src/pybind/rados/setup.py
+@@ -117,14 +117,6 @@ def check_sanity():
+     finally:
+         shutil.rmtree(tmp_dir)
+ 
+-
+-if 'BUILD_DOC' in os.environ.keys():
+-    pass
+-elif check_sanity():
+-    pass
+-else:
+-    sys.exit(1)
+-
+ cmdclass = {}
+ try:
+     from Cython.Build import cythonize
+diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
+index bcf96f2..d4cbbeb 100755
+--- a/src/pybind/rbd/setup.py
++++ b/src/pybind/rbd/setup.py
+@@ -120,14 +120,6 @@ def check_sanity():
+     finally:
+         shutil.rmtree(tmp_dir)
+ 
+-
+-if 'BUILD_DOC' in os.environ.keys():
+-    pass
+-elif check_sanity():
+-    pass
+-else:
+-    sys.exit(1)
+-
+ cmdclass = {}
+ try:
+     from Cython.Build import cythonize
+diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
+index f14f30c..ee7570b 100755
+--- a/src/pybind/rgw/setup.py
++++ b/src/pybind/rgw/setup.py
+@@ -120,14 +120,6 @@ def check_sanity():
+     finally:
+         shutil.rmtree(tmp_dir)
+ 
+-
+-if 'BUILD_DOC' in os.environ.keys():
+-    pass
+-elif check_sanity():
+-    pass
+-else:
+-    sys.exit(1)
+-
+ cmdclass = {}
+ try:
+     from Cython.Build import cythonize
+-- 
+2.7.4
+
diff --git a/recipes-extended/ceph/ceph/0001-ceph-disable-pybind.patch b/recipes-extended/ceph/ceph/0001-ceph-disable-pybind.patch
deleted file mode 100644
index bfba5b0..0000000
--- a/recipes-extended/ceph/ceph/0001-ceph-disable-pybind.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 05bdb2bb6026c3a2e536c7143b39a763ffc1225f Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Thu, 27 Sep 2018 09:09:40 +0800
-Subject: [PATCH] ceph: disable pybind
-
-New ceph version have bad support for corss compile,
-so disable pybind temporarily.
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- src/CMakeLists.txt | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 374cbc7..44845f8 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -777,7 +777,6 @@ if(NOT CEPH_BUILD_VIRTUALENV)
-   set(CEPH_BUILD_VIRTUALENV /tmp)
- endif()
- 
--add_subdirectory(pybind)
- add_subdirectory(ceph-disk)
- add_subdirectory(ceph-volume)
- add_subdirectory(ceph-detect-init)
--- 
-2.7.4
-
diff --git a/recipes-extended/ceph/ceph/ceph.conf b/recipes-extended/ceph/ceph/ceph.conf
new file mode 100644
index 0000000..fd9de6c
--- /dev/null
+++ b/recipes-extended/ceph/ceph/ceph.conf
@@ -0,0 +1,70 @@
+[global]
+	# Unique ID for the cluster. Run uuidgen to get this string.
+	fsid = %CLUSTER_UUID%
+	# Initial monitor
+	mon initial members = node1
+	# IP address of the initial monitor, i.e. 128.224.149.xx
+	mon host = %PUBLIC_IP%
+	# Public network where the monitor is connected to, i.e, 128.224.0.0/16
+	public network = %PUBLIC_DOMAIN%
+	# For version 0.55 and beyond, you must explicitly enable
+	# or disable authentication with "auth" entries in [global].
+	auth cluster required = cephx
+	auth service required = cephx
+	auth client required = cephx
+	osd journal size = 1024
+
+	# Uncomment the following line if you are mounting with ext4
+	# filestore xattr use omap = true
+
+	# Number of replicas of objects. Write an object 2 times.
+	# Cluster cannot reach an active + clean state until there's enough OSDs
+	# to handle the number of copies of an object. In this case, it requires
+	# at least 2 OSDs
+	osd pool default size = 2
+
+	# Allow writing one copy in a degraded state.
+	osd pool default min size = 1
+
+	# Ensure you have a realistic number of placement groups. We recommend
+	# approximately 100 per OSD. E.g., total number of OSDs multiplied by 100
+	# divided by the number of replicas (i.e., osd pool default size). So for
+	# 10 OSDs and osd pool default size = 2, we'd recommend approximately
+	# (100 * 10) / 2 = 500.
+	osd pool default pg num = 500
+	osd pool default pgp num = 500
+	osd crush chooseleaf type = 1
+
+[osd]
+	osd mkfs type = xfs
+	osd mkfs options xfs = "-f"
+	osd mount options xfs = "rw,noatime,inode64,logbufs=8,logbsize=256k"
+
+# All port numbers below are not hard-coded, but expected by ceph, so please
+# do not change the numbers.
+[mon.node1]
+	host = node1
+	mon addr = %PUBLIC_IP%:6789
+
+[osd.0]
+	host = node1
+	public addr = %PUBLIC_IP%:6800
+	cluster addr = %PRIVATE_IP%:6800
+	devs = /dev/sda1
+
+[osd.1]
+	host = node1
+	public addr = %PUBLIC_IP%:6801
+	cluster addr = %PRIVATE_IP%:6801
+	devs = /dev/sda2
+
+[osd.2]
+	host = node1
+	public addr = %PUBLIC_IP%:6802
+	cluster addr = %PRIVATE_IP%:6802
+	devs = /dev/sda3
+
+[mds.a]
+	host = node1
+	devs = /dev/sda4
+
diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-extended/ceph/ceph_13.2.2.bb
similarity index 50%
rename from recipes-extended/ceph/ceph_13.2.1.bb
rename to recipes-extended/ceph/ceph_13.2.2.bb
index e89bbeb..6c6da41 100644
--- a/recipes-extended/ceph/ceph_13.2.1.bb
+++ b/recipes-extended/ceph/ceph_13.2.2.bb
@@ -1,29 +1,36 @@
 SUMMARY = "User space components of the Ceph file system"
-LICENSE = "LGPLv2.1 & GPLv2 & Unknown & Apache-2.0 & MIT"
+LICENSE = "LGPLv2.1 & GPLv2 & Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24 \
                     file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING;md5=92d301c8fccd296f2221a68a8dd53828 \
 "
-
+inherit cmake pythonnative python-dir systemd
 # Disable python pybind support for ceph temporary, when corss compiling pybind,
 # pybind mix cmake and python setup environment, would case a lot of errors.
 
 SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-Correct-the-path-to-find-version.h-in-rocksdb.patch \
-           file://0001-ceph-disable-pybind.patch \
            file://0001-zstd-fix-error-for-cross-compile.patch \
+           file://0001-ceph-add-pybind-support-in-OE.patch \
+           file://ceph.conf \
 "
-SRC_URI[md5sum] = "4b0ee225e153fbb2515fa3f8a3666d17"
-SRC_URI[sha256sum] = "32086294d2007fdf64f85fcd919de2f092eeaa897bd8dc7c01e005e14516903c"
+SRC_URI[md5sum] = "ce118be451dcb6b89e9e0a45057827dd"
+SRC_URI[sha256sum] = "f3a61db4c90e00c38a2dac7239b956ec367ef56f601e07335ed3011f931d8840"
 
 DEPENDS = "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
            nspr nss \
            oath openldap openssl \
-           python rocksdb snappy udev \
+           python python-cython-native rocksdb snappy udev \
            valgrind xfsprogs zlib \
 "
-inherit cmake pythonnative python-dir
+SYSTEMD_SERVICE_${PN} = "ceph-radosgw@.service \
+        ceph-mon@.service \
+        ceph-mds@.service \
+        ceph-disk@.service \
+        ceph-osd@.service \
+        ceph.target \
+"
 OECMAKE_GENERATOR = "Unix Makefiles"
 
 EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
@@ -41,23 +48,43 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
 
 do_configure_prepend () {
 	echo "set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )" >> ${WORKDIR}/toolchain.cmake
+	echo "set( CMAKE_DESTDIR \"${D}\" )" >> ${WORKDIR}/toolchain.cmake
+	echo "set( PYTHON_SITEPACKAGES_DIR \"${PYTHON_SITEPACKAGES_DIR}\" )" >> ${WORKDIR}/toolchain.cmake
 }
 
 do_install_append () {
 	sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph
+	install -d ${D}${sysconfdir}/ceph
+	install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
+	install -d ${D}${systemd_unitdir}/system
+	mv ${D}${libexecdir}/systemd/system/ceph-radosgw@.service ${D}${systemd_unitdir}/system/ceph-radosgw@.service
+	mv ${D}${libexecdir}/systemd/system/ceph-mon@.service ${D}${systemd_unitdir}/system/ceph-mon@.service
+	mv ${D}${libexecdir}/systemd/system/ceph-mds@.service ${D}${systemd_unitdir}/system/ceph-mds@.service
+	mv ${D}${libexecdir}/systemd/system/ceph-disk@.service ${D}${systemd_unitdir}/system/ceph-disk@.service
+	mv ${D}${libexecdir}/systemd/system/ceph-osd@.service ${D}${systemd_unitdir}/system/ceph-osd@.service
+	mv ${D}${libexecdir}/systemd/system/ceph.target ${D}${systemd_unitdir}/system/ceph.target
 }
 
 FILES_${PN} += "\
                 ${libdir}/rados-classes/*.so.* \
 "
-
 FILES_${PN}-dev += "\
 		${libdir}/ceph/compressor/*.so \
 		${libdir}/rados-classes/*.so \
 		${libdir}/ceph/*.so \
 "
-
+FILES_${PN}-python = "\
+                ${PYTHON_SITEPACKAGES_DIR}/* \
+"
 RDEPENDS_${PN} += "\
 		python \
+		python-misc \
+		python-modules \
+		python-prettytable \
+		${PN}-python \
 "
 COMPATIBLE_HOST = "(x86_64).*"
+PACKAGES += " \
+	${PN}-python \
+"
+INSANE_SKIP_${PN}-python += "ldflags"
-- 
2.7.4


