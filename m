Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2DCB4E00848; Wed, 19 Oct 2016 20:08:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F11CBE00756
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Oct 2016 20:08:25 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9K38OQY002806
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Oct 2016 20:08:24 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 19 Oct 2016 20:08:24 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 20 Oct 2016 10:49:17 +0800
Message-ID: <20161020024918.32049-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH 1/2] protobuf: Fix QA error for GNU_HASH
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
X-List-Received-Date: Thu, 20 Oct 2016 03:08:29 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Add LDFLAGS to examples makefile to pass default ld flags.

"ERROR: protobuf-3.0.0-r0 do_package_qa: QA Issue: No GNU_HASH in the
elf binary: '.../protobuf/3.0.0-r0/packages-split/protobuf-ptest/usr/
lib/protobuf/ptest/add_person_cpp'"

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-devtools/protobuf/protobuf_3.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/protobuf/protobuf_3.0.0.bb b/recipes-devtools/protobuf/protobuf_3.0.0.bb
index e1deeac..0445ae4 100644
--- a/recipes-devtools/protobuf/protobuf_3.0.0.bb
+++ b/recipes-devtools/protobuf/protobuf_3.0.0.bb
@@ -36,7 +36,7 @@ do_compile() {
 
 do_compile_ptest() {
 	# Modify makefile to use the cross-compiler
-	sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
+	sed -e "s|c++|${CXX} \$(LDFLAGS)|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
 
 	mkdir -p "${B}/${TEST_SRC_DIR}"
 
-- 
2.8.3


