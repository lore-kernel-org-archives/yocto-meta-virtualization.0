Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58F21E00AAA; Tue,  6 Oct 2015 11:34:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 176FFE00AD5
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Oct 2015 11:34:22 -0700 (PDT)
Received: from yow-dellw-af.wrs.com (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTP id t96IYJLX016263;
	Tue, 6 Oct 2015 11:34:21 -0700 (PDT)
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  6 Oct 2015 14:34:04 -0400
Message-Id: <1444156449-19847-3-git-send-email-amy.fong@windriver.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
References: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
Subject: [PATCH 2/7] Backport go-cross: fix the bug of cross building error
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
X-List-Received-Date: Tue, 06 Oct 2015 18:34:26 -0000

submitted to upstream https://github.com/errordeveloper/oe-meta-go

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-devtools/go-cross/go-cross_1.3.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/go-cross/go-cross_1.3.bb b/recipes-devtools/go-cross/go-cross_1.3.bb
index 8723142..9ecc295 100644
--- a/recipes-devtools/go-cross/go-cross_1.3.bb
+++ b/recipes-devtools/go-cross/go-cross_1.3.bb
@@ -5,6 +5,8 @@ DESCRIPTION = "\
 HOMEPAGE = "https://golang.org/"
 LICENSE = "BSD-3-Clause"
 
+DEPENDS = "virtual/${TARGET_PREFIX}gcc"
+
 SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz"
 
 S = "${WORKDIR}/go/"
@@ -44,8 +46,8 @@ do_compile() {
 	## TODO: consider setting GO_EXTLINK_ENABLED
 
 	export CC="${BUILD_CC}"
-	export CC_FOR_TARGET="${CC}"
-	export CXX_FOR_TARGET="${CXX}"
+	export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+	export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
 	export GO_CCFLAGS="${HOST_CFLAGS}"
 	export GO_LDFLAGS="${HOST_LDFLAGS}"
 
-- 
2.5.3


