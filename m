Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B1F5E00DFB; Wed,  4 Sep 2019 02:02:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1C3CE00DF2
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 02:02:28 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8492Rtx015756
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Sep 2019 02:02:27 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 4 Sep 2019 02:02:26 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Wed, 4 Sep 2019 17:02:25 +0800
Message-ID: <1567587745-220540-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ceph: Upgrade to 14.2.3
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
X-List-Received-Date: Wed, 04 Sep 2019 09:02:29 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Upgrade to the latest stable version and backport two patches from master branch
to fix the following two build failures which are introduce by upgrading boost
to 1.71.0.

f1651b8c509d ("rgw: add executor type for basic_waitable_timers") for:

src/rgw/rgw_dmclock_async_scheduler.h:45:30: error: could not convert
'boost::asio::basic_waitable_timer<Clock, WaitTraits, Executor>::get_executor()

064f142746ae ("rgw: beast handle_connection() takes io_context") for:

src/rgw/rgw_asio_frontend.cc:155:38: error:
'class boost::asio::basic_socket<boost::asio::ip::tcp, boost::asio::executor>'
has no member named 'get_io_context'; did you mean 'io_control'?

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...1-ceph-fix-build-errors-for-cross-compile.patch | 27 ++++------
 ...d-executor-type-for-basic_waitable_timers.patch | 58 ++++++++++++++++++++
 ...-beast-handle_connection-takes-io_context.patch | 61 ++++++++++++++++++++++
 .../ceph/{ceph_14.1.0.bb => ceph_14.2.3.bb}        |  6 ++-
 4 files changed, 134 insertions(+), 18 deletions(-)
 create mode 100644 recipes-extended/ceph/ceph/0001-rgw-add-executor-type-for-basic_waitable_timers.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
 rename recipes-extended/ceph/{ceph_14.1.0.bb => ceph_14.2.3.bb} (92%)

diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
index 1e23cc1..4f009f0 100644
--- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
+++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
@@ -1,4 +1,4 @@
-From 20dd3fb9e5daa780e15113a2c88f846c8f5dd904 Mon Sep 17 00:00:00 2001
+From 9b97824ad0da2c0d3dcc0cf41f4506aa7e458e9f Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Mon, 11 Mar 2019 09:14:09 +0800
 Subject: [PATCH] ceph: fix build errors for cross compile
@@ -9,18 +9,22 @@ Subject: [PATCH] ceph: fix build errors for cross compile
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
+
+Adjust context for v14.2.3
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
 ---
  cmake/modules/Distutils.cmake      | 25 +++++--------------------
- cmake/modules/FindRocksDB.cmake    |  6 +++---
+ cmake/modules/FindRocksDB.cmake    |  4 ++--
  src/compressor/zstd/CMakeLists.txt |  2 +-
  src/pybind/cephfs/setup.py         |  8 --------
  src/pybind/rados/setup.py          |  8 --------
  src/pybind/rbd/setup.py            |  8 --------
  src/pybind/rgw/setup.py            |  8 --------
- 7 files changed, 9 insertions(+), 56 deletions(-)
+ 7 files changed, 8 insertions(+), 55 deletions(-)
 
 diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
-index 5697dff..de3cd57 100644
+index f70265f..b2f4223 100644
 --- a/cmake/modules/Distutils.cmake
 +++ b/cmake/modules/Distutils.cmake
 @@ -16,17 +16,8 @@ function(distutils_install_module name)
@@ -50,9 +54,9 @@ index 5697dff..de3cd57 100644
 -  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w)
 +  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT})
    # This little bit of magic wipes out __Pyx_check_single_interpreter()
+   # Note: this is reproduced in distutils_install_cython_module
    list(APPEND cflags -D'void0=dead_function\(void\)')
