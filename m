Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99C12E00D59; Mon,  9 Sep 2019 10:24:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.177 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2023E00D33
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:24:57 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 7so13545446ljw.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TieGtA54trWWEQDAwAd5nKxmAGoVUQMfH613ISWhCls=;
	b=uEFhykguMd4aoq+b+au05jKmHLQICHnvfg0S/rCJwq+z49SjmEP+YEpwGPGYkXN0uQ
	Mkh1PSiO+1cY+rdkKIEB7ZrwCMb32x+UB0Npvao7SNbkKDiq9XHv+ex/EIHes4oNEY+i
	jXpxhMMvIy0dDAQHdeAAU0JCJ1ZPsU9hWDD37WcCDYSQbG8IxRoehnnxe/47zjBKuA7K
	9Fv8dXYmMLdcy08mNrkqewxqHijUGvSq6gyZXp+ULgO936fZcXrty0qRnA7H1kvUW1+Z
	YUC7n2cviMuijdiYH6n2FzVo19YzuoPDcudEnjNCzC+d1JKByi+XLEfHRgeh9qC6fKjC
	xjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TieGtA54trWWEQDAwAd5nKxmAGoVUQMfH613ISWhCls=;
	b=qorDWtPn0fbL/q0s0ylJFKQARGXI5k3RlxwuMIGPoZBoiaOqo4rwpZwqUwTM+uP5D9
	qXSozVH1rYaC+R5o2P7P0AyrGCLzwRyV5XKhOHotrnqAJt5WGQVs+n4PMSYKFPDx9MYQ
	i76bOfhDMVqWBpCRNh5cIFAIr+nBU2DvRbEX0sTI+PVNSGAurw82Nw7L7x7+/82XXxUy
	Et48K4/YL28JZQHZeZ8xSxdwe1VfOT+BI3+pncXzLrt17WYvRrj521+QaAgqPI+A+FeU
	NfL2nhhFyK1Xvb63RyEXM6pMO4YEDpfJK2wHgQL3bdRJfADQ3NutIIi4e2M+GTAnNtxI
	L+tA==
X-Gm-Message-State: APjAAAWlWhhsr7sI2DEcRkkHaYi1b4VChj+qYgCvUMQAl/HwUz1w1/Yh
	WPpaWvszhWMrX3YfIS6ZoQipaTkeBYS7Yq3gCXp0v8FQ
X-Google-Smtp-Source: APXvYqyuixbpu0o23FAnab/qoazWx3SvJRnycb4ufqF3CaGpD19nE43bPEQTfjWoccEkt4BbWBaIG19md5BAtA+lRjg=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr17635067lje.118.1568049896479;
	Mon, 09 Sep 2019 10:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190807011444.31930-1-Qi.Chen@windriver.com>
	<20190807011444.31930-2-Qi.Chen@windriver.com>
	<def0f1ad189d9ba70c01cac4043b4265@agner.ch>
	<9c1903af-72f6-13a8-b907-71989f119024@windriver.com>
	<b2b76b2f2d007083f4260a1fa960fb0d@agner.ch>
In-Reply-To: <b2b76b2f2d007083f4260a1fa960fb0d@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Sep 2019 13:24:45 -0400
Message-ID: <CADkTA4Nbcztzy=MZ=HPJ5Zg6a0Tqzsnw3oFihTJdEPPPdBJVBg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V2 2/2] runc: add PACKAGECONFIG to allow building as static or not
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
X-List-Received-Date: Mon, 09 Sep 2019 17:24:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 9, 2019 at 6:34 AM Stefan Agner <stefan@agner.ch> wrote:
>
> On 2019-09-09 12:14, ChenQi wrote:
> > On 09/09/2019 05:35 PM, Stefan Agner wrote:
> >> Hi Chen,
> >>
> >> On 2019-08-07 03:14, Chen Qi wrote:
> >>> Add a new PACKAGECONFIG, static, which when enabled will build
> >>> runc as static. Default to enable it.
> >>>
> >>> We need this because we should allow users to build runc as not
> >>> static so that when docker's cgroup driver is set to systemd,
> >>> we don't get error.
> >> Do you happen to know why we use statically linked runc by default? It
> >> seems that distros nowadays use statically linked version of it.
> >>
> >> To some degree it seems that we overturn a distro decision here
> >> (DISABLE_STATIC).
> >>
> >> --
> >> Stefan
> >>
> >
> > Please refer to
> > https://lists.yoctoproject.org/pipermail/meta-virtualization/2019-August/004338.html
> >
>
> Thanks for the link!
>
> > runc is one of those things that may need to be static in some configurations.
> > Since it has security impact, updating runc (and the libc) should be done in
> > paralell and this can cause problems otherwise.
>
> Hm, I don't completely get that argument, as in OE we normally do full
> image updates. So libc will be updated with runc anyways.

