Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.9486.1631864927934782404
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Sep 2021 00:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18H7mkBa010987
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Sep 2021 00:48:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18H7mkr0000737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Sep 2021 00:48:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 17 Sep 2021 00:48:45 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 17 Sep 2021 00:48:45 -0700
From: "kai" <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-cloud-services][PATCH] libibverbs: add back from meta-virtualization
Date: Fri, 17 Sep 2021 00:48:38 -0700
Message-ID: <20210917074838.90843-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

libibverbs has been removed from meta-virtualization but it is still required
by librdmacm and glusterfs. So add it back from meta-virtualization.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libibverbs/libibverbs_1.2.1.bb            | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-extended/libibverbs/libibverbs_1.2.1.bb

diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
new file mode 100644
index 00000000..90c424ec
--- /dev/null
+++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Support InfiniBand verbs"
+DESCRIPTION = "Libibverbs is a library that allows userspace processes to use InfiniBand/RDMA 'verbs' directly."
+HOMEPAGE = "http://www.openfabrics.org/downloads/verbs/"
+SECTION = "libs/devel"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
+
+# Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
+SRC_URI = "https://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1544ebb89d861ce84057ab43dfcd22a0"
+SRC_URI[sha256sum] = "c352a7f24e9a9d30ea74faa35d1b721d78d770506a0c03732e3132b7c85ac330"
+
+inherit autotools
+
+DEPENDS = "libnl pkgconfig-native"
+PACKAGES += "${PN}-utils"
+FILES:${PN} = "${sysconfdir} ${libdir}/*.so.*"
+FILES:${PN}-utils = "${bindir}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
+
+do_install:append() {
+        mkdir -p ${D}${sysconfdir}/libibverbs.d
+        rm -f ${D}${libdir}/libibverbs.la
+}
+
+PROVIDES = "virtual/libibverbs"
+RPROVIDES:${PN} = "virtual-libibverbs"
+
+COMPATIBLE_HOST:mipsarch = "none"
+COMPATIBLE_HOST:arm = "none"
-- 
2.33.0

