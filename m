Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6670AE009E7; Fri, 28 Sep 2018 18:04:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A980E009CF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Sep 2018 18:04:23 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T14MOk001809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Sep 2018 18:04:22 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 18:04:21 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sat, 29 Sep 2018 09:15:33 +0800
Message-ID: <1538183733-12519-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] ceph: add support for ceph
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
X-List-Received-Date: Sat, 29 Sep 2018 01:04:24 -0000
Content-Type: text/plain

Ceph is a distributed object, block, and file storage platform,
ceph depends on oath-toolkit, so add the oath-toolkit also.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...ect-the-path-to-find-version.h-in-rocksdb.patch | 40 ++++++++++++++
 .../ceph/ceph/0001-ceph-disable-pybind.patch       | 28 ++++++++++
 .../0001-zstd-fix-error-for-cross-compile.patch    | 26 +++++++++
 recipes-extended/ceph/ceph_13.2.1.bb               | 62 ++++++++++++++++++++++
 .../0001-oath-fix-macro-definition-error.patch     | 32 +++++++++++
 recipes-extended/oath/oath_2.6.2.bb                | 19 +++++++
 6 files changed, 207 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-Correct-the-path-to-find-version.h-in-rocksdb.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-ceph-disable-pybind.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-zstd-fix-error-for-cross-compile.patch
 create mode 100644 recipes-extended/ceph/ceph_13.2.1.bb
 create mode 100644 recipes-extended/oath/oath/0001-oath-fix-macro-definition-error.patch
 create mode 100644 recipes-extended/oath/oath_2.6.2.bb

