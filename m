Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C367C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 18:50:11 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.3118.1716576606226854636
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 11:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VzyP0z5P;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2bf62b121ccso701616a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716576606; x=1717181406; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpJ89fY12osxdYR0iNNkSrjP0hUrSuBNVQdMF7pe1mM=;
        b=VzyP0z5PO/XSZPvVQb8vA//qwpgQ3DwU6IKZYDnmKh4sVvqppFEJ99Ltc/LyAo30yY
         qA0aac2uU0TE1CeMpVITRzmkOHqbkMPipCELqeJcWATcp4XVokqY7q9A34018Sh/PyW4
         UQs1zT9+fRqF7ISrewOv1lYZOXBfa4729JgPREj63XI+3XHkhgk7fCmEM4iwHEePCZwf
         GUTtoJkeNj4QBHtWaaIUx40Pmd7aIoQgFJ3GRDmuDBAcW41cx8niGqZJ9qHFvIiiHLS3
         7HG8FB4pbkhUWcdO4eRjqt3ZDDSlCOmPDGenWrtfRY7IZ83MSUijKhbS8qu7e9snk+lJ
         AzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716576606; x=1717181406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpJ89fY12osxdYR0iNNkSrjP0hUrSuBNVQdMF7pe1mM=;
        b=Zm5IPJyFaiwszqATDpQ4zEFWHkOGp0msUPtL/TaYWVzgCV1cHodq7RQjl22UUDBXjm
         hsqzLvEFhvbp1Zp6vSHjlBrrnUbN2oGPocrVU6xYgpIqa9hT6a7X4ISbnbuIdmIRsKGK
         VnGTwNUqU2UZoI1kDzBjGrEomQuMprvOR+pBE2TBZ4WSzc3MmcLa3jRRVSISN/Gz9SB7
         eRr5hqsQ9PX06BACULSmuEjTq25X5ko/bf55de9Vb62urpcEAPA9jwyAWYVDlXDlB7KF
         LXS7uhevebR6oWtcML5jOY7timx2k0yKyPkIy1yjaRXp12TBgXzocNfuMTD+t7+iJOiE
         GOYw==
X-Gm-Message-State: AOJu0YyFvtmCTFUy3kV0GCwcf4//ppEZ9xJRXLhtlQhLwCu2U4u9HB+v
	vMMNv0kQaMwbGfgQy+u66PkBmSwxgjySKNYBUIU+14kz8KBJPWOk0+4128RxD81fnlVOO7tKsNh
	2ytj/mo2y9R26NeQ1y1Bzcj2pAZo=
X-Google-Smtp-Source: AGHT+IH1mDf9rf0+v0kv59WDhwyNfoauTYaZMnMld3DDRRBO2DhhOEDmqwhBIPn/ixjyR6Mv1iGJbcmyrtRTdsCh5Dg=
X-Received: by 2002:a17:90a:fd8e:b0:2bd:eef3:fa9f with SMTP id
 98e67ed59e1d1-2bdeef3fb6bmr6962403a91.19.1716576605419; Fri, 24 May 2024
 11:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240524062746.232409-1-martin.jansa@gmail.com> <20240524062746.232409-3-martin.jansa@gmail.com>
In-Reply-To: <20240524062746.232409-3-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 May 2024 14:49:53 -0400
Message-ID: <CADkTA4OORWbRqwNm4+E1uWa6fetd-82UwZ==ra1Nxqb2v74v9Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 3/4] runc: use GO_SRCURI_DESTSUFFIX
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	"Theodore A . Roth" <theodore_roth@trimble.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 18:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8751

