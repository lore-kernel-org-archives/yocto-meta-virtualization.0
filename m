Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B52C2E00A84; Mon,  8 Apr 2019 14:23:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39428E00994
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Apr 2019 14:23:44 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x38LN2nn000530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Apr 2019 14:23:18 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 8 Apr 2019 14:23:12 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>,
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Apr 2019 14:23:12 -0700
Message-ID: <20190408212312.86791-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-virt][m-c-s][v2][PATCH 1/1] libibverbs: do not try to build for arm 32 bit or any mips
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
X-List-Received-Date: Mon, 08 Apr 2019 21:23:45 -0000
Content-Type: text/plain

arch.h does not contain macros for 32 bit arm or any mips arch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-extended/libibverbs/libibverbs_1.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
index dd74522..fa7eee6 100644
--- a/recipes-extended/libibverbs/libibverbs_1.2.1.bb
+++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
@@ -29,3 +29,6 @@ do_install_append() {
 
 PROVIDES = "virtual/libibverbs"
 RPROVIDES_${PN} = "virtual/libibverbs"
+
+COMPATIBLE_HOST_mipsarch = "none"
+COMPATIBLE_HOST_arm = "none"
-- 
2.7.4


