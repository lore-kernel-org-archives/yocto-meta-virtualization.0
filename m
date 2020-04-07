Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.197.1586293502094192779
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 14:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 037L50be016855
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 7 Apr 2020 14:05:00 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 7 Apr 2020
 14:05:00 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 31342900664;
 Tue,  7 Apr 2020 14:05:00 -0700 (PDT)
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] ceph: uprev ceph from 14.2.7 to 15.2.0
Date: Tue, 7 Apr 2020 14:04:48 -0700
Message-ID: <20200407210448.103949-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

ceph uprev to v15.2.0

Refreshed oe-specific patch:
	ceph/0001-ceph-fix-build-errors-for-cross-compile.patch

Removed merged patches:
	ceph/0001-common-rgw-workaround-for-boost-1.72.patch
	ceph/0001-rgw-add-executor-type-for-basic_waitable_timers.patch
	ceph/0001-rgw-beast-handle_connection-takes-io_context.patch

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...h-fix-build-errors-for-cross-compile.patch | 41 ++++++------
 ...common-rgw-workaround-for-boost-1.72.patch | 62 -----------------
 ...cutor-type-for-basic_waitable_timers.patch | 58 ----------------
 ...t-handle_connection-takes-io_context.patch | 67 -------------------
 .../ceph/{ceph_14.2.7.bb => ceph_15.2.0.bb}   | 15 +++--
 5 files changed, 29 insertions(+), 214 deletions(-)
 delete mode 100644 recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-rgw-add-executor-type-for-basic_waitable_timers.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
 rename recipes-extended/ceph/{ceph_14.2.7.bb => ceph_15.2.0.bb} (87%)

diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
index 4f009f0..4d54549 100644
--- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
+++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
@@ -1,4 +1,4 @@
-From 9b97824ad0da2c0d3dcc0cf41f4506aa7e458e9f Mon Sep 17 00:00:00 2001
+From 4712fe18405ffea31405308357a8e7fca358bcce Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Mon, 11 Mar 2019 09:14:09 +0800
 Subject: [PATCH] ceph: fix build errors for cross compile
@@ -13,6 +13,7 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
 Adjust context for v14.2.3
 
 Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 ---
  cmake/modules/Distutils.cmake      | 25 +++++--------------------
  cmake/modules/FindRocksDB.cmake    |  4 ++--
@@ -24,11 +25,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  7 files changed, 8 insertions(+), 55 deletions(-)
 
 diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
-index f70265f..b2f4223 100644
+index 5fe929499d..802eb37e32 100644
 --- a/cmake/modules/Distutils.cmake
 +++ b/cmake/modules/Distutils.cmake
