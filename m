Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52462C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 10:18:07 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.82287.1657016286038164808
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 03:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=W5uDOolV;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 64E335C012B;
	Tue,  5 Jul 2022 06:18:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 05 Jul 2022 06:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1657016285; x=1657102685; bh=x7elurM9JKVHomK8erFMxTiGA
	yoQ4m61mViq3Ka1RcM=; b=W5uDOolVtGh1pnZ+U+9J2c1TeJT5+0cIalE1j7B3E
	zsI/YxylChhY0eKDnRxSHNcPfTg5pqSt5rT4NOmaQoT6L7YqSNBPmFB/t7UGnjmE
	mni2/747z8sZkLHR22VKrXQ9uA17sn4ynYnXSjPNRNE9tttz+NINXgUwnCdH2SCn
	Gp3Heh6g/Cjxb+UOiVkJpyMyez+CEFoLN/iNtinSoqmmHtnr0BaKDZZZU3Tnb6CC
	nyrxBrPiouydzgA/zUgc9Z0n0XGW81QlTwJSd2CB9HH8iCkORewYwmqsAqy2gxSw
	P3WaZOytel99f4Ac3JT5vWR52PbR2uA4KhbouB56BHInA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1657016285; x=1657102685; bh=x7elurM9JKVHomK8erFMxTiGAyoQ4m61mVi
	q3Ka1RcM=; b=dEXYtH3z7hR3tHoz5xx4wC2T+WV1+nZSJBUQ0n8Gsla/TV7jTsP
	0hd9Pn2fc28S1ljI2QwgRrx1kAkdy8AU7sAonrsu8ezdWZwoSf7cKrCkCvezCizO
	vbV10avLxJ8rPldFsKPAbNvAg1bKZzo+SQVr2HwUQAQdTpweKBobmbtjb+dJ6/H/
	0JlamZX3jhv1Qjsr43cxjP2ChcFLtIYSPin/Xev2nHrpoa7eJ9CF1casPTCpLN6Y
	mk7b9ryjooq7evYarzOdB4L+d+AXG/ZDcekkk08M33Q6l43eu8a7PPoJNAC3eDxh
	XZObRWr2VMPz3IOCpLWHBTbgyu81Z4YYs4w==
X-ME-Sender: <xms:3Q_EYsAiy5yOJwoTBJLj401NL7JqFes41-AIxjj0sztXpsSt2WpzhQ>
    <xme:3Q_EYuhnrBQUHZfgQdZwcPuPgvfEcrVnvFF5tOCvyH169ciGN5yMvRHsmrqOU2EqL
    8wAnFru0LRV6gWZcn0>
X-ME-Received: 
 <xmr:3Q_EYvkFA6RlbKbhezBt_zVfXz1nYm626h8lE6kf6g-2loLvq0o7_AXXKJJ2EiI35vxCB6-vlyZn5M2_hDdGXAptUFGIdjXrtBwAq5e43CLv8yzWkcmG00ZV>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepveelieffudejveekudffhfffve
    euleefvefhhfeijeefffevtdelfeekudefieffnecuffhomhgrihhnpehprhgvqdgtohhm
    mhhithdrlhhotggrlhdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:3Q_EYiytFkH5QJ7BhbAIpkZMJxY7VZAe171NPWDWO0bbenKRvWOPng>
    <xmx:3Q_EYhQIER_OK_WIg2owb8a-CCCO0RNWL9KC-PoKsHtY0Catl6FOzQ>
    <xmx:3Q_EYtYE2dLTmFpKZc6jKjYIeUOwTP7R88skIMP43qipMPqv6HPA5Q>
    <xmx:3Q_EYgKyLfBHEdRKb6hARMEZFpg60LvzHG4mIMNLtyNe4yRpEvGQQA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 06:18:04 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH 1/2] podman: Fix host contamination
Date: Tue,  5 Jul 2022 12:17:49 +0200
Message-Id: <20220705101750.1729143-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Jul 2022 10:18:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7402

From: Andrei Gherzan <andrei.gherzan@huawei.com>

The project's internal Makefile uses BUILDFLAGS variable to pass
arguments to `go build` while Yocto/OE defines it as GOBUILDFLAGS. Add a
patch to align this and avoid using host headers in which case, a musl
build will fail similarly to:

