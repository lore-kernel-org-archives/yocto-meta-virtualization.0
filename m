Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BE1BE00A1C; Wed,  1 May 2019 12:40:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5610E009A0
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 May 2019 12:40:09 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id o16so115458lfl.7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 May 2019 12:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ugmeLvoOGp07gAXKJXQ3DQLc9ML5HRw5pkg5zv+6x6Y=;
	b=jaug9ONMB5DS+0ptuVF4Xv4GxJB3BChu4YLVrIuj1+QlGBWaFDTs48mOWw47oxr/lj
	Ibna0cPT84ITHiYtRTtfeB/Qv7lQC0Y6Cz3YF/u3smW3+pri6a+Xud9d/UQiqugKYtL1
	6UwM8m4epYU/fP+H0ZI0Fgsri1zfPM0mJXLs7H3qVTwOvhU7K81RtamJcOjOYqMiCBNQ
	MVEWgjEnHiaxg05K84uPsIVqGjfM9u7MgAZMHwUewT7SbD9PNH95IuNzSeu0JevUaqw6
	9CREQdHnC56ATUDmhfnoe79xA0oujxe3LsWicefyEp9XM84fF/ynhaz9i69jvIiDVX5v
	pL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ugmeLvoOGp07gAXKJXQ3DQLc9ML5HRw5pkg5zv+6x6Y=;
	b=Atzn7cXmuoaGHf4WfggiCcewpMV+steKPtxoWbV4D2cnj2l0wrKGithb/n55Yltuhs
	RVy1ONO0x5YNIlmKLm+g6lIPTBSRPQTmvgLd1QLYoDqN/ez/f7f3z2c+fV4XqhkVCCZn
	wpibS8ddOnbt+Ne9tMz6onq2nZ4zulUrWV0o7bA/M3k8Ks7f9mXfa/GZWta3teARw0FL
	tKQNaDNZwLTHakgRnzxB4xTau3Bm+Owlx5F+jKQLsWGthq6az3O9baqHa4RVhFmj9hJi
	1KUJU7kTIKpVdyzeDwwmO3hkGBixbs8rgutKbMnQKu9k4kCfF/lkh0zkKX/Eth+IF0Tc
	isNQ==
X-Gm-Message-State: APjAAAVbHOHCkUK2xiAzqpJqMf33ptU1DNbVWEF3ZwyEnnW/4sarCKVp
	cMwq0p5jeaIhqQj451wouRyXiwBzInJP5/FMBF1gRkEf
X-Google-Smtp-Source: APXvYqzC8uBK63WymrWCeA7ZVFZBgzAmwjxQgg3F6eS8bXJ3vCRxceGdnHyQddCWKc+ac4czEWXRTEx7kbOgpwzqyI4=
X-Received: by 2002:a19:520e:: with SMTP id m14mr41386294lfb.65.1556739608648; 
	Wed, 01 May 2019 12:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190429204017.32320-1-paul@betafive.co.uk>
In-Reply-To: <20190429204017.32320-1-paul@betafive.co.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 1 May 2019 15:39:57 -0400
Message-ID: <CADkTA4O3givmp25FBPL+bbLFJJMf4CbFYr0MmDH3D3FOSLHOjw@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] netns: Upgrade to v0.5.3
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
X-List-Received-Date: Wed, 01 May 2019 19:40:12 -0000
Content-Type: multipart/alternative; boundary="00000000000061a0120587d8af2b"

--00000000000061a0120587d8af2b
Content-Type: text/plain; charset="UTF-8"

Thanks Paul.

This is now merged.

Bruce

On Mon, Apr 29, 2019 at 4:50 PM <paul@betafive.co.uk> wrote:

