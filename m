Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC192E00B0B; Sat, 29 Sep 2018 20:18:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 533DEE00B93
	for <meta-virtualization@yoctoproject.org>;
	Sat, 29 Sep 2018 20:18:15 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8U3HsI4009337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 29 Sep 2018 20:18:04 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 20:17:43 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sun, 30 Sep 2018 11:17:38 +0800
Message-ID: <1538277461-163634-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] docker-distribution: fix do package qa warning [textrel]
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
X-List-Received-Date: Sun, 30 Sep 2018 03:18:15 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below warning:

do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
has relocations in .text [textrel]

Add GOBUILDFLAGS which have -buildmode=pie to fix it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb |  1 +
 .../files/0001-fix-do_package_qa-error.patch       | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index add5ce1..7c7bce2 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
 SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution \
            file://docker-registry.service \
+           file://0001-fix-do_package_qa-error.patch \
           "
 
 PACKAGES =+ "docker-registry"
diff --git a/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
new file mode 100644
index 0000000..269b0cd
--- /dev/null
+++ b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
@@ -0,0 +1,32 @@
+From 4b9d701fabff8e7969db081406d00fa9fe46b3fd Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Sep 2018 11:05:51 +0800
+Subject: [PATCH] fix do_package_qa error
+
+fix below error:
+do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry' 
+has relocations in .text [textrel]
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 47b8f1d..13b0f92 100644
+--- a/Makefile
++++ b/Makefile
+@@ -39,7 +39,7 @@ GODEP=$(shell which godep || echo '')
+ 
+ ${PREFIX}/bin/registry: $(GOFILES)
+ 	@echo "+ $@"
+-	@go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS}  ${GO_GCFLAGS} ./cmd/registry
++	@go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS} ${GOBUILDFLAGS} ${GO_GCFLAGS} ./cmd/registry
+ 
+ ${PREFIX}/bin/digest:  $(GOFILES)
+ 	@echo "+ $@"
+-- 
+2.7.4
+
-- 
2.7.4


