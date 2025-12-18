Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D2DD711C7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 21:23:44 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3578.1766093015565449877
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 13:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aYLsO7Qa;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: massimiliano.minella@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37bac34346dso8179751fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Dec 2025 13:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766093013; x=1766697813; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H0TeZ9enHzvAXRWr8HiwWZv+n987LHABBw093jCxXXI=;
        b=aYLsO7Qaqs5YJddjvNGmMZAPxwR/Yfaust6imX7xcagrkeEb/mseoa5gQiZz6rjkIE
         TFoU+b5bzBWS55/YEVqfQPZmNCiYkntEt6FIYyY/rzbSLM1zMwmuGiPkYB5GzFp1MCts
         0AQeL03r41n6YUp/2jEh00G/JSomovnIfaiRJQi3CQulK/gAXJmwYArBpf22HGswC7o3
         NBHugBklzi1Rgowq28Z5BDpS0MC7SEyuRgVWNk7T4M8UYWh8DeXzg0JcdxIx/KjRSOdL
         hpI2nnn7k10EpW0R4fz5d9tPb7G1ogYr3fj2fx0lRKyjQ83j8hNDQTse35tIz3N2y1ap
         p8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766093013; x=1766697813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0TeZ9enHzvAXRWr8HiwWZv+n987LHABBw093jCxXXI=;
        b=H/jVfmrwlEgCH+goB51DGPOx3gilpRUbMMs3w1Ucd4HtG1r/N/qi8zYpERzsxWD+KJ
         faNN6FMKqjWZRLSjr0Vcg4q+SoRWk+DFQTKK+10MKkOp0ArFP4o8mc8p3k0P5/fbL2UV
         bEOCNYcHv9loO6jBuvLQaphV0jMywOzFNAJS29isnJHiUSwGcH5aOU2G8PYYmLlFcSuW
         /2rZYPvmcGFjwai5XBVImyKerP0mgqHRqQ9Ki6Z/bn5Py4gFaJqjp87AOhmj4PAWjz+A
         Hs9+0vx6xpo2Xr7XUgVbbmS5dkpKb2FKQHDRp6IS2iubv18rG5hosfjg6T9c39yOptY7
         ZDww==
X-Gm-Message-State: AOJu0YzE4ZZypWGMZZGjC04DeVgsEQCLQyJJflcXTmBXbEatKVDOpwH4
	YRSzWsc2e0/xaQ/gBepLSJqhmrSmHKceu7dU+IoPKWEW+FLrjrRbep9X+LdA/IcK1J+BkKFIk9d
	9sfIwyyJoWle5i43pLHft+/kLp93h+G8=
X-Gm-Gg: AY/fxX4ZA868ETAMegjJzGjyolOlJ+W80Mtgy3BKfS4OWQCiG9j9i4XPaFsqIXT6FPo
	+7HQvExd3dZ0py6olWexf0osYZKWlszSSAAp+klxHzWiJcEWzeRlowtj6jIDah58DViCdD6i7+X
	3zWC52e8X5bVaMS9mW3aHrtRAd2fST4WnM4KNhT+LYAHjX0Ud2gAgPg0xR0DheV52CnolxiqxJm
	wPRb07cq2c8MBOfZCasqMSuad5kGSkwdafPtj6feqPgyxGbblDblo/OVmj8Hj44OMkompUy
X-Google-Smtp-Source: AGHT+IElhGVw7G9S5IHI4CzFiAtL4xXjnm8sH95135filVZQfkDcFuDcWsPl7WJhYOwXt8wdgcqUIQUamHA1kYZEzgw=
X-Received: by 2002:a2e:bc18:0:b0:37b:9a39:b885 with SMTP id
 38308e7fff4ca-3812156713bmr2682981fa.8.1766093012913; Thu, 18 Dec 2025
 13:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20251215-add_oras_recipe-v1-1-1075af14e8aa@se.com> <CADkTA4Mgf5xbABcExN4OhLsqPLeW40bmiJQ7-Z=pM5oUxqLH5A@mail.gmail.com>
In-Reply-To: <CADkTA4Mgf5xbABcExN4OhLsqPLeW40bmiJQ7-Z=pM5oUxqLH5A@mail.gmail.com>
From: Massimiliano Minella <massimiliano.minella@gmail.com>
Date: Thu, 18 Dec 2025 22:23:21 +0100
X-Gm-Features: AQt7F2rRDYU3QUsHNsN50iP57t0oZ23r4XrhYbkctWz7R0MpIICqwslCBtWMzpY
Message-ID: <CAGS_c3X8E4-iJ0VqWefV7k-EX-GoQG8_zfXafOkAW6cojfe0_w@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] oras: add recipe for oras v1.3.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Massimiliano Minella <massimiliano.minella@se.com>
Content-Type: multipart/alternative; boundary="000000000000accf940646409280"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Dec 2025 21:23:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9495

--000000000000accf940646409280
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 3:56=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:
>
> On Mon, Dec 15, 2025 at 11:12=E2=80=AFAM Massimiliano Minella via
> lists.yoctoproject.org
> <massimiliano.minella=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > From: Massimiliano Minella <massimiliano.minella@se.com>
> >
> > ORAS is an OCI registry client for managing artifacts in container
> > registries. It enables pushing and pulling arbitrary artifacts to and
> > from OCI-compliant registries.
>
> Hi Massimiliano,
>
> Thanks for the contribution!
>
> I'm only casually familiar with ORAS, but it definitely belongs in
meta-virt and
> we can definitely get it merged with some tweaks and more information.
>
> I appreciate that you introduced it in the git based approach that the
layer
> follows, that's a good way to keep a maintainer happy .. consistency (eve=
n
> when we are inconsistent ourselves) :)
>
> On that note (and I can do the conversion on your behalf), I've come up
with
> a new scheme that allows the mixing of gomod:// and git://, with git://
still
> being the preference, but for large repos, we can switch in gomod:// and
save
> significant time and space. There are converted recipes and documentation
> on master-next for that right now.

Hi Bruce,

Thank you for your feedback.

My bad, I hadn't checked master-next. I'll definitely have a look at it.

> Outside of that conversion, I just need some more information:
>
> - what architectures has it been built and tested on ? What are the
> architectures
>   it can support ? At a glance I didn't see anything excluded in the
recipe, and
>   there should be some level of restriction

It has been built and tested on x86_64, both QEMU and real hardware.
In the official github repo there are prebuilt binaries for x86 and arm64,
so if
it's fine with you for this first iteration I can restrict the list of
compatibles
to those two architectures, after having tested it also on arm64.

> - How can it be tested ? And even better, tested with artifacts built wit=
h
>   meta-virtualization ? This doesn't need to be elaborate, and doesn't
need to
>   be a ptest or other structured format. Just a README in the recipe
directory
>   with some information and usage examples would be enough.

I'll try to come up with some examples, add them in a README as you
suggested and
send a V2.

Cheers,
Massimiliano