> From: Paul Barker <paul@betafive.co.uk>
>
> Drop obsolete patches and forward-port the remaining required patch. We
> also need to fix up permissions after the build so that we can clean the
> build directory without errors if needed.
>
> Signed-off-by: Paul Barker <paul@betafive.co.uk>
> ---
>  .../0001-Allow-selection-of-go-compiler.patch | 107 ------------------
>  .../0001-Use-correct-go-cross-compiler.patch  |  77 -------------
>  ...rebuilding-all-packages-to-avoid-cgo.patch |  26 +++--
>  recipes-networking/netns/netns_git.bb         |  11 +-
>  4 files changed, 23 insertions(+), 198 deletions(-)
>  delete mode 100644
> recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch
>  delete mode 100644
> recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch
>
> diff --git
> a/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch
> b/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch
> deleted file mode 100644
> index 84fb9a4..0000000
> ---
> a/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patch
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -From 6576f228339b7931e05a8e861f085f483817806b Mon Sep 17 00:00:00 2001
> -From: Paul Barker <pbarker@toganlabs.com>
> -Date: Tue, 8 May 2018 11:01:14 +0000
> -Subject: [PATCH] Allow selection of go compiler
> -
> -By running `make GO=/path/to/go` we can now select the appropriate go
> compiler
> -to use. This also makes it possible to cross compile netns more easily.
> -
> -Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> -Upstream-status: Pending
> ----
> - Makefile | 25 ++++++++++++++-----------
> - 1 file changed, 14 insertions(+), 11 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 3a22f3e..476cb9b 100644
> ---- a/src/import/Makefile
> -+++ b/src/import/Makefile
> -@@ -23,6 +23,9 @@ CTIMEVAR=-X $(PKG)/version.GITCOMMIT=$(GITCOMMIT) -X
> $(PKG)/version.VERSION=$(VE
> - GO_LDFLAGS=-ldflags "-w $(CTIMEVAR)"
> - GO_LDFLAGS_STATIC=-ldflags "-w $(CTIMEVAR) -extldflags -static"
> -
> -+# Set our default go compiler
> -+GO := go
> -+
> - # List the GOOS and GOARCH to build
> - GOOSARCHES = linux/arm linux/arm64 linux/amd64 linux/386
> -
> -@@ -33,12 +36,12 @@ build: $(NAME) ## Builds a dynamic executable or
> package
> -
> - $(NAME): *.go VERSION.txt
> -       @echo "+ $@"
> --      go build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> -+      $(GO) build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> -
> - .PHONY: static
> - static: ## Builds a static executable
> -       @echo "+ $@"
> --      CGO_ENABLED=0 go build \
> -+      CGO_ENABLED=0 $(GO) build \
> -                               -tags "$(BUILDTAGS) static_build" \
> -                               ${GO_LDFLAGS_STATIC} -o $(NAME) .
> -
> -@@ -55,23 +58,23 @@ lint: ## Verifies `golint` passes
> - .PHONY: test
> - test: ## Runs the go tests
> -       @echo "+ $@"
> --      @go test -v -tags "$(BUILDTAGS) cgo" $(shell go list ./... | grep
> -v vendor)
> -+      @$(GO) test -v -tags "$(BUILDTAGS) cgo" $(shell $(GO) list ./... |
> grep -v vendor)
> -
> - .PHONY: vet
> - vet: ## Verifies `go vet` passes
> -       @echo "+ $@"
> --      @go vet $(shell go list ./... | grep -v vendor) | grep -v
> '.pb.go:' | tee /dev/stderr
> -+      @$(GO) vet $(shell $(GO) list ./... | grep -v vendor) | grep -v
> '.pb.go:' | tee /dev/stderr
> -
> - .PHONY: staticcheck
> - staticcheck: ## Verifies `staticcheck` passes
> -       @echo "+ $@"
> --      @staticcheck $(shell go list ./... | grep -v vendor) | grep -v
> '.pb.go:' | tee /dev/stderr
> -+      @staticcheck $(shell $(GO) list ./... | grep -v vendor) | grep -v
> '.pb.go:' | tee /dev/stderr
> -
> - .PHONY: cover
> - cover: ## Runs go test with coverage
> -       @echo "" > coverage.txt
> --      @for d in $(shell go list ./... | grep -v vendor); do \
> --              go test -race -coverprofile=profile.out -covermode=atomic
> "$$d"; \
> -+      @for d in $(shell $(GO) list ./... | grep -v vendor); do \
> -+              $(GO) test -race -coverprofile=profile.out
> -covermode=atomic "$$d"; \
> -               if [ -f profile.out ]; then \
> -                       cat profile.out >> coverage.txt; \
> -                       rm profile.out; \
> -@@ -81,11 +84,11 @@ cover: ## Runs go test with coverage
> - .PHONY: install
> - install: ## Installs the executable or package
> -       @echo "+ $@"
> --      go install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
> -+      $(GO) install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
> -
> - define buildpretty
> - mkdir -p $(BUILDDIR)/$(1)/$(2);
> --GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
> -+GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
> -        -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \
> -        -a -tags "$(BUILDTAGS) static_build netgo" \
> -        -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
> -@@ -99,7 +102,7 @@ cross: *.go VERSION.txt ## Builds the cross-compiled
> binaries, creating a clean
> -       $(foreach GOOSARCH,$(GOOSARCHES), $(call buildpretty,$(subst
> /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))
> -
> - define buildrelease
> --GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
> -+GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
> -        -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \
> -        -a -tags "$(BUILDTAGS) static_build netgo" \
> -        -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
> -@@ -115,7 +118,7 @@ release: *.go VERSION.txt ## Builds the
> cross-compiled binaries, naming them in
> - .PHONY: bump-version
> - BUMP := patch
> - bump-version: ## Bump the version in the version file. Set BUMP to [
> patch | major | minor ]
> --      @go get -u github.com/jessfraz/junk/sembump # update sembump tool
> -+      @$(GO) get -u github.com/jessfraz/junk/sembump # update sembump
> tool
> -       $(eval NEW_VERSION = $(shell sembump --kind $(BUMP) $(VERSION)))
> -       @echo "Bumping VERSION.txt from $(VERSION) to $(NEW_VERSION)"
> -       echo $(NEW_VERSION) > VERSION.txt
> ---
> -2.7.4
> -
> diff --git
> a/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch
> b/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch
> deleted file mode 100644
> index ed66e11..0000000
> ---
> a/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From d5c319bb61155d94bef2571a095d82983d786b94 Mon Sep 17 00:00:00 2001
> -From: Paul Barker <pbarker@toganlabs.com>
> -Date: Fri, 13 Oct 2017 17:58:11 +0000
> -Subject: [PATCH] Use correct go cross-compiler
> -
> -Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> -Upstream-status: Pending
> ----
> - Makefile | 16 ++++++++--------
> - 1 file changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index cb9a46d..633f884 100644
> ---- a/src/import/Makefile
> -+++ b/src/import/Makefile
> -@@ -33,12 +33,12 @@ build: $(NAME) ## Builds a dynamic executable or
> package
> -
> - $(NAME): *.go VERSION
> -       @echo "+ $@"
> --      go build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> -+      $(GO) build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> -
> - .PHONY: static
> - static: ## Builds a static executable
> -       @echo "+ $@"
> --      CGO_ENABLED=0 go build \
> -+      CGO_ENABLED=0 $(GO) build \
> -                               -tags "$(BUILDTAGS) static_build" \
> -                               ${GO_LDFLAGS_STATIC} -o $(NAME) .
> -
> -@@ -55,21 +55,21 @@ lint: ## Verifies `golint` passes
> - .PHONY: test
> - test: ## Runs the go tests
> -       @echo "+ $@"
> --      @go test -v -tags "$(BUILDTAGS) cgo" $(shell go list ./... | grep
> -v vendor)
> -+      @$(GO) test -v -tags "$(BUILDTAGS) cgo" $(shell $(GO) list ./... |
> grep -v vendor)
> -
> - .PHONY: vet
> - vet: ## Verifies `go vet` passes
> -       @echo "+ $@"
> --      @go vet $(shell go list ./... | grep -v vendor) | grep -v
> '.pb.go:' | tee /dev/stderr
> -+      @$(GO) vet $(shell $(GO) list ./... | grep -v vendor) | grep -v
> '.pb.go:' | tee /dev/stderr
> -
> - .PHONY: install
> - install: ## Installs the executable or package
> -       @echo "+ $@"
> --      @go install .
> -+      @$(GO) install .
> -
> - define buildpretty
> - mkdir -p $(BUILDDIR)/$(1)/$(2);
> --GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
> -+GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
> -        -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \
> -        -a -tags "$(BUILDTAGS) static_build netgo" \
> -        -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
> -@@ -83,7 +83,7 @@ cross: *.go VERSION ## Builds the cross-compiled
> binaries, creating a clean dire
> -       $(foreach GOOSARCH,$(GOOSARCHES), $(call buildpretty,$(subst
> /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))
> -
> - define buildrelease
> --GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 go build \
> -+GOOS=$(1) GOARCH=$(2) CGO_ENABLED=0 $(GO) build \
> -        -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \
> -        -a -tags "$(BUILDTAGS) static_build netgo" \
> -        -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
> -@@ -99,7 +99,7 @@ release: *.go VERSION ## Builds the cross-compiled
> binaries, naming them in such
> - .PHONY: bump-version
> - BUMP := patch
> - bump-version: ## Bump the version in the version file. Set KIND to [
> patch | major | minor ]
> --      @go get -u github.com/jessfraz/junk/sembump # update sembump tool
> -+      @$(GO) get -u github.com/jessfraz/junk/sembump # update sembump
> tool
> -       $(eval NEW_VERSION = $(shell sembump --kind $(BUMP) $(VERSION)))
> -       @echo "Bumping VERSION from $(VERSION) to $(NEW_VERSION)"
> -       echo $(NEW_VERSION) > VERSION
> ---
> -2.7.4
> -
> diff --git
> a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
> b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
> index 3b0c0a4..3ed4c21 100644
> ---
> a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
> +++
> b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
> @@ -1,4 +1,4 @@
> -From 09524d187ef108784c854a0c247ac6476a10bb67 Mon Sep 17 00:00:00 2001
> +From fa402247e9b24470648a366cfda1c9134660146a Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Mon, 18 Mar 2019 14:04:16 -0400
>  Subject: [PATCH] Makefile: force rebuilding all packages to avoid cgo
> @@ -32,23 +32,27 @@ used.
>  Upstream-Status: Inappropriate [only an issue with our builds]
>
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +
> +Forward-ported to v0.5.3.
> +
> +Signed-off-by: Paul Barker <paul@betafive.co.uk>
>  ---
> - Makefile | 2 +-
> + basic.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/Makefile b/Makefile
> -index 476cb9b..ecd0df4 100644
> ---- a/src/import/Makefile
> -+++ b/src/import/Makefile
> -@@ -41,7 +41,7 @@ $(NAME): *.go VERSION.txt
> +diff --git a/basic.mk b/basic.mk
> +index 187dff3..fb080b7 100644
> +--- a/src/import/basic.mk
> ++++ b/src/import/basic.mk
> +@@ -50,7 +50,7 @@ $(NAME): $(wildcard *.go) $(wildcard */*.go) VERSION.txt
>   .PHONY: static
> - static: ## Builds a static executable
> + static: prebuild ## Builds a static executable.
>         @echo "+ $@"
> --      CGO_ENABLED=0 $(GO) build \
> -+      CGO_ENABLED=0 $(GO) build -a -pkgdir dontusecurrentpkgs \
> +-      CGO_ENABLED=$(CGO_ENABLED) $(GO) build \
> ++      CGO_ENABLED=$(CGO_ENABLED) $(GO) build -a -pkgdir
> dontusecurrentpkgs \
>                                 -tags "$(BUILDTAGS) static_build" \
>                                 ${GO_LDFLAGS_STATIC} -o $(NAME) .
>
>  --
> -2.7.4
> +2.17.1
>
> diff --git a/recipes-networking/netns/netns_git.bb
> b/recipes-networking/netns/netns_git.bb
> index f5cdace..da6aac2 100644
> --- a/recipes-networking/netns/netns_git.bb
> +++ b/recipes-networking/netns/netns_git.bb
> @@ -4,11 +4,10 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://src/import/LICENSE;md5=48ef0979a2bcc3fae14ff30b8a7f5dbf"
>
>  SRC_URI = "git://github.com/genuinetools/netns;branch=master \
> -           file://0001-Allow-selection-of-go-compiler.patch \
>
> file://Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch \
>            "
> -SRCREV = "0da6ab0997707024debe68c91e940c9168041bf8"
> -PV = "0.4.0"
> +SRCREV = "9b103a19b917cc3762a33b7d78244b1d5e45ccfd"
> +PV = "0.5.3"
>  GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
> @@ -46,6 +45,12 @@ do_compile() {
>         # Static builds work but are not recommended. See Makefile*cgo
> patch.
>         #oe_runmake static
>         oe_runmake build
> +
> +       # Golang forces permissions to 0500 on directories and 0400 on
> files in
> +       # the module cache which prevents us from easily cleaning up the
> build
> +       # directory. Let's just fix the permissions here so we don't have
> to
> +       # hack the clean tasks.
> +       chmod -R u+w vendor/pkg/mod
>  }
>
>  do_install() {
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000061a0120587d8af2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Tha=
nks Paul.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">This is now mer=
ged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, A=
pr 29, 2019 at 4:50 PM &lt;<a href=3D"mailto:paul@betafive.co.uk">paul@beta=
five.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Paul Barker &lt;<a href=3D"mailto:paul@betafive.co.uk" tar=
get=3D"_blank">paul@betafive.co.uk</a>&gt;<br>
<br>
Drop obsolete patches and forward-port the remaining required patch. We<br>
also need to fix up permissions after the build so that we can clean the<br=
>
build directory without errors if needed.<br>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@betafive.co.uk" targe=
t=3D"_blank">paul@betafive.co.uk</a>&gt;<br>
---<br>
=C2=A0.../0001-Allow-selection-of-go-compiler.patch | 107 -----------------=
-<br>
=C2=A0.../0001-Use-correct-go-cross-compiler.patch=C2=A0 |=C2=A0 77 -------=
------<br>
=C2=A0...rebuilding-all-packages-to-avoid-cgo.patch |=C2=A0 26 +++--<br>
=C2=A0recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"noref=
errer" target=3D"_blank">netns_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 11 +-<br>
=C2=A04 files changed, 23 insertions(+), 198 deletions(-)<br>
=C2=A0delete mode 100644 recipes-networking/netns/files/0001-Allow-selectio=
n-of-go-compiler.patch<br>
=C2=A0delete mode 100644 recipes-networking/netns/files/0001-Use-correct-go=
-cross-compiler.patch<br>
<br>
diff --git a/recipes-networking/netns/files/0001-Allow-selection-of-go-comp=
iler.patch b/recipes-networking/netns/files/0001-Allow-selection-of-go-comp=
iler.patch<br>
deleted file mode 100644<br>
index 84fb9a4..0000000<br>
--- a/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.pa=
tch<br>
+++ /dev/null<br>
@@ -1,107 +0,0 @@<br>
-From 6576f228339b7931e05a8e861f085f483817806b Mon Sep 17 00:00:00 2001<br>
-From: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com" target=3D"_=
blank">pbarker@toganlabs.com</a>&gt;<br>
-Date: Tue, 8 May 2018 11:01:14 +0000<br>
-Subject: [PATCH] Allow selection of go compiler<br>
-<br>
-By running `make GO=3D/path/to/go` we can now select the appropriate go co=
mpiler<br>
-to use. This also makes it possible to cross compile netns more easily.<br=
>
-<br>
-Signed-off-by: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com" ta=
rget=3D"_blank">pbarker@toganlabs.com</a>&gt;<br>
-Upstream-status: Pending<br>
----<br>
- Makefile | 25 ++++++++++++++-----------<br>
- 1 file changed, 14 insertions(+), 11 deletions(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index 3a22f3e..476cb9b 100644<br>
---- a/src/import/Makefile<br>
-+++ b/src/import/Makefile<br>
-@@ -23,6 +23,9 @@ CTIMEVAR=3D-X $(PKG)/version.GITCOMMIT=3D$(GITCOMMIT) -X=
 $(PKG)/version.VERSION=3D$(VE<br>
- GO_LDFLAGS=3D-ldflags &quot;-w $(CTIMEVAR)&quot;<br>
- GO_LDFLAGS_STATIC=3D-ldflags &quot;-w $(CTIMEVAR) -extldflags -static&quo=
t;<br>
- <br>
-+# Set our default go compiler<br>
-+GO :=3D go<br>
-+<br>
- # List the GOOS and GOARCH to build<br>
- GOOSARCHES =3D linux/arm linux/arm64 linux/amd64 linux/386<br>
- <br>
-@@ -33,12 +36,12 @@ build: $(NAME) ## Builds a dynamic executable or packa=
ge<br>
- <br>
- $(NAME): *.go VERSION.txt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 go build -tags &quot;$(BUILDTAGS)&quot; ${GO_LDFLAGS=
} -o $(NAME) .<br>
-+=C2=A0 =C2=A0 =C2=A0 $(GO) build -tags &quot;$(BUILDTAGS)&quot; ${GO_LDFL=
AGS} -o $(NAME) .<br>
- <br>
- .PHONY: static<br>
- static: ## Builds a static executable<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 go build \<br>
-+=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 $(GO) build \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-tags &quot;$(BUILDTAGS) static_build=
&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GO_LDFLAGS_STATIC} -o $(NAME) .<br>
- <br>
-@@ -55,23 +58,23 @@ lint: ## Verifies `golint` passes<br>
- .PHONY: test<br>
- test: ## Runs the go tests<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 @go test -v -tags &quot;$(BUILDTAGS) cgo&quot; $(she=
ll go list ./... | grep -v vendor)<br>
-+=C2=A0 =C2=A0 =C2=A0 @$(GO) test -v -tags &quot;$(BUILDTAGS) cgo&quot; $(=
shell $(GO) list ./... | grep -v vendor)<br>
- <br>
- .PHONY: vet<br>
- vet: ## Verifies `go vet` passes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 @go vet $(shell go list ./... | grep -v vendor) | gr=
ep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
-+=C2=A0 =C2=A0 =C2=A0 @$(GO) vet $(shell $(GO) list ./... | grep -v vendor=
) | grep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
- <br>
- .PHONY: staticcheck<br>
- staticcheck: ## Verifies `staticcheck` passes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 @staticcheck $(shell go list ./... | grep -v vendor)=
 | grep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
-+=C2=A0 =C2=A0 =C2=A0 @staticcheck $(shell $(GO) list ./... | grep -v vend=
or) | grep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
- <br>
- .PHONY: cover<br>
- cover: ## Runs go test with coverage<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;&quot; &gt; coverage.txt<br>
--=C2=A0 =C2=A0 =C2=A0 @for d in $(shell go list ./... | grep -v vendor); d=
o \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 go test -race -coverprof=
ile=3Dprofile.out -covermode=3Datomic &quot;$$d&quot;; \<br>
-+=C2=A0 =C2=A0 =C2=A0 @for d in $(shell $(GO) list ./... | grep -v vendor)=
; do \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GO) test -race -coverp=
rofile=3Dprofile.out -covermode=3Datomic &quot;$$d&quot;; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f profile.out=
 ]; then \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cat profile.out &gt;&gt; coverage.txt; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm profile.out; \<br>
-@@ -81,11 +84,11 @@ cover: ## Runs go test with coverage<br>
- .PHONY: install<br>
- install: ## Installs the executable or package<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 go install -a -tags &quot;$(BUILDTAGS)&quot; ${GO_LD=
FLAGS} .<br>
-+=C2=A0 =C2=A0 =C2=A0 $(GO) install -a -tags &quot;$(BUILDTAGS)&quot; ${GO=
_LDFLAGS} .<br>
- <br>
- define buildpretty<br>
- mkdir -p $(BUILDDIR)/$(1)/$(2);<br>
--GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \<br>
-+GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -a -tags &quot;$(BUILDTAGS) static_build netgo=
&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;<b=
r>
-@@ -99,7 +102,7 @@ cross: *.go VERSION.txt ## Builds the cross-compiled bi=
naries, creating a clean<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach GOOSARCH,$(GOOSARCHES), $(call buildp=
retty,$(subst /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))<br>
- <br>
- define buildrelease<br>
--GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \<br>
-+GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -a -tags &quot;$(BUILDTAGS) static_build netgo=
&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;<b=
r>
-@@ -115,7 +118,7 @@ release: *.go VERSION.txt ## Builds the cross-compiled=
 binaries, naming them in<br>
- .PHONY: bump-version<br>
- BUMP :=3D patch<br>
- bump-version: ## Bump the version in the version file. Set BUMP to [ patc=
h | major | minor ]<br>
--=C2=A0 =C2=A0 =C2=A0 @go get -u <a href=3D"http://github.com/jessfraz/jun=
k/sembump" rel=3D"noreferrer" target=3D"_blank">github.com/jessfraz/junk/se=
mbump</a> # update sembump tool<br>
-+=C2=A0 =C2=A0 =C2=A0 @$(GO) get -u <a href=3D"http://github.com/jessfraz/=
junk/sembump" rel=3D"noreferrer" target=3D"_blank">github.com/jessfraz/junk=
/sembump</a> # update sembump tool<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(eval NEW_VERSION =3D $(shell sembump --kind $=
(BUMP) $(VERSION)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Bumping VERSION.txt from $(VERSION)=
 to $(NEW_VERSION)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(NEW_VERSION) &gt; VERSION.txt<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/recipes-networking/netns/files/0001-Use-correct-go-cross-compi=
ler.patch b/recipes-networking/netns/files/0001-Use-correct-go-cross-compil=
er.patch<br>
deleted file mode 100644<br>
index ed66e11..0000000<br>
--- a/recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.pat=
ch<br>
+++ /dev/null<br>
@@ -1,77 +0,0 @@<br>
-From d5c319bb61155d94bef2571a095d82983d786b94 Mon Sep 17 00:00:00 2001<br>
-From: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com" target=3D"_=
blank">pbarker@toganlabs.com</a>&gt;<br>
-Date: Fri, 13 Oct 2017 17:58:11 +0000<br>
-Subject: [PATCH] Use correct go cross-compiler<br>
-<br>
-Signed-off-by: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com" ta=
rget=3D"_blank">pbarker@toganlabs.com</a>&gt;<br>
-Upstream-status: Pending<br>
----<br>
- Makefile | 16 ++++++++--------<br>
- 1 file changed, 8 insertions(+), 8 deletions(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index cb9a46d..633f884 100644<br>
---- a/src/import/Makefile<br>
-+++ b/src/import/Makefile<br>
-@@ -33,12 +33,12 @@ build: $(NAME) ## Builds a dynamic executable or packa=
ge<br>
- <br>
- $(NAME): *.go VERSION<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 go build -tags &quot;$(BUILDTAGS)&quot; ${GO_LDFLAGS=
} -o $(NAME) .<br>
-+=C2=A0 =C2=A0 =C2=A0 $(GO) build -tags &quot;$(BUILDTAGS)&quot; ${GO_LDFL=
AGS} -o $(NAME) .<br>
- <br>
- .PHONY: static<br>
- static: ## Builds a static executable<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 go build \<br>
-+=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 $(GO) build \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-tags &quot;$(BUILDTAGS) static_build=
&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GO_LDFLAGS_STATIC} -o $(NAME) .<br>
- <br>
-@@ -55,21 +55,21 @@ lint: ## Verifies `golint` passes<br>
- .PHONY: test<br>
- test: ## Runs the go tests<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 @go test -v -tags &quot;$(BUILDTAGS) cgo&quot; $(she=
ll go list ./... | grep -v vendor)<br>
-+=C2=A0 =C2=A0 =C2=A0 @$(GO) test -v -tags &quot;$(BUILDTAGS) cgo&quot; $(=
shell $(GO) list ./... | grep -v vendor)<br>
- <br>
- .PHONY: vet<br>
- vet: ## Verifies `go vet` passes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 @go vet $(shell go list ./... | grep -v vendor) | gr=
ep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
-+=C2=A0 =C2=A0 =C2=A0 @$(GO) vet $(shell $(GO) list ./... | grep -v vendor=
) | grep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
- <br>
- .PHONY: install<br>
- install: ## Installs the executable or package<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 @go install .<br>
-+=C2=A0 =C2=A0 =C2=A0 @$(GO) install .<br>
- <br>
- define buildpretty<br>
- mkdir -p $(BUILDDIR)/$(1)/$(2);<br>
--GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \<br>
-+GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -a -tags &quot;$(BUILDTAGS) static_build netgo=
&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;<b=
r>
-@@ -83,7 +83,7 @@ cross: *.go VERSION ## Builds the cross-compiled binarie=
s, creating a clean dire<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach GOOSARCH,$(GOOSARCHES), $(call buildp=
retty,$(subst /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))<br>
- <br>
- define buildrelease<br>
--GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \<br>
-+GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -a -tags &quot;$(BUILDTAGS) static_build netgo=
&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -installsuffix netgo ${GO_LDFLAGS_STATIC} .;<b=
r>
-@@ -99,7 +99,7 @@ release: *.go VERSION ## Builds the cross-compiled binar=
ies, naming them in such<br>
- .PHONY: bump-version<br>
- BUMP :=3D patch<br>
- bump-version: ## Bump the version in the version file. Set KIND to [ patc=
h | major | minor ]<br>
--=C2=A0 =C2=A0 =C2=A0 @go get -u <a href=3D"http://github.com/jessfraz/jun=
k/sembump" rel=3D"noreferrer" target=3D"_blank">github.com/jessfraz/junk/se=
mbump</a> # update sembump tool<br>
-+=C2=A0 =C2=A0 =C2=A0 @$(GO) get -u <a href=3D"http://github.com/jessfraz/=
junk/sembump" rel=3D"noreferrer" target=3D"_blank">github.com/jessfraz/junk=
/sembump</a> # update sembump tool<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(eval NEW_VERSION =3D $(shell sembump --kind $=
(BUMP) $(VERSION)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Bumping VERSION from $(VERSION) to =
$(NEW_VERSION)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(NEW_VERSION) &gt; VERSION<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/recipes-networking/netns/files/Makefile-force-rebuilding-all-p=
ackages-to-avoid-cgo.patch b/recipes-networking/netns/files/Makefile-force-=
rebuilding-all-packages-to-avoid-cgo.patch<br>
index 3b0c0a4..3ed4c21 100644<br>
--- a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages=
-to-avoid-cgo.patch<br>
+++ b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages=
-to-avoid-cgo.patch<br>
@@ -1,4 +1,4 @@<br>
-From 09524d187ef108784c854a0c247ac6476a10bb67 Mon Sep 17 00:00:00 2001<br>
+From fa402247e9b24470648a366cfda1c9134660146a Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver=
.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
=C2=A0Date: Mon, 18 Mar 2019 14:04:16 -0400<br>
=C2=A0Subject: [PATCH] Makefile: force rebuilding all packages to avoid cgo=
<br>
@@ -32,23 +32,27 @@ used.<br>
=C2=A0Upstream-Status: Inappropriate [only an issue with our builds]<br>
<br>
=C2=A0Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
+<br>
+Forward-ported to v0.5.3.<br>
+<br>
+Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@betafive.co.uk" targ=
et=3D"_blank">paul@betafive.co.uk</a>&gt;<br>
=C2=A0---<br>
- Makefile | 2 +-<br>
+ <a href=3D"http://basic.mk" rel=3D"noreferrer" target=3D"_blank">basic.mk=
</a> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
-diff --git a/Makefile b/Makefile<br>
-index 476cb9b..ecd0df4 100644<br>
---- a/src/import/Makefile<br>
-+++ b/src/import/Makefile<br>
-@@ -41,7 +41,7 @@ $(NAME): *.go VERSION.txt<br>
+diff --git a/<a href=3D"http://basic.mk" rel=3D"noreferrer" target=3D"_bla=
nk">basic.mk</a> b/<a href=3D"http://basic.mk" rel=3D"noreferrer" target=3D=
"_blank">basic.mk</a><br>
+index 187dff3..fb080b7 100644<br>
+--- a/src/import/<a href=3D"http://basic.mk" rel=3D"noreferrer" target=3D"=
_blank">basic.mk</a><br>
++++ b/src/import/<a href=3D"http://basic.mk" rel=3D"noreferrer" target=3D"=
_blank">basic.mk</a><br>
+@@ -50,7 +50,7 @@ $(NAME): $(wildcard *.go) $(wildcard */*.go) VERSION.txt=
<br>
=C2=A0 .PHONY: static<br>
- static: ## Builds a static executable<br>
+ static: prebuild ## Builds a static executable.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @echo &quot;+ $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 $(GO) build \<br>
-+=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 $(GO) build -a -pkgdir dontusecurren=
tpkgs \<br>
+-=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D$(CGO_ENABLED) $(GO) build \<br>
++=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D$(CGO_ENABLED) $(GO) build -a -pkgdir =
dontusecurrentpkgs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -tags &quot;$(BUILDTAGS) static_buil=
d&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GO_LDFLAGS_STATIC} -o $(NAME) .<br=
>
<br>
=C2=A0-- <br>
-2.7.4<br>
+2.17.1<br>
<br>
diff --git a/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=
=3D"noreferrer" target=3D"_blank">netns_git.bb</a> b/recipes-networking/net=
ns/<a href=3D"http://netns_git.bb" rel=3D"noreferrer" target=3D"_blank">net=
ns_git.bb</a><br>
index f5cdace..da6aac2 100644<br>
--- a/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"noref=
errer" target=3D"_blank">netns_git.bb</a><br>
+++ b/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"noref=
errer" target=3D"_blank">netns_git.bb</a><br>
@@ -4,11 +4,10 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3D48ef0979a2=
bcc3fae14ff30b8a7f5dbf&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/genuinetools/net=
ns;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/genuine=
tools/netns;branch=3Dmaster</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Allow-selection-of-go=
-compiler.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile-force-rebuilding-=
all-packages-to-avoid-cgo.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRCREV =3D &quot;0da6ab0997707024debe68c91e940c9168041bf8&quot;<br>
-PV =3D &quot;0.4.0&quot;<br>
+SRCREV =3D &quot;9b103a19b917cc3762a33b7d78244b1d5e45ccfd&quot;<br>
+PV =3D &quot;0.5.3&quot;<br>
=C2=A0GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
@@ -46,6 +45,12 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Static builds work but are not recommended. S=
ee Makefile*cgo patch.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #oe_runmake static<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake build<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Golang forces permissions to 0500 on director=
ies and 0400 on files in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# the module cache which prevents us from easil=
y cleaning up the build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# directory. Let&#39;s just fix the permissions=
 here so we don&#39;t have to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# hack the clean tasks.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod -R u+w vendor/pkg/mod<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--00000000000061a0120587d8af2b--
