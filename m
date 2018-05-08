Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD6BEE00C5B; Tue,  8 May 2018 13:14:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87878E009AC
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 May 2018 13:14:38 -0700 (PDT)
Received: by mail-wm0-f46.google.com with SMTP id j5-v6so23724547wme.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 May 2018 13:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7bSTC5YyjOyrFbbWk5n2s65BPD13VjBRrXlhwnjqXts=;
	b=QvfRzTvsO1hDbEBchWbw2ms84iYQNROzIab/vkRBYGtXoCDAkhwZ9JpCIXX/061KtB
	bktTeOo81l9QKyb+G6DzPSzesnCxgErU44fRMWxNCRjpoJgt6+xdG3UQ2xsvvaHEDh6o
	AUGIT0+wigqXUmOpfcjjyl12LplmxRRm6YwadJBb577XTeK0L9ckuJdVa/LYE/aFjmo3
	TAGVJf2LZQEktkvqqVN1MqHP10ACbn6qhJAyDP3BnBYT3iXNOUK3V92HjjManJmCUhTX
	3OVor+7aleCG6W0i3367X+yVFYYDnyT16P/fRG/tL5m/Hra7jNMxWWm2a+aFcOlmSL/M
	suHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7bSTC5YyjOyrFbbWk5n2s65BPD13VjBRrXlhwnjqXts=;
	b=RkoHNkxTR8qgGLdNT/E0blMRws1+mZGnGCxqxquKVvK/zsm8GWj00zZN/xanQDlkRv
	fd+Gjzy7jtpod1Vqg40Ouvh++jwzKMLEmzRzZYwlymHXV5EBKGIIZIN4mLyYniYPU+Aa
	mtStvXhN4rN4YwkrqtDsZ9wKds7eJuCcvjc5ZQCpSovuyESRRT0876ArJiD3GYMILn22
	fgQSIviaayr0OaPlvqsYptKGaGFaFgtLkS0LMcdY1afc8Dw9t6ucy2Q0oIPr5Q5wKe30
	GRIjePWn+c4Jia7yw3o/DbIVJ+TEfTjOadxniG8V8jTWZxo6i0ZHuYHcTf9d+QQJassM
	2GGQ==
X-Gm-Message-State: ALKqPwdXQhU1sjYxZqCIx1QUm6HZUlJfMflJf+pOHfN7ibcOaPnPDxx9
	eKkWhqAP/Gdv4AvUrykhO2sKFQrb
X-Google-Smtp-Source: AB8JxZpSY20hWfVStaxRTL0e0oEl/3qnlzRVcygAm183twP0ua1ZESWOCiJbZl7GeOiDWghzGSwp8Q==
X-Received: by 10.28.218.80 with SMTP id r77mr3787009wmg.105.1525810477234;
	Tue, 08 May 2018 13:14:37 -0700 (PDT)
Received: from eng01.lxd (h02.s01.b5net.uk. [88.99.27.92])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm42708231wrt.20.2018.05.08.13.14.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 May 2018 13:14:36 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  8 May 2018 20:14:12 +0000
Message-Id: <1525810452-7637-2-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525810452-7637-1-git-send-email-pbarker@toganlabs.com>
References: <1525810452-7637-1-git-send-email-pbarker@toganlabs.com>
Cc: Paul Barker <paul@toganlabs.com>
Subject: [PATCH 2/2] netns: Update to v0.4.0
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
X-List-Received-Date: Tue, 08 May 2018 20:14:39 -0000

The netns project has been moved into the 'genuinetools' organisation and so
URLs have been updated. The copyright line in the license file has been updated
to reference "The Genuinetools Authors".

The patch name has been updated to make it more suitable for submission
upstream.

Signed-off-by: Paul Barker <paul@toganlabs.com>
---
 .../0001-Allow-selection-of-go-compiler.patch      | 107 +++++++++++++++++++++
 recipes-networking/netns/netns_git.bb              |  16 +--
 2 files changed, 115 insertions(+), 8 deletions(-)
 create mode 100644 recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch

