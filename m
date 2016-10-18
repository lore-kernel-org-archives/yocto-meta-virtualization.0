Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5032E00747; Tue, 18 Oct 2016 13:15:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20E79E00529
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Oct 2016 13:15:00 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9IKEx7Y023542
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Oct 2016 13:15:00 -0700 (PDT)
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Oct 2016 13:14:59 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Oct 2016 15:11:56 -0500
Message-ID: <1476821516-26732-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] go-native: Add work around for binutils >= 2.27
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
X-List-Received-Date: Tue, 18 Oct 2016 20:15:02 -0000
Content-Type: text/plain

We only use go-native to bootstrap go-cross and according to a post in
the go-lang git it is possible to work around by disabling CGO:

https://github.com/golang/go/issues/16906

This patch fixes the compile failure with binutils 2.27 which has the
message:

cannot load DWARF output from $WORK/net/_obj//_cgo_.o: decoding dwarf section info at offset 0x4: unsupported version 0

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-devtools/go-cross/go-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go-cross/go-native.inc b/recipes-devtools/go-cross/go-native.inc
index 8b4be9e..cb2dd2a 100644
--- a/recipes-devtools/go-cross/go-native.inc
+++ b/recipes-devtools/go-cross/go-native.inc
@@ -16,7 +16,7 @@ do_compile() {
     mkdir -p ${WORKDIR}/build-tmp
 
     cd src
-    ./make.bash --host-only
+    CGO_ENABLED=0 ./make.bash --host-only
 }
 
 
-- 
1.9.1


