Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C222E00C82; Fri, 13 Oct 2017 12:27:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B966E006CA
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:31 -0700 (PDT)
Received: by mail-wr0-f177.google.com with SMTP id g90so719099wrd.6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5ciJ7pYWQV4evqX3W1PcDjRWiicy79t2e7jaSOQxEwo=;
	b=K4G390wERDribLpfxbKK/hHSsOwijloY9xvulSiOiJh6LwAkC17rw3BbIKhXYBTYqt
	gy+ZSD2mf64BB2QsBD4xlPQ/sSWHeweTtRSAfLsws5dSg+N2GmuAg+nXNq+eYU7+cZP/
	e4654soUZXjx3FDIYtjYcEIaF2qyP8ZG1KjuRncHwyHCOX9Lp9Eer3GxJKqhOFH1Z/6U
	x6UZp+o5MmYO1SJdAnoZuEbsGNMKbDm+2Y2lcUekk9W2Qa1SLGNGMtiWya89LAOh7mUi
	dbvxacktCgDBenwtvJQ/IHiXEMUanscP7DsnNQRk//d2JqcgiqyAvCH0PGOKWv2zYWa6
	1xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5ciJ7pYWQV4evqX3W1PcDjRWiicy79t2e7jaSOQxEwo=;
	b=a3cK98rMVEDVd9KQAiBbIPjBlHf8kZLVGD+NyhN/PuvDnHgB6mkd7Nhkd1VRpyVivd
	Znt1Ag7zS3Q5/I3wUha2iZV/i6KWUqmRW98zhuJe5GnVEj8fomTvrGpJo6xcUTvMbFF6
	g34+nI+Eb/aUnSXjvzbswuoRCY/5tu7BYox9P/QXrz07ShWcAJAY2qlnHBPGijJXtdz2
	DNllu7vs30kDn9S/BW4H1TUtyb6P3kMI6DoQSKfhUHWBKxTE89jl9eKp/msXvwBWEplR
	pvMHB+zY38kmimw/FrLz9cfjusdqUMtghwakCT/4ZFaQVo/DagFUdez4AyL6MluN3L1Y
	4eMQ==
X-Gm-Message-State: AMCzsaXhB8pmUE00HJWStJBWKc74/eA+NJUd4j/UU8lL2QoZbdrcTt/p
	+5vHSP94JuKoXuehKSo+VpNcyCWB
X-Google-Smtp-Source: AOwi7QAr5hJfqQckUwGSsbTfIh9FGO94xdVAaVDbgQfOlbBGBqWz3BUm42l3Xj9FnPxT8/hRyr6J0A==
X-Received: by 10.223.132.135 with SMTP id 7mr2404618wrg.74.1507922850938;
	Fri, 13 Oct 2017 12:27:30 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id 69sm1846839wmm.2.2017.10.13.12.27.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 12:27:30 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 13 Oct 2017 19:27:12 +0000
Message-Id: <1507922836-17295-2-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
References: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 1/5] netns: Use correct go cross-compiler
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
X-List-Received-Date: Fri, 13 Oct 2017 19:27:33 -0000

The makefile for netns needs to be patched to ensure that we use the binaries
from go-cross and not go-native.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 .../files/0001-Use-correct-go-cross-compiler.patch | 77 ++++++++++++++++++++++
 recipes-networking/netns/netns_git.bb              |  4 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch

diff --git a/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch b/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch
new file mode 100644
index 0000000..ed66e11
--- /dev/null
+++ b/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch
@@ -0,0 +1,77 @@
+From d5c319bb61155d94bef2571a095d82983d786b94 Mon Sep 17 00:00:00 2001
+From: Paul Barker <pbarker@toganlabs.com>
+Date: Fri, 13 Oct 2017 17:58:11 +0000
+Subject: [PATCH] Use correct go cross-compiler
+
+Signed-off-by: Paul Barker <pbarker@toganlabs.com>
+Upstream-status: Pending
+---
+ Makefile | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index cb9a46d..633f884 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -33,12 +33,12 @@ build: $(NAME) ## Builds a dynamic executable or package
+ 
+ $(NAME): *.go VERSION
+ 	@echo "+ $@"
+-	go build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
++	$(GO) build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
+ 
+ .PHONY: static
+ static: ## Builds a static executable
+ 	@echo "+ $@"
+-	CGO_ENABLED=0 go build \
++	CGO_ENABLED=0 $(GO) build \
+ 				-tags "$(BUILDTAGS) static_build" \
+ 				${GO_LDFLAGS_STATIC} -o $(NAME) .
+ 
+@@ -55,21 +55,21 @@ lint: ## Verifies `golint` passes
+ .PHONY: test
+ test: ## Runs the go tests
+ 	@echo "+ $@"
+-	@go test -v -tags "$(BUILDTAGS) cgo" $(shell go list ./... | grep -v vendor)
++	@$(GO) test -v -tags "$(BUILDTAGS) cgo" $(shell $(GO) list ./... | grep -v vendor)
+ 
+ .PHONY: vet
+ vet: ## Verifies `go vet` passes
+ 	@echo "+ $@"
+-	@go vet $(shell go list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
++	@$(GO) vet $(shell $(GO) list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
+ 
+ .PHONY: install
+ install: ## Installs the executable or package
+ 	@echo "+ $@"
+-	@go install .
++	@$(GO) install .
+ 
+ define buildpretty
+ mkdir -p $(BUILDDIR)/$(1)/$(2);
+-GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
++GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
+ 	 -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \
+ 	 -a -tags "$(BUILDTAGS) static_build netgo" \
+ 	 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
+@@ -83,7 +83,7 @@ cross: *.go VERSION ## Builds the cross-compiled binaries, creating a clean dire
+ 	$(foreach GOOSARCH,$(GOOSARCHES), $(call buildpretty,$(subst /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))
+ 
+ define buildrelease
+-GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
++GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
+ 	 -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \
+ 	 -a -tags "$(BUILDTAGS) static_build netgo" \
+ 	 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
+@@ -99,7 +99,7 @@ release: *.go VERSION ## Builds the cross-compiled binaries, naming them in such
+ .PHONY: bump-version
+ BUMP := patch
+ bump-version: ## Bump the version in the version file. Set KIND to [ patch | major | minor ]
+-	@go get -u github.com/jessfraz/junk/sembump # update sembump tool
++	@$(GO) get -u github.com/jessfraz/junk/sembump # update sembump tool
+ 	$(eval NEW_VERSION = $(shell sembump --kind $(BUMP) $(VERSION)))
+ 	@echo "Bumping VERSION from $(VERSION) to $(NEW_VERSION)"
+ 	echo $(NEW_VERSION) > VERSION
+-- 
+2.7.4
+
diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index 4437764..d35836e 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -3,7 +3,9 @@ SUMMARY = "Runc hook for setting up default bridge networking."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
 
-SRC_URI = "git://github.com/jessfraz/netns;branch=master"
+SRC_URI = "git://github.com/jessfraz/netns;branch=master \
+           file://0001-Use-correct-go-cross-compiler.patch \
+          "
 SRCREV = "74e23a0e5c4e7ac011aafcc4623586c196f1b3ef"
 PV = "0.2.1"
 GO_IMPORT = "import"
-- 
2.7.4


