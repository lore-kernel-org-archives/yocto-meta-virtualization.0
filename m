Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACA7C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 19:53:31 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.104845.1701114802183275234
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 11:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZEws2kER;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35d01ac2877so1232765ab.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 11:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701114801; x=1701719601; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFi78FKNxaBP5ezGHOIeyWrK4BrhkmihjHL8C1GqRgM=;
        b=ZEws2kER2DraCZvpqvGBVY1QS6FwD/uuUIO9wW9es9cbbdBOjFCDRegFMnzfW9Jl0N
         Z1crG7B11lDIlwX2ipznlL+1+RM63YK6sBEE0aIwIDFfkmJwZRvj+UMx8TdgRdV8Sc4d
         fDD5s7OIxE33gpT6arBju+C4lq0VvUoQ2ge8NooXEJJpyyDGBuY2vULQsEku1GHUgsT0
         ZY9vHU4VTcYMgSapfRHITHFLg6YL33LluceoYTBJGbsvJ4SjYsCd9zOV88gXVMLggron
         wpNvudl8m6d3/PBANyd2fl3VHJKboELOiz1goiXBzm9Fp15i2WYjP5RDztqa1GmznluJ
         L1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701114801; x=1701719601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFi78FKNxaBP5ezGHOIeyWrK4BrhkmihjHL8C1GqRgM=;
        b=CWcQq8/oNxPdnH8TTOLhLnfWNejphLFupeI10H7CUN3y/o80r9TGRr+QeSyOAFrXkw
         pA69QHm4auw9gu8SRHuf8JW42hCD4AeiGO3SJ1+v2+UILoV5Z7Ng7oczIxOJ3vQoGaGu
         KjQwNrK1R3VnWrhAe/MtxTf95Sn/dxG2NZxT/rIiH//Td5lFf90QSrOVXeri8e4BLt2p
         PPlr+F1ijdFF6PFU1Zl6Xvs+E6RO+i508z6zuVsODJPHI1ztSL1Gb4Z5XlFfgTITVaO8
         zJWNZUWEhyzGZtLi5VC26VnFWuTFgnj0ao+udW1k7pK6ificdfxjGpqPe0UkYxBWUQKM
         eWgw==
X-Gm-Message-State: AOJu0Yx4SgqYd8cc3r3Zd11RHvqxOVziRE7ONR/xV3PzSv0Rj33fIv0x
	Q0QodprVV4gcbbaMSPtfGbgT/DVQKy2NQJ9jlpA=
X-Google-Smtp-Source: AGHT+IEMVbw/HbKXAppwgd0Hq0j2eEPWF2EJe0zIE8admskdedvx64YgeGQAwhQ2RUk5dCf43pi6EnnSwNMKSPhzPw8=
X-Received: by 2002:a05:6e02:198b:b0:35c:d0b2:2e3 with SMTP id
 g11-20020a056e02198b00b0035cd0b202e3mr6505021ilf.21.1701114801292; Mon, 27
 Nov 2023 11:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20231127193236.2038055-1-jose.quaresma@foundries.io>
In-Reply-To: <20231127193236.2038055-1-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Nov 2023 14:53:10 -0500
Message-ID: <CADkTA4MY1tZxc=D73oktxwr5v4BWXpxKPd=ck=ZiD_xbG8vxZQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-compose: v2.20.3 -> v2.21.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 19:53:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8472

I'll have a look at this in a week or so, but at the moment, I'm not
taking any package version bumps as my focus is on finishing the
nanbield release.

But at a glance, there's some whitespace change that shouldn't be in the pa=
tch.

Bruce

