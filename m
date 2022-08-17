Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64250C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 13:53:35 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.29101.1660744411209014121
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 06:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nSWGw6SP;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id u14so15451537oie.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=WnWp+QIluAQRqhqllqYMW3Q1JEOZz4PIs4QcJCka6os=;
        b=nSWGw6SPNGXu6ttLhmRstyWzxcsgznwtGxgdRSkKJwbg09VG/fZmvuTmFktGn6gxHM
         ZhG4up3Z8w6tbMbdVrT4+cN4NemDYif8D9VUl5ZDJDpcEBsb7FcFF0T/SeLXOux0IHPZ
         OcRcMvRCxS6kNM1dtJG/N451Q3o5pAeKjHjpSs9q+1c0NfU/cnARGv6mFlYP5Aq14vy2
         kXzUz7J+ZeERdMZtftkob399i+JMC+bpKbUu1cUzI7rnb2XlJWuccBB7bg+5UgfQjv6X
         h/OOpNDYkQh+kTRSafJxmur8XP/S3FoWhMl10RKnb01QfMBCjQqDaC4Pc4sUyicVpSbg
         UxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=WnWp+QIluAQRqhqllqYMW3Q1JEOZz4PIs4QcJCka6os=;
        b=ktjubqugOREzKKGFGz/mds0JC1S4nFwEf54OnwFOtLn1fcKcalpmEBtHtLVt67oYSy
         TSkjL3MlZRq38qSoNXvnEWKoTHEKuneK14YQxCqRLH0OTmmOZ0XT3UQ+LkO7U4k06PQk
         eCJxQAhxVBSFlhhOTn703XxEHDJ4M3/Am0uHPWwN7Qtu9k/Qc0X/QvFM7sG5rAnFFxxC
         cpX698Bd/7JdkARH5Rk7lkKqPPsBOmArTLbV41BbYjKXESewNUJYt4jXm+iFSo7Y1oF5
         EHGjeXEucpoQidYfX/FCXpU9KN0IvEqA8mll1AbEdxRHqvVvh5k5UhisfFweovn+7dlT
         JVcQ==
X-Gm-Message-State: ACgBeo0U1yI/+xZWvzL4nwb3p00J6ZNxbDhO5zNb7ICD8l3V1S0FI4Ur
	eILDjqexWhjfOWzdKSlGCflSLY3fwHQz6jXDrxM=
X-Google-Smtp-Source: 
 AA6agR56W2Nj8lheiYv8M0fLHzwjCm6WFVO3vsh4eewwrIYLwbwhomcezoDVqoXj+qEVwbjRNz4vHZ2YQ39oN6I8qbY=
X-Received: by 2002:a05:6808:199d:b0:343:290a:9f4c with SMTP id
 bj29-20020a056808199d00b00343290a9f4cmr1535305oib.6.1660744410311; Wed, 17
 Aug 2022 06:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220817095003.1394193-1-pascal.bach@siemens.com>
 <170C233F147EBB9E.15879@lists.yoctoproject.org>
In-Reply-To: <170C233F147EBB9E.15879@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 17 Aug 2022 09:53:18 -0400
Message-ID: 
 <CADkTA4Mtrou-PK9d+C3JaWaTfwxEPBOOQCF4Pm2=KnxJudX4HA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: update to v4.2.0
To: bruce.ashfield@gmail.com
Cc: Pascal Bach <pascal.bach@siemens.com>,
 meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 13:53:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7529

On Wed, Aug 17, 2022 at 8:58 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> I had just tested the podman (and related version bumps) last night,
> but thanks for the patch!

I just pushed part of my uprev's to master-next .. that being said, my
podman uprev just refreshes the BUILDFLAGS patch, using the exported
variable is simpler for future uprevs.

Did you want to send just that part of the patch against master-next ?
That way you'll get the credit for the simplification of the build.

Cheers,

Bruce

