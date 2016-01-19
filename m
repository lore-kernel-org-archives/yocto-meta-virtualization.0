Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54DD1E00AAF; Tue, 19 Jan 2016 14:17:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12036E00AAF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 14:16:57 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0JMGuFY000304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 14:16:56 -0800
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 14:16:55 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 19 Jan 2016 16:11:48 -0600
Message-ID: <1453241509-9198-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] go-cross-1.3: Fix missing dependency for cross compile
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
X-List-Received-Date: Tue, 19 Jan 2016 22:17:05 -0000
Content-Type: text/plain

The go-cross-1.3 package depends on the libgcc to be installed for the
cross compiler else you will receive an error if this package builds
first like:

runtime/cgo
/opt/tmp/sysroots/x86_64-linux/usr/bin/arm-wrs-linux-gnueabi/../../libexec/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/4.9.1/ld: cannot find crtbeginS.o: No such file or directory
collect2: error: ld returned 1 exit status

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-devtools/go-cross/go-cross-1.3_1.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go-cross/go-cross-1.3_1.3.bb b/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
index 775e28f..dd57e56 100644
--- a/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
+++ b/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "\
 HOMEPAGE = "https://golang.org/"
 LICENSE = "BSD-3-Clause"
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc"
 
 SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz"
 
-- 
1.7.9.5


