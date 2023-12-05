Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67776C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 10:10:49 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.96265.1701771041625445045
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Dec 2023 02:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AYiKtN6O;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4b2dc44d54aso636359e0c.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Dec 2023 02:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701771040; x=1702375840; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FGraVfXu9bLJleryVav5MxCIGO7RWVknxnr5q6Js+Xo=;
        b=AYiKtN6OGMh8dMMBLJmUY7mlPeEEhwrItFJnBeG1NFOkZjAMglcAGXPWeKQ6m/gkUT
         arOKoiWLzLA7+2pyflo9jq/7UnHs/Bgollax1DqpuguqV04EvpjXLE9DOo70qQz7bcJ4
         h8rSn4Uh4Gg/Phm6LvX7YWXBSJdFWZqVsstPjwPwkwwHLJXMdoB104NenvcxV7zH0dsv
         ITezh2RrqGFKMeNIq2Sjsw6wmWpv2mj+fiiJnNm7zIxcHeEIrsCTAUvnx8Z5VstCow5t
         1AUutYIbwvbTjVB+cvbUZ1nCFL4Y4dm2Zz9kxHceGGw60lnlWY8PztxuZMGNnvInlfjP
         +TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701771040; x=1702375840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGraVfXu9bLJleryVav5MxCIGO7RWVknxnr5q6Js+Xo=;
        b=XR408RteSF7dDvW01nM66BESfPDDwZDv4DqZmJ7J1WC/oNBFlR94e2gLjS7tU8AihC
         pzy3kXFfkxZ9tMTmp2TdIZlHMhYoz4ZsDJXdk68/zxE5gnm0ZQ1LduCHMTJl8yx0qO5b
         4Xw+fRMOvIWUAdlXfJo1eO8+KPR1B8qpudfspitu/Iz8VMQ+IlIaho52ozmftZ6dZyTK
         9DV2iVnuEzR0U3xp9yeOvw8iz/0Q+vUu3v8t8m9jYQYQZ3o1fYpm4nFRSID16VCLQD0U
         8P+BNTHj4bKZUT8hMrTpcAiV2vrF/rHEcnY8Z8EFiJdNjQlaK0PW7FOt02gB402awHXn
         qi1A==
X-Gm-Message-State: AOJu0Yz715qQVuG3saanTFT/IH9t/yJrxG3zgBJn+IoDvTEEMYw+z0TR
	sKIDyMBBu9LsU05hKpcDl8WFyPfSS8NyMtLXUPc=
X-Google-Smtp-Source: AGHT+IHaOcTD0P5Y3JwTVQRDcbhk4N26wPjla+HQv5Q6+KWCRGcm4lcVjs2WpsG9jDh8HofA5bPNQTTG4hCBLjLzdiY=
X-Received: by 2002:a1f:7c82:0:b0:4b2:c554:d2b2 with SMTP id
 x124-20020a1f7c82000000b004b2c554d2b2mr2938073vkc.20.1701771040445; Tue, 05
 Dec 2023 02:10:40 -0800 (PST)
MIME-Version: 1.0
References: <20231128103549.2088530-1-jose.quaresma@foundries.io>
 <20231128103549.2088530-2-jose.quaresma@foundries.io> <ZW4+qszCeEylJxwY@gmail.com>
In-Reply-To: <ZW4+qszCeEylJxwY@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 5 Dec 2023 10:10:29 +0000
Message-ID: <CANPvuR=i8K_rJXbtZFXPfb5BNYD6td5xRQAG8=ZBVbwaCg65Qg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] docker-compose: v2.20.3 -> v2.21.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000005ad9bb060bc072d9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Dec 2023 10:10:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8490

--0000000000005ad9bb060bc072d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia segunda,
4/12/2023 =C3=A0(s) 21:03:

> merged.
>
> I've pushed my wip update to newer docker-compose versions to
> master-next. Once oe-core updates go, I'll complete that effort.
>

I have also this wip already in my hands but need to find some time to
update go in oe-core.

Jose


