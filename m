Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CF99E00A6A; Wed,  9 May 2018 07:50:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1FD9E00948
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 May 2018 07:50:43 -0700 (PDT)
Received: by mail-lf0-f54.google.com with SMTP id q2-v6so6180325lfc.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 May 2018 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dPXIWuqgPksxPrYKppYzTIXmbtZe/8CW4l6aQ024gkg=;
	b=aFDqK3blVN4k+kfBwaZEQi8l1Ui+a/cWOJqNUqfAeSI7ETsFlmqXgVPhKWztCGgZn6
	tpYlejbIV3ZC472mZO7vakkUmJNHCV8rgIlZv4EL0IrT5uoj9v8ytZ5O/S2oQhj4EuPz
	GZIDTPn5eEPEJ3HanGCBo5OqFEPmIoNG7PbWDqvaskJ50fd5TI9cQIOvGTRYSkE0aX+0
	Kiu3iecUzUBQTSf+jOzKA7FJzoxTEt1gUWOZpCnBOA7nSBSX8I6aImp6uJYcj7iLGgc8
	FP9dsSKSg+2hfhZfM4CgkEarxWfHc+Bjl0ee6uG5/M6WPswLvscXcE+q3/4bJO/88UTG
	iU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dPXIWuqgPksxPrYKppYzTIXmbtZe/8CW4l6aQ024gkg=;
	b=WSAZFy0wVVaLmWBQ79pkNiex7jtfYghBIGRnAY5ALRqDOmy9V1q+mK0zA/dWxF9xzr
	aYfVaZ8ZsmdKe5ML+L/ZQrrx9wdwaF0CeOvQC8NjeMB2qmI62nWzjuoA+UzOAQ9u98b1
	//c7IFd8meNcQf5FwgJUTzfMvDldib25Q1b78JwIdH36DHkYdH/NyjA3+f/BSZ3qXcoM
	tLuWvGAiqdMkH5LUJnixJ0rGqZIyNrQHvDMK8sYN69AvD4L3qkYAeVEFKnNBOtmFXA0q
	woESkqu1JFv9KFxC2Mwdga9oAYAsqFBP9i2UnZAirFjNcoPaah5FyQYxqQge3GESBAH1
	hm2g==
X-Gm-Message-State: ALQs6tDZcAZbk9/pVE6yoDEVzUs3ViDXhkWDa5fbRxA4WpfksUG3TX/o
	Cyia3E5okK3tK9GNBEkqV5bbRI1HWs/xVKShwPoHRw==
X-Google-Smtp-Source: AB8JxZr5PMQBy1OAep6GCzronGDgxzyEYbObXhf2KKW6kX1cxoJ7U2bVTkUU/O1qdyti2J/4FOMKPCQJ//hHFAykKtw=
X-Received: by 2002:a2e:9248:: with SMTP id
	v8-v6mr15485948ljg.133.1525877442374; 
	Wed, 09 May 2018 07:50:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Wed, 9 May 2018 07:50:41 -0700 (PDT)
In-Reply-To: <CAPyrkgyFypV+=UyepiD26HtTmxmLd+srF3bVEX5+HOVqCcV-Cg@mail.gmail.com>
References: <1525810452-7637-1-git-send-email-pbarker@toganlabs.com>
	<1525810452-7637-2-git-send-email-pbarker@toganlabs.com>
	<CAPyrkgyFypV+=UyepiD26HtTmxmLd+srF3bVEX5+HOVqCcV-Cg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 May 2018 10:50:41 -0400
Message-ID: <CADkTA4MihEDNKtrGrwNjzHH3oyvF1Kz6Qz=OyQu5t04voCtT4A@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Wed, 09 May 2018 14:50:46 -0000
Content-Type: multipart/alternative; boundary="000000000000ec7a22056bc706e8"

--000000000000ec7a22056bc706e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 8, 2018 at 4:18 PM, Paul Barker <pbarker@toganlabs.com> wrote:

