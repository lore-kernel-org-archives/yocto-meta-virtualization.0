Return-Path: <pascal.bach@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA81C32772
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 09:40:40 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net
 (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web09.40349.1660815633691830802
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 02:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=pascal.bach@siemens.com header.s=fm1 header.b=qBsxCqN3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227,
 mailfrom: fm-402798-2022081809403075fb78d4ca9fb93126-d_oucy@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id
 2022081809403075fb78d4ca9fb93126
        for <meta-virtualization@lists.yoctoproject.org>;
        Thu, 18 Aug 2022 11:40:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=pascal.bach@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=n3UzlWOo9TWzc6G416Hr3+ec7r3/7aLZv79N1Or52Zw=;
 b=qBsxCqN352TjhnYjgPKh99GKj6JI5dNrxG6T7C81yzpAJGoVBNQvW1T1I8ctVmPu7sXqB8
 UogVR3OZljgDQt3/hzyuELj4tBUkaMCEL/0JybrjyDHSxHXbH/Ua2kjm7rQJv2BwIlMHmimN
 zGkOjSO0aqZUlhg41NdRSGsYnHDZY=;
From: pascal.bach@siemens.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Pascal Bach <pascal.bach@siemens.com>
Subject: [meta-virtualization][PATCH] podman: replace GOBUILDFLAGS patch
Date: Thu, 18 Aug 2022 11:40:26 +0200
Message-Id: <20220818094026.1772745-1-pascal.bach@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-402798:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Aug 2022 09:40:40 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7540

From: Pascal Bach <pascal.bach@siemens.com>

The GOBUILDFLAGS patch is replaced by explicitly setting BUILDFLAGS="${GOBUILDFLAGS}"
in the recipe.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...01-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch | 109 ------------------
 recipes-containers/podman/podman_git.bb       |   4 +-
 2 files changed, 3 insertions(+), 110 deletions(-)
 delete mode 100644 recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch

diff --git a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch b/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
deleted file mode 100644
index 14b2714..0000000
--- a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 3e18f3a4db638a3df48f49aa0a539f8bb048afc9 Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei.gherzan@huawei.com>
-Date: Tue, 5 Jul 2022 11:51:56 +0200
-Subject: [PATCH] Rename BUILDFLAGS to GOBUILDFLAGS
-
-Yocto uses GOBUILDFLAGS to pass the right build flags while the Makefile
-uses BUILDFLAGS. Align them accordingly.
-
-See go.bbclass for more information.
-
-Upstream-Status: Inappropriate [OE specific]
-Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
----
- Makefile | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-Index: import/Makefile
-===================================================================
---- import.orig/Makefile
-+++ import/Makefile
-@@ -242,7 +242,7 @@
- 
- .PHONY: test/checkseccomp/checkseccomp
- test/checkseccomp/checkseccomp: $(wildcard test/checkseccomp/*.go)
--	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
-+	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
- 
- .PHONY: test/testvol/testvol
- test/testvol/testvol: $(wildcard test/testvol/*.go)
-@@ -254,7 +254,7 @@
- 
- .PHONY: test/goecho/goecho
- test/goecho/goecho: $(wildcard test/goecho/*.go)
--	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/goecho
-+	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/goecho
- 
- test/version/version: version/version.go
- 	$(GO) build -o $@ ./test/version/
-@@ -296,7 +296,7 @@
- 		distro for journald support."
- endif
- 	$(GOCMD) build \
--		$(BUILDFLAGS) \
-+		$(GOBUILDFLAGS) \
- 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
- 		-tags "$(BUILDTAGS)" \
- 		-o $@ ./cmd/podman
-@@ -308,7 +308,7 @@
- # '|' is to ignore SRCBINDIR mtime; see: info make 'Types of Prerequisites'
- $(SRCBINDIR)/podman$(BINSFX): $(SOURCES) go.mod go.sum | $(SRCBINDIR)
- 	$(GOCMD) build \
--		$(BUILDFLAGS) \
-+		$(GOBUILDFLAGS) \
- 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
- 		-tags "${REMOTETAGS}" \
- 		-o $@ ./cmd/podman
-@@ -318,7 +318,7 @@
- 	GOOS=linux \
- 	GOARCH=$(GOARCH) \
- 	$(GO) build \
--		$(BUILDFLAGS) \
-+		$(GOBUILDFLAGS) \
- 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN_STATIC)' \
- 		-tags "${REMOTETAGS}" \
- 		-o $@ ./cmd/podman
-@@ -338,7 +338,7 @@
- 	CGO_ENABLED=0 \
- 		GOOS=windows \
- 		$(GO) build \
--		$(BUILDFLAGS) \
-+		$(GOBUILDFLAGS) \
- 		-ldflags -H=windowsgui \
- 		-o bin/windows/winpath.exe \
- 		./cmd/winpath
-@@ -349,14 +349,14 @@
- 		GOOS=darwin \
- 		GOARCH=$(GOARCH) \
- 		$(GO) build \
--		$(BUILDFLAGS) \
-+		$(GOBUILDFLAGS) \
- 		-o bin/darwin/podman-mac-helper \
- 		./cmd/podman-mac-helper
- 
- bin/rootlessport: $(SOURCES) go.mod go.sum
- 	CGO_ENABLED=$(CGO_ENABLED) \
- 		$(GO) build \
--		$(BUILDFLAGS) \
-+		$(GOBUILDFLAGS) \
- 		-o $@ ./cmd/rootlessport
- 
- .PHONY: rootlessport
-@@ -379,7 +379,7 @@
- 	GOARCH="$${TARGET##*.}"; \
- 	CGO_ENABLED=0 \
- 		$(GO) build \
--		$(BUILDFLAGS) \
-+		$(GOBUILDFLAGS) \
- 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
- 		-tags '$(BUILDTAGS_CROSS)' \
- 		-o "$@" ./cmd/podman
-@@ -830,7 +830,7 @@
- 
- .PHONY: .install.ginkgo
- .install.ginkgo:
--	$(GO) install $(BUILDFLAGS) ./vendor/github.com/onsi/ginkgo/ginkgo
-+	$(GO) install $(GOBUILDFLAGS) ./vendor/github.com/onsi/ginkgo/ginkgo
- 
- .PHONY: .install.golangci-lint
- .install.golangci-lint:
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 52ffa6c..f19d092 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -20,7 +20,6 @@ DEPENDS = " \
 SRCREV = "754ec89a8a185d308ca5ed08afaf34d6cbda08da"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.2;protocol=https \
-    file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
 "
 
@@ -46,6 +45,9 @@ export LDFLAGS=""
 # https://github.com/llvm/llvm-project/issues/53999
 TOOLCHAIN = "gcc"
 
+# podmans Makefile expects BUILDFLAGS to be set but go.bbclass defines them in GOBUILDFLAGS
+export BUILDFLAGS="${GOBUILDFLAGS}"
+
 inherit go goarch
 inherit systemd pkgconfig
 
-- 
2.37.2