| [...]ld: /tmp/go-link-3172010154/000015.o: in function `vfprintf':
| /usr/include/x86_64-linux-gnu/bits/stdio2.h:130: undefined reference to `__vfprintf_chk'
| [...]ld: /tmp/go-link-3172010154/000016.o: in function `fprintf':
| /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
| collect2: error: ld returned 1 exit status

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 ...01-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch | 125 ++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch

diff --git a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch b/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
new file mode 100644
index 0000000..13a736e
--- /dev/null
+++ b/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
@@ -0,0 +1,125 @@
+From 3e18f3a4db638a3df48f49aa0a539f8bb048afc9 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@huawei.com>
+Date: Tue, 5 Jul 2022 11:51:56 +0200
+Subject: [PATCH] Rename BUILDFLAGS to GOBUILDFLAGS
+
+Yocto uses GOBUILDFLAGS to pass the right build flags while the Makefile
+uses BUILDFLAGS. Align them accordingly.
+
+See go.bbclass for more information.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+---
+ Makefile | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index cb230d8e9..538b28d41 100644
+--- a/Makefile
++++ b/Makefile
+@@ -69,7 +69,7 @@ PRE_COMMIT = $(shell command -v bin/venv/bin/pre-commit ~/.local/bin/pre-commit
+ # triggered.
+ SOURCES = $(shell find . -path './.*' -prune -o \( \( -name '*.go' -o -name '*.c' \) -a ! -name '*_test.go' \) -print)
+ 
+-BUILDFLAGS := -mod=vendor $(BUILDFLAGS)
++GOBUILDFLAGS := -mod=vendor $(GOBUILDFLAGS)
+ 
+ BUILDTAGS_CROSS ?= containers_image_openpgp exclude_graphdriver_btrfs exclude_graphdriver_devicemapper exclude_graphdriver_overlay
+ CONTAINER_RUNTIME := $(shell command -v podman 2> /dev/null || echo docker)
+@@ -264,11 +264,11 @@ gofmt: ## Verify the source code gofmt
+ 
+ .PHONY: test/checkseccomp/checkseccomp
+ test/checkseccomp/checkseccomp: .gopathok $(wildcard test/checkseccomp/*.go)
+-	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
++	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
+ 
+ .PHONY: test/testvol/testvol
+ test/testvol/testvol: .gopathok $(wildcard test/testvol/*.go)
+-	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/testvol
++	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/testvol
+ 
+ .PHONY: volume-plugin-test-image
+ volume-plugin-test-img:
+@@ -276,7 +276,7 @@ volume-plugin-test-img:
+ 
+ .PHONY: test/goecho/goecho
+ test/goecho/goecho: .gopathok $(wildcard test/goecho/*.go)
+-	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/goecho
++	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/goecho
+ 
+ test/version/version: .gopathok version/version.go
+ 	$(GO) build -o $@ ./test/version/
+@@ -318,7 +318,7 @@ ifeq (,$(findstring systemd,$(BUILDTAGS)))
+ 		distro for journald support."
+ endif
+ 	$(GOCMD) build \
+-		$(BUILDFLAGS) \
++		$(GOBUILDFLAGS) \
+ 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
+ 		-tags "$(BUILDTAGS)" \
+ 		-o $@ ./cmd/podman
+@@ -329,14 +329,14 @@ $(SRCBINDIR):
+ 
+ $(SRCBINDIR)/podman$(BINSFX): $(SRCBINDIR) .gopathok $(SOURCES) go.mod go.sum
+ 	$(GOCMD) build \
+-		$(BUILDFLAGS) \
++		$(GOBUILDFLAGS) \
+ 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
+ 		-tags "${REMOTETAGS}" \
+ 		-o $@ ./cmd/podman
+ 
+ $(SRCBINDIR)/podman-remote-static: $(SRCBINDIR) .gopathok $(SOURCES) go.mod go.sum
+ 	$(GOCMD) build \
+-		$(BUILDFLAGS) \
++		$(GOBUILDFLAGS) \
+ 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN_STATIC)' \
+ 		-tags "${REMOTETAGS}" \
+ 		-o $@ ./cmd/podman
+@@ -371,7 +371,7 @@ podman-winpath: .gopathok $(SOURCES) go.mod go.sum
+ 	CGO_ENABLED=0 \
+ 		GOOS=windows \
+ 		$(GO) build \
+-		$(BUILDFLAGS) \
++		$(GOBUILDFLAGS) \
+ 		-ldflags -H=windowsgui \
+ 		-o bin/windows/winpath.exe \
+ 		./cmd/winpath
+@@ -390,14 +390,14 @@ podman-mac-helper: ## Build podman-mac-helper for macOS
+ 		GOOS=darwin \
+ 		GOARCH=$(GOARCH) \
+ 		$(GO) build \
+-		$(BUILDFLAGS) \
++		$(GOBUILDFLAGS) \
+ 		-o bin/darwin/podman-mac-helper \
+ 		./cmd/podman-mac-helper
+ 
+ bin/rootlessport: .gopathok $(SOURCES) go.mod go.sum
+ 	CGO_ENABLED=$(CGO_ENABLED) \
+ 		$(GO) build \
+-		$(BUILDFLAGS) \
++		$(GOBUILDFLAGS) \
+ 		-o $@ ./cmd/rootlessport
+ 
+ .PHONY: rootlessport
+@@ -420,7 +420,7 @@ bin/podman.cross.%: .gopathok
+ 	GOARCH="$${TARGET##*.}"; \
+ 	CGO_ENABLED=0 \
+ 		$(GO) build \
+-		$(BUILDFLAGS) \
++		$(GOBUILDFLAGS) \
+ 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
+ 		-tags '$(BUILDTAGS_CROSS)' \
+ 		-o "$@" ./cmd/podman
+@@ -864,7 +864,7 @@ install.tools: .install.goimports .install.gitvalidation .install.md2man .instal
+ .PHONY: .install.ginkgo
+ .install.ginkgo: .gopathok
+ 	if [ ! -x "$(GOBIN)/ginkgo" ]; then \
+-		$(GO) install $(BUILDFLAGS) ./vendor/github.com/onsi/ginkgo/ginkgo ; \
++		$(GO) install $(GOBUILDFLAGS) ./vendor/github.com/onsi/ginkgo/ginkgo ; \
+ 	fi
+ 
+ .PHONY: .install.gitvalidation
+-- 
+2.25.1
+
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 913aea8..547bc4e 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -20,6 +20,7 @@ DEPENDS = " \
 SRCREV = "cedbbfa543651a13055a1fe093a4d0a2a28ccdfd"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.1;protocol=https \
+    file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.25.1