>
> Bruce
>
> On Wed, Aug 17, 2022 at 5:50 AM Pascal Bach <pascal.bach@siemens.com> wro=
te:
> >
> > From: Pascal Bach <pascal.bach@siemens.com>
> >
> > The libseccomp patch was a backport and is included in the current rele=
ase.
> >
> > The GOBUILDFLAGS patch is replaced by explicitly setting BUILDFLAGS=3D"=
${GOBUILDFLAGS}"
> > in the recipe.
> >
> > Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> > ---
> >  ...01-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch | 123 ------------------
> >  ...efine-ActKillThread-equal-to-ActKill.patch |  90 -------------
> >  recipes-containers/podman/podman_git.bb       |  11 +-
> >  3 files changed, 6 insertions(+), 218 deletions(-)
> >  delete mode 100644 recipes-containers/podman/podman/0001-Rename-BUILDF=
LAGS-to-GOBUILDFLAGS.patch
> >  delete mode 100644 recipes-containers/podman/podman/0002-Define-ActKil=
lThread-equal-to-ActKill.patch
> >
> > diff --git a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to=
-GOBUILDFLAGS.patch b/recipes-containers/podman/podman/0001-Rename-BUILDFLA=
GS-to-GOBUILDFLAGS.patch
> > deleted file mode 100644
> > index e27e1fa..0000000
> > --- a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUIL=
DFLAGS.patch
> > +++ /dev/null
> > @@ -1,123 +0,0 @@
> > -From 3e18f3a4db638a3df48f49aa0a539f8bb048afc9 Mon Sep 17 00:00:00 2001
> > -From: Andrei Gherzan <andrei.gherzan@huawei.com>
> > -Date: Tue, 5 Jul 2022 11:51:56 +0200
> > -Subject: [PATCH] Rename BUILDFLAGS to GOBUILDFLAGS
> > -
> > -Yocto uses GOBUILDFLAGS to pass the right build flags while the Makefi=
le
> > -uses BUILDFLAGS. Align them accordingly.
> > -
> > -See go.bbclass for more information.
> > -
> > -Upstream-Status: Inappropriate [OE specific]
> > -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> > ----
> > - Makefile | 24 ++++++++++++------------
> > - 1 file changed, 12 insertions(+), 12 deletions(-)
> > -
> > -Index: import/Makefile
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- import.orig/Makefile
> > -+++ import/Makefile
> > -@@ -69,7 +69,7 @@
> > - # triggered.
> > - SOURCES =3D $(shell find . -path './.*' -prune -o \( \( -name '*.go' =
-o -name '*.c' \) -a ! -name '*_test.go' \) -print)
> > -
> > --BUILDFLAGS :=3D -mod=3Dvendor $(BUILDFLAGS)
> > -+GOBUILDFLAGS :=3D -mod=3Dvendor $(GOBUILDFLAGS)
> > -
> > - BUILDTAGS_CROSS ?=3D containers_image_openpgp exclude_graphdriver_btr=
fs exclude_graphdriver_devicemapper exclude_graphdriver_overlay
> > - CONTAINER_RUNTIME :=3D $(shell command -v podman 2> /dev/null || echo=
 docker)