diff --git a/recipes-extended/ceph/ceph/0001-Correct-the-path-to-find-version.h-in-rocksdb.patch b/recipes-extended/ceph/ceph/0001-Correct-the-path-to-find-version.h-in-rocksdb.patch
new file mode 100644
index 0000000..788505b
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-Correct-the-path-to-find-version.h-in-rocksdb.patch
@@ -0,0 +1,40 @@
+From a53605694d5301b7bb543464b17f74bbbd35d372 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 28 Aug 2018 10:04:40 +0800
+Subject: [PATCH] Correct the path to find version.h in rocksdb
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ cmake/modules/Findrocksdb.cmake | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/cmake/modules/Findrocksdb.cmake b/cmake/modules/Findrocksdb.cmake
+index f8369f7..36b67ea 100644
+--- a/cmake/modules/Findrocksdb.cmake
++++ b/cmake/modules/Findrocksdb.cmake
+@@ -9,17 +9,17 @@
+ #  ROCKSDB_VERSION_MINOR
+ #  ROCKSDB_VERSION_PATCH
+ 
+-find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h)
++find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h ${CMAKE_SYSROOT})
+ 
+-find_library(ROCKSDB_LIBRARIES rocksdb)
++find_library(ROCKSDB_LIBRARIES rocksdb ${CMAKE_SYSROOT})
+ 
+ if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
+   foreach(ver "MAJOR" "MINOR" "PATCH")
+-    file(STRINGS "${ROCKSDB_INCLUDE_DIR}/version.h" ROCKSDB_VER_${ver}_LINE
++    file(STRINGS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h" ROCKSDB_VER_${ver}_LINE
+       REGEX "^#define[ \t]+ROCKSDB_${ver}[ \t]+[0-9]+$")
+     string(REGEX REPLACE "^#define[ \t]+ROCKSDB_${ver}[ \t]+([0-9]+)$"
+-      "\\1" ROCKSDB_VERSION_${ver} "${ROCKDB_VER_${ver}_LINE}")
+-    unset(${ROCKDB_VER_${ver}_LINE})
++      "\\1" ROCKSDB_VERSION_${ver} "${ROCKSDB_VER_${ver}_LINE}")
++    unset(ROCKSDB_VER_${ver}_LINE)
+   endforeach()
+   set(ROCKSDB_VERSION_STRING
+     "${ROCKSDB_VERSION_MAJOR}.${ROCKSDB_VERSION_MINOR}.${ROCKSDB_VERSION_PATCH}")
+-- 
+2.7.4
+
diff --git a/recipes-extended/ceph/ceph/0001-ceph-disable-pybind.patch b/recipes-extended/ceph/ceph/0001-ceph-disable-pybind.patch
new file mode 100644
index 0000000..bfba5b0
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-ceph-disable-pybind.patch
@@ -0,0 +1,28 @@
+From 05bdb2bb6026c3a2e536c7143b39a763ffc1225f Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Thu, 27 Sep 2018 09:09:40 +0800
+Subject: [PATCH] ceph: disable pybind
+
+New ceph version have bad support for corss compile,
+so disable pybind temporarily.
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ src/CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 374cbc7..44845f8 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -777,7 +777,6 @@ if(NOT CEPH_BUILD_VIRTUALENV)
+   set(CEPH_BUILD_VIRTUALENV /tmp)
+ endif()
+ 
+-add_subdirectory(pybind)
+ add_subdirectory(ceph-disk)
+ add_subdirectory(ceph-volume)
+ add_subdirectory(ceph-detect-init)
+-- 
+2.7.4
+
diff --git a/recipes-extended/ceph/ceph/0001-zstd-fix-error-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-zstd-fix-error-for-cross-compile.patch
new file mode 100644
index 0000000..66b5f0a
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-zstd-fix-error-for-cross-compile.patch
@@ -0,0 +1,26 @@
+From 3e86b6d9db2682b123839e38e9bf45060e2bb2ab Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 29 Aug 2018 16:57:52 +0800
+Subject: [PATCH] zstd: fix error for cross compile
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ src/compressor/zstd/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/compressor/zstd/CMakeLists.txt b/src/compressor/zstd/CMakeLists.txt
+index e30cb89..b298a3d 100644
+--- a/src/compressor/zstd/CMakeLists.txt
++++ b/src/compressor/zstd/CMakeLists.txt
+@@ -9,7 +9,7 @@ ExternalProject_Add(zstd_ext
+   CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
+              -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
+              -DCMAKE_C_FLAGS=${ZSTD_C_FLAGS}
+-             -DCMAKE_AR=${CMAKE_AR}
++             -DCMAKE_SYSROOT=${CMAKE_SYSROOT}
+   BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
+   BUILD_COMMAND $(MAKE) libzstd_static
+   INSTALL_COMMAND "true")
+-- 
+2.7.4
+
diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-extended/ceph/ceph_13.2.1.bb
new file mode 100644
index 0000000..d7186b9
--- /dev/null
+++ b/recipes-extended/ceph/ceph_13.2.1.bb
@@ -0,0 +1,62 @@
+SUMMARY = "User space components of the Ceph file system"
+LICENSE = "LGPLv2.1 & GPLv2 & Unknown & Apache-2.0 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24 \
+                    file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING;md5=92d301c8fccd296f2221a68a8dd53828 \
+"
+
+# Disable python pybind support for ceph temporary, when corss compiling pybind,
+# pybind mix cmake and python setup environment, would case a lot of errors.
+
+SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
+           file://0001-Correct-the-path-to-find-version.h-in-rocksdb.patch \
+           file://0001-ceph-disable-pybind.patch \
+           file://0001-zstd-fix-error-for-cross-compile.patch \
+"
+SRC_URI[md5sum] = "4b0ee225e153fbb2515fa3f8a3666d17"
+SRC_URI[sha256sum] = "32086294d2007fdf64f85fcd919de2f092eeaa897bd8dc7c01e005e14516903c"
+
+DEPENDS = "boost bzip2 curl expat gperf-native \
+           keyutils libaio libibverbs lz4 \
+           nspr nss \
+           oath openldap openssl \
+           python rocksdb snappy udev \
+           valgrind xfsprogs zlib \
+"
+inherit cmake pythonnative python-dir
+OECMAKE_GENERATOR = "Unix Makefiles"
+
+EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
+                 -DWITH_FUSE=OFF \
+                 -DWITH_SPDK=OFF \
+                 -DWITH_LEVELDB=OFF \
+                 -DWITH_LTTNG=OFF \
+                 -DWITH_BABELTRACE=OFF \
+                 -DWITH_TESTS=OFF \
+                 -DWITH_MGR=OFF \
+                 -DWITH_MGR_DASHBOARD_FRONTEND=OFF \
+                 -DWITH_SYSTEM_BOOST=ON \
+                 -DWITH_SYSTEM_ROCKSDB=ON \
+"
+
+do_configure_prepend () {
+	echo "set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )" >> ${WORKDIR}/toolchain.cmake
+}
+
+do_install_append () {
+	sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph
+}
+
+FILES_${PN} += "\
+                ${libdir}/rados-classes/*.so.* \
+"
+
+FILES_${PN}-dev += "\
+		${libdir}/ceph/compressor/*.so \
+		${libdir}/rados-classes/*.so \
+		${libdir}/ceph/*.so \
+"
+
+RDEPENDS_${PN} += "\
+		python \
+"
diff --git a/recipes-extended/oath/oath/0001-oath-fix-macro-definition-error.patch b/recipes-extended/oath/oath/0001-oath-fix-macro-definition-error.patch
new file mode 100644
index 0000000..37f9d75
--- /dev/null
+++ b/recipes-extended/oath/oath/0001-oath-fix-macro-definition-error.patch
@@ -0,0 +1,32 @@
+From ba86973a3014caa9a4110611f470d4d9af5c2982 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Thu, 27 Sep 2018 09:37:08 +0800
+Subject: [PATCH] oath: fix macro definition error
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ oathtool/gl/intprops.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/oathtool/gl/intprops.h b/oathtool/gl/intprops.h
+index e1fce5c..cee4997 100644
+--- a/oathtool/gl/intprops.h
++++ b/oathtool/gl/intprops.h
+@@ -230,11 +230,11 @@ verify (TYPE_MAXIMUM (long long int) == LLONG_MAX);
+    (e.g., A and B) have the same type as MIN and MAX.  Instead, they assume
+    that the result (e.g., A + B) has that type.  */
+ #if _GL_HAS_BUILTIN_OVERFLOW_WITH_NULL
+-# define _GL_ADD_OVERFLOW(a, b, min, max)
++# define _GL_ADD_OVERFLOW(a, b, min, max) \
+    __builtin_add_overflow (a, b, (__typeof__ ((a) + (b)) *) 0)
+-# define _GL_SUBTRACT_OVERFLOW(a, b, min, max)
++# define _GL_SUBTRACT_OVERFLOW(a, b, min, max) \
+    __builtin_sub_overflow (a, b, (__typeof__ ((a) - (b)) *) 0)
+-# define _GL_MULTIPLY_OVERFLOW(a, b, min, max)
++# define _GL_MULTIPLY_OVERFLOW(a, b, min, max) \
+    __builtin_mul_overflow (a, b, (__typeof__ ((a) * (b)) *) 0)
+ #else
+ # define _GL_ADD_OVERFLOW(a, b, min, max)                                \
+-- 
+2.7.4
+
diff --git a/recipes-extended/oath/oath_2.6.2.bb b/recipes-extended/oath/oath_2.6.2.bb
new file mode 100644
index 0000000..f423044
--- /dev/null
+++ b/recipes-extended/oath/oath_2.6.2.bb
@@ -0,0 +1,19 @@
+LICENSE = "GPLv3 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=62e1e33aebac5b1bc9fc48a866e2f61b \
+                    file://oathtool/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://liboath/COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://pam_oath/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "http://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-${PV}.tar.gz \
+           file://0001-oath-fix-macro-definition-error.patch \
+"
+
+S = "${WORKDIR}/${BPN}-toolkit-${PV}"
+SRC_URI[md5sum] = "4a05cd4768764843bd5493609a6bdb17"
+SRC_URI[sha256sum] = "b03446fa4b549af5ebe4d35d7aba51163442d255660558cd861ebce536824aa0"
+
+inherit autotools
+
+# Specify any options you want to pass to the configure script using EXTRA_OECONF:
+EXTRA_OECONF = ""
+DEPENDS = "gtk-doc-native"
-- 
2.7.4


