Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC490E00BF3; Sun, 23 Jul 2017 22:14:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4357E00C06
	for <meta-virtualization@yoctoproject.org>;
	Sun, 23 Jul 2017 22:14:08 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6O5E7rV019030
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 23 Jul 2017 22:14:07 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 23 Jul 2017 22:14:06 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@windriver.com>
Date: Mon, 24 Jul 2017 13:14:22 +0800
Message-ID: <1500873264-24606-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500873264-24606-1-git-send-email-yi.zhao@windriver.com>
References: <1500873264-24606-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-cloud-services][PATCH 1/3] libibverbs: add new recpie
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
X-List-Received-Date: Mon, 24 Jul 2017 05:14:15 -0000
Content-Type: text/plain

Libibverbs is a library that allows userspace processes to use
InfiniBand/RDMA 'verbs' directly.

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