> > -@@ -264,11 +264,11 @@
> > -
> > - .PHONY: test/checkseccomp/checkseccomp
> > - test/checkseccomp/checkseccomp: .gopathok $(wildcard test/checkseccom=
p/*.go)
> > --      $(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' =
-tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
> > -+      $(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)=
' -tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
> > -
> > - .PHONY: test/testvol/testvol
> > - test/testvol/testvol: .gopathok $(wildcard test/testvol/*.go)
> > --      $(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' =
-o $@ ./test/testvol
> > -+      $(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)=
' -o $@ ./test/testvol
> > -
> > - .PHONY: volume-plugin-test-image
> > - volume-plugin-test-img:
> > -@@ -276,7 +276,7 @@
> > -
> > - .PHONY: test/goecho/goecho
> > - test/goecho/goecho: .gopathok $(wildcard test/goecho/*.go)
> > --      $(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' =
-o $@ ./test/goecho
> > -+      $(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)=
' -o $@ ./test/goecho
> > -
> > - test/version/version: .gopathok version/version.go
> > -       $(GO) build -o $@ ./test/version/
> > -@@ -318,7 +318,7 @@
> > -               distro for journald support."
> > - endif
> > -       $(GOCMD) build \
> > --              $(BUILDFLAGS) \
> > -+              $(GOBUILDFLAGS) \
> > -               $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> > -               -tags "$(BUILDTAGS)" \
> > -               -o $@ ./cmd/podman
> > -@@ -329,7 +329,7 @@
> > -
> > - $(SRCBINDIR)/podman$(BINSFX): $(SRCBINDIR) .gopathok $(SOURCES) go.mo=
d go.sum
> > -       $(GOCMD) build \
> > --              $(BUILDFLAGS) \
> > -+              $(GOBUILDFLAGS) \
> > -               $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> > -               -tags "${REMOTETAGS}" \
> > -               -o $@ ./cmd/podman
> > -@@ -339,7 +339,7 @@
> > -       GOOS=3D$(GOOS) \
> > -       GOARCH=3D$(GOARCH) \
> > -       $(GO) build \
> > --              $(BUILDFLAGS) \
> > -+              $(GOBUILDFLAGS) \
> > -               $(GO_LDFLAGS) '$(LDFLAGS_PODMAN_STATIC)' \
> > -               -tags "${REMOTETAGS}" \
> > -               -o $@ ./cmd/podman
> > -@@ -374,7 +374,7 @@
> > -       CGO_ENABLED=3D0 \
> > -               GOOS=3Dwindows \
> > -               $(GO) build \
> > --              $(BUILDFLAGS) \
> > -+              $(GOBUILDFLAGS) \
> > -               -ldflags -H=3Dwindowsgui \
> > -               -o bin/windows/winpath.exe \
> > -               ./cmd/winpath
> > -@@ -393,14 +393,14 @@
> > -               GOOS=3Ddarwin \
> > -               GOARCH=3D$(GOARCH) \
> > -               $(GO) build \
> > --              $(BUILDFLAGS) \
> > -+              $(GOBUILDFLAGS) \
> > -               -o bin/darwin/podman-mac-helper \
> > -               ./cmd/podman-mac-helper
> > -
> > - bin/rootlessport: .gopathok $(SOURCES) go.mod go.sum
> > -       CGO_ENABLED=3D$(CGO_ENABLED) \
> > -               $(GO) build \
> > --              $(BUILDFLAGS) \
> > -+              $(GOBUILDFLAGS) \
> > -               -o $@ ./cmd/rootlessport
> > -
> > - .PHONY: rootlessport
> > -@@ -423,7 +423,7 @@
> > -       GOARCH=3D"$${TARGET##*.}"; \
> > -       CGO_ENABLED=3D0 \
> > -               $(GO) build \
> > --              $(BUILDFLAGS) \
> > -+              $(GOBUILDFLAGS) \
> > -               $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> > -               -tags '$(BUILDTAGS_CROSS)' \
> > -               -o "$@" ./cmd/podman
> > -@@ -871,7 +871,7 @@
> > - .PHONY: .install.ginkgo
> > - .install.ginkgo: .gopathok
> > -       if [ ! -x "$(GOBIN)/ginkgo" ]; then \
> > --              $(GO) install $(BUILDFLAGS) ./vendor/github.com/onsi/gi=
nkgo/ginkgo ; \
> > -+              $(GO) install $(GOBUILDFLAGS) ./vendor/github.com/onsi/=
ginkgo/ginkgo ; \
> > -       fi
> > -
> > - .PHONY: .install.gitvalidation
> > diff --git a/recipes-containers/podman/podman/0002-Define-ActKillThread=
-equal-to-ActKill.patch b/recipes-containers/podman/podman/0002-Define-ActK=
illThread-equal-to-ActKill.patch
> > deleted file mode 100644
> > index ba51d4a..0000000
> > --- a/recipes-containers/podman/podman/0002-Define-ActKillThread-equal-=
to-ActKill.patch
> > +++ /dev/null
> > @@ -1,90 +0,0 @@
> > -From f2aa0359bcc776239bda8a4eb84957b97ef55c35 Mon Sep 17 00:00:00 2001
> > -From: Tonis Tiigi <tonistiigi@gmail.com>
> > -Date: Fri, 28 Jan 2022 14:44:56 -0800
> > -Subject: [PATCH] Define ActKillThread equal to ActKill
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -These constants are equal in libseccomp but Go definitions
> > -were defined separately. This resulted in dead code that
> > -never executed due to identical case statements in switch.
> > -Go can usually detect these error cases and refuses to build
> > -but for some reason this detection doesn=E2=80=99t work with cgo+gcc.
> > -Clang detects the equal constants correctly and therefore
> > -libseccomp-golang builds with clang broke after ActKillThread
> > -was added.
> > -
> > -In order to fix the clang build only removal of the
> > -switch case is needed. But I assumed that the setter/getter
> > -logic is supposed to work for ActKillThread as well
> > -and only way to ensure that is to set them equal like they
> > -are in C.
> > -
> > -Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> > -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> > -Acked-by: Tom Hromatka <tom.hromatka@oracle.com>
> > -Signed-off-by: Paul Moore <paul@paul-moore.com>
> > -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> > -Upstream-status: Backport [https://github.com/seccomp/libseccomp-golan=
g/commit/c35397d0ea8f285a0be78693bb2fd37b06952453]
> > ----
> > - seccomp.go          | 8 ++++----
> > - seccomp_internal.go | 4 ----
> > - 2 files changed, 4 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/seccomp.go b/seccomp.go
> > -index e9b92e2..32f6ab2 100644
> > ---- a/seccomp.go
> > -+++ b/seccomp.go
> > -@@ -214,14 +214,14 @@ const (
> > -       // This action is only usable when libseccomp API level 3 or hi=
gher is
> > -       // supported.
> > -       ActLog ScmpAction =3D iota
> > --      // ActKillThread kills the thread that violated the rule. It is=
 the same as ActKill.
> > --      // All other threads from the same thread group will continue t=
o execute.
> > --      ActKillThread ScmpAction =3D iota
> > -       // ActKillProcess kills the process that violated the rule.
> > -       // All threads in the thread group are also terminated.
> > -       // This action is only usable when libseccomp API level 3 or hi=
gher is
> > -       // supported.
> > -       ActKillProcess ScmpAction =3D iota
> > -+      // ActKillThread kills the thread that violated the rule. It is=
 the same as ActKill.
> > -+      // All other threads from the same thread group will continue t=
o execute.
> > -+      ActKillThread =3D ActKill
> > - )
> > -
> > - const (
> > -@@ -394,7 +394,7 @@ func (a ScmpCompareOp) String() string {
> > - // String returns a string representation of a seccomp match action
> > - func (a ScmpAction) String() string {
> > -       switch a & 0xFFFF {
> > --      case ActKill, ActKillThread:
> > -+      case ActKillThread:
> > -               return "Action: Kill thread"
> > -       case ActKillProcess:
> > -               return "Action: Kill process"
> > -diff --git a/seccomp_internal.go b/seccomp_internal.go
> > -index 8dc7b29..8fc9914 100644
> > ---- a/seccomp_internal.go
> > -+++ b/seccomp_internal.go
> > -@@ -612,8 +612,6 @@ func (a ScmpCompareOp) toNative() C.int {
> > - func actionFromNative(a C.uint32_t) (ScmpAction, error) {
> > -       aTmp :=3D a & 0xFFFF
> > -       switch a & 0xFFFF0000 {
> > --      case C.C_ACT_KILL:
> > --              return ActKill, nil
> > -       case C.C_ACT_KILL_PROCESS:
> > -               return ActKillProcess, nil
> > -       case C.C_ACT_KILL_THREAD:
> > -@@ -638,8 +636,6 @@ func actionFromNative(a C.uint32_t) (ScmpAction, e=
rror) {
> > - // Only use with sanitized actions, no error handling
> > - func (a ScmpAction) toNative() C.uint32_t {
> > -       switch a & 0xFFFF {
> > --      case ActKill:
> > --              return C.C_ACT_KILL
> > -       case ActKillProcess:
> > -               return C.C_ACT_KILL_PROCESS
> > -       case ActKillThread:
> > ---
> > -2.25.1
> > -
> > diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containe=
rs/podman/podman_git.bb
> > index 9b92094..ea10f66 100644
> > --- a/recipes-containers/podman/podman_git.bb
> > +++ b/recipes-containers/podman/podman_git.bb
> > @@ -17,11 +17,9 @@ DEPENDS =3D " \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> >  "
> >
> > -SRCREV =3D "cedbbfa543651a13055a1fe093a4d0a2a28ccdfd"
> > +SRCREV =3D "7fe5a419cfd2880df2028ad3d7fd9378a88a04f4"
> >  SRC_URI =3D " \
> > -    git://github.com/containers/libpod.git;branch=3Dv4.1;protocol=3Dht=
tps \
> > -    file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=3Dsrc=
/import \
> > -    file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=
=3Dsrc/import/vendor/github.com/seccomp/libseccomp-golang \
> > +    git://github.com/containers/libpod.git;branch=3Dv4.2;protocol=3Dht=
tps \
> >      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podma=
n-rootless.conf', '', d)} \
> >  "
> >
> > @@ -32,7 +30,7 @@ GO_IMPORT =3D "import"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -PV =3D "4.1.0+git${SRCPV}"
> > +PV =3D "4.2.0+git${SRCPV}"
> >
> >  PACKAGES =3D+ "${PN}-contrib"
> >
> > @@ -47,6 +45,9 @@ export LDFLAGS=3D""
> >  # https://github.com/llvm/llvm-project/issues/53999
> >  TOOLCHAIN =3D "gcc"
> >
> > +# podmans Makefile expects BUILDFLAGS to be set but go.bbclass defines=
 them in GOBUILDFLAGS
> > +export BUILDFLAGS=3D"${GOBUILDFLAGS}"
> > +
> >  inherit go goarch
> >  inherit systemd pkgconfig
> >
> > --
> > 2.37.2
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7528): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7528
> Mute This Topic: https://lists.yoctoproject.org/mt/93077240/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

