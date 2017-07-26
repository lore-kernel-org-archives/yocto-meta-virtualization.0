Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D480E00C12; Tue, 25 Jul 2017 17:42:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1879E00BAF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 17:41:55 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6Q0ftZX015748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 17:41:55 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 25 Jul 2017 17:41:54 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@windriver.com>
Date: Wed, 26 Jul 2017 08:42:08 +0800
Message-ID: <1501029729-15543-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501029729-15543-1-git-send-email-yi.zhao@windriver.com>
References: <1501029729-15543-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-cloud-services][PATCH V2 2/3] librdmacm: add new recipe
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
X-List-Received-Date: Wed, 26 Jul 2017 00:42:01 -0000
Content-Type: text/plain

User space RDMA 'socket' protocol and libraries for establising RDMA
communication. Includes both Infiniband specific and general RDMA
communication management libraries for unreliable datagram, reliable
connected, and multicast data transfers.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../librdmacm/files/librdmacm-needs-libdl.patch    | 21 +++++++++++
 recipes-extended/librdmacm/librdmacm_1.0.17.bb     | 41 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-extended/librdmacm/files/librdmacm-needs-libdl.patch
 create mode 100644 recipes-extended/librdmacm/librdmacm_1.0.17.bb

diff --git a/recipes-extended/librdmacm/files/librdmacm-needs-libdl.patch b/recipes-extended/librdmacm/files/librdmacm-needs-libdl.patch
new file mode 100644
index 0000000..bf15bea
--- /dev/null
+++ b/recipes-extended/librdmacm/files/librdmacm-needs-libdl.patch
@@ -0,0 +1,21 @@
+Librdmacm links against libibverbs, and the current version of libibverbs
+uses dlopen(), so librdmacm must also link against libdl.
+
+Upstream-Status: Pending
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+---
+ configure.in |    2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/configure.in
++++ b/configure.in
+@@ -39,6 +39,8 @@ AC_CHECK_SIZEOF(long)
+ dnl Checks for libraries
+ AC_CHECK_LIB(pthread, pthread_mutex_init, [],
+     AC_MSG_ERROR([pthread_mutex_init() not found.  librdmacm requires libpthread.]))
++AC_CHECK_LIB(dl, dlsym, [],
++    AC_MSG_ERROR([dlsym() not found.  librdmacm requires libdl.]))
+ if test "$disable_libcheck" != "yes"; then
+ AC_CHECK_LIB(ibverbs, ibv_get_device_list, [],
+     AC_MSG_ERROR([ibv_get_device_list() not found.  librdmacm requires libibverbs.]))
diff --git a/recipes-extended/librdmacm/librdmacm_1.0.17.bb b/recipes-extended/librdmacm/librdmacm_1.0.17.bb
new file mode 100644
index 0000000..ba022b0
--- /dev/null
+++ b/recipes-extended/librdmacm/librdmacm_1.0.17.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Userspace RDMA Connection Manager"
+DESCRIPTION = "\
+User space RDMA 'socket' protocol and libraries for establising RDMA\
+communication.  Includes both Infiniband specific and general RDMA\
+communication management libraries for unreliable datagram, reliable\
+connected, and multicast data transfers.\
+Also includes ACM (communication management assistant) service."
+
+HOMEPAGE = "http://www.openfabrics.org/downloads/rdmacm/"
+SECTION = "libs/devel"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=39cc3044d68741f9005da73e9b92db95"
+
+DEPENDS = "libibverbs"
+
+# Repo is at http://git.openfabrics.org/git?p=~shefty/librdmacm.git
+SRC_URI = "http://www.openfabrics.org/downloads/rdmacm/${BPN}-${PV}.tar.gz \
+           file://librdmacm-needs-libdl.patch"
+
+SRC_URI[md5sum] = "da6fad887e9c24cb01b74b75f8449cb1"
+SRC_URI[sha256sum] = "9381e1bf2c7079fc257b8eee74e731d3e7eec70e539bb4245084a7b05aeecb2a"
+
+inherit autotools
+
+# Allow plug-in symlinks.
+INSANE_SKIP_${PN} += "dev-so"
+
+PACKAGES += "${PN}-utils"
+FILES_${PN} = "${libdir}/*.so.* ${libdir}/rsocket/*.so*"
+FILES_${PN}-utils = "${bindir}"
+FILES_${PN}-staticdev += "${libdir}/rsocket/librspreload.a"
+FILES_${PN}-dbg += "${libdir}/rsocket/.debug"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
+
+do_install_append() {
+        rm -f ${D}${libdir}/librdmacm.la
+        rm -f ${D}${libdir}/rsocket/librspreload.la
+}
-- 
2.7.4