> Cheers,
>
> Bruce
>
>
>
>
>
>
>
> >
> > The base files for modules.txt, src_uri.inc and relocation.inc were
> > auto-generated using:
> >
> > ./scripts/oe-go-mod-autogen.py --repo
https://github.com/oras-project/oras.git --rev v1.3.0
> >
> > modules.txt has been updated by running 'go mod vendor' in a devshell
> > environment and copying the resulting modules.txt.
> >
> > Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
> > ---
> >  recipes-containers/oras/files/modules.txt | 113
++++++++++++++++++++++++++++++
> >  recipes-containers/oras/oras_git.bb       |  63 +++++++++++++++++
> >  recipes-containers/oras/relocation.inc    |  56 +++++++++++++++
> >  recipes-containers/oras/src_uri.inc       |  96
+++++++++++++++++++++++++
> >  4 files changed, 328 insertions(+)
> >
> > diff --git recipes-containers/oras/files/modules.txt
recipes-containers/oras/files/modules.txt
> > new file mode 100644
> > index 00000000..521b33f0
> > --- /dev/null
> > +++ recipes-containers/oras/files/modules.txt
> > @@ -0,0 +1,113 @@
> > +# dario.cat/mergo v1.0.2
> > +## explicit; go 1.13
> > +dario.cat/mergo
> > +# github.com/Masterminds/goutils v1.1.1
> > +## explicit
> > +github.com/Masterminds/goutils
> > +# github.com/Masterminds/semver/v3 v3.4.0
> > +## explicit; go 1.21
> > +github.com/Masterminds/semver/v3
> > +# github.com/Masterminds/sprig/v3 v3.3.0
> > +## explicit; go 1.21
> > +github.com/Masterminds/sprig/v3
> > +# github.com/containerd/console v1.0.5
> > +## explicit; go 1.13
> > +github.com/containerd/console
> > +# github.com/google/uuid v1.6.0
> > +## explicit
> > +github.com/google/uuid
> > +# github.com/huandu/xstrings v1.5.0
> > +## explicit; go 1.12
> > +github.com/huandu/xstrings
> > +# github.com/inconshreveable/mousetrap v1.1.0
> > +## explicit; go 1.18
> > +github.com/inconshreveable/mousetrap
> > +# github.com/mitchellh/copystructure v1.2.0
> > +## explicit; go 1.15
> > +github.com/mitchellh/copystructure
> > +# github.com/mitchellh/reflectwalk v1.0.2
> > +## explicit
> > +github.com/mitchellh/reflectwalk
> > +# github.com/morikuni/aec v1.0.0
> > +## explicit
> > +github.com/morikuni/aec
> > +# github.com/opencontainers/go-digest v1.0.0
> > +## explicit; go 1.13
> > +github.com/opencontainers/go-digest
> > +# github.com/opencontainers/image-spec v1.1.1
> > +## explicit; go 1.18
> > +github.com/opencontainers/image-spec/specs-go
> > +github.com/opencontainers/image-spec/specs-go/v1
> > +# github.com/shopspring/decimal v1.4.0
> > +## explicit; go 1.10
> > +github.com/shopspring/decimal
> > +# github.com/sirupsen/logrus v1.9.3
> > +## explicit; go 1.13
> > +github.com/sirupsen/logrus
> > +# github.com/spf13/cast v1.9.2
> > +## explicit; go 1.21.0
> > +github.com/spf13/cast
> > +github.com/spf13/cast/internal
> > +# github.com/spf13/cobra v1.10.1
> > +## explicit; go 1.15
> > +github.com/spf13/cobra
> > +# github.com/spf13/pflag v1.0.9
> > +## explicit; go 1.12
> > +github.com/spf13/pflag
> > +# golang.org/x/crypto v0.40.0
> > +## explicit; go 1.23.0
> > +golang.org/x/crypto/bcrypt
> > +golang.org/x/crypto/blowfish
> > +golang.org/x/crypto/pbkdf2
> > +golang.org/x/crypto/scrypt
> > +# golang.org/x/sync v0.16.0
> > +## explicit; go 1.23.0
> > +golang.org/x/sync/errgroup
> > +golang.org/x/sync/semaphore
> > +# golang.org/x/sys v0.35.0
> > +## explicit; go 1.23.0
> > +golang.org/x/sys/plan9
> > +golang.org/x/sys/unix
> > +golang.org/x/sys/windows
> > +# golang.org/x/term v0.34.0
> > +## explicit; go 1.23.0
> > +golang.org/x/term
> > +# gopkg.in/yaml.v3 v3.0.1
> > +## explicit
> > +gopkg.in/yaml.v3
> > +# oras.land/oras-go/v2 v2.6.0
> > +## explicit; go 1.23.0
> > +oras.land/oras-go/v2
> > +oras.land/oras-go/v2/content
> > +oras.land/oras-go/v2/content/file
> > +oras.land/oras-go/v2/content/memory
> > +oras.land/oras-go/v2/content/oci
> > +oras.land/oras-go/v2/errdef
> > +oras.land/oras-go/v2/internal/cas
> > +oras.land/oras-go/v2/internal/container/set
> > +oras.land/oras-go/v2/internal/copyutil
> > +oras.land/oras-go/v2/internal/descriptor
> > +oras.land/oras-go/v2/internal/docker
> > +oras.land/oras-go/v2/internal/fs/tarfs
> > +oras.land/oras-go/v2/internal/graph
> > +oras.land/oras-go/v2/internal/httputil
> > +oras.land/oras-go/v2/internal/interfaces
> > +oras.land/oras-go/v2/internal/ioutil
> > +oras.land/oras-go/v2/internal/manifestutil
> > +oras.land/oras-go/v2/internal/platform
> > +oras.land/oras-go/v2/internal/registryutil
> > +oras.land/oras-go/v2/internal/resolver
> > +oras.land/oras-go/v2/internal/spec
> > +oras.land/oras-go/v2/internal/status
> > +oras.land/oras-go/v2/internal/syncutil
> > +oras.land/oras-go/v2/registry
> > +oras.land/oras-go/v2/registry/remote
> > +oras.land/oras-go/v2/registry/remote/auth
> > +oras.land/oras-go/v2/registry/remote/credentials
> > +oras.land/oras-go/v2/registry/remote/credentials/internal/config
> > +oras.land/oras-go/v2/registry/remote/credentials/internal/executer
> > +oras.land/oras-go/v2/registry/remote/credentials/internal/ioutil
> > +oras.land/oras-go/v2/registry/remote/credentials/trace
> > +oras.land/oras-go/v2/registry/remote/errcode
> > +oras.land/oras-go/v2/registry/remote/internal/errutil
> > +oras.land/oras-go/v2/registry/remote/retry
> > diff --git recipes-containers/oras/oras_git.bb recipes-containers/oras/
oras_git.bb
> > new file mode 100644
> > index 00000000..94f8251d
> > --- /dev/null
> > +++ recipes-containers/oras/oras_git.bb
> > @@ -0,0 +1,63 @@
> > +HOMEPAGE =3D "https://oras.land/"
> > +SUMMARY =3D "OCI registry client for managing artifacts in container
registries"
> > +
> > +DEPENDS =3D " \
> > +    rsync-native \
> > +"
> > +
> > +# Specify the first two important SRCREVs as the format
> > +SRCREV_FORMAT =3D "oras"
> > +SRCREV_oras =3D "40530fe4c68e5825b868cd874bd46fc0cdd0f432"
> > +
> > +SRC_URI =3D "git://
github.com/oras-project/oras;name=3Doras;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${GO_SRCURI_DESTSUFFIX}
"
> > +
> > +include src_uri.inc
> > +
> > +# patches and config
> > +SRC_URI +=3D "file://modules.txt"
> > +
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D
"file://src/import/LICENSE;md5=3D019fcb726ce54798fc2e56a02520dae8"
> > +
> > +GO_IMPORT =3D "import"
> > +
> > +PV =3D "v1.3.0"
> > +
> > +ORAS_PKG =3D "oras.land/oras"
> > +
> > +inherit go goarch
> > +inherit pkgconfig
> > +
> > +do_configure[noexec] =3D "1"
> > +
> > +include relocation.inc
> > +
> > +GOBUILDFLAGS:append =3D " -mod=3Dvendor"
> > +do_compile() {
> > +       cd ${S}/src/import
> > +
> > +       export GOPATH=3D"$GOPATH:${S}/src/import/.gopath"
> > +
> > +       # Pass the needed cflags/ldflags so that cgo
> > +       # can find the needed headers files and libraries
> > +       export GOARCH=3D${TARGET_GOARCH}
> > +       export CGO_ENABLED=3D"1"
> > +       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET=
}"
> > +       export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARG=
ET}"
> > +
> > +       # our copied .go files are to be used for the build
> > +       ln -sf vendor.copy vendor
> > +       # inform go that we know what we are doing
> > +       cp ${UNPACKDIR}/modules.txt vendor/
> > +
> > +       # set BuildMetadata to empty to remove default "unreleases" tag
> > +       GO_LDFLAGS=3D"-w -X ${ORAS_PKG}/internal/version.BuildMetadata=
=3D"
> > +       GO_BUILDTAGS=3D""
> > +       mkdir -p ./bin
> > +       ${GO} build ${GOBUILDFLAGS} -tags "$GO_BUILDTAGS" -ldflags
"$GO_LDFLAGS" -o ./bin/oras ./cmd/oras
> > +}
> > +
> > +do_install() {
> > +    install -d ${D}${bindir}
> > +    install -m 755 ${S}/src/import/bin/oras ${D}${bindir}
> > +}
> > diff --git recipes-containers/oras/relocation.inc
recipes-containers/oras/relocation.inc
> > new file mode 100644
> > index 00000000..e5d3242a
> > --- /dev/null
> > +++ recipes-containers/oras/relocation.inc
> > @@ -0,0 +1,56 @@
> > +export sites =3D "dario.cat/mergo:dario.cat/mergo:force \
> > +           gopkg.in/yaml.v3:gopkg.in/yaml.v3:force \
> > +           golang.org/x/sys:golang.org/x/sys:force \
> > +           golang.org/x/sync:golang.org/x/sync:force \
> > +           golang.org/x/term:golang.org/x/term:force \
> > +           golang.org/x/crypto:golang.org/x/crypto:force \
> > +           oras.land/oras-go/v2:oras.land/oras-go/v2:force \
> > +           github.com/spf13/cast:github.com/spf13/cast:force \
> > +           github.com/spf13/cobra:github.com/spf13/cobra:force \
> > +           github.com/spf13/pflag:github.com/spf13/pflag:force \
> > +           github.com/google/uuid:github.com/google/uuid:force \
> > +           github.com/morikuni/aec:github.com/morikuni/aec:force \
> > +           github.com/sirupsen/logrus:github.com/sirupsen/logrus:force
\
> > +           github.com/huandu/xstrings:github.com/huandu/xstrings:force
\
> > +
github.com/containerd/console:github.com/containerd/console:force \
> > +
github.com/shopspring/decimal:github.com/shopspring/decimal:force \
> > +
github.com/Masterminds/goutils:github.com/Masterminds/goutils:force \
> > +
github.com/Masterminds/sprig/v3:github.com/Masterminds/sprig/v3:force \
> > +
github.com/Masterminds/semver/v3:github.com/Masterminds/semver/v3:force \
> > +
github.com/mitchellh/reflectwalk:github.com/mitchellh/reflectwalk:force \
> > +
github.com/mitchellh/copystructure:github.com/mitchellh/copystructure:force
\
> > +
github.com/opencontainers/go-digest:github.com/opencontainers/go-digest:for=
ce
\
> > +
github.com/opencontainers/image-spec:github.com/opencontainers/image-spec:f=
orce
\
> > +
github.com/inconshreveable/mousetrap:github.com/inconshreveable/mousetrap:f=
orce
"
> > +
> > +do_compile:prepend() {
> > +    cd ${S}/src/import
> > +    for s in $sites; do
> > +        site_dest=3D$(echo $s | cut -d: -f1)
> > +        site_source=3D$(echo $s | cut -d: -f2)
> > +        force_flag=3D$(echo $s | cut -d: -f3)
> > +
> > +        mkdir -p vendor.copy/$site_dest
> > +
> > +        # create a temporary exclude file
> > +        exclude_file=3D$(mktemp)
> > +
> > +        find vendor.fetch/$site_source -type d -print0 |         xargs
-0 du -sBM 2>/dev/null |         awk '{if ($1+0 > 500) print substr($0,
index($0,$2))}' |         sed 's|^vendor.fetch/||' > "$exclude_file"
> > +
> > +        if [ -n "$force_flag" ]; then
> > +            echo "[INFO] $site_dest: force copying .go files"
> > +            rm -rf vendor.copy/$site_dest
> > +            rsync -a                 --exclude=3D'vendor/'
  --exclude=3D'.git/'                 --exclude-from=3D"$exclude_file"
        vendor.fetch/$site_source/ vendor.copy/$site_dest
