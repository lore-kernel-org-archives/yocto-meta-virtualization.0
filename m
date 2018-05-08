Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7EB9E00B8E; Tue,  8 May 2018 13:18:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1A7BE0084D
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 May 2018 13:18:37 -0700 (PDT)
Received: by mail-wr0-f195.google.com with SMTP id 94-v6so32252801wrf.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 May 2018 13:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cRP9TwpWE+f8PB7EEpZcD06J/R7YKx3owaK8vQBif6A=;
	b=FWj7mNEjQZrmgkin0D8vmnKTQDVJrTQiG4LafPa5cKMMxj+zpZmViLEiNqdfTAwI5h
	46KMfyh9HtvBpBDeiArr4OKnDHeeqOozAVdxovgSi+U5CIDlJDj60+efCzBe+nto8i6T
	Z7X5jqZxwtcJ9UwQo8fePF6WwEqYqDRXBsl8bqrarH9d5LBx0ZO/TLw8i/jw/ehuu/D4
	+lqImFPESt142OLomb7u7a5xTuuI6RwAQ5EjOJTYu5sQ/SSr2ef73IscqF/AFzqaJVyg
	uTcCgnZnBMTuo7lSTpS9HrK6JJgRNI3OAP3AZYwrVvzEcRMT6h7XUDiGf6+aZRLMegPS
	0pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cRP9TwpWE+f8PB7EEpZcD06J/R7YKx3owaK8vQBif6A=;
	b=Zd4onYNcGMHxMN5PETtaMAJWjSFa1HWGVrgYbmlzJJ93jrpnARB0Wd9HODbVEFcWPr
	fPMj9o7AuCdeYicOXm34khNly3rsQ9ouphjgZDe/3lDdxT5SNJUoYE3ERtS/4JbQ/oEO
	1nyhwg0SCP5J7vk2bB/EBWkoa07QyOI0uGMWm0QyZFN9BcLqHhqNScyJRSnKWPaafqva
	A4xE9A1j42DHp0CkFA7qc2MkPnjMDJbf2vvuiBOzLk0Zoe9of5OVa12i09gNZMDJCdMx
	wHLVVYJVkXsGgMDxHi9f+vG1oT9tDKUW9DJlEPKkMXSyiUkvTFPlswpHSntHKLm8KSd7
	gj0Q==
X-Gm-Message-State: ALQs6tDaiGcaXM/erbs/UY69ELpoC0NW0oJOp+cP+GhcGi1JvN/UnNtn
	pLIkLgwVMfjGJ6XYW9Ps+pfdWUeWGOlcYlY+XRJMUx52
X-Google-Smtp-Source: AB8JxZr4h6QsEqtJGvuTd5yxbAYRi6QgvvqoQLAh7oMB+DOoCASaAhXeFse9PEqjqi9/+TfZ18cFD2Lojmi3MvoJ+U0=
X-Received: by 2002:adf:e843:: with SMTP id
	d3-v6mr36930228wrn.146.1525810715926; 
	Tue, 08 May 2018 13:18:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.229.205 with HTTP; Tue, 8 May 2018 13:18:35 -0700 (PDT)
In-Reply-To: <1525810452-7637-2-git-send-email-pbarker@toganlabs.com>
References: <1525810452-7637-1-git-send-email-pbarker@toganlabs.com>
	<1525810452-7637-2-git-send-email-pbarker@toganlabs.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Tue, 8 May 2018 21:18:35 +0100
Message-ID: <CAPyrkgyFypV+=UyepiD26HtTmxmLd+srF3bVEX5+HOVqCcV-Cg@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/2] netns: Update to v0.4.0
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
X-List-Received-Date: Tue, 08 May 2018 20:18:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 8, 2018 at 9:14 PM, Paul Barker <pbarker@toganlabs.com> wrote:
> The netns project has been moved into the 'genuinetools' organisation and=
 so
> URLs have been updated. The copyright line in the license file has been u=
pdated
> to reference "The Genuinetools Authors".
>
> The patch name has been updated to make it more suitable for submission
> upstream.
>
> Signed-off-by: Paul Barker <paul@toganlabs.com>

Serves me right for messing with gitconfig. I end up with the
incorrect email address in my patch. *facepalm*

Should be:

Signed-off-by: Paul Barker <pbarker@toganlabs.com>

