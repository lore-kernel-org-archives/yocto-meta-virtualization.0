Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CE4C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 13:18:21 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.10103.1737638294740650902
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 05:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RJ1t39Pa;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so1264295a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jan 2025 05:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737638294; x=1738243094; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GyI3nRkrwxv0CqtbtUwEfd/U3h7+3T4fXkdamkkEUNw=;
        b=RJ1t39Pay9zJw/ZA7UoS43GbGCbGuIgPv+1UKxrXyvu/9g7MliEMJ7h589mHad/ZTT
         mrIuju6AR6rtFX2uzggJHrdSMakSZ87OU+ebB26z83vXnktDv9ApD9Dz24eYLRdrtBg3
         VGyJ9wCinAJoeUyOxxM3rLyNDsNbunVTTfR1m1FgPbNCF8qmvA1sbhvQqbH9jnNCQSr8
         YEErg+OCz4JVjjGio2rJb2f1RXyt4HplDeue/2cX8ItgFnFwLQzCaSq4judMgqgeOPl5
         hT/oxSFOTybFe1AwW9pSjKv1GK5nFzsPM4VWBCIB5Nv4q2H8OUO2AwBP5LZXhAW0YlZB
         jNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638294; x=1738243094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyI3nRkrwxv0CqtbtUwEfd/U3h7+3T4fXkdamkkEUNw=;
        b=MeFU6sZok5mceP7byElTfdERdrZBy93EijgGqE33j0qDGA9tyQuLITHqbyrMNkNVZv
         OhEt1CGf1tKKJhxcawRI7Ra93sic9PG3fAbZMSwHCLe13J/aKnE5sX8RCd2gLEJdprP7
         7xebOou2MRnPmaqOpwdYw42qgdgBvmLjmsFQ0vMXPAiGJUx5MH+3WAaiypPkBEq9gOks
         +8Q70+kD6qwx8/+d4+mg1b7dYZ1ZD9GvjowaiNs8Lc75cw77spTeMX30VaMPaUPyCQQP
         38pfo/GEQk7Gy5MRP/FSakyDDNyBXEgGOUsh597eC4IOT6m7HSG149NJlq9gq8I5xwhN
         mMhQ==
X-Gm-Message-State: AOJu0YzVmx6RdhzkybVsTocws/G5mxV7Nc0mpQGVQoDgISI/YavwpNrx
	Ktuj4oXZycc2Cah6w/762wSL/wtJue/51jcEzUgHKAUDZEQv7ozsubxq82z795EBAeRyikEQXh2
	PU9gyg02TIA+xhqN7r8qp6gz0+T7TsANq
X-Gm-Gg: ASbGncsbyy+Pco1/SIRgpafcuZvyrbGttsmhQbBKCj01NRsNgC40REB9YmDS08E4WEE
	XChF9WGb3TFToPboa6ik1ISvdiiaWsRUWza/S7SxDqJFpXIPNb+v0etasgvevWQ==
X-Google-Smtp-Source: AGHT+IH4AqSocJqrFSMP6UzBD1kNcqdpkRW1gtwuMnsDKuksCSFpKAjOonLcSzQ8jIKqBsYK662GPkhcycwtXCz2tBA=
X-Received: by 2002:a05:6a00:882:b0:725:e057:c3de with SMTP id
 d2e1a72fcca58-72dafab0376mr36419903b3a.23.1737638293178; Thu, 23 Jan 2025
 05:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20250123112322.3970523-1-paolo.barbolini@m4ss.net>
In-Reply-To: <20250123112322.3970523-1-paolo.barbolini@m4ss.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Jan 2025 08:18:01 -0500
X-Gm-Features: AbW1kvYh2vrFcZNooSsszE5Q6lC5c9UL29UgZmVnn7UFhOAbdkAhe868mubs-5M
Message-ID: <CADkTA4Mdqr1rZPg2riK1LfjJx73hCcObAS1K7k1c1aDFVipsJQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] docker: switch libnetwork to moby version
To: paolo.barbolini@m4ss.net
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003691ea062c5f71dd"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jan 2025 13:18:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9112

--0000000000003691ea062c5f71dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Indeed! This has been on my list to look into for quite some time.

Thanks for the patch, I'll queue it on master next and re-run my system
level tests.

Bruce

On Thu, Jan 23, 2025 at 6:23=E2=80=AFAM Paolo Barbolini via lists.yoctoproj=
ect.org
<paolo.barbolini=3Dm4ss.net@lists.yoctoproject.org> wrote:

