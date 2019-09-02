Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E6F4E00D60; Mon,  2 Sep 2019 01:37:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C01AE0080A
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 01:37:27 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x828bQjs017303
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Sep 2019 01:37:26 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Sep 2019 01:37:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 2 Sep 2019 16:36:49 +0800
Message-ID: <1567413409-22401-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567413409-22401-1-git-send-email-hongxu.jia@windriver.com>
References: <1567413409-22401-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] containerd-opencontainers: building unstripped binaries
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
X-List-Received-Date: Mon, 02 Sep 2019 08:37:29 -0000
Content-Type: text/plain

It defaults to "-s -w" [1] which strips debug information, refresh a backported
patch to build unstripped binaries

https://golang.org/cmd/link/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Add-build-option-GODEBUG-1.patch          | 42 ++++++++++++++++++++++
 .../containerd/containerd-opencontainers_git.bb    |  3 ++
 2 files changed, 45 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch

diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
new file mode 100644
index 0000000..05c4f15
--- /dev/null
+++ b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
@@ -0,0 +1,42 @@
+From 84874e47aa2025b8e73df0286c44f3b8a1d9fdb2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 2 Sep 2019 16:20:07 +0800
+Subject: [PATCH] Add build option "GODEBUG=1"
+
+Make will generate GDB friendly binary with this build option.
+
+Signed-off-by: Hui Zhu <teawater@hyper.sh>
+
+Upstream-Status: Backport [c5a0c7f491b435e4eb45972903b00e2d8ed46495]
+
+Partly backport and refresh to v1.2.7
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/import/Makefile | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/import/Makefile b/src/import/Makefile
+index 4355395..4fb5d3b 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -75,11 +75,15 @@ TEST_REQUIRES_ROOT_PACKAGES=$(filter \
+ COMMANDS=ctr containerd containerd-stress
+ MANPAGES=ctr.1 containerd.1 containerd-config.1 containerd-config.toml.5
+ 
++ifndef GODEBUG
++   EXTRA_LDFLAGS += -s -w
++endif
++
+ # Build tags seccomp and apparmor are needed by CRI plugin.
+ BUILDTAGS ?= seccomp apparmor
+ GO_TAGS=$(if $(BUILDTAGS),-tags "$(BUILDTAGS)",)
+-GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) $(EXTRA_LDFLAGS)'
+-SHIM_GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static"'
++GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) $(EXTRA_LDFLAGS)'
++SHIM_GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static" $(EXTRA_LDFLAGS)'
+ 
+ #Replaces ":" (*nix), ";" (windows) with newline for easy parsing
+ GOPATHS=$(shell echo ${GOPATH} | tr ":" "\n" | tr ";" "\n")
+-- 
+2.7.4
+
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 424de74..347eae5 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -1,6 +1,7 @@
 SRCREV = "fd103cb716352c7e19768e4fed057f71d68902a0"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.2 \
            file://0001-build-use-oe-provided-GO-and-flags.patch \
+           file://0001-Add-build-option-GODEBUG-1.patch \
           "
 
 include containerd.inc
@@ -9,5 +10,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d
 
 CONTAINERD_VERSION = "v1.2.7"
 
+EXTRA_OEMAKE += "GODEBUG=1"
+
 PROVIDES += "virtual/containerd"
 RPROVIDES_${PN} = "virtual/containerd"
-- 
2.7.4