Some do .. many don't in the container based systems. In fact, for my
meta-virt use cases, there's *never* a full image update.

>
> Also that argument you can make for every component, not sure why runc
> is that special.

runc is very much plumbing in a lot of the setups that I know about.
It is used in some small systems (more 'small' in terms of
functionality and runtime complexity, not disk space) for starting
very early (but yet containerized) processes. And for the
container-in-container use cases, it is used as a shared runtime (bind
mounted, etc), which allows it to be atomically updated for a system
.. etc, etc.

>
> >
> > Now, that doesn't mean it HAS to be static, but it should be a configuration and
> > may be wise to have as the default to be static.
>
> ...
>
> > So PACKAGECONFIG is the right answer here.  I'm not sure what the right default
> > for the recipe is.... but in the end the users configuration and distro can and
> > should be able to select what they want.
>
> IMHO, default should be dynamically linked since this is the default in
> OE in general. Also since OE images are commonly updated as a whole and
> in embedded we often care more about space saving.
>
> Anyways, good there is a package config now, and now that I know the
> reasons it is compiled statically by default I can safely flip that
> switch for our distro.

Indeed. That's why I wanted it to be a packageconfig, everyone can
chose what best suits their distro.

Cheers,

Bruce

>
> --
> Stefan
>
>
> > Best Regards,
> > Chen Qi
> >
> >>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>> ---
> >>>   ...-GOBUILDFLAGS-for-runc-and-remove-re.patch | 35 +++++++++++++++++++
> >>>   ...ld-drop-recvtty-and-use-GOBUILDFLAGS.patch | 22 ------------
> >>>   recipes-containers/runc/runc-docker_git.bb    |  2 +-
> >>>   .../runc/runc-opencontainers_git.bb           |  1 +
> >>>   recipes-containers/runc/runc.inc              | 10 ++++--
> >>>   5 files changed, 45 insertions(+), 25 deletions(-)
> >>>   create mode 100644
> >>> recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> >>>   delete mode 100644
> >>> recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
> >>>
> >>> diff --git
> >>> a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> >>> b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> >>> new file mode 100644
> >>> index 0000000..94cbb4c
> >>> --- /dev/null
> >>> +++
> >>> b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> >>> @@ -0,0 +1,35 @@
> >>> +From d2c47a973f354ffd505bb4e809c59e57b543726d Mon Sep 17 00:00:00 2001
> >>> +From: Chen Qi <Qi.Chen@windriver.com>
> >>> +Date: Tue, 6 Aug 2019 19:01:45 +0800
> >>> +Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty
> >>> + from static
> >>> +
> >>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>> +---
> >>> + Makefile | 3 +--
> >>> + 1 file changed, 1 insertion(+), 2 deletions(-)
> >>> +
> >>> +diff --git a/Makefile b/Makefile
> >>> +index 0f26a1c8..a0c6b40b 100644
> >>> +--- a/src/import/Makefile
> >>> ++++ b/src/import/Makefile
> >>> +@@ -30,7 +30,7 @@ SHELL := $(shell command -v bash 2>/dev/null)
> >>> + .DEFAULT: runc
> >>> +
> >>> + runc: $(SOURCES)
> >>> +-  $(GO) build -buildmode=pie $(EXTRA_FLAGS) -ldflags "-X
> >>> main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)"
> >>> -tags "$(BUILDTAGS)" -o runc .
> >>> ++  $(GO) build $(GOBUILDFLAGS) $(EXTRA_FLAGS) -ldflags "-X
> >>> main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)"
> >>> -tags "$(BUILDTAGS)" -o runc .
> >>> +
> >>> + all: runc recvtty
> >>> +
> >>> +@@ -41,7 +41,6 @@ contrib/cmd/recvtty/recvtty: $(SOURCES)
> >>> +
> >>> + static: $(SOURCES)
> >>> +   CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
> >>> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
> >>> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
> >>> $(EXTRA_LDFLAGS)" -o runc .
> >>> +-  CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
> >>> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
> >>> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
> >>> $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
> >>> +
> >>> + release:
> >>> +   script/release.sh -r release/$(VERSION) -v $(VERSION)
> >>> +--
> >>> +2.17.1
> >>> +
> >>> diff --git
> >>> a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
> >>> b/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
> >>> deleted file mode 100644
> >>> index 9ba9957..0000000
> >>> ---
> >>> a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
> >>> +++ /dev/null
> >>> @@ -1,22 +0,0 @@
> >>> -From a9a2b9e72027d0b2357f6dfe8b154762aaa8dd02 Mon Sep 17 00:00:00 2001
> >>> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>> -Date: Thu, 19 Apr 2018 16:39:41 -0400
> >>> -Subject: [PATCH] build: drop recvtty and use GOBUILDFLAGS
> >>> -
> >>> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>> ----
> >>> - Makefile | 3 +--
> >>> - 1 file changed, 1 insertion(+), 2 deletions(-)
> >>> -
> >>> -Index: git/src/import/Makefile
> >>> -===================================================================
> >>> ---- git.orig/src/import/Makefile
> >>> -+++ git/src/import/Makefile
> >>> -@@ -41,7 +41,6 @@
> >>> -
> >>> - static: $(SOURCES)
> >>> -   CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
> >>> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
> >>> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
> >>> $(EXTRA_LDFLAGS)" -o runc .
> >>> --  CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
> >>> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
> >>> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
> >>> $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
> >>> -
> >>> - release:
> >>> -   script/release.sh -r release/$(VERSION) -v $(VERSION)
> >>> diff --git a/recipes-containers/runc/runc-docker_git.bb
> >>> b/recipes-containers/runc/runc-docker_git.bb
> >>> index 2bf6222..c9f460b 100644
> >>> --- a/recipes-containers/runc/runc-docker_git.bb
> >>> +++ b/recipes-containers/runc/runc-docker_git.bb
> >>> @@ -5,7 +5,7 @@ include runc.inc
> >>>   SRCREV_runc-docker = "425e105d5a03fabd737a126ad93d62a9eeede87f"
> >>>   SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
> >>>              file://0001-runc-Add-console-socket-dev-null.patch \
> >>> -           file://0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch \
> >>> +
> >>> file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> >>> \
> >>>              file://0001-runc-docker-SIGUSR1-daemonize.patch \
> >>>             "
> >>>   diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
> >>> b/recipes-containers/runc/runc-opencontainers_git.bb
> >>> index 76ab794..361bc94 100644
> >>> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> >>> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> >>> @@ -3,5 +3,6 @@ include runc.inc
> >>>   SRCREV = "652297c7c7e6c94e8d064ad5916c32891a6fd388"
> >>>   SRC_URI = " \
> >>>       git://github.com/opencontainers/runc;branch=master \
> >>> +    file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
> >>>       "
> >>>   RUNC_VERSION = "1.0.0-rc8"
> >>> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
> >>> index 46fd09d..41ea41b 100644
> >>> --- a/recipes-containers/runc/runc.inc
> >>> +++ b/recipes-containers/runc/runc.inc
> >>> @@ -14,8 +14,10 @@ inherit go
> >>>   inherit goarch
> >>>   inherit pkgconfig
> >>>   -PACKAGECONFIG ??= ""
> >>> +PACKAGECONFIG ??= "static"
> >>>   PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
> >>> +# This PACKAGECONFIG serves the purpose of whether building runc as
> >>> static or not
> >>> +PACKAGECONFIG[static] = ""
> >>>     PROVIDES += "virtual/runc"
> >>>   RPROVIDES_${PN} = "virtual/runc"
> >>> @@ -54,7 +56,11 @@ do_compile() {
> >>>     export CFLAGS=""
> >>>     export LDFLAGS=""
> >>>   - oe_runmake static
> >>> +   if ${@bb.utils.contains('PACKAGECONFIG', 'static', 'true', 'false', d)}; then
> >>> +           oe_runmake static
> >>> +   else
> >>> +           oe_runmake runc
> >>> +   fi
> >>>   }
> >>>     do_install() {
> >>> -- 2.17.1
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