>
> Bruce
>
> In message: [meta-virtualization][PATCH 2/2] docker-compose: v2.20.3 ->
> v2.21.0
> on 28/11/2023 Jose Quaresma wrote:
>
> > - d6f842b0 test: e2e test reliability improvements (#10950)
> > - 4fbbf201 build(deps): upgrade to compose-go v1.18.3 (#10947)
> > - 935d72f4 added the dot at the end of the sentence
> > - 41682acc add support for attributes exposed by `docker ps`
> > - 1054792b align docker compose ps with docker CLI to support --format
> > - 19f66918 watch: only allow a single instance per-project
> > - 186744e0 ci: bump golangci-lint to v1.54.2
> > - bc9d696f Merge pull request #10922 from thaJeztah/replace_dockerignor=
e
> > - 6204fb1c logs: fix for missing output on container exit (#10925)
> > - 5d732010 replace dockerfile/dockerignore with patternmatcher/ignorefi=
le
> > - 2006f3fe go.mod: github.com/moby/patternmatcher v0.6.0
> > - 192718c0 go.mod: remove some outdated comments
> > - c79f67fe otel: add `include` to project up span
> > - 3b294bfd build(deps): bump github.com/compose-spec/compose-go from
> 1.18.1 to 1.18.2 (#10915)
> > - dd34f7a2 include: add experimental support for Git resources (#10811)
> > - caad7271 up: handle various attach use cases better
> > - 792afb8d build: use correct values for proxy variables (#10908)
> > - 150449bb warn user secret uid/gid/mode is not supported
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >
> > There are more versions available but they require go 1.21 so this is
> the latest wich support 1.20
> > | cmd/compose/create.go:22:2: package slices is not in GOROOT
> (/lmp/build-lmp-intel-corei7-64-main-next-container/tmp-lmp/work/corei7-6=
4-lmp-linux/docker-compose/v2.23.0/recipe-sysroot/usr/lib/go/src/sl>
> > | note: imported by a module that requires go 1.21
> >
> > v2: tweak the commit message
> >
> >  .../docker-compose/docker-compose_git.bb        |  4 ++--
> >  .../docker-compose/files/modules.txt            |  6 ++++--
> >  .../docker-compose/relocation.inc               |  7 ++++---
> >  recipes-containers/docker-compose/src_uri.inc   | 17 +++++++++++------
> >  4 files changed, 21 insertions(+), 13 deletions(-)
> >
> > diff --git a/recipes-containers/docker-compose/docker-compose_git.bb
> b/recipes-containers/docker-compose/docker-compose_git.bb
> > index f6a2502..092ce3d 100644
> > --- a/recipes-containers/docker-compose/docker-compose_git.bb
> > +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> > @@ -9,7 +9,7 @@ DEPENDS =3D " \
> >
> >  # Specify the first two important SRCREVs as the format
> >  SRCREV_FORMAT=3D"compose_survey"
> > -SRCREV_compose =3D "8d0df1876296bc639614653ba5de38a377da5356"
> > +SRCREV_compose =3D "d6f842b042d2f2926901305336527b3eaadf067a"
> >
> >  SRC_URI =3D "git://
> github.com/docker/compose;name=3Dcompose;branch=3Dmain;protocol=3Dhttps"
> >
> > @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D175792518e4ac015ab6696d16c4f60
> >
> >  GO_IMPORT =3D "import"
> >
> > -PV =3D "v2.20.3"
> > +PV =3D "v2.21.0"
> >
> >  COMPOSE_PKG =3D "github.com/docker/compose/v2"
> >
> > diff --git a/recipes-containers/docker-compose/files/modules.txt
> b/recipes-containers/docker-compose/files/modules.txt
> > index 0ba3cd1..d287d12 100644
> > --- a/recipes-containers/docker-compose/files/modules.txt
> > +++ b/recipes-containers/docker-compose/files/modules.txt
> > @@ -2,9 +2,11 @@
> >  ## explicit
> >  # github.com/Microsoft/go-winio v0.6.1
> >  ## explicit
> > +# github.com/adrg/xdg v0.4.0
> > +## explicit
> >  # github.com/buger/goterm v1.0.4
> >  ## explicit
> > -# github.com/compose-spec/compose-go v1.18.1
> > +# github.com/compose-spec/compose-go v1.18.3
> >  ## explicit
> >  # github.com/containerd/console v1.0.3
> >  ## explicit
> > @@ -42,7 +44,7 @@
> >  ## explicit
> >  # github.com/moby/buildkit v0.12.1
> >  ## explicit
> > -# github.com/moby/patternmatcher v0.5.0
> > +# github.com/moby/patternmatcher v0.6.0
> >  ## explicit
> >  # github.com/moby/term v0.5.0
> >  ## explicit
> > diff --git a/recipes-containers/docker-compose/relocation.inc
> b/recipes-containers/docker-compose/relocation.inc
> > index a1a12c8..9e6eacf 100644
> > --- a/recipes-containers/docker-compose/relocation.inc
> > +++ b/recipes-containers/docker-compose/relocation.inc
> > @@ -19,6 +19,7 @@ export sites=3D"k8s.io/api:k8s.io/api:force \
> >             golang.org/x/time:golang.org/x/time:force \
> >             go.uber.org/goleak:go.uber.org/goleak:force \
> >             golang.org/x/tools:golang.org/x/tools:force \
> > +           github.com/adrg/xdg:github.com/adrg/xdg:force \
> >             golang.org/x/crypto:golang.org/x/crypto:force \
> >             golang.org/x/oauth2:golang.org/x/oauth2:force \
> >             k8s.io/apimachinery:k8s.io/apimachinery:force \
> > @@ -189,9 +190,9 @@ do_compile:prepend() {
> >          force_flag=3D$(echo $s | cut -d: -f3)
> >          mkdir -p vendor.copy/$site_dest
> >          if [ -n "$force_flag" ]; then
> > -         echo "[INFO] $site_dest: force copying .go files"
> > -         rm -rf vendor.copy/$site_dest
> > -         rsync -a --exclude=3D'vendor/' --exclude=3D'.git/'
> vendor.fetch/$site_source/ vendor.copy/$site_dest
> > +            echo "[INFO] $site_dest: force copying .go files"
> > +            rm -rf vendor.copy/$site_dest
> > +            rsync -a --exclude=3D'vendor/' --exclude=3D'.git/'
> vendor.fetch/$site_source/ vendor.copy/$site_dest
> >          else
> >              [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" ]
> && { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skippe=
d
> (files present)" ; true ; } || { echo "[INFO] $site_dest: copying .go
> files" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/'
> vendor.fetch/$site_source/ vendor.copy/$site_dest ; }
> >          fi
> > diff --git a/recipes-containers/docker-compose/src_uri.inc
> b/recipes-containers/docker-compose/src_uri.inc
> > index 1194804..8897c9c 100644
> > --- a/recipes-containers/docker-compose/src_uri.inc
> > +++ b/recipes-containers/docker-compose/src_uri.inc
> > @@ -103,6 +103,11 @@ SRC_URI +=3D "git://
> github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=3D
> >  SRCREV_tools=3D"031fc75960d487b0b15db12fb328676236a3a39c"
> >  SRC_URI +=3D "git://
> go.googlesource.com/tools;name=3Dtools;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools
> <http://go.googlesource.com/tools;name=3Dtools;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/golang.o=
rg/x/tools>
> "
> >
> > +#       github.com/adrg/xdg v0.4.0
> > +# [1] git ls-remote https://github.com/adrg/xdg
> 4ec40e24f0cf1039f93c773f2984decdea9719b5
> > +SRCREV_xdg=3D"4ec40e24f0cf1039f93c773f2984decdea9719b5"
> > +SRC_URI +=3D "git://
> github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/adrg/xdg
> <http://github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/adrg/x=
dg>
> "
> > +
> >  #       golang.org/x/crypto v0.7.0
> >  # [1] git ls-remote https://go.googlesource.com/crypto
> 776e461a4e6d8b372a43c72122c5c28cfc40dca2
> >  SRCREV_crypto=3D"776e461a4e6d8b372a43c72122c5c28cfc40dca2"
> > @@ -558,9 +563,9 @@ SRC_URI +=3D "git://
> github.com/jonboulle/clockwork;name=3Dclockwork;protocol=3Dhttps;n
> >  SRCREV_go-shellwords=3D"973b9d5391598d4ee601db46fa32f6e186a356ac"
> >  SRC_URI +=3D "git://
> github.com/mattn/go-shellwords;name=3Dgo-shellwords;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/m=
attn/go-shellwords
> <http://github.com/mattn/go-shellwords;name=3Dgo-shellwords;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fe=
tch/github.com/mattn/go-shellwords>
> "
> >
> > -#       github.com/moby/patternmatcher v0.5.0
> > -# [1] git ls-remote https://github.com/moby/patternmatcher
> c5e4b22c8cb290f9439a339c08bba6cb13aa296d
> > -SRCREV_patternmatcher=3D"c5e4b22c8cb290f9439a339c08bba6cb13aa296d"
> > +#       github.com/moby/patternmatcher v0.6.0
> > +# [1] git ls-remote https://github.com/moby/patternmatcher
> 347bb8d8d557f90d1b75cd8bca3c0177f380a979
> > +SRCREV_patternmatcher=3D"347bb8d8d557f90d1b75cd8bca3c0177f380a979"
> >  SRC_URI +=3D "git://
> github.com/moby/patternmatcher;name=3Dpatternmatcher;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
moby/patternmatcher
> <http://github.com/moby/patternmatcher;name=3Dpatternmatcher;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.f=
etch/github.com/moby/patternmatcher>
> "
> >
> >  #       go.opentelemetry.io/otel/trace v1.14.0
> > @@ -698,9 +703,9 @@ SRC_URI +=3D "git://
> github.com/in-toto/in-toto-golang;name=3Din-toto-golang;protocol
> >  SRCREV_go-shellquote=3D"95032a82bc518f77982ea72343cc1ade730072f0"
> >  SRC_URI +=3D "git://
> github.com/kballard/go-shellquote;name=3Dgo-shellquote;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/kballard/go-shellquote
> <http://github.com/kballard/go-shellquote;name=3Dgo-shellquote;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/kballard/go-shellquote>
> "
> >
> > -#       github.com/compose-spec/compose-go v1.18.1
> > -# [1] git ls-remote https://github.com/compose-spec/compose-go
> 45494a8f6b0176d040c82577f82c84377426a9e6
> > -SRCREV_compose-go=3D"45494a8f6b0176d040c82577f82c84377426a9e6"
> > +#       github.com/compose-spec/compose-go v1.18.3
> > +# [1] git ls-remote https://github.com/compose-spec/compose-go
> c6eecc55b95f952b6d6406adcd297499d11a300b
> > +SRCREV_compose-go=3D"c6eecc55b95f952b6d6406adcd297499d11a300b"
> >  SRC_URI +=3D "git://
> github.com/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
compose-spec/compose-go
> <http://github.com/compose-spec/compose-go;name=3Dcompose-go;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.f=
etch/github.com/compose-spec/compose-go>
> "
> >
> >  #       github.com/hashicorp/go-multierror v1.1.1
> > --
> > 2.43.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8478):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8478
> > Mute This Topic: https://lists.yoctoproject.org/mt/102848189/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005ad9bb060bc072d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
segunda, 4/12/2023 =C3=A0(s) 21:03:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">merged.<br>
<br>
I&#39;ve pushed my wip update to newer docker-compose versions to<br>
master-next. Once oe-core updates go, I&#39;ll complete that effort.<br></b=
lockquote><div><br></div><div>I have also this wip already in my hands but =
need to find some time to update go in oe-core.<br><br>Jose<br>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
In message: [meta-virtualization][PATCH 2/2] docker-compose: v2.20.3 -&gt; =
v2.21.0<br>
on 28/11/2023 Jose Quaresma wrote:<br>
<br>
&gt; - d6f842b0 test: e2e test reliability improvements (#10950)<br>
&gt; - 4fbbf201 build(deps): upgrade to compose-go v1.18.3 (#10947)<br>
&gt; - 935d72f4 added the dot at the end of the sentence<br>
&gt; - 41682acc add support for attributes exposed by `docker ps`<br>
&gt; - 1054792b align docker compose ps with docker CLI to support --format=
<br>
&gt; - 19f66918 watch: only allow a single instance per-project<br>
&gt; - 186744e0 ci: bump golangci-lint to v1.54.2<br>
&gt; - bc9d696f Merge pull request #10922 from thaJeztah/replace_dockerigno=
re<br>
&gt; - 6204fb1c logs: fix for missing output on container exit (#10925)<br>
&gt; - 5d732010 replace dockerfile/dockerignore with patternmatcher/ignoref=
ile<br>
&gt; - 2006f3fe go.mod: <a href=3D"http://github.com/moby/patternmatcher" r=
el=3D"noreferrer" target=3D"_blank">github.com/moby/patternmatcher</a> v0.6=
.0<br>
&gt; - 192718c0 go.mod: remove some outdated comments<br>
&gt; - c79f67fe otel: add `include` to project up span<br>
&gt; - 3b294bfd build(deps): bump <a href=3D"http://github.com/compose-spec=
/compose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/c=
ompose-go</a> from 1.18.1 to 1.18.2 (#10915)<br>
&gt; - dd34f7a2 include: add experimental support for Git resources (#10811=
)<br>
&gt; - caad7271 up: handle various attach use cases better<br>
&gt; - 792afb8d build: use correct values for proxy variables (#10908)<br>
&gt; - 150449bb warn user secret uid/gid/mode is not supported<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; There are more versions available but they require go 1.21 so this is =
the latest wich support 1.20<br>
&gt; | cmd/compose/create.go:22:2: package slices is not in GOROOT (/lmp/bu=
ild-lmp-intel-corei7-64-main-next-container/tmp-lmp/work/corei7-64-lmp-linu=
x/docker-compose/v2.23.0/recipe-sysroot/usr/lib/go/src/sl&gt;<br>
&gt; | note: imported by a module that requires go 1.21<br>
&gt; <br>
&gt; v2: tweak the commit message<br>
&gt; <br>
&gt;=C2=A0 .../docker-compose/<a href=3D"http://docker-compose_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 .../docker-compose/files/modules.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 6 ++++--<br>
&gt;=C2=A0 .../docker-compose/relocation.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++++---<br>
&gt;=C2=A0 recipes-containers/docker-compose/src_uri.inc=C2=A0 =C2=A0| 17 +=
++++++++++------<br>
&gt;=C2=A0 4 files changed, 21 insertions(+), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/docker-compose/<a href=3D"http://docke=
r-compose_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.b=
b</a> b/recipes-containers/docker-compose/<a href=3D"http://docker-compose_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><br>
&gt; index f6a2502..092ce3d 100644<br>
&gt; --- a/recipes-containers/docker-compose/<a href=3D"http://docker-compo=
se_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><b=
r>
&gt; +++ b/recipes-containers/docker-compose/<a href=3D"http://docker-compo=
se_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><b=
r>
&gt; @@ -9,7 +9,7 @@ DEPENDS =3D &quot; \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Specify the first two important SRCREVs as the format<br>
&gt;=C2=A0 SRCREV_FORMAT=3D&quot;compose_survey&quot;<br>
&gt; -SRCREV_compose =3D &quot;8d0df1876296bc639614653ba5de38a377da5356&quo=
t;<br>
&gt; +SRCREV_compose =3D &quot;d6f842b042d2f2926901305336527b3eaadf067a&quo=
t;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker/comp=
ose;name=3Dcompose;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/docker/compose;name=3Dcompose;branch=3Dmain;protoco=
l=3Dhttps</a>&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE=
;md5=3D175792518e4ac015ab6696d16c4f60<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 GO_IMPORT =3D &quot;import&quot;<br>
&gt;=C2=A0 <br>
&gt; -PV =3D &quot;v2.20.3&quot;<br>
&gt; +PV =3D &quot;v2.21.0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 COMPOSE_PKG =3D &quot;<a href=3D"http://github.com/docker/compos=
e/v2" rel=3D"noreferrer" target=3D"_blank">github.com/docker/compose/v2</a>=
&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/recipes-containers/docker-compose/files/modules.txt b/rec=
ipes-containers/docker-compose/files/modules.txt<br>
&gt; index 0ba3cd1..d287d12 100644<br>
&gt; --- a/recipes-containers/docker-compose/files/modules.txt<br>
&gt; +++ b/recipes-containers/docker-compose/files/modules.txt<br>
&gt; @@ -2,9 +2,11 @@<br>
&gt;=C2=A0 ## explicit<br>
&gt;=C2=A0 # <a href=3D"http://github.com/Microsoft/go-winio" rel=3D"norefe=
rrer" target=3D"_blank">github.com/Microsoft/go-winio</a> v0.6.1<br>
&gt;=C2=A0 ## explicit<br>
&gt; +# <a href=3D"http://github.com/adrg/xdg" rel=3D"noreferrer" target=3D=
"_blank">github.com/adrg/xdg</a> v0.4.0<br>
&gt; +## explicit<br>
&gt;=C2=A0 # <a href=3D"http://github.com/buger/goterm" rel=3D"noreferrer" =
target=3D"_blank">github.com/buger/goterm</a> v1.0.4<br>
&gt;=C2=A0 ## explicit<br>
&gt; -# <a href=3D"http://github.com/compose-spec/compose-go" rel=3D"norefe=
rrer" target=3D"_blank">github.com/compose-spec/compose-go</a> v1.18.1<br>
&gt; +# <a href=3D"http://github.com/compose-spec/compose-go" rel=3D"norefe=
rrer" target=3D"_blank">github.com/compose-spec/compose-go</a> v1.18.3<br>
&gt;=C2=A0 ## explicit<br>
&gt;=C2=A0 # <a href=3D"http://github.com/containerd/console" rel=3D"norefe=
rrer" target=3D"_blank">github.com/containerd/console</a> v1.0.3<br>
&gt;=C2=A0 ## explicit<br>
&gt; @@ -42,7 +44,7 @@<br>
&gt;=C2=A0 ## explicit<br>
&gt;=C2=A0 # <a href=3D"http://github.com/moby/buildkit" rel=3D"noreferrer"=
 target=3D"_blank">github.com/moby/buildkit</a> v0.12.1<br>
&gt;=C2=A0 ## explicit<br>
&gt; -# <a href=3D"http://github.com/moby/patternmatcher" rel=3D"noreferrer=
" target=3D"_blank">github.com/moby/patternmatcher</a> v0.5.0<br>
&gt; +# <a href=3D"http://github.com/moby/patternmatcher" rel=3D"noreferrer=
" target=3D"_blank">github.com/moby/patternmatcher</a> v0.6.0<br>
&gt;=C2=A0 ## explicit<br>
&gt;=C2=A0 # <a href=3D"http://github.com/moby/term" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/moby/term</a> v0.5.0<br>
&gt;=C2=A0 ## explicit<br>
&gt; diff --git a/recipes-containers/docker-compose/relocation.inc b/recipe=
s-containers/docker-compose/relocation.inc<br>
&gt; index a1a12c8..9e6eacf 100644<br>
&gt; --- a/recipes-containers/docker-compose/relocation.inc<br>
&gt; +++ b/recipes-containers/docker-compose/relocation.inc<br>
&gt; @@ -19,6 +19,7 @@ export sites=3D&quot;<a href=3D"http://k8s.io/api:k8=
s.io/api:force" rel=3D"noreferrer" target=3D"_blank">k8s.io/api:k8s.io/api:=
force</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golan=
g.org/x/time:golang.org/x/time:force" rel=3D"noreferrer" target=3D"_blank">=
golang.org/x/time:golang.org/x/time:force</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.ub=
er.org/goleak:go.uber.org/goleak:force" rel=3D"noreferrer" target=3D"_blank=
">go.uber.org/goleak:go.uber.org/goleak:force</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golan=
g.org/x/tools:golang.org/x/tools:force" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/tools:golang.org/x/tools:force</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com=
/adrg/xdg:github.com/adrg/xdg:force" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/adrg/xdg:github.com/adrg/xdg:force</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golan=
g.org/x/crypto:golang.org/x/crypto:force" rel=3D"noreferrer" target=3D"_bla=
nk">golang.org/x/crypto:golang.org/x/crypto:force</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golan=
g.org/x/oauth2:golang.org/x/oauth2:force" rel=3D"noreferrer" target=3D"_bla=
nk">golang.org/x/oauth2:golang.org/x/oauth2:force</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://k8s.i=
o/apimachinery:k8s.io/apimachinery:force" rel=3D"noreferrer" target=3D"_bla=
nk">k8s.io/apimachinery:k8s.io/apimachinery:force</a> \<br>
&gt; @@ -189,9 +190,9 @@ do_compile:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 force_flag=3D$(echo $s | cut -d: -f3=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p vendor.copy/$site_dest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$force_flag&quot; ]; t=
hen<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;[INFO] $site_dest: force=
 copying .go files&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf vendor.copy/$site_dest<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rsync -a --exclude=3D&#39;vendor/&#=
39; --exclude=3D&#39;.git/&#39; vendor.fetch/$site_source/ vendor.copy/$sit=
e_dest<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;[INFO] $site_des=
t: force copying .go files&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf vendor.copy/$site_de=
st<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rsync -a --exclude=3D&#39;v=
endor/&#39; --exclude=3D&#39;.git/&#39; vendor.fetch/$site_source/ vendor.c=
opy/$site_dest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -n &quot;$(ls -A ven=
dor.copy/$site_dest/*.go 2&gt; /dev/null)&quot; ] &amp;&amp; { echo &quot;[=
INFO] vendor.fetch/$site_source -&gt; $site_dest: go copy skipped (files pr=
esent)&quot; ; true ; } || { echo &quot;[INFO] $site_dest: copying .go file=
s&quot; ; rsync -a --exclude=3D&#39;vendor/&#39; --exclude=3D&#39;.git/&#39=
; vendor.fetch/$site_source/ vendor.copy/$site_dest ; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; diff --git a/recipes-containers/docker-compose/src_uri.inc b/recipes-c=
ontainers/docker-compose/src_uri.inc<br>
&gt; index 1194804..8897c9c 100644<br>
&gt; --- a/recipes-containers/docker-compose/src_uri.inc<br>
&gt; +++ b/recipes-containers/docker-compose/src_uri.inc<br>
&gt; @@ -103,6 +103,11 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github=
.com/uber-go/goleak;name=3Dgoleak;protocol=3Dhttps;nobranch=3D" rel=3D"nore=
ferrer" target=3D"_blank">github.com/uber-go/goleak;name=3Dgoleak;protocol=
=3Dhttps;nobranch=3D</a><br>
&gt;=C2=A0 SRCREV_tools=3D&quot;031fc75960d487b0b15db12fb328676236a3a39c&qu=
ot;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/t=
ools;name=3Dtools;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/golang.org/x/tools" rel=3D"noreferrer" t=
arget=3D"_blank">go.googlesource.com/tools;name=3Dtools;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org=
/x/tools</a>&quot;<br>
&gt;=C2=A0 <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/adrg/xdg" re=
l=3D"noreferrer" target=3D"_blank">github.com/adrg/xdg</a> v0.4.0<br>
&gt; +# [1] git ls-remote <a href=3D"https://github.com/adrg/xdg" rel=3D"no=
referrer" target=3D"_blank">https://github.com/adrg/xdg</a> 4ec40e24f0cf103=
9f93c773f2984decdea9719b5<br>
&gt; +SRCREV_xdg=3D&quot;4ec40e24f0cf1039f93c773f2984decdea9719b5&quot;<br>
&gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/adrg/xdg;name=
=3Dxdg;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/=
src/import/vendor.fetch/github.com/adrg/xdg" rel=3D"noreferrer" target=3D"_=
blank">github.com/adrg/xdg;name=3Dxdg;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/adrg/xdg</a>&quot=
;<br>
&gt; +<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/crypt=
o" rel=3D"noreferrer" target=3D"_blank">golang.org/x/crypto</a> v0.7.0<br>
&gt;=C2=A0 # [1] git ls-remote <a href=3D"https://go.googlesource.com/crypt=
o" rel=3D"noreferrer" target=3D"_blank">https://go.googlesource.com/crypto<=
/a> 776e461a4e6d8b372a43c72122c5c28cfc40dca2<br>
&gt;=C2=A0 SRCREV_crypto=3D&quot;776e461a4e6d8b372a43c72122c5c28cfc40dca2&q=
uot;<br>
&gt; @@ -558,9 +563,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.=
com/jonboulle/clockwork;name=3Dclockwork;protocol=3Dhttps;n" rel=3D"norefer=
rer" target=3D"_blank">github.com/jonboulle/clockwork;name=3Dclockwork;prot=
ocol=3Dhttps;n</a><br>
&gt;=C2=A0 SRCREV_go-shellwords=3D&quot;973b9d5391598d4ee601db46fa32f6e186a=
356ac&quot;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/mattn/go-s=
hellwords;name=3Dgo-shellwords;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/mattn/go-shellwo=
rds" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-shellwords;na=
me=3Dgo-shellwords;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${=
BP}/src/import/vendor.fetch/github.com/mattn/go-shellwords</a>&quot;<br>
&gt;=C2=A0 <br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/moby/pattern=
matcher" rel=3D"noreferrer" target=3D"_blank">github.com/moby/patternmatche=
r</a> v0.5.0<br>
&gt; -# [1] git ls-remote <a href=3D"https://github.com/moby/patternmatcher=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/patternmatch=
er</a> c5e4b22c8cb290f9439a339c08bba6cb13aa296d<br>
&gt; -SRCREV_patternmatcher=3D&quot;c5e4b22c8cb290f9439a339c08bba6cb13aa296=
d&quot;<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/moby/pattern=
matcher" rel=3D"noreferrer" target=3D"_blank">github.com/moby/patternmatche=
r</a> v0.6.0<br>
&gt; +# [1] git ls-remote <a href=3D"https://github.com/moby/patternmatcher=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/patternmatch=
er</a> 347bb8d8d557f90d1b75cd8bca3c0177f380a979<br>
&gt; +SRCREV_patternmatcher=3D&quot;347bb8d8d557f90d1b75cd8bca3c0177f380a97=
9&quot;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/moby/patte=
rnmatcher;name=3Dpatternmatcher;protocol=3Dhttps;nobranch=3D1;destsuffix=3D=
$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/moby/patternmat=
cher" rel=3D"noreferrer" target=3D"_blank">github.com/moby/patternmatcher;n=
ame=3Dpatternmatcher;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/=
${BP}/src/import/vendor.fetch/github.com/moby/patternmatcher</a>&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.opentelemetry.i=
o/otel/trace" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel=
/trace</a> v1.14.0<br>
&gt; @@ -698,9 +703,9 @@ SRC_URI +=3D &quot;git://<a href=3D"http://github.=
com/in-toto/in-toto-golang;name=3Din-toto-golang;protocol" rel=3D"noreferre=
r" target=3D"_blank">github.com/in-toto/in-toto-golang;name=3Din-toto-golan=
g;protocol</a><br>
&gt;=C2=A0 SRCREV_go-shellquote=3D&quot;95032a82bc518f77982ea72343cc1ade730=
072f0&quot;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kballard/g=
o-shellquote;name=3Dgo-shellquote;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/kballard/go-=
shellquote" rel=3D"noreferrer" target=3D"_blank">github.com/kballard/go-she=
llquote;name=3Dgo-shellquote;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${W=
ORKDIR}/${BP}/src/import/vendor.fetch/github.com/kballard/go-shellquote</a>=
&quot;<br>
&gt;=C2=A0 <br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/compose-spec=
/compose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/c=
ompose-go</a> v1.18.1<br>
&gt; -# [1] git ls-remote <a href=3D"https://github.com/compose-spec/compos=
e-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/compose-spec/=
compose-go</a> 45494a8f6b0176d040c82577f82c84377426a9e6<br>
&gt; -SRCREV_compose-go=3D&quot;45494a8f6b0176d040c82577f82c84377426a9e6&qu=
ot;<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/compose-spec=
/compose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/c=
ompose-go</a> v1.18.3<br>
&gt; +# [1] git ls-remote <a href=3D"https://github.com/compose-spec/compos=
e-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/compose-spec/=
compose-go</a> c6eecc55b95f952b6d6406adcd297499d11a300b<br>
&gt; +SRCREV_compose-go=3D&quot;c6eecc55b95f952b6d6406adcd297499d11a300b&qu=
ot;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;git://<a href=3D"http://github.com/compose-sp=
ec/compose-go;name=3Dcompose-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D=
$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/compose-spec/co=
mpose-go" rel=3D"noreferrer" target=3D"_blank">github.com/compose-spec/comp=
ose-go;name=3Dcompose-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKD=
IR}/${BP}/src/import/vendor.fetch/github.com/compose-spec/compose-go</a>&qu=
ot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hashico=
rp/go-multierror" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp=
/go-multierror</a> v1.1.1<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8478): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8478" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8478</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10284818=
9/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/102848189/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000005ad9bb060bc072d9--