> > +        else
> > +            if [ -n "$(ls -A vendor.copy/$site_dest/*.go 2>
/dev/null)" ]; then
> > +                echo "[INFO] vendor.fetch/$site_source -> $site_dest:
go copy skipped (files present)"
> > +                true
> > +            else
> > +                echo "[INFO] $site_dest: copying .go files"
> > +                rsync -a                     --exclude=3D'vendor/'
              --exclude=3D'.git/'
--exclude-from=3D"$exclude_file"
vendor.fetch/$site_source/ vendor.copy/$site_dest
> > +            fi
> > +        fi
> > +
> > +        rm -f "$exclude_file"
> > +    done
> > +}
> > diff --git recipes-containers/oras/src_uri.inc
recipes-containers/oras/src_uri.inc
> > new file mode 100644
> > index 00000000..5fbff72f
> > --- /dev/null
> > +++ recipes-containers/oras/src_uri.inc
> > @@ -0,0 +1,96 @@
> > +# [dario.cat/mergo v1.0.2] git ls-remote
https://github.com/imdario/mergo 7b33b2b01026fbbbbfcfbb1ee2c9c0a5e0c9a9f7
> > +SRCREV_mergo =3D "7b33b2b01026fbbbbfcfbb1ee2c9c0a5e0c9a9f7"
> > +SRC_URI +=3D "git://
github.com/imdario/mergo;name=3Dmergo;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/dario.cat/mergo
"
> > +
> > +# [gopkg.in/yaml.v3 v3.0.1] git ls-remote
https://github.com/go-yaml/yaml f6f7691b1fdeb513f56608cd2c32c51f8194bf51
> > +SRCREV_yaml.v3 =3D "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
> > +SRC_URI +=3D "git://
github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/yaml.v3
"
> > +
> > +# [golang.org/x/sys v0.35.0] git ls-remote
https://go.googlesource.com/sys 5b936e1f126baa13682eff91c2e4d5d9e3a0b71d
> > +SRCREV_sys =3D "5b936e1f126baa13682eff91c2e4d5d9e3a0b71d"
> > +SRC_URI +=3D "git://
go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sys
"
> > +
> > +# [golang.org/x/sync v0.16.0] git ls-remote
https://go.googlesource.com/sync 7fad2c9213e0821bd78435a9c106806f2fc383f1
> > +SRCREV_sync =3D "7fad2c9213e0821bd78435a9c106806f2fc383f1"
> > +SRC_URI +=3D "git://
go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sync
"
> > +
> > +# [golang.org/x/term v0.34.0] git ls-remote
https://go.googlesource.com/term a35244d18d7756b12deca31a518c0fa1327d050a
> > +SRCREV_term =3D "a35244d18d7756b12deca31a518c0fa1327d050a"
> > +SRC_URI +=3D "git://
go.googlesource.com/term;name=3Dterm;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/term
"
> > +
> > +# [golang.org/x/crypto v0.40.0] git ls-remote
https://go.googlesource.com/crypto 459a9db11b9c43bb1d61722bfd371751d6de05c9
> > +SRCREV_crypto =3D "459a9db11b9c43bb1d61722bfd371751d6de05c9"
> > +SRC_URI +=3D "git://
go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/crypto
"
> > +
> > +# [oras.land/oras-go/v2 v2.6.0] git ls-remote
https://github.com/oras-project/oras-go
05a2b09cbf2eab1df691411884dc4df741ec56ab
> > +SRCREV_v2 =3D "05a2b09cbf2eab1df691411884dc4df741ec56ab"
> > +SRC_URI +=3D "git://
github.com/oras-project/oras-go;name=3Dv2;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/oras.land/oras-go/v2
"
> > +
> > +# [github.com/spf13/cast v1.9.2] git ls-remote
https://github.com/spf13/cast 40e8e077c1091d832abbde369bbf6cb6455d3335
> > +SRCREV_cast =3D "40e8e077c1091d832abbde369bbf6cb6455d3335"
> > +SRC_URI +=3D "git://
github.com/spf13/cast;name=3Dcast;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/cast
"
> > +
> > +# [github.com/spf13/cobra v1.10.1] git ls-remote
https://github.com/spf13/cobra 7da941c3547e93b8c9f70bbd3befca79c6335388
> > +SRCREV_cobra =3D "7da941c3547e93b8c9f70bbd3befca79c6335388"
> > +SRC_URI +=3D "git://
github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/cobra
"
> > +
> > +# [github.com/spf13/pflag v1.0.9] git ls-remote
https://github.com/spf13/pflag 10438578954bba2527fe5cae3684d4532b064bbe
> > +SRCREV_pflag =3D "10438578954bba2527fe5cae3684d4532b064bbe"
> > +SRC_URI +=3D "git://
github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/pflag
"
> > +
> > +# [github.com/google/uuid v1.6.0] git ls-remote
https://github.com/google/uuid 0f11ee6918f41a04c201eceeadf612a377bc7fbc
> > +SRCREV_uuid =3D "0f11ee6918f41a04c201eceeadf612a377bc7fbc"
> > +SRC_URI +=3D "git://
github.com/google/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/uuid
"
> > +
> > +# [github.com/morikuni/aec v1.0.0] git ls-remote
https://github.com/morikuni/aec 39771216ff4c63d11f5e604076f9c45e8be1067b
> > +SRCREV_aec =3D "39771216ff4c63d11f5e604076f9c45e8be1067b"
> > +SRC_URI +=3D "git://
github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/morikuni/aec
"
> > +
> > +# [github.com/sirupsen/logrus v1.9.3] git ls-remote
https://github.com/sirupsen/logrus d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd
> > +SRCREV_logrus =3D "d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
> > +SRC_URI +=3D "git://
github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/sirupsen/logrus
"
> > +
> > +# [github.com/huandu/xstrings v1.5.0] git ls-remote
https://github.com/huandu/xstrings 1040c040a86302c5a4de066f5653bccdff2ecd2f
> > +SRCREV_xstrings =3D "1040c040a86302c5a4de066f5653bccdff2ecd2f"
> > +SRC_URI +=3D "git://
github.com/huandu/xstrings;name=3Dxstrings;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/huandu/xstrings
"
> > +
> > +# [github.com/containerd/console v1.0.5] git ls-remote
https://github.com/containerd/console
c8d962180f543ac07c008ecc79a413406ea10c0b
> > +SRCREV_console =3D "c8d962180f543ac07c008ecc79a413406ea10c0b"
> > +SRC_URI +=3D "git://
github.com/containerd/console;name=3Dconsole;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/con=
sole
"
> > +
> > +# [github.com/shopspring/decimal v1.4.0] git ls-remote
https://github.com/shopspring/decimal
a1bdfc355e9c71119322b748c95f7d6b82566e30
> > +SRCREV_decimal =3D "a1bdfc355e9c71119322b748c95f7d6b82566e30"
> > +SRC_URI +=3D "git://
github.com/shopspring/decimal;name=3Ddecimal;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/shopspring/dec=
imal
"
> > +
> > +# [github.com/Masterminds/goutils v1.1.1] git ls-remote
https://github.com/Masterminds/goutils
f1923532a168b8203bfe956d8cd3b17ebece5982
> > +SRCREV_goutils =3D "f1923532a168b8203bfe956d8cd3b17ebece5982"
> > +SRC_URI +=3D "git://
github.com/Masterminds/goutils;name=3Dgoutils;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Masterminds/g=
outils
"
> > +
> > +# [github.com/Masterminds/sprig/v3 v3.3.0] git ls-remote
https://github.com/Masterminds/sprig
e708470d529a10ac1a3f02ab6fdd339b65958372
> > +SRCREV_v3 =3D "e708470d529a10ac1a3f02ab6fdd339b65958372"
> > +SRC_URI +=3D "git://
github.com/Masterminds/sprig;name=3Dv3;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Masterminds/sprig/v3
"
> > +
> > +# [github.com/Masterminds/semver/v3 v3.4.0] git ls-remote
https://github.com/Masterminds/semver
61fc460d28283a91c53be65c2e0f20b494ac8ad9
> > +SRCREV_semver-v3 =3D "61fc460d28283a91c53be65c2e0f20b494ac8ad9"
> > +SRC_URI +=3D "git://
github.com/Masterminds/semver;name=3Dsemver-v3;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Masterminds/=
semver/v3
"
> > +
> > +# [github.com/mitchellh/reflectwalk v1.0.2] git ls-remote
https://github.com/mitchellh/reflectwalk
e0c24fdb021963cd2c4013097a0b993a7c4e344f
> > +SRCREV_reflectwalk =3D "e0c24fdb021963cd2c4013097a0b993a7c4e344f"
> > +SRC_URI +=3D "git://
github.com/mitchellh/reflectwalk;name=3Dreflectwalk;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchel=
lh/reflectwalk
"
> > +
> > +# [github.com/mitchellh/copystructure v1.2.0] git ls-remote
https://github.com/mitchellh/copystructure
d4ce1f938f7a7ea2a40bff4544b56be9c00b5e84
> > +SRCREV_copystructure =3D "d4ce1f938f7a7ea2a40bff4544b56be9c00b5e84"
> > +SRC_URI +=3D "git://
github.com/mitchellh/copystructure;name=3Dcopystructure;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mit=
chellh/copystructure
"
> > +
> > +# [github.com/opencontainers/go-digest v1.0.0] git ls-remote
https://github.com/opencontainers/go-digest
ea51bea511f75cfa3ef6098cc253c5c3609b037a
> > +SRCREV_go-digest =3D "ea51bea511f75cfa3ef6098cc253c5c3609b037a"
> > +SRC_URI +=3D "git://
github.com/opencontainers/go-digest;name=3Dgo-digest;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/openco=
ntainers/go-digest
"
> > +
> > +# [github.com/opencontainers/image-spec v1.1.1] git ls-remote
https://github.com/opencontainers/image-spec
147f9c13cedb47a0c4d9a11a222961073d585877
> > +SRCREV_image-spec =3D "147f9c13cedb47a0c4d9a11a222961073d585877"
> > +SRC_URI +=3D "git://
github.com/opencontainers/image-spec;name=3Dimage-spec;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/open=
containers/image-spec
"
> > +
> > +# [github.com/inconshreveable/mousetrap v1.1.0] git ls-remote
https://github.com/inconshreveable/mousetrap
4e8053ee7ef85a6bd26368364a6d27f1641c1d21
> > +SRCREV_mousetrap =3D "4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
> > +SRC_URI +=3D "git://
github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/incon=
shreveable/mousetrap
"
> > +
> >
> > ---
> > base-commit: 26e2b40b91f2424b0b9318b50dbb700a67714b6f
> > change-id: 20251215-add_oras_recipe-40ab44a8ad02
> >
> > Best regards,
> > --
> > Massimiliano Minella <massimiliano.minella@se.com>
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9484):
https://lists.yoctoproject.org/g/meta-virtualization/message/9484
> > Mute This Topic: https://lists.yoctoproject.org/mt/116794590/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
[bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--000000000000accf940646409280
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace">On Tue, Dec 16, 2025 at 3:56=E2=
=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bru=
ce.ashfield@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt; On Mon, Dec 15, 2025 a=
t 11:12=E2=80=AFAM Massimiliano Minella via<br>&gt; <a href=3D"http://lists=
.yoctoproject.org">lists.yoctoproject.org</a><br>&gt; &lt;massimiliano.mine=
lla=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.y=
octoproject.org</a>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt; From: Massimiliano=
 Minella &lt;<a href=3D"mailto:massimiliano.minella@se.com">massimiliano.mi=
nella@se.com</a>&gt;<br>&gt; &gt;<br>&gt; &gt; ORAS is an OCI registry clie=
nt for managing artifacts in container<br>&gt; &gt; registries. It enables =
pushing and pulling arbitrary artifacts to and<br>&gt; &gt; from OCI-compli=
ant registries.<br>&gt;<br>&gt; Hi Massimiliano,<br>&gt;<br>&gt; Thanks for=
 the contribution!<br>&gt;<br>&gt; I&#39;m only casually familiar with ORAS=
, but it definitely belongs in meta-virt and<br>&gt; we can definitely get =
it merged with some tweaks and more information.<br>&gt;<br>&gt; I apprecia=
te that you introduced it in the git based approach that the layer<br>&gt; =
follows, that&#39;s a good way to keep a maintainer happy .. consistency (e=
ven<br>&gt; when we are inconsistent ourselves) :)<br>&gt;<br>&gt; On that =
note (and I can do the conversion on your behalf), I&#39;ve come up with<br=
>&gt; a new scheme that allows the mixing of gomod:// and git://, with git:=
// still<br>&gt; being the preference, but for large repos, we can switch i=
n gomod:// and save<br>&gt; significant time and space. There are converted=
 recipes and documentation<br>&gt; on master-next for that right now.<br><b=
