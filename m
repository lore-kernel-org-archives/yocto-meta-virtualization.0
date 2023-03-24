Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFABC6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 19:44:56 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.6844.1679687089341060306
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Mar 2023 12:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gNsEX9vS;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id d22so185826iow.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Mar 2023 12:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679687088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uyJw+UNzmieHWAAV4jEBv5CVs6d1Bfg9In1lXiaqs0=;
        b=gNsEX9vSZ8pj7rDg5zG8Tb6Q7rVlTd6nOu9x+3kxIfKMpzzn5FHd8D2rTbrt6iwaHA
         E6xYD5z03EDyjRG/bHovIdfuqTKXP29crjnnRaYFHuHHN1ttwVt7yZeEaGqaOBFxxLxX
         uqgXdi6fSw1NCskBaxaLOOxjjSeue1n9RmiKXRAaAHXHRGkf3ip9hDxcYNBFhP3rk3JA
         CVFhU/9hyorzhOCuc9C9i7Sr23T/lXtXDeMjykF5WZ0Q6P+M2dBI8KIYMAC6A4ZUcJ5l
         147kBLb/OPzfIURWynXeOsO5Ms/RLjhBEiX88iI0d2OAkz3GAspcZXKLFvYsCfQCD/ad
         uxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679687088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uyJw+UNzmieHWAAV4jEBv5CVs6d1Bfg9In1lXiaqs0=;
        b=Lp+b9UPIpAxdwJkuA8H3AoHNNMje9+LCuNWVl36WuUqWVcuIGKukhejn+h2tnm63s1
         USmG19A3/Op1NPoMzJkVHpuwMbt81sKaYFOi6IHv3yDlNItTCMfUPxgeZMcEcfEcJduv
         tukdsFAn6GudgodEIxGWlLVmIZuuZjbEBbdMWZ7c/qiAALmd6bT2Tlh1SXeiEKQZlgkX
         2RRqFfjO5CoXvKenCZIkFisToqfrXH9KDtlggmff2O54a5PnjLLB/IwlbKUsIzlBBpYg
         lRAP5Q3qGjZlzj+UqnbMTKQtu9kAw5UvI0rgA2d3tQiX6Z4rUIn0p0JgkVI6cVhm3cK+
         od+g==
X-Gm-Message-State: AO0yUKU2DKzx/SxNpxCEceqwBVkm6Suk3INf3cYezLq38FISt2DdfyFa
	Y5Wp2oE+7DJNmxJbzBp3TdhoynKuatodkYEiS3I=
X-Google-Smtp-Source: AK7set9Nbuh5iE4EAc4rjdGxXibAy6PtqIlqpx/c3R9l1gLUHm6KDaublBX39rQ9V/iWn1TxB41DHCIG6r2TnDrUn04=
X-Received: by 2002:a6b:fe08:0:b0:752:ed8d:d015 with SMTP id
 x8-20020a6bfe08000000b00752ed8dd015mr1456057ioh.1.1679687088482; Fri, 24 Mar
 2023 12:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230203085053.16198-1-Qi.Chen@windriver.com> <174A90EFB426D987.11886@lists.yoctoproject.org>
In-Reply-To: <174A90EFB426D987.11886@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 Mar 2023 15:44:49 -0400
Message-ID: <CADkTA4O=+LZk06nUApdkRPRi6n0xt6+tv1ps6E+pqXCjJtaGLw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] kubernetes: upgrade to 1.26.1
To: bruce.ashfield@gmail.com
Cc: Chen Qi <Qi.Chen@windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Mar 2023 19:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7955

I ran into some issues with varying networking, and latest updates to
go (related to the build).

Since 1.27 releases on April 11th, I've started to consolidate all the
fixes into a single bump to 1.27.x that will be in place for the
mickledore release.

Bruce