-   list(APPEND cflags -D'__Pyx_check_single_interpreter\(ARG\)=ARG \#\# 0')
-@@ -86,14 +77,8 @@ function(distutils_install_cython_module name)
+@@ -89,14 +80,8 @@ function(distutils_install_cython_module name)
      set(ENV{CEPH_LIBDIR} \"${CMAKE_LIBRARY_OUTPUT_DIRECTORY}\")
  
      set(options --prefix=${CMAKE_INSTALL_PREFIX})
@@ -70,7 +74,7 @@ index 5697dff..de3cd57 100644
         COMMAND
             ${PYTHON${PYTHON_VERSION}_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
 diff --git a/cmake/modules/FindRocksDB.cmake b/cmake/modules/FindRocksDB.cmake
-index 9818433..be38597 100644
+index c5dd3df..be38597 100644
 --- a/cmake/modules/FindRocksDB.cmake
 +++ b/cmake/modules/FindRocksDB.cmake
 @@ -9,9 +9,9 @@
@@ -85,15 +89,6 @@ index 9818433..be38597 100644
  
  if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
    foreach(ver "MAJOR" "MINOR" "PATCH")
-@@ -40,7 +40,7 @@ if(RocksDB_FOUND)
-     set_target_properties(RocksDB::RocksDB PROPERTIES
-       INTERFACE_INCLUDE_DIRECTORIES "${ROCKSDB_INCLUDE_DIR}"
-       IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
--      IMPORTED_LOCATION "${ROCKSDB_LIBRARY}"
-+      IMPORTED_LOCATION "${ROCKSDB_LIBRARIES}"
-       VERSION "${ROCKSDB_VERSION_STRING}")
-   endif()
- endif()
 diff --git a/src/compressor/zstd/CMakeLists.txt b/src/compressor/zstd/CMakeLists.txt
 index 76709bb..95bba4a 100644
 --- a/src/compressor/zstd/CMakeLists.txt
diff --git a/recipes-extended/ceph/ceph/0001-rgw-add-executor-type-for-basic_waitable_timers.patch b/recipes-extended/ceph/ceph/0001-rgw-add-executor-type-for-basic_waitable_timers.patch
new file mode 100644
index 0000000..b7a9dd9
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-rgw-add-executor-type-for-basic_waitable_timers.patch
@@ -0,0 +1,58 @@
+From f1651b8c509d60787d10c4115e29fecfd2da237c Mon Sep 17 00:00:00 2001
+From: Casey Bodley <cbodley@redhat.com>
+Date: Tue, 23 Apr 2019 15:41:45 -0400
+Subject: [PATCH] rgw: add executor type for basic_waitable_timers
+
+as of boost 1.70, the timer no longer depends on io_context directly,
+so we have to specify its executor as a template parameter
+
+Signed-off-by: Casey Bodley <cbodley@redhat.com>
+
+Upstream-Status: Backport [f1651b8c509d60787d10c4115e29fecfd2da237c]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ src/rgw/rgw_dmclock_async_scheduler.h | 5 +++++
+ src/rgw/rgw_reshard.h                 | 9 ++++++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/src/rgw/rgw_dmclock_async_scheduler.h b/src/rgw/rgw_dmclock_async_scheduler.h
+index 70487a5253..1d454acd2e 100644
+--- a/src/rgw/rgw_dmclock_async_scheduler.h
++++ b/src/rgw/rgw_dmclock_async_scheduler.h
+@@ -82,7 +82,12 @@ class AsyncScheduler : public md_config_obs_t, public Scheduler {
+   using Completion = async::Completion<Signature, async::AsBase<Request>>;
+ 
+   using Clock = ceph::coarse_real_clock;
++#if BOOST_VERSION < 107000
+   using Timer = boost::asio::basic_waitable_timer<Clock>;
++#else
++  using Timer = boost::asio::basic_waitable_timer<Clock,
++        boost::asio::wait_traits<Clock>, executor_type>;
++#endif
+   Timer timer; //< timer for the next scheduled request
+ 
+   CephContext *const cct;
+diff --git a/src/rgw/rgw_reshard.h b/src/rgw/rgw_reshard.h
+index d99a6ff68d..213fc238d2 100644
+--- a/src/rgw/rgw_reshard.h
++++ b/src/rgw/rgw_reshard.h
+@@ -183,7 +183,14 @@ class RGWReshardWait {
+   ceph::condition_variable cond;
+ 
+   struct Waiter : boost::intrusive::list_base_hook<> {
+-    boost::asio::basic_waitable_timer<Clock> timer;
++#if BOOST_VERSION < 107000
++    using Timer = boost::asio::basic_waitable_timer<Clock>;
++#else
++    using Executor = boost::asio::io_context::executor_type;
++    using Timer = boost::asio::basic_waitable_timer<Clock,
++          boost::asio::wait_traits<Clock>, Executor>;
++#endif
++    Timer timer;
+     explicit Waiter(boost::asio::io_context& ioc) : timer(ioc) {}
+   };
+   boost::intrusive::list<Waiter> waiters;
+-- 
+2.21.0
+
diff --git a/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch b/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
new file mode 100644
index 0000000..7a44338
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
@@ -0,0 +1,61 @@
+From 064f142746ae97f54865069cdacf5aae2b1b14f6 Mon Sep 17 00:00:00 2001
+From: Casey Bodley <cbodley@redhat.com>
+Date: Tue, 23 Apr 2019 15:40:01 -0400
+Subject: [PATCH] rgw: beast handle_connection() takes io_context
+
+as of boost 1.70, the socket no longer has a get_io_context(), so we
+have to pass it in as an argument
+
+Signed-off-by: Casey Bodley <cbodley@redhat.com>
+
+Upstream-Status: Backport [064f142746ae97f54865069cdacf5aae2b1b14f6] 
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ src/rgw/rgw_asio_frontend.cc | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/rgw/rgw_asio_frontend.cc b/src/rgw/rgw_asio_frontend.cc
+index e4be074ec7..4af3695dc1 100644
+--- a/src/rgw/rgw_asio_frontend.cc
++++ b/src/rgw/rgw_asio_frontend.cc
+@@ -81,7 +81,8 @@ class StreamIO : public rgw::asio::ClientIO {
+ using SharedMutex = ceph::async::SharedMutex<boost::asio::io_context::executor_type>;
+ 
+ template <typename Stream>
+-void handle_connection(RGWProcessEnv& env, Stream& stream,
++void handle_connection(boost::asio::io_context& context,
++                       RGWProcessEnv& env, Stream& stream,
+                        boost::beast::flat_buffer& buffer, bool is_ssl,
+                        SharedMutex& pause_mutex,
+                        rgw::dmclock::Scheduler *scheduler,
+@@ -152,7 +153,7 @@ void handle_connection(RGWProcessEnv& env, Stream& stream,
+                                   rgw::io::add_conlen_controlling(
+                                     &real_client))));
+       RGWRestfulIO client(cct, &real_client_io);
+-      auto y = optional_yield{socket.get_io_context(), yield};
++      auto y = optional_yield{context, yield};
+       process_request(env.store, env.rest, &req, env.uri_prefix,
+                       *env.auth_registry, &client, env.olog, y, scheduler);
+     }
+@@ -560,7 +561,7 @@ void AsioFrontend::accept(Listener& l, boost::system::error_code ec)
+           return;
+         }
+         buffer.consume(bytes);
+-        handle_connection(env, stream, buffer, true, pause_mutex,
++        handle_connection(context, env, stream, buffer, true, pause_mutex,
+                           scheduler.get(), ec, yield);
+         if (!ec) {
+           // ssl shutdown (ignoring errors)
+@@ -578,7 +579,7 @@ void AsioFrontend::accept(Listener& l, boost::system::error_code ec)
+         auto c = connections.add(conn);
+         boost::beast::flat_buffer buffer;
+         boost::system::error_code ec;
+-        handle_connection(env, s, buffer, false, pause_mutex,
++        handle_connection(context, env, s, buffer, false, pause_mutex,
+                           scheduler.get(), ec, yield);
+         s.shutdown(tcp::socket::shutdown_both, ec);
+       });
+-- 
+2.21.0
+
diff --git a/recipes-extended/ceph/ceph_14.1.0.bb b/recipes-extended/ceph/ceph_14.2.3.bb
similarity index 92%
rename from recipes-extended/ceph/ceph_14.1.0.bb
rename to recipes-extended/ceph/ceph_14.2.3.bb
index 18a324a..722efe3 100644
--- a/recipes-extended/ceph/ceph_14.1.0.bb
+++ b/recipes-extended/ceph/ceph_14.2.3.bb
@@ -11,9 +11,11 @@ inherit cmake pythonnative python-dir systemd
 SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://ceph.conf \
+           file://0001-rgw-add-executor-type-for-basic_waitable_timers.patch \
+           file://0001-rgw-beast-handle_connection-takes-io_context.patch \
 "
-SRC_URI[md5sum] = "67b53eeb0f241c3011e7f40925aa7e08"
-SRC_URI[sha256sum] = "9ef726d7e73ce4d9510ad899493258374f1b40ba20a26b72bbbedb0bfb6dffd8"
+SRC_URI[md5sum] = "e4a53270fba14bf34d0b4c2a2340042e"
+SRC_URI[sha256sum] = "63d0eddab80f7bcdd4e9ac86d2b36c6cc8c9e2d34f20e8e426ff1620d66748dd"
 
 DEPENDS = "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
-- 
2.7.4


