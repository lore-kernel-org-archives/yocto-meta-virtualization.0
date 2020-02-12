Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.21838.1581479645555162113
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 19:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01C3s4gF026206
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2020 19:54:04 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.468.0; Tue, 11 Feb 2020 19:53:48 -0800
From: "kai" <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] ceph: 14.2.6 -> 14.2.7
Date: Wed, 12 Feb 2020 11:53:46 +0800
Message-ID: <20200212035346.8364-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update ceph from 14.2.6 to 14.2.7.

* Backport patch to fix compile error
* Replace python with python3 in the script files that /usr/bin/python
  not exists
* Replace runtime dependency python3 with python3-core
  - /usr/bin/python3 is provided by python3-core
  - packagee python3 is provided by python3-modules which in RDEPENDS already

This has been build-only tested.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...t-handle_connection-takes-io_context.patch | 67 +++++++++++++++++++
 .../ceph/{ceph_14.2.6.bb => ceph_14.2.7.bb}   | 39 +++++------
 2 files changed, 87 insertions(+), 19 deletions(-)
 create mode 100644 recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
 rename recipes-extended/ceph/{ceph_14.2.6.bb => ceph_14.2.7.bb} (84%)

diff --git a/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch b/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
new file mode 100644
index 0000000..d18e00a
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
@@ -0,0 +1,67 @@
+Backport patch from upstream and update context to fix compile error:
+
+| /path/to/tmp-glibc/work/core2-64-wrs-linux/ceph/14.2.6-r0/ceph-14.2.6/src/rgw/rgw_asio_frontend.cc:165:38: error: 'class boost::asio::basic_socket<boost::asio::ip::tcp, boost::asio::executor>' has no member named 'get_io_context'
+|   165 |       auto y = optional_yield{socket.get_io_context(), yield};
+|       |                               ~~~~~~~^~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://github.com/ceph/ceph/commit/064f142]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 064f142746ae97f54865069cdacf5aae2b1b14f6 Mon Sep 17 00:00:00 2001
+From: Casey Bodley <cbodley@redhat.com>
+Date: Tue, 23 Apr 2019 15:40:01 -0400
+Subject: [PATCH] rgw: beast handle_connection() takes io_context
+
+as of boost 1.70, the socket no longer has a get_io_context(), so we
+have to pass it in as an argument
+
+Signed-off-by: Casey Bodley <cbodley@redhat.com>
+---
+ src/rgw/rgw_asio_frontend.cc | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/rgw/rgw_asio_frontend.cc b/src/rgw/rgw_asio_frontend.cc
+index 0e1e09a..f7c13e1 100644
+--- a/src/rgw/rgw_asio_frontend.cc
++++ b/src/rgw/rgw_asio_frontend.cc
+@@ -84,7 +84,8 @@ class StreamIO : public rgw::asio::ClientIO {
+ using SharedMutex = ceph::async::SharedMutex<boost::asio::io_context::executor_type>;
+
+ template <typename Stream>
+-void handle_connection(RGWProcessEnv& env, Stream& stream,
++void handle_connection(boost::asio::io_context& context,
++                       RGWProcessEnv& env, Stream& stream,
+                        parse_buffer& buffer, bool is_ssl,
+                        SharedMutex& pause_mutex,
+                        rgw::dmclock::Scheduler *scheduler,
+@@ -161,7 +162,7 @@ void handle_connection(RGWProcessEnv& env, Stream& stream,
+                                   rgw::io::add_conlen_controlling(
+                                     &real_client))));
+       RGWRestfulIO client(cct, &real_client_io);
+-      auto y = optional_yield{socket.get_io_context(), yield};
++      auto y = optional_yield{context, yield};
+       process_request(env.store, env.rest, &req, env.uri_prefix,
+                       *env.auth_registry, &client, env.olog, y, scheduler);
+     }
+@@ -605,7 +606,7 @@ void AsioFrontend::accept(Listener& l, boost::system::error_code ec)
+           return;
+         }
+         buffer->consume(bytes);
+-        handle_connection(env, stream, *buffer, true, pause_mutex,
++        handle_connection(context, env, stream, *buffer, true, pause_mutex,
+                           scheduler.get(), ec, yield);
+         if (!ec) {
+           // ssl shutdown (ignoring errors)
+@@ -623,7 +624,7 @@ void AsioFrontend::accept(Listener& l, boost::system::error_code ec)
+         auto c = connections.add(conn);
+         auto buffer = std::make_unique<parse_buffer>();
+         boost::system::error_code ec;
+-        handle_connection(env, s, *buffer, false, pause_mutex,
++        handle_connection(context, env, s, *buffer, false, pause_mutex,
+                           scheduler.get(), ec, yield);
+         s.shutdown(tcp::socket::shutdown_both, ec);
+       });
+--
+2.20.1
+
diff --git a/recipes-extended/ceph/ceph_14.2.6.bb b/recipes-extended/ceph/ceph_14.2.7.bb
similarity index 84%
rename from recipes-extended/ceph/ceph_14.2.6.bb
rename to recipes-extended/ceph/ceph_14.2.7.bb
index c213e1a..18df8b4 100644
--- a/recipes-extended/ceph/ceph_14.2.6.bb
+++ b/recipes-extended/ceph/ceph_14.2.7.bb
@@ -13,10 +13,11 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://ceph.conf \
            file://0001-rgw-add-executor-type-for-basic_waitable_timers.patch \
            file://0001-common-rgw-workaround-for-boost-1.72.patch \
+           file://0001-rgw-beast-handle_connection-takes-io_context.patch \
 "
 
-SRC_URI[md5sum] = "10c22151123ce73b3fe49a6700fe24e0"
-SRC_URI[sha256sum] = "a1d20f2ba4e2d38a52f40e2e75e2ad136e78fa208b59348d3d45895cc4ca7e62"
+SRC_URI[md5sum] = "8100ce9820714554e6d4717f6f0aa4da"
+SRC_URI[sha256sum] = "9606dc80553bd97e138cd80b6bbbc117b6b26c66248e490a4e49fc0d4d853862"
 
 DEPENDS = "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
@@ -26,22 +27,22 @@ DEPENDS = "boost bzip2 curl expat gperf-native \
            valgrind xfsprogs zlib \
 "
 SYSTEMD_SERVICE_${PN} = " \
-	ceph-radosgw@.service \
-	ceph-radosgw.target \
+        ceph-radosgw@.service \
+        ceph-radosgw.target \
         ceph-mon@.service \
-	ceph-mon.target \
+        ceph-mon.target \
         ceph-mds@.service \
-	ceph-mds.target \
+        ceph-mds.target \
         ceph-osd@.service \
-	ceph-osd.target \
+        ceph-osd.target \
         ceph.target \
-	ceph-rbd-mirror@.service \
-	ceph-rbd-mirror.target \
-	ceph-volume@.service \
-	ceph-mgr@.service \
-	ceph-mgr.target \
-	ceph-crash.service \
-	rbdmap.service \
+        ceph-rbd-mirror@.service \
+        ceph-rbd-mirror.target \
+        ceph-volume@.service \
+        ceph-mgr@.service \
+        ceph-mgr.target \
+        ceph-crash.service \
+        rbdmap.service \
 "
 OECMAKE_GENERATOR = "Unix Makefiles"
 
@@ -69,10 +70,10 @@ do_configure_prepend () {
 }
 
 do_install_append () {
-	sed -i -e 's:${WORKDIR}.*python3:${bindir}/python:' ${D}${bindir}/ceph
-	sed -i -e 's:${WORKDIR}.*python3:${bindir}/python:' ${D}${bindir}/ceph-crash
-	sed -i -e 's:${WORKDIR}.*python3:${bindir}/python:' ${D}${bindir}/ceph-volume
-	sed -i -e 's:${WORKDIR}.*python3:${bindir}/python:' ${D}${bindir}/ceph-volume-systemd
+	sed -i -e 's:^#!/usr/bin/python$:&3:' \
+		-e 's:${WORKDIR}.*python3:${bindir}/python3:' \
+		${D}${bindir}/ceph ${D}${bindir}/ceph-crash \
+		${D}${bindir}/ceph-volume ${D}${bindir}/ceph-volume-systemd
 	find ${D} -name SOURCES.txt | xargs sed -i -e 's:${WORKDIR}::'
 	install -d ${D}${sysconfdir}/ceph
 	install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
@@ -118,7 +119,7 @@ FILES_${PN}-python = "\
                 ${PYTHON_SITEPACKAGES_DIR}/* \
 "
 RDEPENDS_${PN} += "\
-		python3 \
+		python3-core \
 		python3-misc \
 		python3-modules \
 		python3-prettytable \
-- 
2.17.1