> Some time ago libnetwork was moved from it's own repository to moby.
> This patch updates the docker recipe to use the new location
>
> Signed-off-by: Paolo Barbolini <paolo.barbolini@m4ss.net>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |  5 +-
>  recipes-containers/docker/docker.inc          |  7 +--
>  ...0001-libnetwork-use-GO-instead-of-go.patch | 63 -------------------
>  3 files changed, 2 insertions(+), 73 deletions(-)
>  delete mode 100644
> recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.patc=
h
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb
> b/recipes-containers/docker/docker-moby_git.bb
> index b16f44fd..5cb504a6 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -45,15 +45,12 @@ DESCRIPTION =3D "Linux container runtime \
>  #
>
>  SRCREV_moby =3D "33b6b826c26b05c5e68adc106b6c3b4b44ca5360"
> -SRCREV_libnetwork =3D "67e0588f1ddfaf2faf4c8cae8b7ea2876434d91c"
>  SRCREV_cli =3D "d41cb083c352853f94b292a87df4859c4a96dcc2"
> -SRCREV_FORMAT =3D "moby_libnetwork"
> +SRCREV_FORMAT =3D "moby"
>  SRC_URI =3D "\
>         git://
> github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3Dhttps;destsu=
ffix=3D${GO_SRCURI_DESTSUFFIX}
> <http://github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3Dhttp=
s;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D>
> \
> -       git://
> github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dlibnetwork;destsu=
ffix=3Dgit/libnetwork;protocol=3Dhttps
> \
>         git://
> github.com/docker/cli;nobranch=3D1;name=3Dcli;destsuffix=3Dgit/cli;protoc=
ol=3Dhttps
> \
>         file://docker.init \
> -       file://0001-libnetwork-use-GO-instead-of-go.patch \
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patc=
h
> \
>
>  file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc/import =
\
>
>  file://0001-check-config-make-CONFIG_MEMCG_SWAP-conditional.patch;patchd=
ir=3Dsrc/import
> \
> diff --git a/recipes-containers/docker/docker.inc
> b/recipes-containers/docker/docker.inc
> index 8aabd154..4e2891b4 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -60,7 +60,6 @@ do_compile() {
>         ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
>
>         mkdir -p .gopath/src/github.com/docker
> -       ln -sf ${S}/libnetwork .gopath/src/github.com/docker/libnetwork
>         ln -sf ${S}/cli .gopath/src/github.com/docker/cli
>
>         export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor"
> @@ -90,17 +89,13 @@ do_compile() {
>         export LDFLAGS=3D""
>         export DOCKER_VERSION=3D${DOCKER_VERSION}
>         VERSION=3D"${DOCKER_VERSION}" DOCKER_GITCOMMIT=3D"${DOCKER_COMMIT=
}"
> make dynbinary
> -
> -       # build the proxy
> -       cd ${S}/src/import/.gopath/src/github.com/docker/libnetwork
> -       oe_runmake cross-local
>  }
>
>  do_install() {
>         mkdir -p ${D}/${bindir}
>         cp ${S}/cli/build/docker ${D}/${bindir}/docker
>         cp ${S}/src/import/bundles/dynbinary-daemon/dockerd
> ${D}/${bindir}/dockerd
> -       cp ${S}/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
> +       cp ${S}/src/import/bundles/dynbinary-daemon/docker-proxy
> ${D}/${bindir}/docker-proxy
>
>         if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>                 install -d ${D}${systemd_unitdir}/system
> diff --git
> a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.pa=
tch
> b/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.pa=
tch
> deleted file mode 100644
> index f94f73e4..00000000
> ---
> a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.pa=
tch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From 04c07804930faad708218a3134c81de06a9c742a Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
> -Date: Fri, 6 Apr 2018 23:58:22 -0400
> -Subject: [PATCH] libnetwork: use $(GO) instead of go
> -
> -Ensure that the libnetwork makefile uses the go cross flags and
> -utilities.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ----
> - Makefile | 14 +++++++-------
> - 1 file changed, 7 insertions(+), 7 deletions(-)
> -
> -Index: git/libnetwork/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/libnetwork/Makefile
> -+++ git/libnetwork/Makefile
> -@@ -45,10 +45,10 @@
> - build-local:
> -       @echo "=F0=9F=90=B3 $@"
> -       @mkdir -p "bin"
> --      GO111MODULE=3Doff go build -tags experimental -o "bin/dnet"
> ./cmd/dnet
> --      GO111MODULE=3Doff go build -o "bin/docker-proxy" ./cmd/proxy
> --      CGO_ENABLED=3D0 go build -o "bin/diagnosticClient" ./cmd/diagnost=
ic
> --      CGO_ENABLED=3D0 go build -o "bin/testMain"
> ./cmd/networkdb-test/testMain.go
> -+      GO111MODULE=3Doff $(GO) build -trimpath -tags experimental -o
> "bin/dnet" ./cmd/dnet
> -+      GO111MODULE=3Doff $(GO) build -trimpath -o "bin/docker-proxy"
> ./cmd/proxy
> -+      CGO_ENABLED=3D0 $(GO) build -trimpath -o "bin/diagnosticClient"
> ./cmd/diagnostic
> -+      CGO_ENABLED=3D0 $(GO) build -trimpath -o "bin/testMain"
> ./cmd/networkdb-test/testMain.go
> -
> - build-images:
> -       @echo "=F0=9F=90=B3 $@"
> -@@ -82,8 +82,8 @@
> -
> - cross-local:
> -       @echo "=F0=9F=90=B3 $@"
> --      GO111MODULE=3Doff go build -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dn=
et
> --      GO111MODULE=3Doff go build -o "bin/docker-proxy-$$GOOS-$$GOARCH"
> ./cmd/proxy
> -+      GO111MODULE=3Doff $(GO) build -trimpath $(GO_LINKSHARED)
> $(GOBUILDFLAGS) -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
> -+      GO111MODULE=3Doff $(GO) build -trimpath  $(GO_LINKSHARED)
> $(GOBUILDFLAGS) -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
> -
> - # Rebuild protocol buffers.
> - # These may need to be rebuilt after vendoring updates, so .proto files
> are declared .PHONY so they are always rebuilt.
> -@@ -130,7 +130,7 @@
> -       if ls $$dir/*.go &> /dev/null; then \
> -               pushd . &> /dev/null ; \
> -               cd $$dir ; \
> --              go test ${INSIDECONTAINER} -test.parallel 5 -test.v
> -covermode=3Dcount -coverprofile=3D./profile.tmp ; \
> -+              $(GO) test ${INSIDECONTAINER} -test.parallel 5 -test.v
> -covermode=3Dcount -coverprofile=3D./profile.tmp ; \
> -               ret=3D$$? ;\
> -               if [ $$ret -ne 0 ]; then exit $$ret; fi ;\
> -               popd &> /dev/null; \
> -@@ -145,7 +145,7 @@
> - # Depends on binaries because vet will silently fail if it can not load
> compiled imports
> - vet: ## run go vet
> -       @echo "=F0=9F=90=B3 $@"
> --      @test -z "$$(go vet ${PACKAGES} 2>&1 | grep -v 'constant [0-9]*
> not a string in call to Errorf' | egrep -v
> '(timestamp_test.go|duration_test.go|exit status 1)' | tee /dev/stderr)"
> -+      @test -z "$$($(GO) vet ${PACKAGES} 2>&1 | grep -v 'constant [0-9]=
*
> not a string in call to Errorf' | egrep -v
> '(timestamp_test.go|duration_test.go|exit status 1)' | tee /dev/stderr)"
> -
> - misspell:
> -       @echo "=F0=9F=90=B3 $@"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9111):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9111
> Mute This Topic: https://lists.yoctoproject.org/mt/110769776/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003691ea062c5f71dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Indeed! This has been on my list to look into for quite some =
time.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Thanks for the patc=
h, I&#39;ll queue it on master next and re-run my system level tests.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Jan 23, 2025 at 6:23=E2=80=AFAM Paolo Barbolini via <a href=3D"h=
ttp://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;paolo.barbolin=
i=3D<a href=3D"mailto:m4ss.net@lists.yoctoproject.org">m4ss.net@lists.yocto=
project.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Some time ago libnetwork was moved from it&#39;s own repository =
to moby.<br>
This patch updates the docker recipe to use the new location<br>
<br>
Signed-off-by: Paolo Barbolini &lt;<a href=3D"mailto:paolo.barbolini@m4ss.n=
et" target=3D"_blank">paolo.barbolini@m4ss.net</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a>=C2=A0 |=C2=A0 5 +-=
<br>
=C2=A0recipes-containers/docker/docker.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 7 +--<br>
=C2=A0...0001-libnetwork-use-GO-instead-of-go.patch | 63 ------------------=
-<br>
=C2=A03 files changed, 2 insertions(+), 73 deletions(-)<br>
=C2=A0delete mode 100644 recipes-containers/docker/files/0001-libnetwork-us=
e-GO-instead-of-go.patch<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> b/recipes-con=
tainers/docker/<a href=3D"http://docker-moby_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">docker-moby_git.bb</a><br>
index b16f44fd..5cb504a6 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
@@ -45,15 +45,12 @@ DESCRIPTION =3D &quot;Linux container runtime \<br>
=C2=A0#<br>
<br>
=C2=A0SRCREV_moby =3D &quot;33b6b826c26b05c5e68adc106b6c3b4b44ca5360&quot;<=
br>
-SRCREV_libnetwork =3D &quot;67e0588f1ddfaf2faf4c8cae8b7ea2876434d91c&quot;=
<br>
=C2=A0SRCREV_cli =3D &quot;d41cb083c352853f94b292a87df4859c4a96dcc2&quot;<b=
r>
-SRCREV_FORMAT =3D &quot;moby_libnetwork&quot;<br>
+SRCREV_FORMAT =3D &quot;moby&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/moby/moby.gi=
t;nobranch=3D1;name=3Dmoby;protocol=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DEST=
SUFFIX%7D" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby.git;no=
branch=3D1;name=3Dmoby;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX=
}</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/docker/libne=
twork.git;branch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;pro=
tocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/docker/libne=
twork.git;branch=3Dmaster;name=3Dlibnetwork;destsuffix=3Dgit/libnetwork;pro=
tocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/docker/cli;n=
obranch=3D1;name=3Dcli;destsuffix=3Dgit/cli;protocol=3Dhttps" rel=3D"norefe=
rrer" target=3D"_blank">github.com/docker/cli;nobranch=3D1;name=3Dcli;dests=
uffix=3Dgit/cli;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.init \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libnetwork-use-GO-instead-of-go.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cli-use-external-GO111MODULE-=
and-cross-compiler.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-dynbinary-use-go-cross-compil=
er.patch;patchdir=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-check-config-make-CONFIG_MEMC=
G_SWAP-conditional.patch;patchdir=3Dsrc/import \<br>
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/dock=
er/docker.inc<br>
index 8aabd154..4e2891b4 100644<br>
--- a/recipes-containers/docker/docker.inc<br>
+++ b/recipes-containers/docker/docker.inc<br>
@@ -60,7 +60,6 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../.. .gopath/src/&quot;${DOCKER_P=
KG}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p .gopath/src/<a href=3D"http://github.c=
om/docker" rel=3D"noreferrer" target=3D"_blank">github.com/docker</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${S}/libnetwork .gopath/src/<a href=3D"h=
ttp://github.com/docker/libnetwork" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/docker/libnetwork</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${S}/cli .gopath/src/<a href=3D"http://g=
ithub.com/docker/cli" rel=3D"noreferrer" target=3D"_blank">github.com/docke=
r/cli</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/src/import/.gopath:$=
{S}/src/import/vendor&quot;<br>
@@ -90,17 +89,13 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export DOCKER_VERSION=3D${DOCKER_VERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VERSION=3D&quot;${DOCKER_VERSION}&quot; DOCKER_=
GITCOMMIT=3D&quot;${DOCKER_COMMIT}&quot; make dynbinary<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# build the proxy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import/.gopath/src/<a href=3D"http:=
//github.com/docker/libnetwork" rel=3D"noreferrer" target=3D"_blank">github=
.com/docker/libnetwork</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake cross-local<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/${bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${S}/cli/build/docker ${D}/${bindir}/docker<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${S}/src/import/bundles/dynbinary-daemon/doc=
kerd ${D}/${bindir}/dockerd<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/libnetwork/bin/docker-proxy* ${D}/${bin=
dir}/docker-proxy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/src/import/bundles/dynbinary-daemon/doc=
ker-proxy ${D}/${bindir}/docker-proxy<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sy=
stemd_unitdir}/system<br>
diff --git a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead=
-of-go.patch b/recipes-containers/docker/files/0001-libnetwork-use-GO-inste=
ad-of-go.patch<br>
deleted file mode 100644<br>
index f94f73e4..00000000<br>
--- a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.=
patch<br>
+++ /dev/null<br>
@@ -1,63 +0,0 @@<br>
-From 04c07804930faad708218a3134c81de06a9c742a Mon Sep 17 00:00:00 2001<br>
-From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" t=
arget=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
-Date: Fri, 6 Apr 2018 23:58:22 -0400<br>
-Subject: [PATCH] libnetwork: use $(GO) instead of go<br>
-<br>
-Ensure that the libnetwork makefile uses the go cross flags and<br>
-utilities.<br>
-<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriv=
er.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
----<br>
- Makefile | 14 +++++++-------<br>
- 1 file changed, 7 insertions(+), 7 deletions(-)<br>
-<br>
-Index: git/libnetwork/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/libnetwork/Makefile<br>
-+++ git/libnetwork/Makefile<br>
-@@ -45,10 +45,10 @@<br>
- build-local:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=F0=9F=90=B3 $@&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@mkdir -p &quot;bin&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 GO111MODULE=3Doff go build -tags experimental -o &qu=
ot;bin/dnet&quot; ./cmd/dnet<br>
--=C2=A0 =C2=A0 =C2=A0 GO111MODULE=3Doff go build -o &quot;bin/docker-proxy=
&quot; ./cmd/proxy<br>
--=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 go build -o &quot;bin/diagnosticClie=
nt&quot; ./cmd/diagnostic<br>
--=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 go build -o &quot;bin/testMain&quot;=
 ./cmd/networkdb-test/testMain.go<br>
-+=C2=A0 =C2=A0 =C2=A0 GO111MODULE=3Doff $(GO) build -trimpath -tags experi=
mental -o &quot;bin/dnet&quot; ./cmd/dnet<br>
-+=C2=A0 =C2=A0 =C2=A0 GO111MODULE=3Doff $(GO) build -trimpath -o &quot;bin=
/docker-proxy&quot; ./cmd/proxy<br>
-+=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 $(GO) build -trimpath -o &quot;bin/d=
iagnosticClient&quot; ./cmd/diagnostic<br>
-+=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D0 $(GO) build -trimpath -o &quot;bin/t=
estMain&quot; ./cmd/networkdb-test/testMain.go<br>
- <br>
- build-images:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=F0=9F=90=B3 $@&quot;<br>
-@@ -82,8 +82,8 @@<br>
- <br>
- cross-local:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=F0=9F=90=B3 $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 GO111MODULE=3Doff go build -o &quot;bin/dnet-$$GOOS-=
$$GOARCH&quot; ./cmd/dnet<br>
--=C2=A0 =C2=A0 =C2=A0 GO111MODULE=3Doff go build -o &quot;bin/docker-proxy=
-$$GOOS-$$GOARCH&quot; ./cmd/proxy<br>
-+=C2=A0 =C2=A0 =C2=A0 GO111MODULE=3Doff $(GO) build -trimpath $(GO_LINKSHA=
RED) $(GOBUILDFLAGS) -o &quot;bin/dnet-$$GOOS-$$GOARCH&quot; ./cmd/dnet<br>
-+=C2=A0 =C2=A0 =C2=A0 GO111MODULE=3Doff $(GO) build -trimpath=C2=A0 $(GO_L=
INKSHARED) $(GOBUILDFLAGS) -o &quot;bin/docker-proxy-$$GOOS-$$GOARCH&quot; =
./cmd/proxy<br>
- <br>
- # Rebuild protocol buffers.<br>
- # These may need to be rebuilt after vendoring updates, so .proto files a=
re declared .PHONY so they are always rebuilt.<br>
-@@ -130,7 +130,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ls $$dir/*.go &amp;&gt; /dev/null; then \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pushd . &amp;&gt; /=
dev/null ; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd $$dir ; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 go test ${INSIDECONTAINE=
R} -test.parallel 5 -test.v -covermode=3Dcount -coverprofile=3D./profile.tm=
p ; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GO) test ${INSIDECONTA=
INER} -test.parallel 5 -test.v -covermode=3Dcount -coverprofile=3D./profile=
.tmp ; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=3D$$? ;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $$ret -ne 0 ];=
 then exit $$ret; fi ;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0popd &amp;&gt; /dev=
/null; \<br>
-@@ -145,7 +145,7 @@<br>
- # Depends on binaries because vet will silently fail if it can not load c=
ompiled imports<br>
- vet: ## run go vet<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=F0=9F=90=B3 $@&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 @test -z &quot;$$(go vet ${PACKAGES} 2&gt;&amp;1 | g=
rep -v &#39;constant [0-9]* not a string in call to Errorf&#39; | egrep -v =
&#39;(timestamp_test.go|duration_test.go|exit status 1)&#39; | tee /dev/std=
err)&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 @test -z &quot;$$($(GO) vet ${PACKAGES} 2&gt;&amp;1 =
| grep -v &#39;constant [0-9]* not a string in call to Errorf&#39; | egrep =
-v &#39;(timestamp_test.go|duration_test.go|exit status 1)&#39; | tee /dev/=
stderr)&quot;<br>
- <br>
- misspell:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=F0=9F=90=B3 $@&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9111): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9111" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9111</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110769776/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110769776/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000003691ea062c5f71dd--