On Fri, May 24, 2024 at 2:28=E2=80=AFAM Martin Jansa via
lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> * see:
>   https://lists.openembedded.org/g/openembedded-architecture/message/2007
>   and
>   https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2b6=
57fb4c58429ab14f1edc2473c1327
>
> * the files are now unpacked in different directory and paths in patches
>   no longer match.
>
> * WIP started by me and finished by Theodore, thank you!
>
> * fixes:
>   http://errors.yoctoproject.org/Errors/Details/772681/
>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  ...spect-GOBUILDFLAGS-for-runc-and-remove-re.patch |  6 +++---
>  .../0001-runc-Add-console-socket-dev-null.patch    |  4 ++--
>  .../0001-runc-docker-SIGUSR1-daemonize.patch       |  8 ++++----
>  recipes-containers/runc/runc-docker_git.bb         |  8 ++++----
>  recipes-containers/runc/runc-opencontainers_git.bb |  4 ++--
>  recipes-containers/runc/runc.inc                   | 14 +++++++-------
>  6 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDF=
LAGS-for-runc-and-remove-re.patch b/recipes-containers/runc/files/0001-Make=
file-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> index 9e5a8313..30332114 100644
> --- a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-fo=
r-runc-and-remove-re.patch
> +++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-fo=
r-runc-and-remove-re.patch
> @@ -13,10 +13,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.c=
om>
>   Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> -Index: git/src/import/Makefile
> +Index: Makefile
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/import/Makefile
> -+++ git/src/import/Makefile
> +--- a/Makefile
> ++++ b/Makefile
>  @@ -24,7 +24,7 @@
>                 GO_BUILDMODE :=3D "-buildmode=3Dpie"
>         endif
> diff --git a/recipes-containers/runc/runc-docker/0001-runc-Add-console-so=
cket-dev-null.patch b/recipes-containers/runc/runc-docker/0001-runc-Add-con=
sole-socket-dev-null.patch
> index cb0ddc37..91d56e7b 100644
> --- a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-de=
v-null.patch
> +++ b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-de=
v-null.patch
> @@ -16,8 +16,8 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com=
>
>
>  Index: git/src/import/utils_linux.go
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/import/utils_linux.go
> -+++ git/src/import/utils_linux.go
> +--- a/utils_linux.go
> ++++ b/utils_linux.go
>  @@ -267,6 +267,11 @@
>   }
>
> diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1=
-daemonize.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-SIG=
USR1-daemonize.patch
> index d3d1134b..bcf0cb27 100644
> --- a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemon=
ize.patch
> +++ b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemon=
ize.patch
> @@ -33,8 +33,8 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com=
>
>
>  Index: git/src/import/signals.go
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/import/signals.go
> -+++ git/src/import/signals.go
> +--- a/signals.go
> ++++ b/signals.go
>  @@ -5,7 +5,9 @@
>   import (
>         "os"
> @@ -120,8 +120,8 @@ Index: git/src/import/signals.go
>         _ =3D tty.resize()
>  Index: git/src/import/utils_linux.go
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/import/utils_linux.go
> -+++ git/src/import/utils_linux.go
> +--- a/utils_linux.go
> ++++ b/utils_linux.go
>  @@ -345,7 +345,7 @@
>         if err !=3D nil {
>                 r.terminate(process)
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-contain=
ers/runc/runc-docker_git.bb
> index 8d078e85..21291c7e 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -3,10 +3,10 @@ include runc.inc
>  # Note: this rev is before the required protocol field, update when all =
components
>  #       have been updated to match.
>  SRCREV_runc-docker =3D "a9833ff391a71b30069a6c3f816db113379a4346"
> -SRC_URI =3D "git://github.com/opencontainers/runc;branch=3Drelease-1.1;n=
ame=3Drunc-docker;protocol=3Dhttps \
> -           file://0001-runc-Add-console-socket-dev-null.patch \
> -           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove=
-re.patch \
> -           file://0001-runc-docker-SIGUSR1-daemonize.patch \
> +SRC_URI =3D "git://github.com/opencontainers/runc;branch=3Drelease-1.1;n=
ame=3Drunc-docker;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}  \
> +           file://0001-runc-Add-console-socket-dev-null.patch;patchdir=
=3D${GO_SRCURI_DESTSUFFIX} \
> +           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove=
-re.patch;patchdir=3D${GO_SRCURI_DESTSUFFIX} \
> +           file://0001-runc-docker-SIGUSR1-daemonize.patch;patchdir=3D${=
GO_SRCURI_DESTSUFFIX} \
>            "
>
>  RUNC_VERSION =3D "1.1.12"
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes=
-containers/runc/runc-opencontainers_git.bb
> index 188b8440..aba59ea1 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -2,8 +2,8 @@ include runc.inc
>
>  SRCREV =3D "a9833ff391a71b30069a6c3f816db113379a4346"
>  SRC_URI =3D " \
> -    git://github.com/opencontainers/runc;branch=3Drelease-1.1;protocol=
=3Dhttps \
> -    file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.pat=
ch \
> +    git://github.com/opencontainers/runc;branch=3Drelease-1.1;protocol=
=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
> +    file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.pat=
ch;patchdir=3D${GO_SRCURI_DESTSUFFIX} \
>      "
>  RUNC_VERSION =3D "1.1.12"
>