On Wed, Mar 8, 2023 at 5:06=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> I haven't forgotten about this, I'm still working on a joint upgrade
> to multiple recipes and stacks related to kubernetes, so it is taking
> a bit longer than I'd like for the update.
>
> Bruce
>
> In message: [meta-virtualization][PATCH] kubernetes: upgrade to 1.26.1
> on 03/02/2023 Chen Qi wrote:
>
> > Changes include:
> > 1. Update SRC_URI an SRCREV
> > 2. Change 0001-hack-lib-golang.sh-use-CC-from-environment.patch to also
> >    remove the 'export CC=3Dxxx' for amd64. The original patch is a litt=
le
> >    strange, it removes such statements for other archs but leaves amd64
> >    untouched. If we're using CC from our environment, we use it for all
> >    targets.
> > 3. Adapt 0001-build-golang.sh-convert-remaining-go-calls-to-use.patch t=
o
> >    the 1.26.1 version.
> > 4. Comment out the 'make file_generated' command. I'm not sure why it's
> >    needed in the past, but for 1.26.1, it does seem to be necessary.
> >
> > This upgrade is tested on qemux86-64 & qemuarm64: k8s + containerd + fl=
annel.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  ...sh-convert-remaining-go-calls-to-use.patch | 39 +++++++++++--------
> >  ...ib-golang.sh-use-CC-from-environment.patch | 25 +++++++-----
> >  .../kubernetes/kubernetes_git.bb              |  8 ++--
> >  3 files changed, 43 insertions(+), 29 deletions(-)
> >
> > diff --git a/recipes-containers/kubernetes/kubernetes/0001-build-golang=
.sh-convert-remaining-go-calls-to-use.patch b/recipes-containers/kubernetes=
/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
> > index 8c6644a..6849549 100644
> > --- a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-con=
vert-remaining-go-calls-to-use.patch
> > +++ b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-con=
vert-remaining-go-calls-to-use.patch
> > @@ -1,18 +1,22 @@
> > -From 9973a66665992c49593595ae1eb70848907ea6a9 Mon Sep 17 00:00:00 2001
> > -From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > -Date: Wed, 12 Aug 2020 16:01:49 +0000
> > -Subject: [PATCH] build/golang.sh: convert remaining 'go' calls to use
> > +From 3a357f4bb769a4127f5107f4ae21ee8f12279677 Mon Sep 17 00:00:00 2001
> > +From: Chen Qi <Qi.Chen@windriver.com>
> > +Date: Thu, 2 Feb 2023 22:29:07 -0800
> > +Subject: [PATCH 2/2] golang.sh: convert go to $GO
> >
> > -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +Upstream-Status: Inappropriate [OE Specific]
> > +
> > +[The patch was original created by Bruce.]
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >  ---
> >   hack/lib/golang.sh | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > -Index: kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/=
hack/lib/golang.sh
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f.ori=
g/hack/lib/golang.sh
> > -+++ kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/hac=
k/lib/golang.sh
> > -@@ -652,7 +652,7 @@
> > +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> > +index 0ed2d719dd1..c2ea9e10186 100755
> > +--- a/hack/lib/golang.sh
> > ++++ b/hack/lib/golang.sh
> > +@@ -676,7 +676,7 @@ kube::golang::build_some_binaries() {
> >           kube::golang::create_coverage_dummy_test "${package}"
> >           kube::util::trap_add "kube::golang::delete_coverage_dummy_tes=
t \"${package}\"" EXIT
> >
> > @@ -21,23 +25,23 @@ Index: kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b971=
37180f413cb9e2186f/hack/lib/g
> >             -covermode count \
> >             -coverpkg k8s.io/...,k8s.io/kubernetes/vendor/k8s.io/... \
> >             "${build_args[@]}" \
> > -@@ -664,13 +664,13 @@
> > +@@ -688,13 +688,13 @@ kube::golang::build_some_binaries() {
> >       done
> >       if [[ "${#uncovered[@]}" !=3D 0 ]]; then
> >         V=3D2 kube::log::info "Building ${uncovered[*]} without coverag=
e..."
> > --      go install "${build_args[@]}" "${uncovered[@]}"
> > -+      $GO install "${build_args[@]}" "${uncovered[@]}"
> > +-      GO111MODULE=3Don GOPROXY=3Doff go install "${build_args[@]}" "$=
{uncovered[@]}"
> > ++      GO111MODULE=3Don GOPROXY=3Doff $GO install "${build_args[@]}" "=
${uncovered[@]}"
> >       else
> >         V=3D2 kube::log::info "Nothing to build without coverage."
> >        fi
> >      else
> >       V=3D2 kube::log::info "Coverage is disabled."
> > --    go install "${build_args[@]}" "$@"
> > -+    $GO install "${build_args[@]}" "$@"
> > +-    GO111MODULE=3Don GOPROXY=3Doff go install "${build_args[@]}" "$@"
> > ++    GO111MODULE=3Don GOPROXY=3Doff $GO install "${build_args[@]}" "$@=
"
> >      fi
> >   }
> >
> > -@@ -729,7 +729,7 @@
> > +@@ -756,7 +756,7 @@ kube::golang::build_binaries_for_platform() {
> >       testpkg=3D$(dirname "${test}")
> >
> >       mkdir -p "$(dirname "${outfile}")"
> > @@ -46,3 +50,6 @@ Index: kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137=
180f413cb9e2186f/hack/lib/g
> >         ${goflags:+"${goflags[@]}"} \
> >         -gcflags=3D"${gogcflags}" \
> >         -asmflags=3D"${goasmflags}" \
> > +--
> > +2.37.1
> > +
> > diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-gol=
ang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubern=
etes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
> > index 1c4555a..c81bd1a 100644
> > --- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-=
use-CC-from-environment.patch
> > +++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-=
use-CC-from-environment.patch
> > @@ -1,21 +1,25 @@
> > -From 9cbb2d523d481053d405ebac830c2074b00d3417 Mon Sep 17 00:00:00 2001
> > +From 116ccf93eef322db23e3bd4f35b12be09ebfbde5 Mon Sep 17 00:00:00 2001
> >  From: Koen Kooi <koen.kooi@linaro.org>
> >  Date: Mon, 23 Jul 2018 15:28:02 +0200
> > -Subject: [PATCH] hack/lib/golang.sh: use CC from environment
> > +Subject: [PATCH 1/2] hack/lib/golang.sh: use CC from environment
> >
> >  Toolchain tupples differs, especially when using vendor provides ones.
> >
> >  Upstream-status: Inappropriate [embedded specific]
> >  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> >  ---
> > - hack/lib/golang.sh | 4 ----
> > - 1 file changed, 4 deletions(-)
> > + hack/lib/golang.sh | 5 -----
> > + 1 file changed, 5 deletions(-)
> >
> > -Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/=
hack/lib/golang.sh
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.ori=
g/hack/lib/golang.sh
> > -+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/hac=
k/lib/golang.sh
> > -@@ -414,19 +414,15 @@
> > +diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
> > +index fb97ee76783..0ed2d719dd1 100755
> > +--- a/hack/lib/golang.sh
> > ++++ b/hack/lib/golang.sh
> > +@@ -419,23 +419,18 @@ kube::golang::set_platform_envs() {
> > +     case "${platform}" in
> > +       "linux/amd64")
> > +         export CGO_ENABLED=3D1
> > +-        export CC=3D${KUBE_LINUX_AMD64_CC:-x86_64-linux-gnu-gcc}
> >           ;;
> >         "linux/arm")
> >           export CGO_ENABLED=3D1
> > @@ -35,3 +39,6 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8=
c4d03e530d6f7630/hack/lib/g
> >           ;;
> >       esac
> >     fi
> > +--
> > +2.37.1
> > +
> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-=
containers/kubernetes/kubernetes_git.bb
> > index 31ef135..af26a39 100644
> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> > @@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mec=
hanisms for deployment, \
> >  maintenance, and scaling of applications. \
> >  "
> >
> > -PV =3D "v1.24.0+git${SRCREV_kubernetes}"
> > -SRCREV_kubernetes =3D "8b1b4db3834ddf7cf1b97137180f413cb9e2186f"
> > +PV =3D "v1.26.1+git${SRCREV_kubernetes}"
> > +SRCREV_kubernetes =3D "8f94681cd294aa8cfd3407b8191f6c70214973a4"
> >  SRCREV_kubernetes-release =3D "7c1aa83dac555de6f05500911467b70aca4949f=
0"
> >  PE =3D "1"
> >
> > @@ -22,7 +22,7 @@ PV:class-devupstream =3D "v1.23-alpha+git${SRCPV}"
> >
> >  SRCREV_FORMAT ?=3D "kubernetes_release"
> >
> > -SRC_URI =3D "git://github.com/kubernetes/kubernetes.git;branch=3Drelea=
se-1.24;name=3Dkubernetes;protocol=3Dhttps;destsuffix=3Dgit/src/github.com/=
kubernetes/kubernetes \
> > +SRC_URI =3D "git://github.com/kubernetes/kubernetes.git;branch=3Drelea=
se-1.26;name=3Dkubernetes;protocol=3Dhttps;destsuffix=3Dgit/src/github.com/=
kubernetes/kubernetes \
> >             git://github.com/kubernetes/release;branch=3Dmaster;name=3D=
kubernetes-release;destsuffix=3Dgit/release;protocol=3Dhttps"
> >
> >  SRC_URI:append =3D " \
> > @@ -69,7 +69,7 @@ do_compile() {
> >       export CC=3D"${BUILD_CC}"
> >       export LD=3D"${BUILD_LD}"
> >
> > -     make generated_files GO=3D"go" KUBE_BUILD_PLATFORMS=3D"${HOST_GOO=
S}/${BUILD_GOARCH}"
> > +     #make generated_files GO=3D"go" KUBE_BUILD_PLATFORMS=3D"${HOST_GO=
OS}/${BUILD_GOARCH}"
> >
> >       # Build the target binaries
> >       export GOARCH=3D"${TARGET_GOARCH}"
> > --
> > 2.37.1
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7935): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7935
> Mute This Topic: https://lists.yoctoproject.org/mt/96719358/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

