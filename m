Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.6425.1586847176117290587
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 23:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03E6qtZ9025596
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Apr 2020 23:52:55 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Apr 2020
 23:52:55 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 2/2] ceph: fix host library paths were used
Date: Mon, 13 Apr 2020 23:52:54 -0700
Message-ID: <20200414065254.64863-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200414065254.64863-1-hongxu.jia@windriver.com>
References: <20200414065254.64863-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

...
|ERROR: ceph-15.2.0-r0 do_package_qa: QA Issue: ceph: The compile
log indicates that host include and/or library paths were used.
|         Please check the log 'tmp-glibc/work/corei7-64-wrs-linux/
ceph/15.2.0-r0/temp/log.do_compile' for more information. [compile-host-path]
|ERROR: ceph-15.2.0-r0 do_package_qa: QA Issue: ceph: The install
log indicates that host include and/or library paths were used.
|         Please check the log 'tmp-glibc/work/corei7-64-wrs-linux/
ceph/15.2.0-r0/temp/log.do_install' for more information. [install-host-path]
...

While python setup, test var-LIBPL contains recipe-sysrooot prefix,
add it back if lost

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...001-fix-host-library-paths-were-used.patch | 96 +++++++++++++++++++
 recipes-extended/ceph/ceph_15.2.0.bb          |  3 +
 2 files changed, 99 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch

diff --git a/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
new file mode 100644
index 0000000..310bfa4
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
@@ -0,0 +1,96 @@
+From bbf1cba8feb0e43492a1f6a6b31d024117cad262 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 13 Apr 2020 23:35:41 -0700
+Subject: [PATCH] fix host library paths were used
+
+Test the existence of recipe-sysrooot, add it back if lost
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/pybind/cephfs/setup.py | 6 +++++-
+ src/pybind/rados/setup.py  | 6 +++++-
+ src/pybind/rbd/setup.py    | 6 +++++-
+ src/pybind/rgw/setup.py    | 6 +++++-
+ 4 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
+index c9a25ccf..972f936c 100755
+--- a/src/pybind/cephfs/setup.py
++++ b/src/pybind/cephfs/setup.py
+@@ -63,9 +63,13 @@ def get_python_flags(libs):
+                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
+     compiler = new_compiler()
+     distutils.sysconfig.customize_compiler(compiler)
++    libpl = distutils.sysconfig.get_config_var('LIBPL')
++    sysroot = os.environ.get('STAGING_DIR_HOST')
++    if not libpl.startswith(sysroot):
++        libpl = sysroot + libpl
+     return dict(
+         include_dirs=[distutils.sysconfig.get_python_inc()],
+-        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
++        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
+         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
+         extra_compile_args=filter_unsupported_flags(
+             compiler.compiler[0],
+diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
+index 4e99d267..de24f766 100755
+--- a/src/pybind/rados/setup.py
++++ b/src/pybind/rados/setup.py
+@@ -66,9 +66,13 @@ def get_python_flags(libs):
+                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
+     compiler = new_compiler()
+     distutils.sysconfig.customize_compiler(compiler)
++    libpl = distutils.sysconfig.get_config_var('LIBPL')
++    sysroot = os.environ.get('STAGING_DIR_HOST')
++    if not libpl.startswith(sysroot):
++        libpl = sysroot + libpl
+     return dict(
+         include_dirs=[distutils.sysconfig.get_python_inc()],
+-        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
++        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
+         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
+         extra_compile_args=filter_unsupported_flags(
+             compiler.compiler[0],
+diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
+index f5bbbdab..a1f70e1d 100755
+--- a/src/pybind/rbd/setup.py
++++ b/src/pybind/rbd/setup.py
+@@ -63,9 +63,13 @@ def get_python_flags(libs):
+                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
+     compiler = new_compiler()
+     distutils.sysconfig.customize_compiler(compiler)
++    libpl = distutils.sysconfig.get_config_var('LIBPL')
++    sysroot = os.environ.get('STAGING_DIR_HOST')
++    if not libpl.startswith(sysroot):
++        libpl = sysroot + libpl
+     return dict(
+         include_dirs=[distutils.sysconfig.get_python_inc()],
+-        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
++        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
+         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
+         extra_compile_args=filter_unsupported_flags(
+             compiler.compiler[0],
+diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
+index b9f2428c..f5119f73 100755
+--- a/src/pybind/rgw/setup.py
++++ b/src/pybind/rgw/setup.py
+@@ -64,9 +64,13 @@ def get_python_flags(libs):
+                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
+     compiler = new_compiler()
+     distutils.sysconfig.customize_compiler(compiler)
++    libpl = distutils.sysconfig.get_config_var('LIBPL')
++    sysroot = os.environ.get('STAGING_DIR_HOST')
++    if not libpl.startswith(sysroot):
++        libpl = sysroot + libpl
+     return dict(
+         include_dirs=[distutils.sysconfig.get_python_inc()],
+-        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
++        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
+         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
+         extra_compile_args=filter_unsupported_flags(
+             compiler.compiler[0],
+-- 
+2.21.0
+
diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
index 1893086..8ab58eb 100644
--- a/recipes-extended/ceph/ceph_15.2.0.bb
+++ b/recipes-extended/ceph/ceph_15.2.0.bb
@@ -10,6 +10,7 @@ inherit cmake python3native python3-dir systemd
 
 SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-ceph-fix-build-errors-for-cross-compile.patch \
+           file://0001-fix-host-library-paths-were-used.patch \
            file://ceph.conf \
 "
 
@@ -66,6 +67,8 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
                  -DWITH_RADOSGW_KAFKA_ENDPOINT=OFF \
 "
 
+export STAGING_DIR_HOST
+
 do_configure_prepend () {
 	echo "set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )" >> ${WORKDIR}/toolchain.cmake
 	echo "set( CMAKE_DESTDIR \"${D}\" )" >> ${WORKDIR}/toolchain.cmake
-- 
2.21.0