> ---
>  .../0001-Allow-selection-of-go-compiler.patch      | 107 +++++++++++++++=
++++++
>  recipes-networking/netns/netns_git.bb              |  16 +--
>  2 files changed, 115 insertions(+), 8 deletions(-)
>  create mode 100644 recipes-networking/netns/files/0001-Allow-selection-o=
f-go-compiler.patch
>
> diff --git a/recipes-networking/netns/files/0001-Allow-selection-of-go-co=
mpiler.patch b/recipes-networking/netns/files/0001-Allow-selection-of-go-co=
mpiler.patch
> new file mode 100644
> index 0000000..84fb9a4
> --- /dev/null
> +++ b/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.=
patch
> @@ -0,0 +1,107 @@
> +From 6576f228339b7931e05a8e861f085f483817806b Mon Sep 17 00:00:00 2001
> +From: Paul Barker <pbarker@toganlabs.com>
> +Date: Tue, 8 May 2018 11:01:14 +0000
> +Subject: [PATCH] Allow selection of go compiler
> +
> +By running `make GO=3D/path/to/go` we can now select the appropriate go =
compiler
> +to use. This also makes it possible to cross compile netns more easily.
> +
> +Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> +Upstream-status: Pending
> +---
> + Makefile | 25 ++++++++++++++-----------
> + 1 file changed, 14 insertions(+), 11 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 3a22f3e..476cb9b 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -23,6 +23,9 @@ CTIMEVAR=3D-X $(PKG)/version.GITCOMMIT=3D$(GITCOMMIT) =
-X $(PKG)/version.VERSION=3D$(VE
> + GO_LDFLAGS=3D-ldflags "-w $(CTIMEVAR)"
> + GO_LDFLAGS_STATIC=3D-ldflags "-w $(CTIMEVAR) -extldflags -static"
> +
> ++# Set our default go compiler
> ++GO :=3D go
> ++
> + # List the GOOS and GOARCH to build
> + GOOSARCHES =3D linux/arm linux/arm64 linux/amd64 linux/386
> +
> +@@ -33,12 +36,12 @@ build: $(NAME) ## Builds a dynamic executable or pac=
kage
> +
> + $(NAME): *.go VERSION.txt
> +       @echo "+ $@"
> +-      go build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> ++      $(GO) build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> +
> + .PHONY: static
> + static: ## Builds a static executable
> +       @echo "+ $@"
> +-      CGO_ENABLED=3D0 go build \
> ++      CGO_ENABLED=3D0 $(GO) build \
> +                               -tags "$(BUILDTAGS) static_build" \
> +                               ${GO_LDFLAGS_STATIC} -o $(NAME) .
> +
> +@@ -55,23 +58,23 @@ lint: ## Verifies `golint` passes
> + .PHONY: test
> + test: ## Runs the go tests
> +       @echo "+ $@"
> +-      @go test -v -tags "$(BUILDTAGS) cgo" $(shell go list ./... | grep=
 -v vendor)
> ++      @$(GO) test -v -tags "$(BUILDTAGS) cgo" $(shell $(GO) list ./... =
| grep -v vendor)
> +
> + .PHONY: vet
> + vet: ## Verifies `go vet` passes
> +       @echo "+ $@"
> +-      @go vet $(shell go list ./... | grep -v vendor) | grep -v '.pb.go=
:' | tee /dev/stderr
> ++      @$(GO) vet $(shell $(GO) list ./... | grep -v vendor) | grep -v '=
.pb.go:' | tee /dev/stderr
> +
> + .PHONY: staticcheck
> + staticcheck: ## Verifies `staticcheck` passes
> +       @echo "+ $@"
> +-      @staticcheck $(shell go list ./... | grep -v vendor) | grep -v '.=
pb.go:' | tee /dev/stderr
> ++      @staticcheck $(shell $(GO) list ./... | grep -v vendor) | grep -v=
 '.pb.go:' | tee /dev/stderr
> +
> + .PHONY: cover
> + cover: ## Runs go test with coverage
> +       @echo "" > coverage.txt
> +-      @for d in $(shell go list ./... | grep -v vendor); do \
> +-              go test -race -coverprofile=3Dprofile.out -covermode=3Dat=
omic "$$d"; \
> ++      @for d in $(shell $(GO) list ./... | grep -v vendor); do \
> ++              $(GO) test -race -coverprofile=3Dprofile.out -covermode=
=3Datomic "$$d"; \
> +               if [ -f profile.out ]; then \
> +                       cat profile.out >> coverage.txt; \
> +                       rm profile.out; \
> +@@ -81,11 +84,11 @@ cover: ## Runs go test with coverage
> + .PHONY: install
> + install: ## Installs the executable or package
> +       @echo "+ $@"
> +-      go install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
> ++      $(GO) install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
> +
> + define buildpretty
> + mkdir -p $(BUILDDIR)/$(1)/$(2);
> +-GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \
> ++GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \
> +        -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \
> +        -a -tags "$(BUILDTAGS) static_build netgo" \
> +        -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
> +@@ -99,7 +102,7 @@ cross: *.go VERSION.txt ## Builds the cross-compiled =
binaries, creating a clean
> +       $(foreach GOOSARCH,$(GOOSARCHES), $(call buildpretty,$(subst /,,$=
(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))
> +
> + define buildrelease
> +-GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \
> ++GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \
> +        -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \
> +        -a -tags "$(BUILDTAGS) static_build netgo" \
> +        -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
> +@@ -115,7 +118,7 @@ release: *.go VERSION.txt ## Builds the cross-compil=
ed binaries, naming them in
> + .PHONY: bump-version
> + BUMP :=3D patch
> + bump-version: ## Bump the version in the version file. Set BUMP to [ pa=
tch | major | minor ]
> +-      @go get -u github.com/jessfraz/junk/sembump # update sembump tool
> ++      @$(GO) get -u github.com/jessfraz/junk/sembump # update sembump t=
ool
> +       $(eval NEW_VERSION =3D $(shell sembump --kind $(BUMP) $(VERSION))=
)
> +       @echo "Bumping VERSION.txt from $(VERSION) to $(NEW_VERSION)"
> +       echo $(NEW_VERSION) > VERSION.txt
> +--
> +2.7.4
> +
> diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/n=
etns/netns_git.bb
> index d35836e..82a961b 100644
> --- a/recipes-networking/netns/netns_git.bb
> +++ b/recipes-networking/netns/netns_git.bb
> @@ -1,13 +1,13 @@
>  HOMEPAGE =3D "https://github.com/jfrazelle/netns"
>  SUMMARY =3D "Runc hook for setting up default bridge networking."
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D20ce4c6a4f32d6ee4a=
68e3a7506db3f1"
> +LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D48ef0979a2bcc3fae1=
4ff30b8a7f5dbf"
>
> -SRC_URI =3D "git://github.com/jessfraz/netns;branch=3Dmaster \
> -           file://0001-Use-correct-go-cross-compiler.patch \
> +SRC_URI =3D "git://github.com/genuinetools/netns;branch=3Dmaster \
> +           file://0001-Allow-selection-of-go-compiler.patch \
>            "
> -SRCREV =3D "74e23a0e5c4e7ac011aafcc4623586c196f1b3ef"
> -PV =3D "0.2.1"
> +SRCREV =3D "0da6ab0997707024debe68c91e940c9168041bf8"
> +PV =3D "0.4.0"
>  GO_IMPORT =3D "import"
>
>  S =3D "${WORKDIR}/git"
> @@ -26,9 +26,9 @@ do_compile() {
>         # We also need to link in the ipallocator and version directories=
 as
>         # they are not under the src directory.
>         ln -sfn . "${S}/src/import/vendor/src"
> -       mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/netns"
> -       ln -sfn "${S}/src/import/ipallocator" "${S}/src/import/vendor/src=
/github.com/jessfraz/netns/ipallocator"
> -       ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/git=
hub.com/jessfraz/netns/version"
> +       mkdir -p "${S}/src/import/vendor/src/github.com/genuinetools/netn=
s"
> +       ln -sfn "${S}/src/import/ipallocator" "${S}/src/import/vendor/src=
/github.com/genuinetools/netns/ipallocator"
> +       ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/git=
hub.com/genuinetools/netns/version"
>         export GOPATH=3D"${S}/src/import/vendor"
>
>         # Pass the needed cflags/ldflags so that cgo
> --
> 2.7.4
>



--=20
Paul Barker
Tog=C3=A1n Labs Ltd