> On Tue, May 8, 2018 at 9:14 PM, Paul Barker <pbarker@toganlabs.com> wrote=
:
> > The netns project has been moved into the 'genuinetools' organisation
> and so
> > URLs have been updated. The copyright line in the license file has been
> updated
> > to reference "The Genuinetools Authors".
> >
> > The patch name has been updated to make it more suitable for submission
> > upstream.
> >
> > Signed-off-by: Paul Barker <paul@toganlabs.com>
>
> Serves me right for messing with gitconfig. I end up with the
> incorrect email address in my patch. *facepalm*
>

No worries. Applied, amended and pushed.

Bruce


>
> Should be:
>
> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
>
> > ---
> >  .../0001-Allow-selection-of-go-compiler.patch      | 107
> +++++++++++++++++++++
> >  recipes-networking/netns/netns_git.bb              |  16 +--
> >  2 files changed, 115 insertions(+), 8 deletions(-)
> >  create mode 100644 recipes-networking/netns/
> files/0001-Allow-selection-of-go-compiler.patch
> >
> > diff --git a/recipes-networking/netns/files/0001-Allow-selection-of-go-=
compiler.patch
> b/recipes-networking/netns/files/0001-Allow-selection-of-go-compiler.patc=
h
> > new file mode 100644
> > index 0000000..84fb9a4
> > --- /dev/null
> > +++ b/recipes-networking/netns/files/0001-Allow-selection-of-
> go-compiler.patch
> > @@ -0,0 +1,107 @@
> > +From 6576f228339b7931e05a8e861f085f483817806b Mon Sep 17 00:00:00 2001
> > +From: Paul Barker <pbarker@toganlabs.com>
> > +Date: Tue, 8 May 2018 11:01:14 +0000
> > +Subject: [PATCH] Allow selection of go compiler
> > +
> > +By running `make GO=3D/path/to/go` we can now select the appropriate g=
o
> compiler
> > +to use. This also makes it possible to cross compile netns more easily=
.
> > +
> > +Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> > +Upstream-status: Pending
> > +---
> > + Makefile | 25 ++++++++++++++-----------
> > + 1 file changed, 14 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 3a22f3e..476cb9b 100644
> > +--- a/src/import/Makefile
> > ++++ b/src/import/Makefile
> > +@@ -23,6 +23,9 @@ CTIMEVAR=3D-X $(PKG)/version.GITCOMMIT=3D$(GITCOMMIT=
) -X
> $(PKG)/version.VERSION=3D$(VE
> > + GO_LDFLAGS=3D-ldflags "-w $(CTIMEVAR)"
> > + GO_LDFLAGS_STATIC=3D-ldflags "-w $(CTIMEVAR) -extldflags -static"
> > +
> > ++# Set our default go compiler
> > ++GO :=3D go
> > ++
> > + # List the GOOS and GOARCH to build
> > + GOOSARCHES =3D linux/arm linux/arm64 linux/amd64 linux/386
> > +
> > +@@ -33,12 +36,12 @@ build: $(NAME) ## Builds a dynamic executable or
> package
> > +
> > + $(NAME): *.go VERSION.txt
> > +       @echo "+ $@"
> > +-      go build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> > ++      $(GO) build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> > +
> > + .PHONY: static
> > + static: ## Builds a static executable
> > +       @echo "+ $@"
> > +-      CGO_ENABLED=3D0 go build \
> > ++      CGO_ENABLED=3D0 $(GO) build \
> > +                               -tags "$(BUILDTAGS) static_build" \
> > +                               ${GO_LDFLAGS_STATIC} -o $(NAME) .
> > +
> > +@@ -55,23 +58,23 @@ lint: ## Verifies `golint` passes
> > + .PHONY: test
> > + test: ## Runs the go tests
> > +       @echo "+ $@"
> > +-      @go test -v -tags "$(BUILDTAGS) cgo" $(shell go list ./... |
> grep -v vendor)
> > ++      @$(GO) test -v -tags "$(BUILDTAGS) cgo" $(shell $(GO) list ./..=
.
> | grep -v vendor)
> > +
> > + .PHONY: vet
> > + vet: ## Verifies `go vet` passes
> > +       @echo "+ $@"
> > +-      @go vet $(shell go list ./... | grep -v vendor) | grep -v
> '.pb.go:' | tee /dev/stderr
> > ++      @$(GO) vet $(shell $(GO) list ./... | grep -v vendor) | grep -v
> '.pb.go:' | tee /dev/stderr
> > +
> > + .PHONY: staticcheck
> > + staticcheck: ## Verifies `staticcheck` passes
> > +       @echo "+ $@"
> > +-      @staticcheck $(shell go list ./... | grep -v vendor) | grep -v
> '.pb.go:' | tee /dev/stderr
> > ++      @staticcheck $(shell $(GO) list ./... | grep -v vendor) | grep
> -v '.pb.go:' | tee /dev/stderr
> > +
> > + .PHONY: cover
> > + cover: ## Runs go test with coverage
> > +       @echo "" > coverage.txt
> > +-      @for d in $(shell go list ./... | grep -v vendor); do \
> > +-              go test -race -coverprofile=3Dprofile.out
> -covermode=3Datomic "$$d"; \
> > ++      @for d in $(shell $(GO) list ./... | grep -v vendor); do \
> > ++              $(GO) test -race -coverprofile=3Dprofile.out
> -covermode=3Datomic "$$d"; \
> > +               if [ -f profile.out ]; then \
> > +                       cat profile.out >> coverage.txt; \
> > +                       rm profile.out; \
> > +@@ -81,11 +84,11 @@ cover: ## Runs go test with coverage
> > + .PHONY: install
> > + install: ## Installs the executable or package
> > +       @echo "+ $@"
> > +-      go install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
> > ++      $(GO) install -a -tags "$(BUILDTAGS)" ${GO_LDFLAGS} .
> > +
> > + define buildpretty
> > + mkdir -p $(BUILDDIR)/$(1)/$(2);
> > +-GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \
> > ++GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \
> > +        -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \
> > +        -a -tags "$(BUILDTAGS) static_build netgo" \
> > +        -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
> > +@@ -99,7 +102,7 @@ cross: *.go VERSION.txt ## Builds the cross-compile=
d
> binaries, creating a clean
> > +       $(foreach GOOSARCH,$(GOOSARCHES), $(call buildpretty,$(subst
> /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))
> > +
> > + define buildrelease
> > +-GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \
> > ++GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \
> > +        -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \
> > +        -a -tags "$(BUILDTAGS) static_build netgo" \
> > +        -installsuffix netgo ${GO_LDFLAGS_STATIC} .;
> > +@@ -115,7 +118,7 @@ release: *.go VERSION.txt ## Builds the
> cross-compiled binaries, naming them in
> > + .PHONY: bump-version
> > + BUMP :=3D patch
> > + bump-version: ## Bump the version in the version file. Set BUMP to [
> patch | major | minor ]
> > +-      @go get -u github.com/jessfraz/junk/sembump # update sembump
> tool
> > ++      @$(GO) get -u github.com/jessfraz/junk/sembump # update sembump
> tool
> > +       $(eval NEW_VERSION =3D $(shell sembump --kind $(BUMP) $(VERSION=
)))
> > +       @echo "Bumping VERSION.txt from $(VERSION) to $(NEW_VERSION)"
> > +       echo $(NEW_VERSION) > VERSION.txt
> > +--
> > +2.7.4
> > +
> > diff --git a/recipes-networking/netns/netns_git.bb
> b/recipes-networking/netns/netns_git.bb
> > index d35836e..82a961b 100644
> > --- a/recipes-networking/netns/netns_git.bb
> > +++ b/recipes-networking/netns/netns_git.bb
> > @@ -1,13 +1,13 @@
> >  HOMEPAGE =3D "https://github.com/jfrazelle/netns"
> >  SUMMARY =3D "Runc hook for setting up default bridge networking."
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D
> 20ce4c6a4f32d6ee4a68e3a7506db3f1"
> > +LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D
> 48ef0979a2bcc3fae14ff30b8a7f5dbf"
> >
> > -SRC_URI =3D "git://github.com/jessfraz/netns;branch=3Dmaster \
> > -           file://0001-Use-correct-go-cross-compiler.patch \
> > +SRC_URI =3D "git://github.com/genuinetools/netns;branch=3Dmaster \
> > +           file://0001-Allow-selection-of-go-compiler.patch \
> >            "
> > -SRCREV =3D "74e23a0e5c4e7ac011aafcc4623586c196f1b3ef"
> > -PV =3D "0.2.1"
> > +SRCREV =3D "0da6ab0997707024debe68c91e940c9168041bf8"
> > +PV =3D "0.4.0"
> >  GO_IMPORT =3D "import"
> >
> >  S =3D "${WORKDIR}/git"
> > @@ -26,9 +26,9 @@ do_compile() {
> >         # We also need to link in the ipallocator and version
> directories as
> >         # they are not under the src directory.
> >         ln -sfn . "${S}/src/import/vendor/src"
> > -       mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/netns"
> > -       ln -sfn "${S}/src/import/ipallocator"
> "${S}/src/import/vendor/src/github.com/jessfraz/netns/ipallocator"
> > -       ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/g=
i
> thub.com/jessfraz/netns/version"
> > +       mkdir -p "${S}/src/import/vendor/src/gi
> thub.com/genuinetools/netns"
> > +       ln -sfn "${S}/src/import/ipallocator"
> "${S}/src/import/vendor/src/github.com/genuinetools/netns/ipallocator"
> > +       ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/g=
i
> thub.com/genuinetools/netns/version"
> >         export GOPATH=3D"${S}/src/import/vendor"
> >
> >         # Pass the needed cflags/ldflags so that cgo
> > --
> > 2.7.4
> >
>
>
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000ec7a22056bc706e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 8, 2018 at 4:18 PM, Paul Barker <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:pbarker@toganlabs.com" target=3D"_blank">pbarker@toganlabs.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n Tue, May 8, 2018 at 9:14 PM, Paul Barker &lt;<a href=3D"mailto:pbarker@to=
ganlabs.com">pbarker@toganlabs.com</a>&gt; wrote:<br>
&gt; The netns project has been moved into the &#39;genuinetools&#39; organ=
isation and so<br>
&gt; URLs have been updated. The copyright line in the license file has bee=
n updated<br>
&gt; to reference &quot;The Genuinetools Authors&quot;.<br>
&gt;<br>
&gt; The patch name has been updated to make it more suitable for submissio=
n<br>
&gt; upstream.<br>
&gt;<br>
&gt; Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@toganlabs.com">p=
aul@toganlabs.com</a>&gt;<br>
<br>
</span>Serves me right for messing with gitconfig. I end up with the<br>
incorrect email address in my patch. *facepalm*<br></blockquote><div><br></=
div><div>No worries. Applied, amended and pushed.</div><div><br></div><div>=
Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Should be:<br>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com">pba=
rker@toganlabs.com</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 .../0001-Allow-selection-of-<wbr>go-compiler.patch=C2=A0 =C2=A0 =
=C2=A0 | 107 +++++++++++++++++++++<br>
&gt;=C2=A0 recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"=
noreferrer" target=3D"_blank">netns<wbr>_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +--<br>
&gt;=C2=A0 2 files changed, 115 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 create mode 100644 recipes-networking/netns/<wbr>files/0001-Allo=
w-selection-of-<wbr>go-compiler.patch<br>
&gt;<br>
&gt; diff --git a/recipes-networking/netns/<wbr>files/0001-Allow-selection-=
of-<wbr>go-compiler.patch b/recipes-networking/netns/<wbr>files/0001-Allow-=
selection-of-<wbr>go-compiler.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..84fb9a4<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-networking/netns/<wbr>files/0001-Allow-selection-of-<wbr=
>go-compiler.patch<br>
&gt; @@ -0,0 +1,107 @@<br>
&gt; +From 6576f228339b7931e05a8e861f085f<wbr>483817806b Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com">pbarke=
r@toganlabs.com</a>&gt;<br>
&gt; +Date: Tue, 8 May 2018 11:01:14 +0000<br>
&gt; +Subject: [PATCH] Allow selection of go compiler<br>
&gt; +<br>
&gt; +By running `make GO=3D/path/to/go` we can now select the appropriate =
go compiler<br>
&gt; +to use. This also makes it possible to cross compile netns more easil=
y.<br>
&gt; +<br>
&gt; +Signed-off-by: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.co=
m">pbarker@toganlabs.com</a>&gt;<br>
&gt; +Upstream-status: Pending<br>
&gt; +---<br>
&gt; + Makefile | 25 ++++++++++++++-----------<br>
&gt; + 1 file changed, 14 insertions(+), 11 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Makefile b/Makefile<br>
&gt; +index 3a22f3e..476cb9b 100644<br>
&gt; +--- a/src/import/Makefile<br>
&gt; ++++ b/src/import/Makefile<br>
&gt; +@@ -23,6 +23,9 @@ CTIMEVAR=3D-X $(PKG)/version.GITCOMMIT=3D$(<wbr>GIT=
COMMIT) -X $(PKG)/version.VERSION=3D$(VE<br>
&gt; + GO_LDFLAGS=3D-ldflags &quot;-w $(CTIMEVAR)&quot;<br>
&gt; + GO_LDFLAGS_STATIC=3D-ldflags &quot;-w $(CTIMEVAR) -extldflags -stati=
c&quot;<br>
&gt; +<br>
&gt; ++# Set our default go compiler<br>
&gt; ++GO :=3D go<br>
&gt; ++<br>
&gt; + # List the GOOS and GOARCH to build<br>
&gt; + GOOSARCHES =3D linux/arm linux/arm64 linux/amd64 linux/386<br>
&gt; +<br>
&gt; +@@ -33,12 +36,12 @@ build: $(NAME) ## Builds a dynamic executable or =
package<br>
&gt; +<br>
&gt; + $(NAME): *.go VERSION.txt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 go build -tags &quot;$(BUILDTAGS)&quot; ${GO_LD=
FLAGS} -o $(NAME) .<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(GO) build -tags &quot;$(BUILDTAGS)&quot; ${GO=
_LDFLAGS} -o $(NAME) .<br>
&gt; +<br>
&gt; + .PHONY: static<br>
&gt; + static: ## Builds a static executable<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 go build \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 $(GO) build \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-tags &quot;$(BUILDTAGS) static_b=
uild&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GO_LDFLAGS_STATIC} -o $(NAME) .=
<br>
&gt; +<br>
&gt; +@@ -55,23 +58,23 @@ lint: ## Verifies `golint` passes<br>
&gt; + .PHONY: test<br>
&gt; + test: ## Runs the go tests<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 @go test -v -tags &quot;$(BUILDTAGS) cgo&quot; =
$(shell go list ./... | grep -v vendor)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @$(GO) test -v -tags &quot;$(BUILDTAGS) cgo&quo=
t; $(shell $(GO) list ./... | grep -v vendor)<br>
&gt; +<br>
&gt; + .PHONY: vet<br>
&gt; + vet: ## Verifies `go vet` passes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 @go vet $(shell go list ./... | grep -v vendor)=
 | grep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @$(GO) vet $(shell $(GO) list ./... | grep -v v=
endor) | grep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
&gt; +<br>
&gt; + .PHONY: staticcheck<br>
&gt; + staticcheck: ## Verifies `staticcheck` passes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 @staticcheck $(shell go list ./... | grep -v ve=
ndor) | grep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @staticcheck $(shell $(GO) list ./... | grep -v=
 vendor) | grep -v &#39;.pb.go:&#39; | tee /dev/stderr<br>
&gt; +<br>
&gt; + .PHONY: cover<br>
&gt; + cover: ## Runs go test with coverage<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;&quot; &gt; coverage.txt<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 @for d in $(shell go list ./... | grep -v vendo=
r); do \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 go test -race -cove=
rprofile=3Dprofile.out -covermode=3Datomic &quot;$$d&quot;; \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @for d in $(shell $(GO) list ./... | grep -v ve=
ndor); do \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GO) test -race -c=
overprofile=3Dprofile.out -covermode=3Datomic &quot;$$d&quot;; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f profil=
e.out ]; then \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0cat profile.out &gt;&gt; coverage.txt; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rm profile.out; \<br>
&gt; +@@ -81,11 +84,11 @@ cover: ## Runs go test with coverage<br>
&gt; + .PHONY: install<br>
&gt; + install: ## Installs the executable or package<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;+ $@&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 go install -a -tags &quot;$(BUILDTAGS)&quot; ${=
GO_LDFLAGS} .<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 $(GO) install -a -tags &quot;$(BUILDTAGS)&quot;=
 ${GO_LDFLAGS} .<br>
