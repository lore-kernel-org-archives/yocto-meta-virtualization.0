Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 113B1E00BBC; Tue, 25 Jul 2017 17:41:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F16DFE00BBC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 17:41:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6Q0fqLD021321
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 17:41:52 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 25 Jul 2017 17:41:51 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@windriver.com>
Date: Wed, 26 Jul 2017 08:42:07 +0800
Message-ID: <1501029729-15543-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501029729-15543-1-git-send-email-yi.zhao@windriver.com>
References: <1501029729-15543-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-cloud-services][PATCH V2 1/3] libibverbs: add new recpie
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
X-List-Received-Date: Wed, 26 Jul 2017 00:41:54 -0000
Content-Type: text/plain

Libibverbs is a library that allows userspace processes to use
InfiniBand/RDMA 'verbs' directly.

libibverbs is now part of rdma-core and the standalone libibverbs
project has been deprecated. Rough testing shows that we can move to use
rdma-core however we have yet to perform extensive testing with this
change. We therefor will continue to use the standalone libibverbs at
this point in time. This is also inline with the upstream glusterfs
project that still lists libibverbs as a dependency.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 recipes-extended/libibverbs/libibverbs_1.1.7.bb | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-extended/libibverbs/libibverbs_1.1.7.bb

diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
new file mode 100644
index 0000000..e75f90d
--- /dev/null
+++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Support InfiniBand verbs"
+DESCRIPTION = "Libibverbs is a library that allows userspace processes to use InfiniBand/RDMA 'verbs' directly."
+HOMEPAGE = "http://www.openfabrics.org/downloads/verbs/"
+SECTION = "libs/devel"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
+
+# Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
+SRC_URI = "http://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "5aea59e4766ae4548419010ac84032ff"
+SRC_URI[sha256sum] = "31b4114bf32d41c9fc81a862ec5febed1e982975f21fa177ea9c7516c9064690"
+
+inherit autotools
+
+PACKAGES += "${PN}-utils"
+FILES_${PN} = "${sysconfdir} ${libdir}/*.so.*"
+FILES_${PN}-utils = "${bindir}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
+
+do_install_append() {
+        mkdir -p ${D}${sysconfdir}/libibverbs.d
+        rm -f ${D}${libdir}/libibverbs.la
+}
-- 
2.7.4


