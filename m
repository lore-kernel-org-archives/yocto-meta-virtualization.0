Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A02B8E00C93; Fri, 15 Feb 2019 07:01:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 329 seconds by postgrey-1.32 at yocto-www;
	Fri, 15 Feb 2019 07:01:47 PST
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34265E00BB7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Feb 2019 07:01:47 -0800 (PST)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 7B66F5C029B;
	Fri, 15 Feb 2019 15:56:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1550242577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=c2xuyeiLoIhB8GmjHxkP08nKlpT0BrRgaFtwAJ97C5Y=;
	b=TIH+BZ9fXYzIxu72WZ+VLGkghlSNleJOf9I+CWIKUBtrBAKjugXYSnhkqctabE++B7OWmy
	Cuak06vAc2ViQNA2CKy5DxFDJ3uU0OUr93+JAvwPw789E25Ocsy5tPeks4PpXIX1vdR/Vv
	QQLLfk208xC0FOAvC5ZDY3dXOdUmZl8=
From: Stefan Agner <stefan@agner.ch>
To: bruce.ashfield@gmail.com,
	meta-virtualization@yoctoproject.org
Date: Fri, 15 Feb 2019 15:56:12 +0100
Message-Id: <20190215145613.11794-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 1/2] containerd: update to v1.2.4
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
X-List-Received-Date: Fri, 15 Feb 2019 15:01:48 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Update containerd to the latest release of the 1.2.x branch. We have
to tweak the go compile patch, but otherwise, the build is unchanged.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../containerd/containerd-opencontainers_git.bb             |  4 ++--
 .../files/0001-build-use-oe-provided-GO-and-flags.patch     | 13 +++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 7755f7d..f7d8645 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -1,4 +1,4 @@
-SRCREV = "0190e5f3900227fc739afbc8f4a03df968dc337b"
+SRCREV = "e6b3f5632f50dbc4e9cb6288d911bf4f5e95b18e"
 SRC_URI = "git://github.com/containerd/containerd;nobranch=1 \
            file://0001-build-use-oe-provided-GO-and-flags.patch \
           "
@@ -7,7 +7,7 @@ include containerd.inc
 
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.2.0"
+CONTAINERD_VERSION = "v1.2.4"
 
 PROVIDES += "virtual/containerd"
 RPROVIDES_${PN} = "virtual/containerd"
diff --git a/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch b/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
index c2433f1..f6b6a11 100644
--- a/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
+++ b/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
@@ -1,6 +1,6 @@
-From 408e8b526d490af817a64b7220e8e2c3789de58f Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Sun, 10 Feb 2019 23:46:06 +0000
+From 6e76a23b831c1c8d39e14afe7ef1368eacaa778a Mon Sep 17 00:00:00 2001
+From: Stefan Agner <stefan.agner@toradex.com>
+Date: Fri, 15 Feb 2019 13:37:19 +0000
 Subject: [PATCH] build: use oe provided GO and flags
 
 We want to use the go compiler as defined in the oe-enviroment, not the
@@ -8,6 +8,7 @@ generic call to 'go'. Without changing this, we'll get things like cgo
 errors and invalid flag combos.
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
 ---
  Makefile | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -20,8 +21,8 @@ index 8e680133..fd7d2813 100644
  # Build a binary from a cmd.
  bin/%: cmd/% FORCE
  	@echo "$(WHALE) $@${BINARY_SUFFIX}"
--	@go build ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS}  ./$<
-+	@$(GO) build ${GO_BUILD_FLAGS} ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS}  ./$<
+-	@go build ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS}  ./$<
++	@$(GO) build ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS}  ./$<
  
  bin/containerd-shim: cmd/containerd-shim FORCE # set !cgo and omit pie for a static shim build: https://github.com/golang/go/issues/17789#issuecomment-258542220
  	@echo "$(WHALE) bin/containerd-shim"
@@ -41,5 +42,5 @@ index 8e680133..fd7d2813 100644
  binaries: $(BINARIES) ## build binaries
  	@echo "$(WHALE) $@"
 -- 
-2.19.1
+2.13.6
 
-- 
2.13.6


