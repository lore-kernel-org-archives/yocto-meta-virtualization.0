Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4EFC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 12:58:45 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web12.28349.1660741116104873108
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 05:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qoSBn3yi;
 spf=pass (domain: gmail.com, ip: 209.85.167.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id w197so15291422oie.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=qHRYk4TJ0m2SkegrDvpOBXK2GrShedTHynwzbToHe00=;
        b=qoSBn3yi7t4S4dTaPK3+FweYgedcPnyYrH1NRmUAN7S2pNPBwlzlJOyNzw8FGF49+1
         jeKcIQ5gUCqnlqB3a87w9RKtB4aWX4BxYIeJ2osgtf7FZUc7Tzz8F/39DAHwsmFnm4qR
         BK80Tru+R7pg5e7pIAemomnLdqU4iqM4NUrMwAcZbdQ2CQJX8GgVpv/iredgL54lwnog
         HFPlxTIreLumAiPydGhMznnhy4f2M9O+vFW+7VMwrFQc8Hx4TaOuhuzI5i2PeD6hvuic
         57sktLNjZT3qE9P6yoMsAcxLO+LObXLGyjluLaO8dBUPJ/My1hDnG8hVUxpEQ2EWEcQL
         kWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=qHRYk4TJ0m2SkegrDvpOBXK2GrShedTHynwzbToHe00=;
        b=Twe6HNikwoWdZBKGn+6xYxI/lbSaBa91K40iryJVsMVMBpSw+HUEHnOyTYZKcqRL6M
         k+/u5ueHa7STPXACgWfypT/mDGSi5SLwk56Lw8PL7w1AwsUY/lRPrlToY2zC6v/1jn2S
         mXYanBOmogqjAZTEu40taO8r5RoK5zUXFagQEn+TcBziN0Z0m8zEhWsbf+Zy1QlwJqNi
         0XVJyTIKaJ6fL3RI077wTbbgb6aIfpPn/Y5LIF7FQA0t3tks/3FnllzRj5OSSNB2PO43
         nYk5OVdWUcAQMhCsasmYmpoimJO/T8cvEvXsCM88ggdG193d3HdG6gVSiJIUBPxF3YHv
         8Jfw==
X-Gm-Message-State: ACgBeo1dkOzvOc36kgFcUcSG2BykXIzfjT5rwjw0z9+vDDnS4R8v+7CL
	s2atCLRm4NOtXGvJkspin/alxUvQjsmzS272Gic=
X-Google-Smtp-Source: 
 AA6agR62v8/w4dnZpHmykvn6s8/dxYuCSNgTDTePo4fMieHBqUKt7k24j0mwjocO0Fp7avmI6EUzYhCa8G6bCekTNB8=
X-Received: by 2002:a05:6808:199d:b0:343:290a:9f4c with SMTP id
 bj29-20020a056808199d00b00343290a9f4cmr1407418oib.6.1660741115156; Wed, 17
 Aug 2022 05:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220817095003.1394193-1-pascal.bach@siemens.com>
In-Reply-To: <20220817095003.1394193-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 17 Aug 2022 08:58:23 -0400
Message-ID: 
 <CADkTA4NdeNZPftAxu8PjMojza=U8aoY=+UrtwTpiahZd=G3GMA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: update to v4.2.0
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 12:58:45 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7528

I had just tested the podman (and related version bumps) last night,
but thanks for the patch!

Bruce

On Wed, Aug 17, 2022 at 5:50 AM Pascal Bach <pascal.bach@siemens.com> wrote=
:
>
> From: Pascal Bach <pascal.bach@siemens.com>
>
> The libseccomp patch was a backport and is included in the current releas=
e.
>
> The GOBUILDFLAGS patch is replaced by explicitly setting BUILDFLAGS=3D"${=
GOBUILDFLAGS}"
> in the recipe.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  ...01-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch | 123 ------------------
>  ...efine-ActKillThread-equal-to-ActKill.patch |  90 -------------
>  recipes-containers/podman/podman_git.bb       |  11 +-
>  3 files changed, 6 insertions(+), 218 deletions(-)
>  delete mode 100644 recipes-containers/podman/podman/0001-Rename-BUILDFLA=
GS-to-GOBUILDFLAGS.patch
>  delete mode 100644 recipes-containers/podman/podman/0002-Define-ActKillT=
hread-equal-to-ActKill.patch
>
> diff --git a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-G=
OBUILDFLAGS.patch b/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS=
-to-GOBUILDFLAGS.patch
> deleted file mode 100644
> index e27e1fa..0000000
> --- a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDF=
LAGS.patch
> +++ /dev/null
> @@ -1,123 +0,0 @@
> -From 3e18f3a4db638a3df48f49aa0a539f8bb048afc9 Mon Sep 17 00:00:00 2001
> -From: Andrei Gherzan <andrei.gherzan@huawei.com>
> -Date: Tue, 5 Jul 2022 11:51:56 +0200
> -Subject: [PATCH] Rename BUILDFLAGS to GOBUILDFLAGS
> -
> -Yocto uses GOBUILDFLAGS to pass the right build flags while the Makefile
> -uses BUILDFLAGS. Align them accordingly.
> -
> -See go.bbclass for more information.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ----
> - Makefile | 24 ++++++++++++------------
> - 1 file changed, 12 insertions(+), 12 deletions(-)
> -
> -Index: import/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- import.orig/Makefile
> -+++ import/Makefile
> -@@ -69,7 +69,7 @@
> - # triggered.
> - SOURCES =3D $(shell find . -path './.*' -prune -o \( \( -name '*.go' -o=
 -name '*.c' \) -a ! -name '*_test.go' \) -print)