r>Hi Bruce,</font><div><font face=3D"monospace"><br></font></div><div><font=
 face=3D"monospace">Thank you for your feedback.</font></div><div><font fac=
e=3D"monospace"><br></font></div><div><font face=3D"monospace">My bad, I ha=
dn&#39;t checked master-next. I&#39;ll definitely have a look at it.<br><br=
></font><div><font face=3D"monospace">&gt; Outside of that conversion, I ju=
st need some more information:<br>&gt;<br>&gt; - what architectures has it =
been built and tested on ? What are the<br>&gt; architectures<br>&gt; =C2=
=A0 it can support ? At a glance I didn&#39;t see anything excluded in the =
recipe, and<br>&gt; =C2=A0 there should be some level of restriction<br><br=
>It has been built and tested on x86_64, both QEMU and real hardware.</font=
></div><div><font face=3D"monospace">In the official github repo there are =
prebuilt binaries for x86 and arm64, so if</font></div><div><font face=3D"m=
onospace">it&#39;s fine with you for this first iteration I can restrict th=
e list of compatibles</font></div><div><font face=3D"monospace">to those tw=
o architectures, after having tested it also on arm64.<br><br>&gt; - How ca=
n it be tested ? And even better, tested with artifacts built with<br>&gt; =
=C2=A0 meta-virtualization ? This doesn&#39;t need to be elaborate, and doe=
sn&#39;t need to<br>&gt; =C2=A0 be a ptest or other structured format. Just=
 a README in the recipe directory<br>&gt; =C2=A0 with some information and =
usage examples would be enough.<br><br>I&#39;ll try to come up with some ex=
amples, add them in a README as you suggested and</font></div><div><font fa=
ce=3D"monospace">send a V2.</font></div><div><font face=3D"monospace"><br><=
/font></div><div><font face=3D"monospace">Cheers,</font></div><div><font fa=
ce=3D"monospace">Massimiliano<br><br>&gt; Cheers,<br>&gt;<br>&gt; Bruce<br>=
&gt;<br>&gt;<br>&gt;<br>&gt;<br>&gt;<br>&gt;<br>&gt;<br>&gt; &gt;<br>&gt; &=
gt; The base files for modules.txt, src_uri.inc and relocation.inc were<br>=
&gt; &gt; auto-generated using:<br>&gt; &gt;<br>&gt; &gt; ./scripts/oe-go-m=
od-autogen.py --repo <a href=3D"https://github.com/oras-project/oras.git">h=
ttps://github.com/oras-project/oras.git</a> --rev v1.3.0<br>&gt; &gt;<br>&g=
t; &gt; modules.txt has been updated by running &#39;go mod vendor&#39; in =
a devshell<br>&gt; &gt; environment and copying the resulting modules.txt.<=
br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Massimiliano Minella &lt;<a href=
=3D"mailto:massimiliano.minella@se.com">massimiliano.minella@se.com</a>&gt;=
<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0recipes-containers/oras/files/modules.=
txt | 113 ++++++++++++++++++++++++++++++<br>&gt; &gt; =C2=A0recipes-contain=
ers/oras/<a href=3D"http://oras_git.bb">oras_git.bb</a> =C2=A0 =C2=A0 =C2=
=A0 | =C2=A063 +++++++++++++++++<br>&gt; &gt; =C2=A0recipes-containers/oras=
/relocation.inc =C2=A0 =C2=A0| =C2=A056 +++++++++++++++<br>&gt; &gt; =C2=A0=
recipes-containers/oras/src_uri.inc =C2=A0 =C2=A0 =C2=A0 | =C2=A096 +++++++=
++++++++++++++++++<br>&gt; &gt; =C2=A04 files changed, 328 insertions(+)<br=
>&gt; &gt;<br>&gt; &gt; diff --git recipes-containers/oras/files/modules.tx=
t recipes-containers/oras/files/modules.txt<br>&gt; &gt; new file mode 1006=
44<br>&gt; &gt; index 00000000..521b33f0<br>&gt; &gt; --- /dev/null<br>&gt;=
 &gt; +++ recipes-containers/oras/files/modules.txt<br>&gt; &gt; @@ -0,0 +1=
,113 @@<br>&gt; &gt; +# <a href=3D"http://dario.cat/mergo">dario.cat/mergo<=
/a> v1.0.2<br>&gt; &gt; +## explicit; go 1.13<br>&gt; &gt; +<a href=3D"http=
://dario.cat/mergo">dario.cat/mergo</a><br>&gt; &gt; +# <a href=3D"http://g=
ithub.com/Masterminds/goutils">github.com/Masterminds/goutils</a> v1.1.1<br=
>&gt; &gt; +## explicit<br>&gt; &gt; +<a href=3D"http://github.com/Mastermi=
nds/goutils">github.com/Masterminds/goutils</a><br>&gt; &gt; +# <a href=3D"=
http://github.com/Masterminds/semver/v3">github.com/Masterminds/semver/v3</=
a> v3.4.0<br>&gt; &gt; +## explicit; go 1.21<br>&gt; &gt; +<a href=3D"http:=
//github.com/Masterminds/semver/v3">github.com/Masterminds/semver/v3</a><br=
>&gt; &gt; +# <a href=3D"http://github.com/Masterminds/sprig/v3">github.com=
/Masterminds/sprig/v3</a> v3.3.0<br>&gt; &gt; +## explicit; go 1.21<br>&gt;=
 &gt; +<a href=3D"http://github.com/Masterminds/sprig/v3">github.com/Master=
minds/sprig/v3</a><br>&gt; &gt; +# <a href=3D"http://github.com/containerd/=
console">github.com/containerd/console</a> v1.0.5<br>&gt; &gt; +## explicit=
; go 1.13<br>&gt; &gt; +<a href=3D"http://github.com/containerd/console">gi=
thub.com/containerd/console</a><br>&gt; &gt; +# <a href=3D"http://github.co=
m/google/uuid">github.com/google/uuid</a> v1.6.0<br>&gt; &gt; +## explicit<=
br>&gt; &gt; +<a href=3D"http://github.com/google/uuid">github.com/google/u=
uid</a><br>&gt; &gt; +# <a href=3D"http://github.com/huandu/xstrings">githu=
b.com/huandu/xstrings</a> v1.5.0<br>&gt; &gt; +## explicit; go 1.12<br>&gt;=
 &gt; +<a href=3D"http://github.com/huandu/xstrings">github.com/huandu/xstr=