I have a much simpler patch for this and some of the other ripple effects
under test.

I haven't needed to change the definition of S, which means that there are
much fewer other changes required.

I'm building and creating a working runc with the three or four line
patch (runc-docker
still needs more).

I'm just convincing myself that I'm not overlooking something obvious
and then I'll
start queuing and sending out patches.

Bruce

> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/r=
unc.inc
> index c8e74273..3e7a9712 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -4,9 +4,9 @@ DESCRIPTION =3D "runc is a CLI tool for spawning and runn=
ing containers according
>
>  # Apache-2.0 for containerd
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D435b266b3899aa8a95=
9f17d41c56def8"
> +LIC_FILES_CHKSUM =3D "file://${GO_SRCURI_DESTSUFFIX}/LICENSE;md5=3D435b2=
66b3899aa8a959f17d41c56def8"
>
> -S =3D "${WORKDIR}/git"
> +S =3D "${UNPACKDIR}"
>
>  PV =3D "${RUNC_VERSION}+git${SRCPV}"
>
> @@ -44,18 +44,18 @@ do_compile() {
>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>         # docker to download its dependencies but rather
>         # use dependencies packaged independently.
> -       cd ${S}/src/import
> +       cd ${S}/${GO_SRCURI_DESTSUFFIX}
>         rm -rf .gopath
>         dname=3D`dirname "${LIBCONTAINER_PACKAGE}"`
>         bname=3D`basename "${LIBCONTAINER_PACKAGE}"`
>         mkdir -p .gopath/src/${dname}
>
>         (cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname}=
)
> -       export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:$=
{STAGING_DIR_TARGET}/${prefix}/local/go"
> +       export GOPATH=3D"${S}/${GO_SRCURI_DESTSUFFIX}/.gopath:${S}/${GO_S=
RCURI_DESTSUFFIX}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>
>         # Fix up symlink for go-cross compiler
> -       rm -f ${S}/src/import/vendor/src
> -       ln -sf ./ ${S}/src/import/vendor/src
> +       rm -f ${S}/${GO_SRCURI_DESTSUFFIX}/vendor/src
> +       ln -sf ./ ${S}/${GO_SRCURI_DESTSUFFIX}/vendor/src
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> @@ -77,7 +77,7 @@ do_compile() {
>  do_install() {
>         mkdir -p ${D}/${bindir}
>
> -       cp ${S}/src/import/runc ${D}/${bindir}/runc
> +       cp ${S}/${GO_SRCURI_DESTSUFFIX}/runc ${D}/${bindir}/runc
>         ln -sf runc ${D}/${bindir}/docker-runc
>  }
>
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8747): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8747
> Mute This Topic: https://lists.yoctoproject.org/mt/106277145/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