> -
> --BUILDFLAGS :=3D -mod=3Dvendor $(BUILDFLAGS)
> -+GOBUILDFLAGS :=3D -mod=3Dvendor $(GOBUILDFLAGS)
> -
> - BUILDTAGS_CROSS ?=3D containers_image_openpgp exclude_graphdriver_btrfs=
 exclude_graphdriver_devicemapper exclude_graphdriver_overlay
> - CONTAINER_RUNTIME :=3D $(shell command -v podman 2> /dev/null || echo d=
ocker)
> -@@ -264,11 +264,11 @@
> -
> - .PHONY: test/checkseccomp/checkseccomp
> - test/checkseccomp/checkseccomp: .gopathok $(wildcard test/checkseccomp/=
*.go)
> --      $(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -t=
ags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
> -+      $(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' =
-tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
> -
> - .PHONY: test/testvol/testvol
> - test/testvol/testvol: .gopathok $(wildcard test/testvol/*.go)
> --      $(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o=
 $@ ./test/testvol
> -+      $(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' =
-o $@ ./test/testvol
> -
> - .PHONY: volume-plugin-test-image
> - volume-plugin-test-img:
> -@@ -276,7 +276,7 @@
> -
> - .PHONY: test/goecho/goecho
> - test/goecho/goecho: .gopathok $(wildcard test/goecho/*.go)
> --      $(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o=
 $@ ./test/goecho
> -+      $(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' =
-o $@ ./test/goecho
> -
> - test/version/version: .gopathok version/version.go
> -       $(GO) build -o $@ ./test/version/
> -@@ -318,7 +318,7 @@
> -               distro for journald support."
> - endif
> -       $(GOCMD) build \
> --              $(BUILDFLAGS) \
> -+              $(GOBUILDFLAGS) \
> -               $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> -               -tags "$(BUILDTAGS)" \
> -               -o $@ ./cmd/podman
> -@@ -329,7 +329,7 @@
> -
> - $(SRCBINDIR)/podman$(BINSFX): $(SRCBINDIR) .gopathok $(SOURCES) go.mod =
go.sum
> -       $(GOCMD) build \
> --              $(BUILDFLAGS) \
> -+              $(GOBUILDFLAGS) \
> -               $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> -               -tags "${REMOTETAGS}" \
> -               -o $@ ./cmd/podman
> -@@ -339,7 +339,7 @@
> -       GOOS=3D$(GOOS) \
> -       GOARCH=3D$(GOARCH) \
> -       $(GO) build \
> --              $(BUILDFLAGS) \
> -+              $(GOBUILDFLAGS) \
> -               $(GO_LDFLAGS) '$(LDFLAGS_PODMAN_STATIC)' \
> -               -tags "${REMOTETAGS}" \
> -               -o $@ ./cmd/podman
> -@@ -374,7 +374,7 @@
> -       CGO_ENABLED=3D0 \
> -               GOOS=3Dwindows \
> -               $(GO) build \
> --              $(BUILDFLAGS) \
> -+              $(GOBUILDFLAGS) \
> -               -ldflags -H=3Dwindowsgui \
> -               -o bin/windows/winpath.exe \
> -               ./cmd/winpath
> -@@ -393,14 +393,14 @@
> -               GOOS=3Ddarwin \
> -               GOARCH=3D$(GOARCH) \
> -               $(GO) build \
> --              $(BUILDFLAGS) \
> -+              $(GOBUILDFLAGS) \
> -               -o bin/darwin/podman-mac-helper \
> -               ./cmd/podman-mac-helper
> -
> - bin/rootlessport: .gopathok $(SOURCES) go.mod go.sum
> -       CGO_ENABLED=3D$(CGO_ENABLED) \
> -               $(GO) build \
> --              $(BUILDFLAGS) \
> -+              $(GOBUILDFLAGS) \
> -               -o $@ ./cmd/rootlessport
> -
> - .PHONY: rootlessport
> -@@ -423,7 +423,7 @@
> -       GOARCH=3D"$${TARGET##*.}"; \
> -       CGO_ENABLED=3D0 \
> -               $(GO) build \
> --              $(BUILDFLAGS) \
> -+              $(GOBUILDFLAGS) \
> -               $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> -               -tags '$(BUILDTAGS_CROSS)' \
> -               -o "$@" ./cmd/podman
> -@@ -871,7 +871,7 @@
> - .PHONY: .install.ginkgo
> - .install.ginkgo: .gopathok
> -       if [ ! -x "$(GOBIN)/ginkgo" ]; then \
> --              $(GO) install $(BUILDFLAGS) ./vendor/github.com/onsi/gink=
go/ginkgo ; \
> -+              $(GO) install $(GOBUILDFLAGS) ./vendor/github.com/onsi/gi=
nkgo/ginkgo ; \
> -       fi
> -
> - .PHONY: .install.gitvalidation
> diff --git a/recipes-containers/podman/podman/0002-Define-ActKillThread-e=
qual-to-ActKill.patch b/recipes-containers/podman/podman/0002-Define-ActKil=
lThread-equal-to-ActKill.patch
> deleted file mode 100644
> index ba51d4a..0000000
> --- a/recipes-containers/podman/podman/0002-Define-ActKillThread-equal-to=
-ActKill.patch
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -From f2aa0359bcc776239bda8a4eb84957b97ef55c35 Mon Sep 17 00:00:00 2001
> -From: Tonis Tiigi <tonistiigi@gmail.com>
> -Date: Fri, 28 Jan 2022 14:44:56 -0800
> -Subject: [PATCH] Define ActKillThread equal to ActKill
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -These constants are equal in libseccomp but Go definitions
> -were defined separately. This resulted in dead code that
> -never executed due to identical case statements in switch.
> -Go can usually detect these error cases and refuses to build
> -but for some reason this detection doesn=E2=80=99t work with cgo+gcc.
> -Clang detects the equal constants correctly and therefore
> -libseccomp-golang builds with clang broke after ActKillThread
> -was added.
> -
> -In order to fix the clang build only removal of the
> -switch case is needed. But I assumed that the setter/getter
> -logic is supposed to work for ActKillThread as well
> -and only way to ensure that is to set them equal like they
> -are in C.
> -
> -Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> -Acked-by: Tom Hromatka <tom.hromatka@oracle.com>
> -Signed-off-by: Paul Moore <paul@paul-moore.com>
> -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> -Upstream-status: Backport [https://github.com/seccomp/libseccomp-golang/=
commit/c35397d0ea8f285a0be78693bb2fd37b06952453]
> ----
> - seccomp.go          | 8 ++++----
> - seccomp_internal.go | 4 ----
> - 2 files changed, 4 insertions(+), 8 deletions(-)
> -
> -diff --git a/seccomp.go b/seccomp.go
> -index e9b92e2..32f6ab2 100644
> ---- a/seccomp.go
> -+++ b/seccomp.go
> -@@ -214,14 +214,14 @@ const (
> -       // This action is only usable when libseccomp API level 3 or high=
er is
> -       // supported.
> -       ActLog ScmpAction =3D iota
> --      // ActKillThread kills the thread that violated the rule. It is t=
he same as ActKill.
> --      // All other threads from the same thread group will continue to =
execute.
> --      ActKillThread ScmpAction =3D iota
> -       // ActKillProcess kills the process that violated the rule.
> -       // All threads in the thread group are also terminated.
> -       // This action is only usable when libseccomp API level 3 or high=
er is
> -       // supported.
> -       ActKillProcess ScmpAction =3D iota
> -+      // ActKillThread kills the thread that violated the rule. It is t=
he same as ActKill.
> -+      // All other threads from the same thread group will continue to =
execute.
> -+      ActKillThread =3D ActKill
> - )
> -
> - const (
> -@@ -394,7 +394,7 @@ func (a ScmpCompareOp) String() string {
> - // String returns a string representation of a seccomp match action
> - func (a ScmpAction) String() string {
> -       switch a & 0xFFFF {
> --      case ActKill, ActKillThread:
> -+      case ActKillThread:
> -               return "Action: Kill thread"
> -       case ActKillProcess:
> -               return "Action: Kill process"
> -diff --git a/seccomp_internal.go b/seccomp_internal.go
> -index 8dc7b29..8fc9914 100644
> ---- a/seccomp_internal.go
> -+++ b/seccomp_internal.go
> -@@ -612,8 +612,6 @@ func (a ScmpCompareOp) toNative() C.int {
> - func actionFromNative(a C.uint32_t) (ScmpAction, error) {
> -       aTmp :=3D a & 0xFFFF
> -       switch a & 0xFFFF0000 {
> --      case C.C_ACT_KILL:
> --              return ActKill, nil
> -       case C.C_ACT_KILL_PROCESS:
> -               return ActKillProcess, nil
> -       case C.C_ACT_KILL_THREAD:
> -@@ -638,8 +636,6 @@ func actionFromNative(a C.uint32_t) (ScmpAction, err=
or) {
> - // Only use with sanitized actions, no error handling
> - func (a ScmpAction) toNative() C.uint32_t {
> -       switch a & 0xFFFF {
> --      case ActKill:
> --              return C.C_ACT_KILL
> -       case ActKillProcess:
> -               return C.C_ACT_KILL_PROCESS
> -       case ActKillThread:
> ---
> -2.25.1
> -
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
> index 9b92094..ea10f66 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -17,11 +17,9 @@ DEPENDS =3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>  "
>
> -SRCREV =3D "cedbbfa543651a13055a1fe093a4d0a2a28ccdfd"
> +SRCREV =3D "7fe5a419cfd2880df2028ad3d7fd9378a88a04f4"
>  SRC_URI =3D " \
> -    git://github.com/containers/libpod.git;branch=3Dv4.1;protocol=3Dhttp=
s \
> -    file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=3Dsrc/i=
mport \
> -    file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=3Ds=
rc/import/vendor/github.com/seccomp/libseccomp-golang \
> +    git://github.com/containers/libpod.git;branch=3Dv4.2;protocol=3Dhttp=
s \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-=
rootless.conf', '', d)} \
>  "
>
> @@ -32,7 +30,7 @@ GO_IMPORT =3D "import"
>
>  S =3D "${WORKDIR}/git"
>
> -PV =3D "4.1.0+git${SRCPV}"
> +PV =3D "4.2.0+git${SRCPV}"
>
>  PACKAGES =3D+ "${PN}-contrib"
>
> @@ -47,6 +45,9 @@ export LDFLAGS=3D""
>  # https://github.com/llvm/llvm-project/issues/53999
>  TOOLCHAIN =3D "gcc"
>
> +# podmans Makefile expects BUILDFLAGS to be set but go.bbclass defines t=
hem in GOBUILDFLAGS
> +export BUILDFLAGS=3D"${GOBUILDFLAGS}"
> +
>  inherit go goarch
>  inherit systemd pkgconfig
>
> --
> 2.37.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7525): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7525
> Mute This Topic: https://lists.yoctoproject.org/mt/93077240/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