On Mon, Nov 27, 2023 at 2:32=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
> d6f842b0 test: e2e test reliability improvements (#10950)
> 4fbbf201 build(deps): upgrade to compose-go v1.18.3 (#10947)
> 935d72f4 added the dot at the end of the sentence
> 41682acc add support for attributes exposed by `docker ps`
> 1054792b align docker compose ps with docker CLI to support --format
> 19f66918 watch: only allow a single instance per-project
> 186744e0 ci: bump golangci-lint to v1.54.2
> bc9d696f Merge pull request #10922 from thaJeztah/replace_dockerignore
> 6204fb1c logs: fix for missing output on container exit (#10925)
> 5d732010 replace dockerfile/dockerignore with patternmatcher/ignorefile
> 2006f3fe go.mod: github.com/moby/patternmatcher v0.6.0
> 192718c0 go.mod: remove some outdated comments
> c79f67fe otel: add `include` to project up span
> 3b294bfd build(deps): bump github.com/compose-spec/compose-go from 1.18.1=
 to 1.18.2 (#10915)
> dd34f7a2 include: add experimental support for Git resources (#10811)
> caad7271 up: handle various attach use cases better
> 792afb8d build: use correct values for proxy variables (#10908)
> 150449bb warn user secret uid/gid/mode is not supported
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> --
>
> There are more recent updates but they require go 1.21
> | cmd/compose/create.go:22:2: package slices is not in GOROOT (/lmp/build=
-lmp-intel-corei7-64-main-next-container/tmp-lmp/work/corei7-64-lmp-linux/d=
ocker-compose/v2.23.0/recipe-sysroot/usr/lib/go/src/slices)
> | note: imported by a module that requires go 1.21
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  .../docker-compose/docker-compose_git.bb        |  4 ++--
>  .../docker-compose/files/modules.txt            |  6 ++++--
>  .../docker-compose/relocation.inc               |  7 ++++---
>  recipes-containers/docker-compose/src_uri.inc   | 17 +++++++++++------
>  4 files changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/re=
cipes-containers/docker-compose/docker-compose_git.bb
> index f6a2502..092ce3d 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -9,7 +9,7 @@ DEPENDS =3D " \
>
>  # Specify the first two important SRCREVs as the format
>  SRCREV_FORMAT=3D"compose_survey"
> -SRCREV_compose =3D "8d0df1876296bc639614653ba5de38a377da5356"
> +SRCREV_compose =3D "d6f842b042d2f2926901305336527b3eaadf067a"
>
>  SRC_URI =3D "git://github.com/docker/compose;name=3Dcompose;branch=3Dmai=
n;protocol=3Dhttps"
>
> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D1=
75792518e4ac015ab6696d16c4f60
>
>  GO_IMPORT =3D "import"
>
> -PV =3D "v2.20.3"
> +PV =3D "v2.21.0"
>
>  COMPOSE_PKG =3D "github.com/docker/compose/v2"
>
> diff --git a/recipes-containers/docker-compose/files/modules.txt b/recipe=
s-containers/docker-compose/files/modules.txt
> index 0ba3cd1..d287d12 100644
> --- a/recipes-containers/docker-compose/files/modules.txt
> +++ b/recipes-containers/docker-compose/files/modules.txt
> @@ -2,9 +2,11 @@
>  ## explicit
>  # github.com/Microsoft/go-winio v0.6.1
>  ## explicit
> +# github.com/adrg/xdg v0.4.0
> +## explicit
>  # github.com/buger/goterm v1.0.4
>  ## explicit
> -# github.com/compose-spec/compose-go v1.18.1
> +# github.com/compose-spec/compose-go v1.18.3
>  ## explicit
>  # github.com/containerd/console v1.0.3
>  ## explicit
> @@ -42,7 +44,7 @@
>  ## explicit
>  # github.com/moby/buildkit v0.12.1
>  ## explicit
> -# github.com/moby/patternmatcher v0.5.0
> +# github.com/moby/patternmatcher v0.6.0
>  ## explicit
>  # github.com/moby/term v0.5.0
>  ## explicit
> diff --git a/recipes-containers/docker-compose/relocation.inc b/recipes-c=
ontainers/docker-compose/relocation.inc
> index a1a12c8..9e6eacf 100644
> --- a/recipes-containers/docker-compose/relocation.inc
> +++ b/recipes-containers/docker-compose/relocation.inc
> @@ -19,6 +19,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
>             golang.org/x/time:golang.org/x/time:force \
>             go.uber.org/goleak:go.uber.org/goleak:force \
>             golang.org/x/tools:golang.org/x/tools:force \
> +           github.com/adrg/xdg:github.com/adrg/xdg:force \
>             golang.org/x/crypto:golang.org/x/crypto:force \
>             golang.org/x/oauth2:golang.org/x/oauth2:force \
>             k8s.io/apimachinery:k8s.io/apimachinery:force \
> @@ -189,9 +190,9 @@ do_compile:prepend() {
>          force_flag=3D$(echo $s | cut -d: -f3)
>          mkdir -p vendor.copy/$site_dest
>          if [ -n "$force_flag" ]; then
> -           echo "[INFO] $site_dest: force copying .go files"
> -           rm -rf vendor.copy/$site_dest
> -           rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.fet=
ch/$site_source/ vendor.copy/$site_dest
> +            echo "[INFO] $site_dest: force copying .go files"
> +            rm -rf vendor.copy/$site_dest
> +            rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.fe=
tch/$site_source/ vendor.copy/$site_dest
>          else
>              [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" ] &=
& { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skipped (=
files present)" ; true ; } || { echo "[INFO] $site_dest: copying .go files"=
 ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.fetch/$site_so=
urce/ vendor.copy/$site_dest ; }
>          fi
> diff --git a/recipes-containers/docker-compose/src_uri.inc b/recipes-cont=
ainers/docker-compose/src_uri.inc
> index 1194804..8897c9c 100644
> --- a/recipes-containers/docker-compose/src_uri.inc
> +++ b/recipes-containers/docker-compose/src_uri.inc
> @@ -103,6 +103,11 @@ SRC_URI +=3D "git://github.com/uber-go/goleak;name=
=3Dgoleak;protocol=3Dhttps;nobranch=3D
>  SRCREV_tools=3D"031fc75960d487b0b15db12fb328676236a3a39c"
>  SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gola=
ng.org/x/tools"
>
> +#       github.com/adrg/xdg v0.4.0
> +# [1] git ls-remote https://github.com/adrg/xdg 4ec40e24f0cf1039f93c773f=
2984decdea9719b5
> +SRCREV_xdg=3D"4ec40e24f0cf1039f93c773f2984decdea9719b5"
> +SRC_URI +=3D "git://github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/a=
drg/xdg"
> +
>  #       golang.org/x/crypto v0.7.0
>  # [1] git ls-remote https://go.googlesource.com/crypto 776e461a4e6d8b372=
a43c72122c5c28cfc40dca2
>  SRCREV_crypto=3D"776e461a4e6d8b372a43c72122c5c28cfc40dca2"
> @@ -558,9 +563,9 @@ SRC_URI +=3D "git://github.com/jonboulle/clockwork;na=
me=3Dclockwork;protocol=3Dhttps;n
>  SRCREV_go-shellwords=3D"973b9d5391598d4ee601db46fa32f6e186a356ac"
>  SRC_URI +=3D "git://github.com/mattn/go-shellwords;name=3Dgo-shellwords;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/mattn/go-shellwords"
>
> -#       github.com/moby/patternmatcher v0.5.0
> -# [1] git ls-remote https://github.com/moby/patternmatcher c5e4b22c8cb29=
0f9439a339c08bba6cb13aa296d
> -SRCREV_patternmatcher=3D"c5e4b22c8cb290f9439a339c08bba6cb13aa296d"
> +#       github.com/moby/patternmatcher v0.6.0
> +# [1] git ls-remote https://github.com/moby/patternmatcher 347bb8d8d557f=
90d1b75cd8bca3c0177f380a979
> +SRCREV_patternmatcher=3D"347bb8d8d557f90d1b75cd8bca3c0177f380a979"
>  SRC_URI +=3D "git://github.com/moby/patternmatcher;name=3Dpatternmatcher=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/moby/patternmatcher"
>
>  #       go.opentelemetry.io/otel/trace v1.14.0
> @@ -698,9 +703,9 @@ SRC_URI +=3D "git://github.com/in-toto/in-toto-golang=
;name=3Din-toto-golang;protocol
>  SRCREV_go-shellquote=3D"95032a82bc518f77982ea72343cc1ade730072f0"
>  SRC_URI +=3D "git://github.com/kballard/go-shellquote;name=3Dgo-shellquo=
te;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/kballard/go-shellquote"
>
> -#       github.com/compose-spec/compose-go v1.18.1
> -# [1] git ls-remote https://github.com/compose-spec/compose-go 45494a8f6=
b0176d040c82577f82c84377426a9e6
> -SRCREV_compose-go=3D"45494a8f6b0176d040c82577f82c84377426a9e6"
> +#       github.com/compose-spec/compose-go v1.18.3
> +# [1] git ls-remote https://github.com/compose-spec/compose-go c6eecc55b=
95f952b6d6406adcd297499d11a300b
> +SRCREV_compose-go=3D"c6eecc55b95f952b6d6406adcd297499d11a300b"
>  SRC_URI +=3D "git://github.com/compose-spec/compose-go;name=3Dcompose-go=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/compose-spec/compose-go"
>
>  #       github.com/hashicorp/go-multierror v1.1.1
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8471): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8471
> Mute This Topic: https://lists.yoctoproject.org/mt/102836354/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