-@@ -16,17 +16,8 @@ function(distutils_install_module name)
-   cmake_parse_arguments(DU "" INSTALL_SCRIPT "" ${ARGN})
+@@ -18,17 +18,8 @@ function(distutils_install_module name)
+   cmake_parse_arguments(DU "" "INSTALL_SCRIPT" "" ${ARGN})
    install(CODE "
      set(options --prefix=${CMAKE_INSTALL_PREFIX})
 -    if(DEFINED ENV{DESTDIR})
@@ -45,9 +46,9 @@ index f70265f..b2f4223 100644
 +    list(APPEND options --root=${CMAKE_DESTDIR})
 +    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
      execute_process(
-     COMMAND ${PYTHON${PYTHON_VERSION}_EXECUTABLE}
+     COMMAND ${Python3_EXECUTABLE}
          setup.py install \${options}
-@@ -48,7 +39,7 @@ function(distutils_add_cython_module name src)
+@@ -50,7 +41,7 @@ function(distutils_add_cython_module target name src)
    # Note: no quotes, otherwise distutils will execute "/usr/bin/ccache gcc"
    # CMake's implicit conversion between strings and lists is wonderful, isn't it?
    string(REPLACE " " ";" cflags ${CMAKE_C_FLAGS})
@@ -56,7 +57,7 @@ index f70265f..b2f4223 100644
    # This little bit of magic wipes out __Pyx_check_single_interpreter()
    # Note: this is reproduced in distutils_install_cython_module
    list(APPEND cflags -D'void0=dead_function\(void\)')
-@@ -89,14 +80,8 @@ function(distutils_install_cython_module name)
+@@ -108,14 +99,8 @@ function(distutils_install_cython_module name)
      set(ENV{CEPH_LIBDIR} \"${CMAKE_LIBRARY_OUTPUT_DIRECTORY}\")
  
      set(options --prefix=${CMAKE_INSTALL_PREFIX})
@@ -72,9 +73,9 @@ index f70265f..b2f4223 100644
 +    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
      execute_process(
         COMMAND
-            ${PYTHON${PYTHON_VERSION}_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
+            ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
 diff --git a/cmake/modules/FindRocksDB.cmake b/cmake/modules/FindRocksDB.cmake
-index c5dd3df..be38597 100644
+index c5dd3dfaf6..be38597af2 100644
 --- a/cmake/modules/FindRocksDB.cmake
 +++ b/cmake/modules/FindRocksDB.cmake
 @@ -9,9 +9,9 @@
@@ -90,7 +91,7 @@ index c5dd3df..be38597 100644
  if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
    foreach(ver "MAJOR" "MINOR" "PATCH")
 diff --git a/src/compressor/zstd/CMakeLists.txt b/src/compressor/zstd/CMakeLists.txt
-index 76709bb..95bba4a 100644
+index a5ebdaf538..a234068150 100644
 --- a/src/compressor/zstd/CMakeLists.txt
 +++ b/src/compressor/zstd/CMakeLists.txt
 @@ -9,7 +9,7 @@ ExternalProject_Add(zstd_ext
@@ -100,13 +101,13 @@ index 76709bb..95bba4a 100644
 -             -DCMAKE_AR=${CMAKE_AR}
 +             -DCMAKE_SYSROOT=${CMAKE_SYSROOT}
               -DCMAKE_POSITION_INDEPENDENT_CODE=${ENABLE_SHARED}
+              -G${CMAKE_GENERATOR}
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
-   BUILD_COMMAND $(MAKE) libzstd_static
 diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
-index 1f95005..8a6d136 100755
+index 19ae6c329a..c9a25ccfff 100755
 --- a/src/pybind/cephfs/setup.py
 +++ b/src/pybind/cephfs/setup.py
-@@ -142,14 +142,6 @@ def check_sanity():
+@@ -135,14 +135,6 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
  
@@ -122,10 +123,10 @@ index 1f95005..8a6d136 100755
  try:
      from Cython.Build import cythonize
 diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
-index 75081df..4d1591c 100755
+index e2c5696404..4e99d26721 100755
 --- a/src/pybind/rados/setup.py
 +++ b/src/pybind/rados/setup.py
-@@ -138,14 +138,6 @@ def check_sanity():
+@@ -134,14 +134,6 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
  
@@ -141,10 +142,10 @@ index 75081df..4d1591c 100755
  try:
      from Cython.Build import cythonize
 diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
-index 8dd5c12..b8f4d91 100755
+index 634484f140..f5bbbdab4f 100755
 --- a/src/pybind/rbd/setup.py
 +++ b/src/pybind/rbd/setup.py
-@@ -141,14 +141,6 @@ def check_sanity():
+@@ -133,14 +133,6 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
  
@@ -160,10 +161,10 @@ index 8dd5c12..b8f4d91 100755
  try:
      from Cython.Build import cythonize
 diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
-index 4ee4f49..91dc7d4 100755
+index eb1591a460..b9f2428cf9 100755
 --- a/src/pybind/rgw/setup.py
 +++ b/src/pybind/rgw/setup.py
-@@ -143,14 +143,6 @@ def check_sanity():
+@@ -134,14 +134,6 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
  
@@ -179,5 +180,5 @@ index 4ee4f49..91dc7d4 100755
  try:
      from Cython.Build import cythonize
 -- 
-2.7.4
+2.20.1
 
diff --git a/recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch b/recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch
deleted file mode 100644
index 44bda1a..0000000
--- a/recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From ea64c4909ffeae10e5d8e0a23604030e8849f803 Mon Sep 17 00:00:00 2001
-From: Kefu Chai <kchai@redhat.com>
-Date: Mon, 23 Dec 2019 16:26:13 +0800
-Subject: [PATCH] common,rgw: workaround for boost 1.72
-
-see also https://github.com/boostorg/coroutine/issues/46
-
-will need to remove this change once we require boost >= 1.73
-
-Signed-off-by: Kefu Chai <kchai@redhat.com>
-
-Upstream-Status: Backport [https://github.com/ceph/ceph/commit/ea64c4909ffeae10e5d8e0a23604030e8849f803]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/common/async/yield_context.h | 2 ++
- src/rgw/rgw_asio_frontend.cc     | 2 ++
- src/test/librados/asio.cc        | 2 ++
- 3 files changed, 6 insertions(+)
-
-diff --git a/src/common/async/yield_context.h b/src/common/async/yield_context.h
-index fda9541eb4..436192c02f 100644
---- a/src/common/async/yield_context.h
-+++ b/src/common/async/yield_context.h
-@@ -14,6 +14,8 @@
- 
- #pragma once
- 
-+#include <boost/range/begin.hpp>
-+#include <boost/range/end.hpp>
- #include <boost/asio/io_context.hpp>
- 
- #include "acconfig.h"
-diff --git a/src/rgw/rgw_asio_frontend.cc b/src/rgw/rgw_asio_frontend.cc
-index 7df74225f6..deab1b0c66 100644
---- a/src/rgw/rgw_asio_frontend.cc
-+++ b/src/rgw/rgw_asio_frontend.cc
-@@ -7,6 +7,8 @@
- 
- #include <boost/asio.hpp>
- #define BOOST_COROUTINES_NO_DEPRECATION_WARNING
-+#include <boost/range/begin.hpp>
-+#include <boost/range/end.hpp>
- #include <boost/asio/spawn.hpp>
- #include <boost/intrusive/list.hpp>
- 
-diff --git a/src/test/librados/asio.cc b/src/test/librados/asio.cc
-index 9c86ad420c..8fa4bab197 100644
---- a/src/test/librados/asio.cc
-+++ b/src/test/librados/asio.cc
-@@ -21,6 +21,8 @@
- 
- #ifdef HAVE_BOOST_CONTEXT
- #define BOOST_COROUTINES_NO_DEPRECATION_WARNING
-+#include <boost/range/begin.hpp>
-+#include <boost/range/end.hpp>
- #include <boost/asio/spawn.hpp>
- #endif
- #include <boost/asio/use_future.hpp>
--- 
-2.17.1
-
diff --git a/recipes-extended/ceph/ceph/0001-rgw-add-executor-type-for-basic_waitable_timers.patch b/recipes-extended/ceph/ceph/0001-rgw-add-executor-type-for-basic_waitable_timers.patch
deleted file mode 100644
index b7a9dd9..0000000
--- a/recipes-extended/ceph/ceph/0001-rgw-add-executor-type-for-basic_waitable_timers.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From f1651b8c509d60787d10c4115e29fecfd2da237c Mon Sep 17 00:00:00 2001
-From: Casey Bodley <cbodley@redhat.com>
-Date: Tue, 23 Apr 2019 15:41:45 -0400
-Subject: [PATCH] rgw: add executor type for basic_waitable_timers
-
-as of boost 1.70, the timer no longer depends on io_context directly,
-so we have to specify its executor as a template parameter
-
-Signed-off-by: Casey Bodley <cbodley@redhat.com>
-
-Upstream-Status: Backport [f1651b8c509d60787d10c4115e29fecfd2da237c]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- src/rgw/rgw_dmclock_async_scheduler.h | 5 +++++
- src/rgw/rgw_reshard.h                 | 9 ++++++++-
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/src/rgw/rgw_dmclock_async_scheduler.h b/src/rgw/rgw_dmclock_async_scheduler.h
-index 70487a5253..1d454acd2e 100644
---- a/src/rgw/rgw_dmclock_async_scheduler.h
-+++ b/src/rgw/rgw_dmclock_async_scheduler.h
-@@ -82,7 +82,12 @@ class AsyncScheduler : public md_config_obs_t, public Scheduler {
-   using Completion = async::Completion<Signature, async::AsBase<Request>>;
- 
-   using Clock = ceph::coarse_real_clock;
-+#if BOOST_VERSION < 107000
-   using Timer = boost::asio::basic_waitable_timer<Clock>;
-+#else
-+  using Timer = boost::asio::basic_waitable_timer<Clock,
-+        boost::asio::wait_traits<Clock>, executor_type>;
-+#endif
-   Timer timer; //< timer for the next scheduled request
- 
-   CephContext *const cct;
-diff --git a/src/rgw/rgw_reshard.h b/src/rgw/rgw_reshard.h
-index d99a6ff68d..213fc238d2 100644
---- a/src/rgw/rgw_reshard.h
-+++ b/src/rgw/rgw_reshard.h
-@@ -183,7 +183,14 @@ class RGWReshardWait {
-   ceph::condition_variable cond;
- 
-   struct Waiter : boost::intrusive::list_base_hook<> {
--    boost::asio::basic_waitable_timer<Clock> timer;
-+#if BOOST_VERSION < 107000
-+    using Timer = boost::asio::basic_waitable_timer<Clock>;
-+#else
-+    using Executor = boost::asio::io_context::executor_type;
-+    using Timer = boost::asio::basic_waitable_timer<Clock,
-+          boost::asio::wait_traits<Clock>, Executor>;
-+#endif
-+    Timer timer;
-     explicit Waiter(boost::asio::io_context& ioc) : timer(ioc) {}
-   };
-   boost::intrusive::list<Waiter> waiters;
--- 
-2.21.0
-
diff --git a/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch b/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
deleted file mode 100644
index d18e00a..0000000
--- a/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Backport patch from upstream and update context to fix compile error:
-
-| /path/to/tmp-glibc/work/core2-64-wrs-linux/ceph/14.2.6-r0/ceph-14.2.6/src/rgw/rgw_asio_frontend.cc:165:38: error: 'class boost::asio::basic_socket<boost::asio::ip::tcp, boost::asio::executor>' has no member named 'get_io_context'
-|   165 |       auto y = optional_yield{socket.get_io_context(), yield};
-|       |                               ~~~~~~~^~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://github.com/ceph/ceph/commit/064f142]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 064f142746ae97f54865069cdacf5aae2b1b14f6 Mon Sep 17 00:00:00 2001
-From: Casey Bodley <cbodley@redhat.com>
-Date: Tue, 23 Apr 2019 15:40:01 -0400
-Subject: [PATCH] rgw: beast handle_connection() takes io_context
-
-as of boost 1.70, the socket no longer has a get_io_context(), so we
-have to pass it in as an argument
-
-Signed-off-by: Casey Bodley <cbodley@redhat.com>
----
- src/rgw/rgw_asio_frontend.cc | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/src/rgw/rgw_asio_frontend.cc b/src/rgw/rgw_asio_frontend.cc
-index 0e1e09a..f7c13e1 100644
---- a/src/rgw/rgw_asio_frontend.cc
-+++ b/src/rgw/rgw_asio_frontend.cc
-@@ -84,7 +84,8 @@ class StreamIO : public rgw::asio::ClientIO {
- using SharedMutex = ceph::async::SharedMutex<boost::asio::io_context::executor_type>;
-
- template <typename Stream>
--void handle_connection(RGWProcessEnv& env, Stream& stream,
-+void handle_connection(boost::asio::io_context& context,
-+                       RGWProcessEnv& env, Stream& stream,
-                        parse_buffer& buffer, bool is_ssl,
-                        SharedMutex& pause_mutex,
-                        rgw::dmclock::Scheduler *scheduler,
-@@ -161,7 +162,7 @@ void handle_connection(RGWProcessEnv& env, Stream& stream,
-                                   rgw::io::add_conlen_controlling(
-                                     &real_client))));
-       RGWRestfulIO client(cct, &real_client_io);
--      auto y = optional_yield{socket.get_io_context(), yield};
-+      auto y = optional_yield{context, yield};
-       process_request(env.store, env.rest, &req, env.uri_prefix,
-                       *env.auth_registry, &client, env.olog, y, scheduler);
-     }
-@@ -605,7 +606,7 @@ void AsioFrontend::accept(Listener& l, boost::system::error_code ec)
-           return;
-         }
-         buffer->consume(bytes);
--        handle_connection(env, stream, *buffer, true, pause_mutex,
-+        handle_connection(context, env, stream, *buffer, true, pause_mutex,
-                           scheduler.get(), ec, yield);
-         if (!ec) {
-           // ssl shutdown (ignoring errors)
-@@ -623,7 +624,7 @@ void AsioFrontend::accept(Listener& l, boost::system::error_code ec)
-         auto c = connections.add(conn);
-         auto buffer = std::make_unique<parse_buffer>();
-         boost::system::error_code ec;
--        handle_connection(env, s, *buffer, false, pause_mutex,
-+        handle_connection(context, env, s, *buffer, false, pause_mutex,
-                           scheduler.get(), ec, yield);
-         s.shutdown(tcp::socket::shutdown_both, ec);
-       });
---
-2.20.1
-
diff --git a/recipes-extended/ceph/ceph_14.2.7.bb b/recipes-extended/ceph/ceph_15.2.0.bb
similarity index 87%
rename from recipes-extended/ceph/ceph_14.2.7.bb
rename to recipes-extended/ceph/ceph_15.2.0.bb
index 18df8b4..2b7b2c1 100644
--- a/recipes-extended/ceph/ceph_14.2.7.bb
+++ b/recipes-extended/ceph/ceph_15.2.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "User space components of the Ceph file system"
 LICENSE = "LGPLv2.1 & GPLv2 & Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24 \
                     file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING;md5=601c21a554d728c3038ca292b83b8af0 \
+                    file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754 \
 "
 inherit cmake python3native python3-dir systemd
 # Disable python pybind support for ceph temporary, when corss compiling pybind,
@@ -11,13 +11,13 @@ inherit cmake python3native python3-dir systemd
 SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://ceph.conf \
-           file://0001-rgw-add-executor-type-for-basic_waitable_timers.patch \
-           file://0001-common-rgw-workaround-for-boost-1.72.patch \
-           file://0001-rgw-beast-handle_connection-takes-io_context.patch \
 "
 
-SRC_URI[md5sum] = "8100ce9820714554e6d4717f6f0aa4da"
-SRC_URI[sha256sum] = "9606dc80553bd97e138cd80b6bbbc117b6b26c66248e490a4e49fc0d4d853862"
+SRC_URI[md5sum] = "1f9af648b4c6d19975aab2583ab99710"
+SRC_URI[sha256sum] = "4292c473d1714a6602c525d7582e4e03ec608f0a1cbc0dd338207e5c7068e0d3"
+SRC_URI[sha1sum] = "7158806ece1483fcccdf1172c20cc34d9401c543"
+SRC_URI[sha384sum] = "20e996dbf30d1e33a6d6aae36960190125ce263d306415bcec5d2b3032b8b8f730deeba3ca318576573127d08909404a"
+SRC_URI[sha512sum] = "07a3ff2ccf1a3abac652ff8c5f1611e7c628fcedcb280adc6cd49792b46fa50c7c29437dc57c2c4a6af708a6833abf8c1a386ef2142d30bd5e1f214ba7aec4f2"
 
 DEPENDS = "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
@@ -60,7 +60,8 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
                  -DWITH_RDMA=OFF \
                  -DWITH_RADOSGW_AMQP_ENDPOINT=OFF \
                  -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 \
-                 -DPYTHON_EXECUTABLE=${PYTHON} \
+                 -DPython3_EXECUTABLE=${PYTHON} \
+                 -DWITH_RADOSGW_KAFKA_ENDPOINT=OFF \
 "
 
 do_configure_prepend () {
-- 
2.17.1

