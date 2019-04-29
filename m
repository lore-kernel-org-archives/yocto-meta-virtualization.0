Return-Path: <paul@betafive.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90818E00CAA; Mon, 29 Apr 2019 13:50:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [64.147.123.25 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 599 seconds by postgrey-1.32 at yocto-www;
	Mon, 29 Apr 2019 13:50:28 PDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB3A0E00C78
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Apr 2019 13:50:28 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 92CBBBE4;
	Mon, 29 Apr 2019 16:40:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Mon, 29 Apr 2019 16:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm1; bh=t1NANKXz5D9aItf
	YWBzed44B133H1+l1iPPsMBPlqQA=; b=m+cG3ILUUbMdwm3vXF5gIT5mNYLXESV
	e/k/f007fnhurxnz2M9+e/z4/PBCAbyA7P8j4tDZzn4gj0Cywbgf2qBDL3ViYwpr
	vmdgr2rEfHHLZ8/HSppAfjid0urn8VCRIHn0ggdYQYVW7QDHFxpaetXqRDbEvrD7
	xwjtSY7uyBdc3lhGO0BeQrV7T7zCHWQrfripy9MFSkXG7YE0r4B4diSABH412vbn
	zseKRF5pSHFf6ZfmCCS5360E6MJ9kZSmKlnkJiLMnHcYM53EccTCrrHX/XSs1geU
	Pd0gvUogKj6r7Rg5p0dAjJkJMWE0vbUd50gu8s9sTK2NvAw+QG71XkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=t1NANKXz5D9aItfYWBzed44B133H1+l1iPPsMBPlqQA=; b=3fCj9rdH
	IbWY+3owMpn61QKodlvcWl4MKizMMhk3bqQzsC2H0FqBZURScqZ32SW9grViK6sz
	xwN+6+LL7dXdvwpsHJjYUpXqom1M1BD6MezP4IbDW/luSaK7g0vWEcHedGAkg+B2
	n3HNKP2qsJobdAZ4eO9YulqOQphc+2La5k2gcjRmDNL801gocAC8BFAlmsFyM2og
	uTUDOdmP6yluFtKf3K1VUA8OaolCj0R9pniNMOeV0MQLDRjHcMYojg2d0t+JkVC4
	1LdMVkVDm8iNOGw5wk55c4lvSLa5ev1qOeJ9INIjISD5gTW+GccEBBiUjoT4XF6e
	rh9tPPdezN0g5w==
X-ME-Sender: <xms:OmHHXP3Ewc51rUaWOcM1gEuNMK-ANO1tHTfUT0TokjEwPU1u6cx_vA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddriedvgdduheegucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhephffvufffkffosedttdertdertddtnecuhfhrohhmpehprghulhessggvthgr
	fhhivhgvrdgtohdruhhknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepke
	durddukeejrdefvddrudefkeenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegs
	vghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OmHHXJrUyeR2MangvdefsKLKUW7CCEuC3yImWCax6yeAm2P9dkgyoA>
	<xmx:OmHHXP595BYDSyDwAzhSGG2Qn2asbzRZlxvRW1yNF4DQFwJnAbxxjA>
	<xmx:OmHHXJzM9HTI6ALr3CSuceicgdjUvHu1Q1KP_OapyTNPcPN9bYFvGA>
	<xmx:O2HHXIV_J3flD9D_WEGdRvhE0YKeFQSTly3649oKbnLPCj5q1rLCQw>
Received: from beta-ub1804.home.b5net.uk (138.32.187.81.in-addr.arpa
	[81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9DE59E4382;
	Mon, 29 Apr 2019 16:40:25 -0400 (EDT)
From: paul@betafive.co.uk
To: meta-virtualization@yoctoproject.org
Date: Mon, 29 Apr 2019 20:40:17 +0000
Message-Id: <20190429204017.32320-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] netns: Upgrade to v0.5.3
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
X-List-Received-Date: Mon, 29 Apr 2019 20:50:30 -0000

From: Paul Barker <paul@betafive.co.uk>

Drop obsolete patches and forward-port the remaining required patch. We
also need to fix up permissions after the build so that we can clean the
build directory without errors if needed.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 .../0001-Allow-selection-of-go-compiler.patch | 107 ------------------
 .../0001-Use-correct-go-cross-compiler.patch  |  77 -------------
 ...rebuilding-all-packages-to-avoid-cgo.patch |  26 +++--
 recipes-networking/netns/netns_git.bb         |  11 +-
 4 files changed, 23 insertions(+), 198 deletions(-)
 delete mode 100644 recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch
 delete mode 100644 recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch

diff --git a/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch b/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch
deleted file mode 100644
index 84fb9a4..0000000
--- a/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 6576f228339b7931e05a8e861f085f483817806b Mon Sep 17 00:00:00 2001
-From: Paul Barker <pbarker@toganlabs.com>
-Date: Tue, 8 May 2018 11:01:14 +0000
-Subject: [PATCH] Allow selection of go compiler
-
-By running `make GO=/path/to/go` we can now select the appropriate go compiler
-to use. This also makes it possible to cross compile netns more easily.
-
-Signed-off-by: Paul Barker <pbarker@toganlabs.com>
-Upstream-status: Pending
----
- Makefile | 25 ++++++++++++++-----------
- 1 file changed, 14 insertions(+), 11 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 3a22f3e..476cb9b 100644
---- a/src/import/Makefile
-+++ b/src/import/Makefile
-@@ -23,6 +23,9 @@ CTIMEVAR=-X $(PKG)/version.GITCOMMIT=$(GITCOMMIT) -X $(PKG)/version.VERSION=$(VE
- GO_LDFLAGS=-ldflags "-w $(CTIMEVAR)"
- GO_LDFLAGS_STATIC=-ldflags "-w $(CTIMEVAR) -extldflags -static"
- 
-+# Set our default go compiler
-+GO := go
-+
- # List the GOOS and GOARCH to build
- GOOSARCHES = linux/arm linux/arm64 linux/amd64 linux/386
- 
-@@ -33,12 +36,12 @@ build: $(NAME) ## Builds a dynamic executable or package
- 
- $(NAME): *.go VERSION.txt
- 	@echo "+ $@"
--	go build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
-+	$(GO) build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
- 
- .PHONY: static
- static: ## Builds a static executable
- 	@echo "+ $@"
--	CGO_ENABLED=0 go build \
-+	CGO_ENABLED=0 $(GO) build \
- 				-tags "$(BUILDTAGS) static_build" \
- 				${GO_LDFLAGS_STATIC} -o $(NAME) .
- 
-@@ -55,23 +58,23 @@ lint: ## Verifies `golint` passes
- .PHONY: test
- test: ## Runs the go tests
- 	@echo "+ $@"
--	@go test -v -tags "$(BUILDTAGS) cgo" $(shell go list ./... | grep -v vendor)
-+	@$(GO) test -v -tags "$(BUILDTAGS) cgo" $(shell $(GO) list ./... | grep -v vendor)
- 
- .PHONY: vet
- vet: ## Verifies `go vet` passes
- 	@echo "+ $@"
--	@go vet $(shell go list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
-+	@$(GO) vet $(shell $(GO) list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
- 
- .PHONY: staticcheck
- staticcheck: ## Verifies `staticcheck` passes
- 	@echo "+ $@"
--	@staticcheck $(shell go list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
-+	@staticcheck $(shell $(GO) list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
- 
- .PHONY: cover
- cover: ## Runs go test with coverage
- 	@echo "" > coverage.txt
--	@for d in $(shell go list ./... | grep -v vendor); do \
--		go test -race -coverprofile=profile.out -covermode=atomic "$$d"; \
-+	@for d in $(shell $(GO) list ./... | grep -v vendor); do \
-+		$(GO) test -race -coverprofile=profile.out -covermode=atomic "$$d"; \
- 		if [ -f profile.out ]; then \
- 			cat profile.out >> coverage.txt; \
- 			rm profile.out; \
-@@ -81,11 +84,11 @@ cover: ## Runs go test with coverage
- .PHONY: install
- install: ## Installs the executable or package
- 	@echo "+ $@"
--	go install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
-+	$(GO) install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
- 
- define buildpretty
- mkdir -p $(BUILDDIR)/$(1)/$(2);
--GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
-+GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
- 	 -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \
- 	 -a -tags "$(BUILDTAGS) static_build netgo" \
- 	 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
-@@ -99,7 +102,7 @@ cross: *.go VERSION.txt ## Builds the cross-compiled binaries, creating a clean
- 	$(foreach GOOSARCH,$(GOOSARCHES), $(call buildpretty,$(subst /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))
- 
- define buildrelease
--GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
-+GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
- 	 -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \
- 	 -a -tags "$(BUILDTAGS) static_build netgo" \
- 	 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
-@@ -115,7 +118,7 @@ release: *.go VERSION.txt ## Builds the cross-compiled binaries, naming them in
- .PHONY: bump-version
- BUMP := patch
- bump-version: ## Bump the version in the version file. Set BUMP to [ patch | major | minor ]
--	@go get -u github.com/jessfraz/junk/sembump # update sembump tool
-+	@$(GO) get -u github.com/jessfraz/junk/sembump # update sembump tool
- 	$(eval NEW_VERSION = $(shell sembump --kind $(BUMP) $(VERSION)))
- 	@echo "Bumping VERSION.txt from $(VERSION) to $(NEW_VERSION)"
- 	echo $(NEW_VERSION) > VERSION.txt
--- 
-2.7.4
-
diff --git a/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch b/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch
deleted file mode 100644
index ed66e11..0000000
--- a/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From d5c319bb61155d94bef2571a095d82983d786b94 Mon Sep 17 00:00:00 2001
-From: Paul Barker <pbarker@toganlabs.com>
-Date: Fri, 13 Oct 2017 17:58:11 +0000
-Subject: [PATCH] Use correct go cross-compiler
-
-Signed-off-by: Paul Barker <pbarker@toganlabs.com>
-Upstream-status: Pending
----
- Makefile | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index cb9a46d..633f884 100644
---- a/src/import/Makefile
-+++ b/src/import/Makefile
-@@ -33,12 +33,12 @@ build: $(NAME) ## Builds a dynamic executable or package
- 
- $(NAME): *.go VERSION
- 	@echo "+ $@"
--	go build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
-+	$(GO) build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
- 
- .PHONY: static
- static: ## Builds a static executable
- 	@echo "+ $@"
--	CGO_ENABLED=0 go build \
-+	CGO_ENABLED=0 $(GO) build \
- 				-tags "$(BUILDTAGS) static_build" \
- 				${GO_LDFLAGS_STATIC} -o $(NAME) .
- 
-@@ -55,21 +55,21 @@ lint: ## Verifies `golint` passes
- .PHONY: test
- test: ## Runs the go tests
- 	@echo "+ $@"
--	@go test -v -tags "$(BUILDTAGS) cgo" $(shell go list ./... | grep -v vendor)
-+	@$(GO) test -v -tags "$(BUILDTAGS) cgo" $(shell $(GO) list ./... | grep -v vendor)
- 
- .PHONY: vet
- vet: ## Verifies `go vet` passes
- 	@echo "+ $@"
--	@go vet $(shell go list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
-+	@$(GO) vet $(shell $(GO) list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
- 
- .PHONY: install
- install: ## Installs the executable or package
- 	@echo "+ $@"
--	@go install .
-+	@$(GO) install .
- 
- define buildpretty
- mkdir -p $(BUILDDIR)/$(1)/$(2);
--GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
-+GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
- 	 -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \
- 	 -a -tags "$(BUILDTAGS) static_build netgo" \
- 	 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
-@@ -83,7 +83,7 @@ cross: *.go VERSION ## Builds the cross-compiled binaries, creating a clean dire
- 	$(foreach GOOSARCH,$(GOOSARCHES), $(call buildpretty,$(subst /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))
- 
- define buildrelease
--GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
-+GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
- 	 -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \
- 	 -a -tags "$(BUILDTAGS) static_build netgo" \
- 	 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
-@@ -99,7 +99,7 @@ release: *.go VERSION ## Builds the cross-compiled binaries, naming them in such
- .PHONY: bump-version
- BUMP := patch
- bump-version: ## Bump the version in the version file. Set KIND to [ patch | major | minor ]
--	@go get -u github.com/jessfraz/junk/sembump # update sembump tool
-+	@$(GO) get -u github.com/jessfraz/junk/sembump # update sembump tool
- 	$(eval NEW_VERSION = $(shell sembump --kind $(BUMP) $(VERSION)))
- 	@echo "Bumping VERSION from $(VERSION) to $(NEW_VERSION)"
- 	echo $(NEW_VERSION) > VERSION
--- 
-2.7.4
-
diff --git a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
index 3b0c0a4..3ed4c21 100644
--- a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
+++ b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
@@ -1,4 +1,4 @@
-From 09524d187ef108784c854a0c247ac6476a10bb67 Mon Sep 17 00:00:00 2001
+From fa402247e9b24470648a366cfda1c9134660146a Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Mon, 18 Mar 2019 14:04:16 -0400
 Subject: [PATCH] Makefile: force rebuilding all packages to avoid cgo
@@ -32,23 +32,27 @@ used.
 Upstream-Status: Inappropriate [only an issue with our builds]
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+
+Forward-ported to v0.5.3.
+
+Signed-off-by: Paul Barker <paul@betafive.co.uk>
 ---
- Makefile | 2 +-
+ basic.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile b/Makefile
-index 476cb9b..ecd0df4 100644
---- a/src/import/Makefile
-+++ b/src/import/Makefile
-@@ -41,7 +41,7 @@ $(NAME): *.go VERSION.txt
+diff --git a/basic.mk b/basic.mk
+index 187dff3..fb080b7 100644
+--- a/src/import/basic.mk
++++ b/src/import/basic.mk
+@@ -50,7 +50,7 @@ $(NAME): $(wildcard *.go) $(wildcard */*.go) VERSION.txt
  .PHONY: static
- static: ## Builds a static executable
+ static: prebuild ## Builds a static executable.
  	@echo "+ $@"
--	CGO_ENABLED=0 $(GO) build \
-+	CGO_ENABLED=0 $(GO) build -a -pkgdir dontusecurrentpkgs \
+-	CGO_ENABLED=$(CGO_ENABLED) $(GO) build \
++	CGO_ENABLED=$(CGO_ENABLED) $(GO) build -a -pkgdir dontusecurrentpkgs \
  				-tags "$(BUILDTAGS) static_build" \
  				${GO_LDFLAGS_STATIC} -o $(NAME) .
  
 -- 
-2.7.4
+2.17.1
 
diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index f5cdace..da6aac2 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -4,11 +4,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=48ef0979a2bcc3fae14ff30b8a7f5dbf"
 
 SRC_URI = "git://github.com/genuinetools/netns;branch=master \
-           file://0001-Allow-selection-of-go-compiler.patch \
            file://Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch \
           "
-SRCREV = "0da6ab0997707024debe68c91e940c9168041bf8"
-PV = "0.4.0"
+SRCREV = "9b103a19b917cc3762a33b7d78244b1d5e45ccfd"
+PV = "0.5.3"
 GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
@@ -46,6 +45,12 @@ do_compile() {
 	# Static builds work but are not recommended. See Makefile*cgo patch.
 	#oe_runmake static
 	oe_runmake build
+
+	# Golang forces permissions to 0500 on directories and 0400 on files in
+	# the module cache which prevents us from easily cleaning up the build
+	# directory. Let's just fix the permissions here so we don't have to
+	# hack the clean tasks.
+	chmod -R u+w vendor/pkg/mod
 }
 
 do_install() {
-- 
2.17.1


