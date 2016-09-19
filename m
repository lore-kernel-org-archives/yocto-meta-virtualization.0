Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26E1DE00571; Mon, 19 Sep 2016 12:35:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAF3BE00529
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 12:35:30 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8JJZT3o022351
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 12:35:29 -0700
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 12:35:29 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 19 Sep 2016 14:33:04 -0500
Message-ID: <1474313584-40091-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] go-cross: Fix host contamination for x86_64 host to x86_64 target
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
X-List-Received-Date: Mon, 19 Sep 2016 19:35:34 -0000
Content-Type: text/plain

The go-cross package is explicitly for compiling target libraries on
the host system.  When the target architecture matches the host
architecture it will actually use the host's linker and compiler
however which can result in the generation of the cgo.a library having
linker symbols which might not work properly when compiling other
packages.

A typical error looks like this when building consul-migrate:

/opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/lib/x86_64-linux/go/pkg/tool/linux_amd64/link: running x86_64-yocto-linux-gcc failed: exit status 1
/opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld: /opt/build-intel-x86/tmp/work/core2-64-yocto-linux/consul-migrate/git-r0/build-tmp/go-link-956548052/000002.o: unrecognized relocation (0x2a) in section `.text'
/opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld: final link failed: Bad value
collect2: error: ld returned 1 exit status

The fix is to use the make.bash --target-only option to properly build
the libraries with the target toolchain.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-devtools/go-cross/go-cross.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go-cross/go-cross.inc
index 613e9c7..c1577e3 100644
--- a/recipes-devtools/go-cross/go-cross.inc
+++ b/recipes-devtools/go-cross/go-cross.inc
@@ -26,6 +26,10 @@ do_compile() {
 
     cd src
     ./make.bash --host-only
+    if [ "${GOARCH}" = "amd64" -a "${BUILD_ARCH}" = "x86_64" ] ; then
+        # Ensure cgo.a is built with the target toolchain
+        GO_FLAGS="-a" ./make.bash --target-only
+    fi
 }
 
 do_install() {
-- 
1.9.1


