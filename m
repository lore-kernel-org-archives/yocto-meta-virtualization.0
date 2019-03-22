Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63540E00D3D; Thu, 21 Mar 2019 19:14:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF81AE00798
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 19:14:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2M2E2Tx015158
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 19:14:12 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 21 Mar 2019 19:13:51 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 22 Mar 2019 10:13:52 +0800
Message-ID: <1553220833-33258-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH 1/2] libibverbs: upgrade to 1.2.1
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
X-List-Received-Date: Fri, 22 Mar 2019 02:14:23 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../libibverbs/{libibverbs_1.1.7.bb => libibverbs_1.2.1.bb}          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename recipes-extended/libibverbs/{libibverbs_1.1.7.bb => libibverbs_1.2.1.bb} (83%)

diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
similarity index 83%
rename from recipes-extended/libibverbs/libibverbs_1.1.7.bb
rename to recipes-extended/libibverbs/libibverbs_1.2.1.bb
index e7e8d65..dd74522 100644
--- a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
+++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
@@ -9,11 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
 # Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
 SRC_URI = "https://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5aea59e4766ae4548419010ac84032ff"
-SRC_URI[sha256sum] = "31b4114bf32d41c9fc81a862ec5febed1e982975f21fa177ea9c7516c9064690"
+SRC_URI[md5sum] = "1544ebb89d861ce84057ab43dfcd22a0"
+SRC_URI[sha256sum] = "c352a7f24e9a9d30ea74faa35d1b721d78d770506a0c03732e3132b7c85ac330"
 
 inherit autotools
 
+DEPENDS = "libnl pkgconfig-native"
 PACKAGES += "${PN}-utils"
 FILES_${PN} = "${sysconfdir} ${libdir}/*.so.*"
 FILES_${PN}-utils = "${bindir}"
-- 
2.7.4