diff --git a/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch b/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch
new file mode 100644
index 0000000..84fb9a4
--- /dev/null
+++ b/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch
@@ -0,0 +1,107 @@
+From 6576f228339b7931e05a8e861f085f483817806b Mon Sep 17 00:00:00 2001
+From: Paul Barker <pbarker@toganlabs.com>
+Date: Tue, 8 May 2018 11:01:14 +0000
+Subject: [PATCH] Allow selection of go compiler
+
+By running `make GO=/path/to/go` we can now select the appropriate go compiler
+to use. This also makes it possible to cross compile netns more easily.
+
+Signed-off-by: Paul Barker <pbarker@toganlabs.com>
+Upstream-status: Pending
+---
+ Makefile | 25 ++++++++++++++-----------
+ 1 file changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 3a22f3e..476cb9b 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -23,6 +23,9 @@ CTIMEVAR=-X $(PKG)/version.GITCOMMIT=$(GITCOMMIT) -X $(PKG)/version.VERSION=$(VE
+ GO_LDFLAGS=-ldflags "-w $(CTIMEVAR)"
+ GO_LDFLAGS_STATIC=-ldflags "-w $(CTIMEVAR) -extldflags -static"
+ 
++# Set our default go compiler
++GO := go
++
+ # List the GOOS and GOARCH to build
+ GOOSARCHES = linux/arm linux/arm64 linux/amd64 linux/386
+ 
+@@ -33,12 +36,12 @@ build: $(NAME) ## Builds a dynamic executable or package
+ 
+ $(NAME): *.go VERSION.txt
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
+@@ -55,23 +58,23 @@ lint: ## Verifies `golint` passes
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
+ .PHONY: staticcheck
+ staticcheck: ## Verifies `staticcheck` passes
+ 	@echo "+ $@"
+-	@staticcheck $(shell go list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
++	@staticcheck $(shell $(GO) list ./... | grep -v vendor) | grep -v '.pb.go:' | tee /dev/stderr
+ 
+ .PHONY: cover
+ cover: ## Runs go test with coverage
+ 	@echo "" > coverage.txt
+-	@for d in $(shell go list ./... | grep -v vendor); do \
+-		go test -race -coverprofile=profile.out -covermode=atomic "$$d"; \
++	@for d in $(shell $(GO) list ./... | grep -v vendor); do \
++		$(GO) test -race -coverprofile=profile.out -covermode=atomic "$$d"; \
+ 		if [ -f profile.out ]; then \
+ 			cat profile.out >> coverage.txt; \
+ 			rm profile.out; \
+@@ -81,11 +84,11 @@ cover: ## Runs go test with coverage
+ .PHONY: install
+ install: ## Installs the executable or package
+ 	@echo "+ $@"
+-	go install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
++	$(GO) install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
+ 
+ define buildpretty
+ mkdir -p $(BUILDDIR)/$(1)/$(2);
+-GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
++GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
+ 	 -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \
+ 	 -a -tags "$(BUILDTAGS) static_build netgo" \
+ 	 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
+@@ -99,7 +102,7 @@ cross: *.go VERSION.txt ## Builds the cross-compiled binaries, creating a clean
+ 	$(foreach GOOSARCH,$(GOOSARCHES), $(call buildpretty,$(subst /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))
+ 
+ define buildrelease
+-GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
++GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
+ 	 -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \
+ 	 -a -tags "$(BUILDTAGS) static_build netgo" \
+ 	 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
+@@ -115,7 +118,7 @@ release: *.go VERSION.txt ## Builds the cross-compiled binaries, naming them in
+ .PHONY: bump-version
+ BUMP := patch
+ bump-version: ## Bump the version in the version file. Set BUMP to [ patch | major | minor ]
+-	@go get -u github.com/jessfraz/junk/sembump # update sembump tool
++	@$(GO) get -u github.com/jessfraz/junk/sembump # update sembump tool
+ 	$(eval NEW_VERSION = $(shell sembump --kind $(BUMP) $(VERSION)))
+ 	@echo "Bumping VERSION.txt from $(VERSION) to $(NEW_VERSION)"
+ 	echo $(NEW_VERSION) > VERSION.txt
+-- 
+2.7.4
+
diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index d35836e..82a961b 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -1,13 +1,13 @@
 HOMEPAGE = "https://github.com/jfrazelle/netns"
 SUMMARY = "Runc hook for setting up default bridge networking."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=48ef0979a2bcc3fae14ff30b8a7f5dbf"
 
-SRC_URI = "git://github.com/jessfraz/netns;branch=master \
-           file://0001-Use-correct-go-cross-compiler.patch \
+SRC_URI = "git://github.com/genuinetools/netns;branch=master \
+           file://0001-Allow-selection-of-go-compiler.patch \
           "
-SRCREV = "74e23a0e5c4e7ac011aafcc4623586c196f1b3ef"
-PV = "0.2.1"
+SRCREV = "0da6ab0997707024debe68c91e940c9168041bf8"
+PV = "0.4.0"
 GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
@@ -26,9 +26,9 @@ do_compile() {
 	# We also need to link in the ipallocator and version directories as
 	# they are not under the src directory.
 	ln -sfn . "${S}/src/import/vendor/src"
-	mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/netns"
-	ln -sfn "${S}/src/import/ipallocator" "${S}/src/import/vendor/src/github.com/jessfraz/netns/ipallocator"
-	ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/jessfraz/netns/version"
+	mkdir -p "${S}/src/import/vendor/src/github.com/genuinetools/netns"
+	ln -sfn "${S}/src/import/ipallocator" "${S}/src/import/vendor/src/github.com/genuinetools/netns/ipallocator"
+	ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/genuinetools/netns/version"
 	export GOPATH="${S}/src/import/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
-- 
2.7.4