&gt; +<br>
&gt; + define buildpretty<br>
&gt; + mkdir -p $(BUILDDIR)/$(1)/$(2);<br>
&gt; +-GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \<br>
&gt; ++GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $(BUILDDIR)/$(1)/$(2)/$(NAME) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -a -tags &quot;$(BUILDTAGS) static_build =
netgo&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -installsuffix netgo ${GO_LDFLAGS_STATIC}=
 .;<br>
&gt; +@@ -99,7 +102,7 @@ cross: *.go VERSION.txt ## Builds the cross-compil=
ed binaries, creating a clean<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach GOOSARCH,$(GOOSARCHES), $(call b=
uildpretty,$(subst /,,$(dir $(GOOSARCH))),$(notdir $(GOOSARCH))))<br>
&gt; +<br>
&gt; + define buildrelease<br>
&gt; +-GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 go build \<br>
&gt; ++GOOS=3D$(1) GOARCH=3D$(2) CGO_ENABLED=3D0 $(GO) build \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $(BUILDDIR)/$(NAME)-$(1)-$(2) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -a -tags &quot;$(BUILDTAGS) static_build =
netgo&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -installsuffix netgo ${GO_LDFLAGS_STATIC}=
 .;<br>
&gt; +@@ -115,7 +118,7 @@ release: *.go VERSION.txt ## Builds the cross-com=
piled binaries, naming them in<br>
&gt; + .PHONY: bump-version<br>
&gt; + BUMP :=3D patch<br>
&gt; + bump-version: ## Bump the version in the version file. Set BUMP to [=
 patch | major | minor ]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 @go get -u <a href=3D"http://github.com/jessfra=
