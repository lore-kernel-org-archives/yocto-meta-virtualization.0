Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 481FFE00B6C; Fri, 12 Oct 2018 01:15:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4886DE00AC8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 01:15:19 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C8FHN9017050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2018 01:15:17 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 12 Oct 2018 01:15:17 -0700
From: <mingli.yu@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 12 Oct 2018 16:15:14 +0800
Message-ID: <1539332115-342326-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH v2 1/2] libibverbs: Update SRC_URI
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
X-List-Received-Date: Fri, 12 Oct 2018 08:15:21 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update SRC_URI for libibverbs as the
previous one is invalid.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 recipes-extended/libibverbs/libibverbs_1.1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
index b3cd73f..e7e8d65 100644
--- a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
+++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
 
 # Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
-SRC_URI = "http://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "5aea59e4766ae4548419010ac84032ff"
 SRC_URI[sha256sum] = "31b4114bf32d41c9fc81a862ec5febed1e982975f21fa177ea9c7516c9064690"
-- 
2.7.4