ings</a><br>&gt; &gt; +# <a href=3D"http://github.com/inconshreveable/mouse=
trap">github.com/inconshreveable/mousetrap</a> v1.1.0<br>&gt; &gt; +## expl=
icit; go 1.18<br>&gt; &gt; +<a href=3D"http://github.com/inconshreveable/mo=
usetrap">github.com/inconshreveable/mousetrap</a><br>&gt; &gt; +# <a href=
=3D"http://github.com/mitchellh/copystructure">github.com/mitchellh/copystr=
ucture</a> v1.2.0<br>&gt; &gt; +## explicit; go 1.15<br>&gt; &gt; +<a href=
=3D"http://github.com/mitchellh/copystructure">github.com/mitchellh/copystr=
ucture</a><br>&gt; &gt; +# <a href=3D"http://github.com/mitchellh/reflectwa=
lk">github.com/mitchellh/reflectwalk</a> v1.0.2<br>&gt; &gt; +## explicit<b=
r>&gt; &gt; +<a href=3D"http://github.com/mitchellh/reflectwalk">github.com=
/mitchellh/reflectwalk</a><br>&gt; &gt; +# <a href=3D"http://github.com/mor=
ikuni/aec">github.com/morikuni/aec</a> v1.0.0<br>&gt; &gt; +## explicit<br>=
&gt; &gt; +<a href=3D"http://github.com/morikuni/aec">github.com/morikuni/a=
ec</a><br>&gt; &gt; +# <a href=3D"http://github.com/opencontainers/go-diges=
t">github.com/opencontainers/go-digest</a> v1.0.0<br>&gt; &gt; +## explicit=
; go 1.13<br>&gt; &gt; +<a href=3D"http://github.com/opencontainers/go-dige=
st">github.com/opencontainers/go-digest</a><br>&gt; &gt; +# <a href=3D"http=
://github.com/opencontainers/image-spec">github.com/opencontainers/image-sp=
ec</a> v1.1.1<br>&gt; &gt; +## explicit; go 1.18<br>&gt; &gt; +<a href=3D"h=
ttp://github.com/opencontainers/image-spec/specs-go">github.com/opencontain=
ers/image-spec/specs-go</a><br>&gt; &gt; +<a href=3D"http://github.com/open=
containers/image-spec/specs-go/v1">github.com/opencontainers/image-spec/spe=
cs-go/v1</a><br>&gt; &gt; +# <a href=3D"http://github.com/shopspring/decima=
l">github.com/shopspring/decimal</a> v1.4.0<br>&gt; &gt; +## explicit; go 1=
.10<br>&gt; &gt; +<a href=3D"http://github.com/shopspring/decimal">github.c=
om/shopspring/decimal</a><br>&gt; &gt; +# <a href=3D"http://github.com/siru=
psen/logrus">github.com/sirupsen/logrus</a> v1.9.3<br>&gt; &gt; +## explici=
t; go 1.13<br>&gt; &gt; +<a href=3D"http://github.com/sirupsen/logrus">gith=
ub.com/sirupsen/logrus</a><br>&gt; &gt; +# <a href=3D"http://github.com/spf=
13/cast">github.com/spf13/cast</a> v1.9.2<br>&gt; &gt; +## explicit; go 1.2=
1.0<br>&gt; &gt; +<a href=3D"http://github.com/spf13/cast">github.com/spf13=
/cast</a><br>&gt; &gt; +<a href=3D"http://github.com/spf13/cast/internal">g=
ithub.com/spf13/cast/internal</a><br>&gt; &gt; +# <a href=3D"http://github.=
com/spf13/cobra">github.com/spf13/cobra</a> v1.10.1<br>&gt; &gt; +## explic=
it; go 1.15<br>&gt; &gt; +<a href=3D"http://github.com/spf13/cobra">github.=
com/spf13/cobra</a><br>&gt; &gt; +# <a href=3D"http://github.com/spf13/pfla=
g">github.com/spf13/pflag</a> v1.0.9<br>&gt; &gt; +## explicit; go 1.12<br>=
&gt; &gt; +<a href=3D"http://github.com/spf13/pflag">github.com/spf13/pflag=
</a><br>&gt; &gt; +# <a href=3D"http://golang.org/x/crypto">golang.org/x/cr=
ypto</a> v0.40.0<br>&gt; &gt; +## explicit; go 1.23.0<br>&gt; &gt; +<a href=
=3D"http://golang.org/x/crypto/bcrypt">golang.org/x/crypto/bcrypt</a><br>&g=
t; &gt; +<a href=3D"http://golang.org/x/crypto/blowfish">golang.org/x/crypt=
o/blowfish</a><br>&gt; &gt; +<a href=3D"http://golang.org/x/crypto/pbkdf2">=
golang.org/x/crypto/pbkdf2</a><br>&gt; &gt; +<a href=3D"http://golang.org/x=
/crypto/scrypt">golang.org/x/crypto/scrypt</a><br>&gt; &gt; +# <a href=3D"h=
ttp://golang.org/x/sync">golang.org/x/sync</a> v0.16.0<br>&gt; &gt; +## exp=
licit; go 1.23.0<br>&gt; &gt; +<a href=3D"http://golang.org/x/sync/errgroup=
">golang.org/x/sync/errgroup</a><br>&gt; &gt; +<a href=3D"http://golang.org=
/x/sync/semaphore">golang.org/x/sync/semaphore</a><br>&gt; &gt; +# <a href=
=3D"http://golang.org/x/sys">golang.org/x/sys</a> v0.35.0<br>&gt; &gt; +## =
explicit; go 1.23.0<br>&gt; &gt; +<a href=3D"http://golang.org/x/sys/plan9"=
>golang.org/x/sys/plan9</a><br>&gt; &gt; +<a href=3D"http://golang.org/x/sy=
s/unix">golang.org/x/sys/unix</a><br>&gt; &gt; +<a href=3D"http://golang.or=
g/x/sys/windows">golang.org/x/sys/windows</a><br>&gt; &gt; +# <a href=3D"ht=
tp://golang.org/x/term">golang.org/x/term</a> v0.34.0<br>&gt; &gt; +## expl=
icit; go 1.23.0<br>&gt; &gt; +<a href=3D"http://golang.org/x/term">golang.o=
rg/x/term</a><br>&gt; &gt; +# <a href=3D"http://gopkg.in/yaml.v3">gopkg.in/=
yaml.v3</a> v3.0.1<br>&gt; &gt; +## explicit<br>&gt; &gt; +<a href=3D"http:=
//gopkg.in/yaml.v3">gopkg.in/yaml.v3</a><br>&gt; &gt; +# oras.land/oras-go/=
v2 v2.6.0<br>&gt; &gt; +## explicit; go 1.23.0<br>&gt; &gt; +oras.land/oras=
-go/v2<br>&gt; &gt; +oras.land/oras-go/v2/content<br>&gt; &gt; +oras.land/o=
ras-go/v2/content/file<br>&gt; &gt; +oras.land/oras-go/v2/content/memory<br=
>&gt; &gt; +oras.land/oras-go/v2/content/oci<br>&gt; &gt; +oras.land/oras-g=
o/v2/errdef<br>&gt; &gt; +oras.land/oras-go/v2/internal/cas<br>&gt; &gt; +o=
ras.land/oras-go/v2/internal/container/set<br>&gt; &gt; +oras.land/oras-go/=
v2/internal/copyutil<br>&gt; &gt; +oras.land/oras-go/v2/internal/descriptor=
<br>&gt; &gt; +oras.land/oras-go/v2/internal/docker<br>&gt; &gt; +oras.land=
/oras-go/v2/internal/fs/tarfs<br>&gt; &gt; +oras.land/oras-go/v2/internal/g=
raph<br>&gt; &gt; +oras.land/oras-go/v2/internal/httputil<br>&gt; &gt; +ora=
s.land/oras-go/v2/internal/interfaces<br>&gt; &gt; +oras.land/oras-go/v2/in=
ternal/ioutil<br>&gt; &gt; +oras.land/oras-go/v2/internal/manifestutil<br>&=
gt; &gt; +oras.land/oras-go/v2/internal/platform<br>&gt; &gt; +oras.land/or=
as-go/v2/internal/registryutil<br>&gt; &gt; +oras.land/oras-go/v2/internal/=
resolver<br>&gt; &gt; +oras.land/oras-go/v2/internal/spec<br>&gt; &gt; +ora=
s.land/oras-go/v2/internal/status<br>&gt; &gt; +oras.land/oras-go/v2/intern=
al/syncutil<br>&gt; &gt; +oras.land/oras-go/v2/registry<br>&gt; &gt; +oras.=
land/oras-go/v2/registry/remote<br>&gt; &gt; +oras.land/oras-go/v2/registry=
/remote/auth<br>&gt; &gt; +oras.land/oras-go/v2/registry/remote/credentials=
<br>&gt; &gt; +oras.land/oras-go/v2/registry/remote/credentials/internal/co=
nfig<br>&gt; &gt; +oras.land/oras-go/v2/registry/remote/credentials/interna=
l/executer<br>&gt; &gt; +oras.land/oras-go/v2/registry/remote/credentials/i=
nternal/ioutil<br>&gt; &gt; +oras.land/oras-go/v2/registry/remote/credentia=
ls/trace<br>&gt; &gt; +oras.land/oras-go/v2/registry/remote/errcode<br>&gt;=
 &gt; +oras.land/oras-go/v2/registry/remote/internal/errutil<br>&gt; &gt; +=
oras.land/oras-go/v2/registry/remote/retry<br>&gt; &gt; diff --git recipes-=
containers/oras/<a href=3D"http://oras_git.bb">oras_git.bb</a> recipes-cont=
ainers/oras/<a href=3D"http://oras_git.bb">oras_git.bb</a><br>&gt; &gt; new=
 file mode 100644<br>&gt; &gt; index 00000000..94f8251d<br>&gt; &gt; --- /d=