z/junk/sembump" rel=3D"noreferrer" target=3D"_blank">github.com/jessfraz/ju=
nk/<wbr>sembump</a> # update sembump tool<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @$(GO) get -u <a href=3D"http://github.com/jess=
fraz/junk/sembump" rel=3D"noreferrer" target=3D"_blank">github.com/jessfraz=
/junk/<wbr>sembump</a> # update sembump tool<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(eval NEW_VERSION =3D $(shell sembump --k=
ind $(BUMP) $(VERSION)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Bumping VERSION.txt from $(VER=
SION) to $(NEW_VERSION)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(NEW_VERSION) &gt; VERSION.txt<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; +<br>
&gt; diff --git a/recipes-networking/netns/<a href=3D"http://netns_git.bb" =
rel=3D"noreferrer" target=3D"_blank">net<wbr>ns_git.bb</a> b/recipes-networ=
king/netns/<a href=3D"http://netns_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">net<wbr>ns_git.bb</a><br>
&gt; index d35836e..82a961b 100644<br>
&gt; --- a/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"=
noreferrer" target=3D"_blank">net<wbr>ns_git.bb</a><br>
&gt; +++ b/recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"=
noreferrer" target=3D"_blank">net<wbr>ns_git.bb</a><br>
&gt; @@ -1,13 +1,13 @@<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://github.com/jfrazelle/netns=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/jfrazelle/<wbr>ne=
tns</a>&quot;<br>
&gt;=C2=A0 SUMMARY =3D &quot;Runc hook for setting up default bridge networ=
king.&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;<wbr>md5=3D<wbr>=
20ce4c6a4f32d6ee4a68e3a7506db3<wbr>f1&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;<wbr>md5=3D<wbr>=
48ef0979a2bcc3fae14ff30b8a7f5d<wbr>bf&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/jessfraz/netns;b=
ranch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/jessfraz/<w=
br>netns;branch=3Dmaster</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-correct-go-<=
wbr>cross-compiler.patch \<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/genuinetools/net=
ns;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/<wbr>ge=
nuinetools/netns;branch=3D<wbr>master</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Allow-selection-=
<wbr>of-go-compiler.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; -SRCREV =3D &quot;<wbr>74e23a0e5c4e7ac011aafcc4623586<wbr>c196f1b3ef&q=
uot;<br>
&gt; -PV =3D &quot;0.2.1&quot;<br>
&gt; +SRCREV =3D &quot;<wbr>0da6ab0997707024debe68c91e940c<wbr>9168041bf8&q=
uot;<br>
&gt; +PV =3D &quot;0.4.0&quot;<br>
&gt;=C2=A0 GO_IMPORT =3D &quot;import&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; @@ -26,9 +26,9 @@ do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We also need to link in the ipalloc=
ator and version directories as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# they are not under the src director=
y.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn . &quot;${S}/src/import/vendo=
r/src&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${S}/src/import/vendor/src/=
<a href=3D"http://github.com/jessfraz/netns" rel=3D"noreferrer" target=3D"_=
blank">gi<wbr>thub.com/jessfraz/netns</a>&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/src/import/ipallocator&=
quot; &quot;${S}/src/import/vendor/src/<a href=3D"http://github.com/jessfra=
z/netns/ipallocator" rel=3D"noreferrer" target=3D"_blank">gi<wbr>thub.com/j=
essfraz/netns/<wbr>ipallocator</a>&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/src/import/version&quot=
; &quot;${S}/src/import/vendor/src/<a href=3D"http://github.com/jessfraz/ne=
tns/version" rel=3D"noreferrer" target=3D"_blank">gi<wbr>thub.com/jessfraz/=
netns/<wbr>version</a>&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${S}/src/import/vendor/src/=
<a href=3D"http://github.com/genuinetools/netns" rel=3D"noreferrer" target=
=3D"_blank">gi<wbr>thub.com/genuinetools/netns</a>&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/src/import/ipallocator&=
quot; &quot;${S}/src/import/vendor/src/<a href=3D"http://github.com/genuine=
tools/netns/ipallocator" rel=3D"noreferrer" target=3D"_blank">gi<wbr>thub.c=
om/genuinetools/netns/<wbr>ipallocator</a>&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn &quot;${S}/src/import/version&quot=
; &quot;${S}/src/import/vendor/src/<a href=3D"http://github.com/genuinetool=
s/netns/version" rel=3D"noreferrer" target=3D"_blank">gi<wbr>thub.com/genui=
netools/netns/<wbr>version</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import=
/<wbr>vendor&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so t=
hat cgo<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
<br>
<br>
<br>
-- <br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">Paul Barker<br>
Tog=C3=A1n Labs Ltd<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--000000000000ec7a22056bc706e8--
