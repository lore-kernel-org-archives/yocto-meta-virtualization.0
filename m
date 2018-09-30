Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33DF5E00ADF; Sat, 29 Sep 2018 20:18:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE9ABE00A9C
	for <meta-virtualization@yoctoproject.org>;
	Sat, 29 Sep 2018 20:18:07 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8U3I7jc012053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 29 Sep 2018 20:18:07 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 20:18:06 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sun, 30 Sep 2018 11:17:40 +0800
Message-ID: <1538277461-163634-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] oci-image-tools: fix do package qa warning
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
X-List-Received-Date: Sun, 30 Sep 2018 03:18:08 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below warning:
do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/oci-image-tool'
has relocations in .text [textrel]

Add GOBUILDFLAGS which have -buildmode=pie to fix the problem

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../files/0001-fix-do_package_qa-error.patch       | 32 ++++++++++++++++++++++
 .../oci-image-tools/oci-image-tools_git.bb         |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/oci-image-tools/files/0001-fix-do_package_qa-error.patch

diff --git a/recipes-containers/oci-image-tools/files/0001-fix-do_package_qa-error.patch b/recipes-containers/oci-image-tools/files/0001-fix-do_package_qa-error.patch
new file mode 100644
index 0000000..4b3efc2
--- /dev/null
+++ b/recipes-containers/oci-image-tools/files/0001-fix-do_package_qa-error.patch
@@ -0,0 +1,32 @@
+From 981e2582128911d0b131cb47aeb88005b04b38fe Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Sep 2018 12:54:42 +0800
+Subject: [PATCH] fix do_package_qa error
+
+fix below error:
+do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/oci-image-tool' 
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
+index 61d7a80..7e641e9 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -29,7 +29,7 @@ check-license:
+ 
+ .PHONY: tool
+ tool:
+-	go build -ldflags "-X main.gitCommit=${COMMIT}" -o oci-image-tool ./cmd/oci-image-tool
++	go build -ldflags "-X main.gitCommit=${COMMIT}" ${GOBUILDFLAGS} -o oci-image-tool ./cmd/oci-image-tool
+ 
+ 
+ all: tool man
+-- 
+2.7.4
+
diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 807ee26..ad7c5e9 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -15,7 +15,9 @@ DEPENDS = "\
 SRC_URI = "git://github.com/opencontainers/image-tools.git \
            file://0001-image-manifest-Recursively-remove-pre-existing-entri.patch \
            file://0002-image-manifest-Split-unpackLayerEntry-into-its-own-f.patch \
-           file://0001-config-make-Config.User-mapping-errors-a-warning.patch"
+           file://0001-config-make-Config.User-mapping-errors-a-warning.patch \
+           file://0001-fix-do_package_qa-error.patch \
+"
 
 SRCREV = "4abe1a166f9be97e8e71b1bb4d7599cc29323011"
 PV = "0.2.0-dev+git${SRCPV}"
-- 
2.7.4