ev/null<br>&gt; &gt; +++ recipes-containers/oras/<a href=3D"http://oras_git=
.bb">oras_git.bb</a><br>&gt; &gt; @@ -0,0 +1,63 @@<br>&gt; &gt; +HOMEPAGE =
=3D &quot;<a href=3D"https://oras.land/">https://oras.land/</a>&quot;<br>&g=
t; &gt; +SUMMARY =3D &quot;OCI registry client for managing artifacts in co=
ntainer registries&quot;<br>&gt; &gt; +<br>&gt; &gt; +DEPENDS =3D &quot; \<=
br>&gt; &gt; + =C2=A0 =C2=A0rsync-native \<br>&gt; &gt; +&quot;<br>&gt; &gt=
; +<br>&gt; &gt; +# Specify the first two important SRCREVs as the format<b=
r>&gt; &gt; +SRCREV_FORMAT =3D &quot;oras&quot;<br>&gt; &gt; +SRCREV_oras =
=3D &quot;40530fe4c68e5825b868cd874bd46fc0cdd0f432&quot;<br>&gt; &gt; +<br>=
&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/oras-projec=
t/oras;name=3Doras;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_D=
ESTSUFFIX}">github.com/oras-project/oras;name=3Doras;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}</a>&quot;<br>&gt; &gt; +<br>&g=
t; &gt; +include src_uri.inc<br>&gt; &gt; +<br>&gt; &gt; +# patches and con=
fig<br>&gt; &gt; +SRC_URI +=3D &quot;file://modules.txt&quot;<br>&gt; &gt; =
+<br>&gt; &gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>&gt; &gt; +LIC_FILES_=
CHKSUM =3D &quot;file://src/import/LICENSE;md5=3D019fcb726ce54798fc2e56a025=
20dae8&quot;<br>&gt; &gt; +<br>&gt; &gt; +GO_IMPORT =3D &quot;import&quot;<=
br>&gt; &gt; +<br>&gt; &gt; +PV =3D &quot;v1.3.0&quot;<br>&gt; &gt; +<br>&g=
t; &gt; +ORAS_PKG =3D &quot;oras.land/oras&quot;<br>&gt; &gt; +<br>&gt; &gt=
; +inherit go goarch<br>&gt; &gt; +inherit pkgconfig<br>&gt; &gt; +<br>&gt;=
 &gt; +do_configure[noexec] =3D &quot;1&quot;<br>&gt; &gt; +<br>&gt; &gt; +=
