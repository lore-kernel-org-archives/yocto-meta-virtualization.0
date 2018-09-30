Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C726FE00ADF; Sat, 29 Sep 2018 20:18:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CE60E0097C
	for <meta-virtualization@yoctoproject.org>;
	Sat, 29 Sep 2018 20:18:39 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8U3II9d009341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 29 Sep 2018 20:18:29 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 20:18:07 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sun, 30 Sep 2018 11:17:41 +0800
Message-ID: <1538277461-163634-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] oci-runtime-tools: fix do package qa warning
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
X-List-Received-Date: Sun, 30 Sep 2018 03:18:39 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below warning:
do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/oci-runtime-tool'
has relocations in .text [textrel]

Add GOBUILDFLAGS which have -buildmode=pie to fix the problem

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../files/0001-fix-do_package_qa-error.patch       | 32 ++++++++++++++++++++++
 .../oci-runtime-tools/oci-runtime-tools_git.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-containers/oci-runtime-tools/files/0001-fix-do_package_qa-error.patch

diff --git a/recipes-containers/oci-runtime-tools/files/0001-fix-do_package_qa-error.patch b/recipes-containers/oci-runtime-tools/files/0001-fix-do_package_qa-error.patch
new file mode 100644
index 0000000..3c5d820
--- /dev/null
+++ b/recipes-containers/oci-runtime-tools/files/0001-fix-do_package_qa-error.patch
@@ -0,0 +1,32 @@
+From 7de9fd7db7a001b66d92d5e80806e50bb5252392 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Sep 2018 12:50:32 +0800
+Subject: [PATCH] fix do_package_qa error
+
+fix below error:
+do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/oci-runtime-tool'
+has relocations in .text [textrel]
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/import/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/import/Makefile b/src/import/Makefile
+index 77626d2..b97f6ec 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -8,7 +8,7 @@ COMMIT=$(shell git rev-parse HEAD 2> /dev/null || true)
+ all: tool runtimetest
+ 
+ tool:
+-	go build -tags "$(BUILDTAGS)" -ldflags "-X main.gitCommit=${COMMIT}" -o oci-runtime-tool ./cmd/oci-runtime-tool
++	go build -tags "$(BUILDTAGS)" -ldflags "-X main.gitCommit=${COMMIT}" ${GOBUILDFLAGS} -o oci-runtime-tool ./cmd/oci-runtime-tool
+ 
+ .PHONY: runtimetest
+ runtimetest:
+-- 
+2.7.4
+
diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
index 61b68b5..218f68c 100644
--- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
+++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=b355a61a394a504dacde901c958f66
 
 SRC_URI = "git://github.com/opencontainers/runtime-tools.git \
            file://0001-Revert-implement-add-set-function-for-hooks-items.patch \
+           file://0001-fix-do_package_qa-error.patch \
            "
 
 SRCREV = "6e7da8148f4de2c9e9c9d3b345576898d4f412cb"
-- 
2.7.4