include relocation.inc<br>&gt; &gt; +<br>&gt; &gt; +GOBUILDFLAGS:append =3D=
 &quot; -mod=3Dvendor&quot;<br>&gt; &gt; +do_compile() {<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 cd ${S}/src/import<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 export GOPATH=3D&quot;$GOPATH:${S}/src/import/.gopath&quot;<b=
r>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/=
ldflags so that cgo<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 # can find the need=
ed headers files and libraries<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 export G=
OARCH=3D${TARGET_GOARCH}<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 export CGO_ENA=
BLED=3D&quot;1&quot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 export CGO_CFLAGS=
=3D&quot;${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=3D${ST=
AGING_DIR_TARGET}&quot;<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
# our copied .go files are to be used for the build<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 ln -sf vendor.copy vendor<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 # inform go that we know what we are doing<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 cp ${UNPACKDIR}/modules.txt vendor/<br>&gt; &gt; +<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 # set BuildMetadata to empty to remove default &quot;u=
nreleases&quot; tag<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 GO_LDFLAGS=3D&quot;=
-w -X ${ORAS_PKG}/internal/version.BuildMetadata=3D&quot;<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 GO_BUILDTAGS=3D&quot;&quot;<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 mkdir -p ./bin<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 ${GO} build $=
{GOBUILDFLAGS} -tags &quot;$GO_BUILDTAGS&quot; -ldflags &quot;$GO_LDFLAGS&q=
uot; -o ./bin/oras ./cmd/oras<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +=
do_install() {<br>&gt; &gt; + =C2=A0 =C2=A0install -d ${D}${bindir}<br>&gt;=
 &gt; + =C2=A0 =C2=A0install -m 755 ${S}/src/import/bin/oras ${D}${bindir}<=
br>&gt; &gt; +}<br>&gt; &gt; diff --git recipes-containers/oras/relocation.=
inc recipes-containers/oras/relocation.inc<br>&gt; &gt; new file mode 10064=
4<br>&gt; &gt; index 00000000..e5d3242a<br>&gt; &gt; --- /dev/null<br>&gt; =
&gt; +++ recipes-containers/oras/relocation.inc<br>&gt; &gt; @@ -0,0 +1,56 =
@@<br>&gt; &gt; +export sites =3D &quot;<a href=3D"http://dario.cat/mergo:d=
ario.cat/mergo:force">dario.cat/mergo:dario.cat/mergo:force</a> \<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gopkg.in/yaml.v3=
:gopkg.in/yaml.v3:force">gopkg.in/yaml.v3:gopkg.in/yaml.v3:force</a> \<br>&=
gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/=
x/sys:golang.org/x/sys:force">golang.org/x/sys:golang.org/x/sys:force</a> \=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang=
.org/x/sync:golang.org/x/sync:force">golang.org/x/sync:golang.org/x/sync:fo=
rce</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http=
://golang.org/x/term:golang.org/x/term:force">golang.org/x/term:golang.org/=
x/term:force</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"http://golang.org/x/crypto:golang.org/x/crypto:force">golang.org/x/cry=
pto:golang.org/x/crypto:force</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 oras.land/oras-go/v2:oras.land/oras-go/v2:force \<br>&gt; &gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/spf13/cast=
:github.com/spf13/cast:force">github.com/spf13/cast:github.com/spf13/cast:f=
orce</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://github.com/spf13/cobra:github.com/spf13/cobra:force">github.com/spf13/c=
obra:github.com/spf13/cobra:force</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 <a href=3D"http://github.com/spf13/pflag:github.com/spf13/pf=
lag:force">github.com/spf13/pflag:github.com/spf13/pflag:force</a> \<br>&gt=
; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/go=
ogle/uuid:github.com/google/uuid:force">github.com/google/uuid:github.com/g=
oogle/uuid:force</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a=
 href=3D"http://github.com/morikuni/aec:github.com/morikuni/aec:force">gith=
ub.com/morikuni/aec:github.com/morikuni/aec:force</a> \<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/sirupsen/logru=
s:github.com/sirupsen/logrus:force">github.com/sirupsen/logrus:github.com/s=
irupsen/logrus:force</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <a href=3D"http://github.com/huandu/xstrings:github.com/huandu/xstrings=
:force">github.com/huandu/xstrings:github.com/huandu/xstrings:force</a> \<b=
r>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.c=
om/containerd/console:github.com/containerd/console:force">github.com/conta=
inerd/console:github.com/containerd/console:force</a> \<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/shopspring/dec=
imal:github.com/shopspring/decimal:force">github.com/shopspring/decimal:git=
hub.com/shopspring/decimal:force</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <a href=3D"http://github.com/Masterminds/goutils:github.com/M=
asterminds/goutils:force">github.com/Masterminds/goutils:github.com/Masterm=
inds/goutils:force</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
<a href=3D"http://github.com/Masterminds/sprig/v3:github.com/Masterminds/sp=
rig/v3:force">github.com/Masterminds/sprig/v3:github.com/Masterminds/sprig/=
v3:force</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D=
"http://github.com/Masterminds/semver/v3:github.com/Masterminds/semver/v3:f=
orce">github.com/Masterminds/semver/v3:github.com/Masterminds/semver/v3:for=
ce</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http:=
//github.com/mitchellh/reflectwalk:github.com/mitchellh/reflectwalk:force">=
github.com/mitchellh/reflectwalk:github.com/mitchellh/reflectwalk:force</a>=
 \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gith=
ub.com/mitchellh/copystructure:github.com/mitchellh/copystructure:force">gi=
thub.com/mitchellh/copystructure:github.com/mitchellh/copystructure:force</=
a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gi=
thub.com/opencontainers/go-digest:github.com/opencontainers/go-digest:force=
">github.com/opencontainers/go-digest:github.com/opencontainers/go-digest:f=
orce</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://github.com/opencontainers/image-spec:github.com/opencontainers/image-sp=
ec:force">github.com/opencontainers/image-spec:github.com/opencontainers/im=
age-spec:force</a> \<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://github.com/inconshreveable/mousetrap:github.com/inconshreveab=
le/mousetrap:force">github.com/inconshreveable/mousetrap:github.com/inconsh=
reveable/mousetrap:force</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +do_compile:=
prepend() {<br>&gt; &gt; + =C2=A0 =C2=A0cd ${S}/src/import<br>&gt; &gt; + =
=C2=A0 =C2=A0for s in $sites; do<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
site_dest=3D$(echo $s | cut -d: -f1)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0site_source=3D$(echo $s | cut -d: -f2)<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0force_flag=3D$(echo $s | cut -d: -f3)<br>&gt; &gt; +<br>&gt; &=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p vendor.copy/$site_dest<br>&gt; &g=
t; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0# create a temporary exclude=
 file<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0exclude_file=3D$(mktemp)<br=
>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0find vendor.fetch/$s=
ite_source -type d -print0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 xargs -0 du -sBM 2=
&gt;/dev/null | =C2=A0 =C2=A0 =C2=A0 =C2=A0 awk &#39;{if ($1+0 &gt; 500) pr=
int substr($0, index($0,$2))}&#39; | =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed &#39;s=
|^vendor.fetch/||&#39; &gt; &quot;$exclude_file&quot;<br>&gt; &gt; +<br>&gt=
; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$force_flag&quot; ]; then=
<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;[INFO] =
$site_dest: force copying .go files&quot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0rm -rf vendor.copy/$site_dest<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rsync -a =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --exclude=3D&#39;vendor/&#39; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --exclude=3D&#39;.git/&#39; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --exclude-from=3D&quot;$exclu=
de_file&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vendo=
r.fetch/$site_source/ vendor.copy/$site_dest<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0else<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f [ -n &quot;$(ls -A vendor.copy/$site_dest/*.go 2&gt; /dev/null)&quot; ]; =
then<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
echo &quot;[INFO] vendor.fetch/$site_source -&gt; $site_dest: go copy skipp=
ed (files present)&quot;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0true<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0else<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo &quot;[INFO] $site_dest: copying .go files&quot;<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rsync -a =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --exclude=3D&#3=
9;vendor/&#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --exclude=3D&#39;.git/&#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --exclude-from=3D&quot;$exclude_file&quo=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ve=
ndor.fetch/$site_source/ vendor.copy/$site_dest<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fi<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;=
$exclude_file&quot;<br>&gt; &gt; + =C2=A0 =C2=A0done<br>&gt; &gt; +}<br>&gt=
; &gt; diff --git recipes-containers/oras/src_uri.inc recipes-containers/or=
as/src_uri.inc<br>&gt; &gt; new file mode 100644<br>&gt; &gt; index 0000000=
0..5fbff72f<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ recipes-containers/=
oras/src_uri.inc<br>&gt; &gt; @@ -0,0 +1,96 @@<br>&gt; &gt; +# [<a href=3D"=
http://dario.cat/mergo">dario.cat/mergo</a> v1.0.2] git ls-remote <a href=
=3D"https://github.com/imdario/mergo">https://github.com/imdario/mergo</a> =
7b33b2b01026fbbbbfcfbb1ee2c9c0a5e0c9a9f7<br>&gt; &gt; +SRCREV_mergo =3D &qu=
ot;7b33b2b01026fbbbbfcfbb1ee2c9c0a5e0c9a9f7&quot;<br>&gt; &gt; +SRC_URI +=
=3D &quot;git://<a href=3D"http://github.com/imdario/mergo;name=3Dmergo;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetc=
h/dario.cat/mergo">github.com/imdario/mergo;name=3Dmergo;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/dario.cat/mer=
go</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http://gopkg.in/yam=
l.v3">gopkg.in/yaml.v3</a> v3.0.1] git ls-remote <a href=3D"https://github.=
com/go-yaml/yaml">https://github.com/go-yaml/yaml</a> f6f7691b1fdeb513f5660=
8cd2c32c51f8194bf51<br>&gt; &gt; +SRCREV_yaml.v3 =3D &quot;f6f7691b1fdeb513=
f56608cd2c32c51f8194bf51&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a hr=
ef=3D"http://github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/yaml.v3">=
github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/yaml.v3</a>&quot;<br>&=
gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http://golang.org/x/sys">golang.org/=
x/sys</a> v0.35.0] git ls-remote <a href=3D"https://go.googlesource.com/sys=
">https://go.googlesource.com/sys</a> 5b936e1f126baa13682eff91c2e4d5d9e3a0b=
71d<br>&gt; &gt; +SRCREV_sys =3D &quot;5b936e1f126baa13682eff91c2e4d5d9e3a0=
b71d&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://go.goog=
lesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO=
_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sys">go.googlesource.com/sys;=
name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFI=
X}/vendor.fetch/golang.org/x/sys</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [=
<a href=3D"http://golang.org/x/sync">golang.org/x/sync</a> v0.16.0] git ls-=
remote <a href=3D"https://go.googlesource.com/sync">https://go.googlesource=
.com/sync</a> 7fad2c9213e0821bd78435a9c106806f2fc383f1<br>&gt; &gt; +SRCREV=
_sync =3D &quot;7fad2c9213e0821bd78435a9c106806f2fc383f1&quot;<br>&gt; &gt;=
 +SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sync;name=
=3Dsync;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/=
vendor.fetch/golang.org/x/sync">go.googlesource.com/sync;name=3Dsync;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
olang.org/x/sync</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http:=
//golang.org/x/term">golang.org/x/term</a> v0.34.0] git ls-remote <a href=
=3D"https://go.googlesource.com/term">https://go.googlesource.com/term</a> =
a35244d18d7756b12deca31a518c0fa1327d050a<br>&gt; &gt; +SRCREV_term =3D &quo=
t;a35244d18d7756b12deca31a518c0fa1327d050a&quot;<br>&gt; &gt; +SRC_URI +=3D=
 &quot;git://<a href=3D"http://go.googlesource.com/term;name=3Dterm;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go=
lang.org/x/term">go.googlesource.com/term;name=3Dterm;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/ter=
m</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http://golang.org/x/=
crypto">golang.org/x/crypto</a> v0.40.0] git ls-remote <a href=3D"https://g=
o.googlesource.com/crypto">https://go.googlesource.com/crypto</a> 459a9db11=
b9c43bb1d61722bfd371751d6de05c9<br>&gt; &gt; +SRCREV_crypto =3D &quot;459a9=
db11b9c43bb1d61722bfd371751d6de05c9&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;=
git://<a href=3D"http://go.googlesource.com/crypto;name=3Dcrypto;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gol=
ang.org/x/crypto">go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/=
x/crypto</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [oras.land/oras-go/v2 v2.=
6.0] git ls-remote <a href=3D"https://github.com/oras-project/oras-go">http=
s://github.com/oras-project/oras-go</a> 05a2b09cbf2eab1df691411884dc4df741e=
c56ab<br>&gt; &gt; +SRCREV_v2 =3D &quot;05a2b09cbf2eab1df691411884dc4df741e=
c56ab&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github=
.com/oras-project/oras-go;name=3Dv2;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/oras.land/oras-go/v2">github.com/o=
ras-project/oras-go;name=3Dv2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${=
GO_SRCURI_DESTSUFFIX}/vendor.fetch/oras.land/oras-go/v2</a>&quot;<br>&gt; &=
gt; +<br>&gt; &gt; +# [<a href=3D"http://github.com/spf13/cast">github.com/=
spf13/cast</a> v1.9.2] git ls-remote <a href=3D"https://github.com/spf13/ca=
st">https://github.com/spf13/cast</a> 40e8e077c1091d832abbde369bbf6cb6455d3=
335<br>&gt; &gt; +SRCREV_cast =3D &quot;40e8e077c1091d832abbde369bbf6cb6455=
d3335&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github=
.com/spf13/cast;name=3Dcast;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO=
_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/cast">github.com/spf13/ca=
st;name=3Dcast;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTS=
UFFIX}/vendor.fetch/github.com/spf13/cast</a>&quot;<br>&gt; &gt; +<br>&gt; =
&gt; +# [<a href=3D"http://github.com/spf13/cobra">github.com/spf13/cobra</=
a> v1.10.1] git ls-remote <a href=3D"https://github.com/spf13/cobra">https:=
//github.com/spf13/cobra</a> 7da941c3547e93b8c9f70bbd3befca79c6335388<br>&g=
t; &gt; +SRCREV_cobra =3D &quot;7da941c3547e93b8c9f70bbd3befca79c6335388&qu=
ot;<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf=
13/cobra;name=3Dcobra;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCUR=
I_DESTSUFFIX}/vendor.fetch/github.com/spf13/cobra">github.com/spf13/cobra;n=
ame=3Dcobra;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFF=
IX}/vendor.fetch/github.com/spf13/cobra</a>&quot;<br>&gt; &gt; +<br>&gt; &g=
t; +# [<a href=3D"http://github.com/spf13/pflag">github.com/spf13/pflag</a>=
 v1.0.9] git ls-remote <a href=3D"https://github.com/spf13/pflag">https://g=
ithub.com/spf13/pflag</a> 10438578954bba2527fe5cae3684d4532b064bbe<br>&gt; =
&gt; +SRCREV_pflag =3D &quot;10438578954bba2527fe5cae3684d4532b064bbe&quot;=
<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/spf13/=
pflag;name=3Dpflag;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_D=
ESTSUFFIX}/vendor.fetch/github.com/spf13/pflag">github.com/spf13/pflag;name=
=3Dpflag;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}=
/vendor.fetch/github.com/spf13/pflag</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; =
+# [<a href=3D"http://github.com/google/uuid">github.com/google/uuid</a> v1=
.6.0] git ls-remote <a href=3D"https://github.com/google/uuid">https://gith=
ub.com/google/uuid</a> 0f11ee6918f41a04c201eceeadf612a377bc7fbc<br>&gt; &gt=
; +SRCREV_uuid =3D &quot;0f11ee6918f41a04c201eceeadf612a377bc7fbc&quot;<br>=
&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google/uui=
d;name=3Duuid;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSU=
FFIX}/vendor.fetch/github.com/google/uuid">github.com/google/uuid;name=3Duu=
id;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/github.com/google/uuid</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [<a=
 href=3D"http://github.com/morikuni/aec">github.com/morikuni/aec</a> v1.0.0=
] git ls-remote <a href=3D"https://github.com/morikuni/aec">https://github.=
com/morikuni/aec</a> 39771216ff4c63d11f5e604076f9c45e8be1067b<br>&gt; &gt; =
+SRCREV_aec =3D &quot;39771216ff4c63d11f5e604076f9c45e8be1067b&quot;<br>&gt=
; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/morikuni/aec;=
name=3Daec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFI=
X}/vendor.fetch/github.com/morikuni/aec">github.com/morikuni/aec;name=3Daec=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.=
fetch/github.com/morikuni/aec</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [<a =
href=3D"http://github.com/sirupsen/logrus">github.com/sirupsen/logrus</a> v=
1.9.3] git ls-remote <a href=3D"https://github.com/sirupsen/logrus">https:/=
/github.com/sirupsen/logrus</a> d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd<br=
>&gt; &gt; +SRCREV_logrus =3D &quot;d40e25cd45ed9c6b2b66e6b97573a0413e4c23b=
d&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com=
/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
{GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/sirupsen/logrus">github.com/=
sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${=
GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/sirupsen/logrus</a>&quot;<br>=
&gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http://github.com/huandu/xstrings">=
github.com/huandu/xstrings</a> v1.5.0] git ls-remote <a href=3D"https://git=
hub.com/huandu/xstrings">https://github.com/huandu/xstrings</a> 1040c040a86=
302c5a4de066f5653bccdff2ecd2f<br>&gt; &gt; +SRCREV_xstrings =3D &quot;1040c=
040a86302c5a4de066f5653bccdff2ecd2f&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;=
git://<a href=3D"http://github.com/huandu/xstrings;name=3Dxstrings;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/huandu/xstrings">github.com/huandu/xstrings;name=3Dxstrings;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gi=
thub.com/huandu/xstrings</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [<a href=
=3D"http://github.com/containerd/console">github.com/containerd/console</a>=
 v1.0.5] git ls-remote <a href=3D"https://github.com/containerd/console">ht=
tps://github.com/containerd/console</a> c8d962180f543ac07c008ecc79a413406ea=
10c0b<br>&gt; &gt; +SRCREV_console =3D &quot;c8d962180f543ac07c008ecc79a413=
406ea10c0b&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://g=
ithub.com/containerd/console;name=3Dconsole;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/cons=
ole">github.com/containerd/console;name=3Dconsole;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/container=
d/console</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http://githu=
b.com/shopspring/decimal">github.com/shopspring/decimal</a> v1.4.0] git ls-=
remote <a href=3D"https://github.com/shopspring/decimal">https://github.com=
/shopspring/decimal</a> a1bdfc355e9c71119322b748c95f7d6b82566e30<br>&gt; &g=
t; +SRCREV_decimal =3D &quot;a1bdfc355e9c71119322b748c95f7d6b82566e30&quot;=
<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/shopsp=
ring/decimal;name=3Ddecimal;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO=
_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/shopspring/decimal">github.com/=
shopspring/decimal;name=3Ddecimal;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/shopspring/decimal</a>&q=
uot;<br>&gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http://github.com/Mastermin=
ds/goutils">github.com/Masterminds/goutils</a> v1.1.1] git ls-remote <a hre=
f=3D"https://github.com/Masterminds/goutils">https://github.com/Masterminds=
/goutils</a> f1923532a168b8203bfe956d8cd3b17ebece5982<br>&gt; &gt; +SRCREV_=
goutils =3D &quot;f1923532a168b8203bfe956d8cd3b17ebece5982&quot;<br>&gt; &g=
t; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/Masterminds/gouti=
ls;name=3Dgoutils;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DE=
STSUFFIX}/vendor.fetch/github.com/Masterminds/goutils">github.com/Mastermin=
ds/goutils;name=3Dgoutils;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_S=
RCURI_DESTSUFFIX}/vendor.fetch/github.com/Masterminds/goutils</a>&quot;<br>=
&gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http://github.com/Masterminds/sprig=
/v3">github.com/Masterminds/sprig/v3</a> v3.3.0] git ls-remote <a href=3D"h=
ttps://github.com/Masterminds/sprig">https://github.com/Masterminds/sprig</=
a> e708470d529a10ac1a3f02ab6fdd339b65958372<br>&gt; &gt; +SRCREV_v3 =3D &qu=
ot;e708470d529a10ac1a3f02ab6fdd339b65958372&quot;<br>&gt; &gt; +SRC_URI +=
=3D &quot;git://<a href=3D"http://github.com/Masterminds/sprig;name=3Dv3;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/Masterminds/sprig/v3">github.com/Masterminds/sprig;name=3Dv3;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.f=
etch/github.com/Masterminds/sprig/v3</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; =
+# [<a href=3D"http://github.com/Masterminds/semver/v3">github.com/Mastermi=
nds/semver/v3</a> v3.4.0] git ls-remote <a href=3D"https://github.com/Maste=
rminds/semver">https://github.com/Masterminds/semver</a> 61fc460d28283a91c5=
3be65c2e0f20b494ac8ad9<br>&gt; &gt; +SRCREV_semver-v3 =3D &quot;61fc460d282=
83a91c53be65c2e0f20b494ac8ad9&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;git://=
<a href=3D"http://github.com/Masterminds/semver;name=3Dsemver-v3;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/Masterminds/semver/v3">github.com/Masterminds/semver;name=3Dsemver-=
v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/github.com/Masterminds/semver/v3</a>&quot;<br>&gt; &gt; +<br>&gt; &=
gt; +# [<a href=3D"http://github.com/mitchellh/reflectwalk">github.com/mitc=
hellh/reflectwalk</a> v1.0.2] git ls-remote <a href=3D"https://github.com/m=
itchellh/reflectwalk">https://github.com/mitchellh/reflectwalk</a> e0c24fdb=
021963cd2c4013097a0b993a7c4e344f<br>&gt; &gt; +SRCREV_reflectwalk =3D &quot=
;e0c24fdb021963cd2c4013097a0b993a7c4e344f&quot;<br>&gt; &gt; +SRC_URI +=3D =
&quot;git://<a href=3D"http://github.com/mitchellh/reflectwalk;name=3Drefle=
ctwalk;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/v=
endor.fetch/github.com/mitchellh/reflectwalk">github.com/mitchellh/reflectw=
alk;name=3Dreflectwalk;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCU=
RI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/reflectwalk</a>&quot;<br>&=
gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http://github.com/mitchellh/copystru=
cture">github.com/mitchellh/copystructure</a> v1.2.0] git ls-remote <a href=
=3D"https://github.com/mitchellh/copystructure">https://github.com/mitchell=
h/copystructure</a> d4ce1f938f7a7ea2a40bff4544b56be9c00b5e84<br>&gt; &gt; +=
SRCREV_copystructure =3D &quot;d4ce1f938f7a7ea2a40bff4544b56be9c00b5e84&quo=
t;<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://github.com/mitc=
hellh/copystructure;name=3Dcopystructure;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/copystru=
cture">github.com/mitchellh/copystructure;name=3Dcopystructure;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.=
com/mitchellh/copystructure</a>&quot;<br>&gt; &gt; +<br>&gt; &gt; +# [<a hr=
ef=3D"http://github.com/opencontainers/go-digest">github.com/opencontainers=
/go-digest</a> v1.0.0] git ls-remote <a href=3D"https://github.com/opencont=
ainers/go-digest">https://github.com/opencontainers/go-digest</a> ea51bea51=
1f75cfa3ef6098cc253c5c3609b037a<br>&gt; &gt; +SRCREV_go-digest =3D &quot;ea=
51bea511f75cfa3ef6098cc253c5c3609b037a&quot;<br>&gt; &gt; +SRC_URI +=3D &qu=
ot;git://<a href=3D"http://github.com/opencontainers/go-digest;name=3Dgo-di=
gest;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/ven=
dor.fetch/github.com/opencontainers/go-digest">github.com/opencontainers/go=
-digest;name=3Dgo-digest;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SR=
CURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/go-digest</a>&quot;=
<br>&gt; &gt; +<br>&gt; &gt; +# [<a href=3D"http://github.com/opencontainer=
s/image-spec">github.com/opencontainers/image-spec</a> v1.1.1] git ls-remot=
e <a href=3D"https://github.com/opencontainers/image-spec">https://github.c=
om/opencontainers/image-spec</a> 147f9c13cedb47a0c4d9a11a222961073d585877<b=
r>&gt; &gt; +SRCREV_image-spec =3D &quot;147f9c13cedb47a0c4d9a11a222961073d=
585877&quot;<br>&gt; &gt; +SRC_URI +=3D &quot;git://<a href=3D"http://githu=
b.com/opencontainers/image-spec;name=3Dimage-spec;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/openconta=
iners/image-spec">github.com/opencontainers/image-spec;name=3Dimage-spec;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/opencontainers/image-spec</a>&quot;<br>&gt; &gt; +<br>&gt; &g=
t; +# [<a href=3D"http://github.com/inconshreveable/mousetrap">github.com/i=
nconshreveable/mousetrap</a> v1.1.0] git ls-remote <a href=3D"https://githu=
b.com/inconshreveable/mousetrap">https://github.com/inconshreveable/mousetr=
ap</a> 4e8053ee7ef85a6bd26368364a6d27f1641c1d21<br>&gt; &gt; +SRCREV_mouset=
rap =3D &quot;4e8053ee7ef85a6bd26368364a6d27f1641c1d21&quot;<br>&gt; &gt; +=
SRC_URI +=3D &quot;git://<a href=3D"http://github.com/inconshreveable/mouse=
trap;name=3Dmousetrap;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCUR=
I_DESTSUFFIX}/vendor.fetch/github.com/inconshreveable/mousetrap">github.com=
/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/inconshreveable=
/mousetrap</a>&quot;<br>&gt; &gt; +<br>&gt; &gt;<br>&gt; &gt; ---<br>&gt; &=
gt; base-commit: 26e2b40b91f2424b0b9318b50dbb700a67714b6f<br>&gt; &gt; chan=
ge-id: 20251215-add_oras_recipe-40ab44a8ad02<br>&gt; &gt;<br>&gt; &gt; Best=
 regards,<br>&gt; &gt; --<br>&gt; &gt; Massimiliano Minella &lt;<a href=3D"=
mailto:massimiliano.minella@se.com">massimiliano.minella@se.com</a>&gt;<br>=
&gt; &gt;<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-<br>&gt; &gt; Links: You receive all messages sent to t=
his group.<br>&gt; &gt; View/Reply Online (#9484): <a href=3D"https://lists=
.yoctoproject.org/g/meta-virtualization/message/9484">https://lists.yoctopr=
oject.org/g/meta-virtualization/message/9484</a><br>&gt; &gt; Mute This Top=
ic: <a href=3D"https://lists.yoctoproject.org/mt/116794590/1050810">https:/=
/lists.yoctoproject.org/mt/116794590/1050810</a><br>&gt; &gt; Group Owner: =
<a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproject.org">meta-=
virtualization+owner@lists.yoctoproject.org</a><br>&gt; &gt; Unsubscribe: <=
a href=3D"https://lists.yoctoproject.org/g/meta-virtualization/unsub">https=
://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailt=
o:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]<br>&gt; &gt; -=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>&gt; &gt;<br>&gt;<br>&gt;<br>&=
gt; --<br>&gt; - Thou shalt not follow the NULL pointer, for chaos and madn=
ess await<br>&gt; thee at its end<br>&gt; - &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II</font></div></div></div>

--000000000000accf940646409280--

