Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F669D609A1
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:56:36 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24645.1765896993601090816
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 06:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kFF1iHdC;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c30f0f12eso2758184a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Dec 2025 06:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765896993; x=1766501793; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piv4LFnnEKktUJPdkLdND/0xWzWuUbjI5/01mC0inKQ=;
        b=kFF1iHdCx5BvLD2yDNOvCVS1j2buIcZbi+pKMvZI4SQXf1K4R+gbEexP0BTici7Xpf
         pIh9AqZ5oQnZrGkFjQkxE9TNDKgETvf66U/Qecd2Hmgluf1TPyhXsTijD8js4KQ67CUm
         +yGz+ZOFqer3RyJKZDovh8LBsJ0UQlacevONVKKUXUYFOnyjToOcro/btXp+KyvJdFrj
         kCVaOXUevb0Pb5nngo0fzpGahiqcZIedhhWOPMNsgB3Pok683DQ5IkooLVsTJSv3Iwrw
         vpKam1HOUUpBM2mo7PATjcK7PagBw/x72lHz5v8FcO0+JUxEZ0HzMN5nd5eI29IsQAT2
         y6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896993; x=1766501793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=piv4LFnnEKktUJPdkLdND/0xWzWuUbjI5/01mC0inKQ=;
        b=SS04ukaDud0bIRlc8UDlb5CNgaOEwUH6YYO2l4aQ4CHdl4ehz2HN+kzJq53JIm/ZLo
         QECon70KUCwXuRF796Qx8UwScjkD3qqP64Yz7capFtSbuyIiRDLkq1OmTD8rqax7fynP
         /3K/8p+U6c/q0muLu61QIRLtxyBWy1wLoqbO8Ru/tj+hBC5jX8X8VLkOKj3WjGgvgCsO
         HBt0gor2eFGU35uE0TYAxkVVIuUpp0Xx7IXhAis6hjWULAsnmZK8smcGIxpW0s/lNmJP
         1mmeMrLrUITjqkm+ajrf+NCI8suGDKDRSOzcBg4swik899eIRTHQ34M2j+HKKdo0jBaR
         /3Yg==
X-Gm-Message-State: AOJu0YzyKF+mnk8iqnqpnXbr8HJHMIS9HQmmMU7oPFA/X+I9GaKmSX5k
	o5iVXAl5YCeFNSqcdtOd2QSJszX+0z+mRzjeg4c3JrSQgnLEGpHihpY4uWyUVfEqZqVDGawPqrH
	MQ5i7I+em0uPe67uRMVqqq1kabUM4C0s=
X-Gm-Gg: AY/fxX5stb2dIMa0QtCY62A++6VOfg4chBtra6MzuYT6wjIfl32xrHHH327Pwu794g2
	TZKje2VWRvmani9B+c9aKjtsJX1kliqVmdixfhiJb99AY2D9QFvWbYRXfX37wMXEyaVjVJAkIZU
	VV2ZegtNIj2eKaAKJkkmWUxwlkMA3tylYFnphofuGDWTtSw8RxV5tCfI38jq122k6TE2fdAm2Yd
	flMHFhMkJKgEvSJ3SDHTpMhCGmTliRV6sZX/q5xnB+Nr2xRT5asdwY34NQOdzdhObjx1kCT
X-Google-Smtp-Source: AGHT+IHdYXUco8Ls7H0pA6FTG2iI3mQvfGWiVN4WqU2l1DZgc3tRf4P/SmXm5hUy920ojybVyylHhY7F3EkKmfFae14=
X-Received: by 2002:a17:90b:4fc1:b0:34c:2db6:57a7 with SMTP id
 98e67ed59e1d1-34c2db65a7cmr10109060a91.8.1765896992659; Tue, 16 Dec 2025
 06:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20251215-add_oras_recipe-v1-1-1075af14e8aa@se.com>
In-Reply-To: <20251215-add_oras_recipe-v1-1-1075af14e8aa@se.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 Dec 2025 09:56:20 -0500
X-Gm-Features: AQt7F2pWCCTWq1Mm9Tq7bDz4V-bPFdcL1ctxYjbe92mGJ_glBnaKE7SHSJ7Cbvk
Message-ID: <CADkTA4Mgf5xbABcExN4OhLsqPLeW40bmiJQ7-Z=pM5oUxqLH5A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] oras: add recipe for oras v1.3.0
To: massimiliano.minella@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	Massimiliano Minella <massimiliano.minella@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Dec 2025 14:56:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9486

On Mon, Dec 15, 2025 at 11:12=E2=80=AFAM Massimiliano Minella via
lists.yoctoproject.org
<massimiliano.minella=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> From: Massimiliano Minella <massimiliano.minella@se.com>
>
> ORAS is an OCI registry client for managing artifacts in container
> registries. It enables pushing and pulling arbitrary artifacts to and
> from OCI-compliant registries.

Hi Massimiliano,

Thanks for the contribution!

I'm only casually familiar with ORAS, but it definitely belongs in meta-vir=
t and
we can definitely get it merged with some tweaks and more information.

I appreciate that you introduced it in the git based approach that the laye=
r
follows, that's a good way to keep a maintainer happy .. consistency (even
when we are inconsistent ourselves) :)

On that note (and I can do the conversion on your behalf), I've come up wit=
h
a new scheme that allows the mixing of gomod:// and git://, with git:// sti=
ll
being the preference, but for large repos, we can switch in gomod:// and sa=
ve
significant time and space. There are converted recipes and documentation
on master-next for that right now.

Outside of that conversion, I just need some more information:

- what architectures has it been built and tested on ? What are the
architectures
  it can support ? At a glance I didn't see anything excluded in the recipe=
, and
  there should be some level of restriction

- How can it be tested ? And even better, tested with artifacts built with
  meta-virtualization ? This doesn't need to be elaborate, and doesn't need=
 to
  be a ptest or other structured format. Just a README in the recipe direct=
ory
  with some information and usage examples would be enough.

Cheers,

Bruce







>
> The base files for modules.txt, src_uri.inc and relocation.inc were
> auto-generated using:
>
> ./scripts/oe-go-mod-autogen.py --repo https://github.com/oras-project/ora=
s.git --rev v1.3.0
>
> modules.txt has been updated by running 'go mod vendor' in a devshell
> environment and copying the resulting modules.txt.
>
> Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
> ---
>  recipes-containers/oras/files/modules.txt | 113 ++++++++++++++++++++++++=
++++++
>  recipes-containers/oras/oras_git.bb       |  63 +++++++++++++++++
>  recipes-containers/oras/relocation.inc    |  56 +++++++++++++++
>  recipes-containers/oras/src_uri.inc       |  96 ++++++++++++++++++++++++=
+
>  4 files changed, 328 insertions(+)
>
> diff --git recipes-containers/oras/files/modules.txt recipes-containers/o=
ras/files/modules.txt
> new file mode 100644
> index 00000000..521b33f0
> --- /dev/null
> +++ recipes-containers/oras/files/modules.txt
> @@ -0,0 +1,113 @@
> +# dario.cat/mergo v1.0.2
> +## explicit; go 1.13
> +dario.cat/mergo
> +# github.com/Masterminds/goutils v1.1.1
> +## explicit
> +github.com/Masterminds/goutils
> +# github.com/Masterminds/semver/v3 v3.4.0
> +## explicit; go 1.21
> +github.com/Masterminds/semver/v3
> +# github.com/Masterminds/sprig/v3 v3.3.0
> +## explicit; go 1.21
> +github.com/Masterminds/sprig/v3
> +# github.com/containerd/console v1.0.5
> +## explicit; go 1.13
> +github.com/containerd/console
> +# github.com/google/uuid v1.6.0
> +## explicit
> +github.com/google/uuid
> +# github.com/huandu/xstrings v1.5.0
> +## explicit; go 1.12
> +github.com/huandu/xstrings
> +# github.com/inconshreveable/mousetrap v1.1.0
> +## explicit; go 1.18
> +github.com/inconshreveable/mousetrap
> +# github.com/mitchellh/copystructure v1.2.0
> +## explicit; go 1.15
> +github.com/mitchellh/copystructure
> +# github.com/mitchellh/reflectwalk v1.0.2
> +## explicit
> +github.com/mitchellh/reflectwalk
> +# github.com/morikuni/aec v1.0.0
> +## explicit
> +github.com/morikuni/aec
> +# github.com/opencontainers/go-digest v1.0.0
> +## explicit; go 1.13
> +github.com/opencontainers/go-digest
> +# github.com/opencontainers/image-spec v1.1.1
> +## explicit; go 1.18
> +github.com/opencontainers/image-spec/specs-go
> +github.com/opencontainers/image-spec/specs-go/v1
> +# github.com/shopspring/decimal v1.4.0
> +## explicit; go 1.10
> +github.com/shopspring/decimal
> +# github.com/sirupsen/logrus v1.9.3
> +## explicit; go 1.13
> +github.com/sirupsen/logrus
> +# github.com/spf13/cast v1.9.2
> +## explicit; go 1.21.0
> +github.com/spf13/cast
> +github.com/spf13/cast/internal
> +# github.com/spf13/cobra v1.10.1
> +## explicit; go 1.15
> +github.com/spf13/cobra
> +# github.com/spf13/pflag v1.0.9
> +## explicit; go 1.12
> +github.com/spf13/pflag
> +# golang.org/x/crypto v0.40.0
> +## explicit; go 1.23.0
> +golang.org/x/crypto/bcrypt
> +golang.org/x/crypto/blowfish
> +golang.org/x/crypto/pbkdf2
> +golang.org/x/crypto/scrypt
> +# golang.org/x/sync v0.16.0
> +## explicit; go 1.23.0
> +golang.org/x/sync/errgroup
> +golang.org/x/sync/semaphore
> +# golang.org/x/sys v0.35.0
> +## explicit; go 1.23.0
> +golang.org/x/sys/plan9
> +golang.org/x/sys/unix
> +golang.org/x/sys/windows
> +# golang.org/x/term v0.34.0
> +## explicit; go 1.23.0
> +golang.org/x/term
> +# gopkg.in/yaml.v3 v3.0.1
> +## explicit
> +gopkg.in/yaml.v3
> +# oras.land/oras-go/v2 v2.6.0
> +## explicit; go 1.23.0
> +oras.land/oras-go/v2
> +oras.land/oras-go/v2/content
> +oras.land/oras-go/v2/content/file
> +oras.land/oras-go/v2/content/memory
> +oras.land/oras-go/v2/content/oci
> +oras.land/oras-go/v2/errdef
> +oras.land/oras-go/v2/internal/cas
> +oras.land/oras-go/v2/internal/container/set
> +oras.land/oras-go/v2/internal/copyutil
> +oras.land/oras-go/v2/internal/descriptor
> +oras.land/oras-go/v2/internal/docker
> +oras.land/oras-go/v2/internal/fs/tarfs
> +oras.land/oras-go/v2/internal/graph
> +oras.land/oras-go/v2/internal/httputil
> +oras.land/oras-go/v2/internal/interfaces
> +oras.land/oras-go/v2/internal/ioutil
> +oras.land/oras-go/v2/internal/manifestutil
> +oras.land/oras-go/v2/internal/platform
> +oras.land/oras-go/v2/internal/registryutil
> +oras.land/oras-go/v2/internal/resolver
> +oras.land/oras-go/v2/internal/spec
> +oras.land/oras-go/v2/internal/status
> +oras.land/oras-go/v2/internal/syncutil
> +oras.land/oras-go/v2/registry
> +oras.land/oras-go/v2/registry/remote
> +oras.land/oras-go/v2/registry/remote/auth
> +oras.land/oras-go/v2/registry/remote/credentials
> +oras.land/oras-go/v2/registry/remote/credentials/internal/config
> +oras.land/oras-go/v2/registry/remote/credentials/internal/executer
> +oras.land/oras-go/v2/registry/remote/credentials/internal/ioutil
> +oras.land/oras-go/v2/registry/remote/credentials/trace
> +oras.land/oras-go/v2/registry/remote/errcode
> +oras.land/oras-go/v2/registry/remote/internal/errutil
> +oras.land/oras-go/v2/registry/remote/retry
> diff --git recipes-containers/oras/oras_git.bb recipes-containers/oras/or=
as_git.bb
> new file mode 100644
> index 00000000..94f8251d
> --- /dev/null
> +++ recipes-containers/oras/oras_git.bb
> @@ -0,0 +1,63 @@
> +HOMEPAGE =3D "https://oras.land/"
> +SUMMARY =3D "OCI registry client for managing artifacts in container reg=
istries"
> +
> +DEPENDS =3D " \
> +    rsync-native \
> +"
> +
> +# Specify the first two important SRCREVs as the format
> +SRCREV_FORMAT =3D "oras"
> +SRCREV_oras =3D "40530fe4c68e5825b868cd874bd46fc0cdd0f432"
> +
> +SRC_URI =3D "git://github.com/oras-project/oras;name=3Doras;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}"
> +
> +include src_uri.inc
> +
> +# patches and config
> +SRC_URI +=3D "file://modules.txt"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D019fcb726ce54798fc=
2e56a02520dae8"
> +
> +GO_IMPORT =3D "import"
> +
> +PV =3D "v1.3.0"
> +
> +ORAS_PKG =3D "oras.land/oras"
> +
> +inherit go goarch
> +inherit pkgconfig
> +
> +do_configure[noexec] =3D "1"
> +
> +include relocation.inc
> +
> +GOBUILDFLAGS:append =3D " -mod=3Dvendor"
> +do_compile() {
> +       cd ${S}/src/import
> +
> +       export GOPATH=3D"$GOPATH:${S}/src/import/.gopath"
> +
> +       # Pass the needed cflags/ldflags so that cgo
> +       # can find the needed headers files and libraries
> +       export GOARCH=3D${TARGET_GOARCH}
> +       export CGO_ENABLED=3D"1"
> +       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
> +       export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGET=
}"
> +
> +       # our copied .go files are to be used for the build
> +       ln -sf vendor.copy vendor
> +       # inform go that we know what we are doing
> +       cp ${UNPACKDIR}/modules.txt vendor/
> +
> +       # set BuildMetadata to empty to remove default "unreleases" tag
> +       GO_LDFLAGS=3D"-w -X ${ORAS_PKG}/internal/version.BuildMetadata=3D=
"
> +       GO_BUILDTAGS=3D""
> +       mkdir -p ./bin
> +       ${GO} build ${GOBUILDFLAGS} -tags "$GO_BUILDTAGS" -ldflags "$GO_L=
DFLAGS" -o ./bin/oras ./cmd/oras
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/src/import/bin/oras ${D}${bindir}
> +}
> diff --git recipes-containers/oras/relocation.inc recipes-containers/oras=
/relocation.inc
> new file mode 100644
> index 00000000..e5d3242a
> --- /dev/null
> +++ recipes-containers/oras/relocation.inc
> @@ -0,0 +1,56 @@
> +export sites =3D "dario.cat/mergo:dario.cat/mergo:force \
> +           gopkg.in/yaml.v3:gopkg.in/yaml.v3:force \
> +           golang.org/x/sys:golang.org/x/sys:force \
> +           golang.org/x/sync:golang.org/x/sync:force \
> +           golang.org/x/term:golang.org/x/term:force \
> +           golang.org/x/crypto:golang.org/x/crypto:force \
> +           oras.land/oras-go/v2:oras.land/oras-go/v2:force \
> +           github.com/spf13/cast:github.com/spf13/cast:force \
> +           github.com/spf13/cobra:github.com/spf13/cobra:force \
> +           github.com/spf13/pflag:github.com/spf13/pflag:force \
> +           github.com/google/uuid:github.com/google/uuid:force \
> +           github.com/morikuni/aec:github.com/morikuni/aec:force \
> +           github.com/sirupsen/logrus:github.com/sirupsen/logrus:force \
> +           github.com/huandu/xstrings:github.com/huandu/xstrings:force \
> +           github.com/containerd/console:github.com/containerd/console:f=
orce \
> +           github.com/shopspring/decimal:github.com/shopspring/decimal:f=
orce \
> +           github.com/Masterminds/goutils:github.com/Masterminds/goutils=
:force \
> +           github.com/Masterminds/sprig/v3:github.com/Masterminds/sprig/=
v3:force \
> +           github.com/Masterminds/semver/v3:github.com/Masterminds/semve=
r/v3:force \
> +           github.com/mitchellh/reflectwalk:github.com/mitchellh/reflect=
walk:force \
> +           github.com/mitchellh/copystructure:github.com/mitchellh/copys=
tructure:force \
> +           github.com/opencontainers/go-digest:github.com/opencontainers=
/go-digest:force \
> +           github.com/opencontainers/image-spec:github.com/opencontainer=
s/image-spec:force \
> +           github.com/inconshreveable/mousetrap:github.com/inconshreveab=
le/mousetrap:force"
> +
> +do_compile:prepend() {
> +    cd ${S}/src/import
> +    for s in $sites; do
> +        site_dest=3D$(echo $s | cut -d: -f1)
> +        site_source=3D$(echo $s | cut -d: -f2)
> +        force_flag=3D$(echo $s | cut -d: -f3)
> +
> +        mkdir -p vendor.copy/$site_dest
> +
> +        # create a temporary exclude file
> +        exclude_file=3D$(mktemp)
> +
> +        find vendor.fetch/$site_source -type d -print0 |         xargs -=
0 du -sBM 2>/dev/null |         awk '{if ($1+0 > 500) print substr($0, inde=
x($0,$2))}' |         sed 's|^vendor.fetch/||' > "$exclude_file"
> +
> +        if [ -n "$force_flag" ]; then
> +            echo "[INFO] $site_dest: force copying .go files"
> +            rm -rf vendor.copy/$site_dest
> +            rsync -a                 --exclude=3D'vendor/'              =
   --exclude=3D'.git/'                 --exclude-from=3D"$exclude_file"    =
             vendor.fetch/$site_source/ vendor.copy/$site_dest
> +        else
> +            if [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" =
]; then
> +                echo "[INFO] vendor.fetch/$site_source -> $site_dest: go=
 copy skipped (files present)"
> +                true
> +            else
> +                echo "[INFO] $site_dest: copying .go files"
> +                rsync -a                     --exclude=3D'vendor/'      =
               --exclude=3D'.git/'                     --exclude-from=3D"$e=
xclude_file"                     vendor.fetch/$site_source/ vendor.copy/$si=
te_dest
> +            fi
> +        fi
> +
> +        rm -f "$exclude_file"
> +    done
> +}
> diff --git recipes-containers/oras/src_uri.inc recipes-containers/oras/sr=
c_uri.inc
> new file mode 100644
> index 00000000..5fbff72f
> --- /dev/null
> +++ recipes-containers/oras/src_uri.inc
> @@ -0,0 +1,96 @@
> +# [dario.cat/mergo v1.0.2] git ls-remote https://github.com/imdario/merg=
o 7b33b2b01026fbbbbfcfbb1ee2c9c0a5e0c9a9f7
> +SRCREV_mergo =3D "7b33b2b01026fbbbbfcfbb1ee2c9c0a5e0c9a9f7"
> +SRC_URI +=3D "git://github.com/imdario/mergo;name=3Dmergo;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/dario.cat=
/mergo"
> +
> +# [gopkg.in/yaml.v3 v3.0.1] git ls-remote https://github.com/go-yaml/yam=
l f6f7691b1fdeb513f56608cd2c32c51f8194bf51
> +SRCREV_yaml.v3 =3D "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
> +SRC_URI +=3D "git://github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in=
/yaml.v3"
> +
> +# [golang.org/x/sys v0.35.0] git ls-remote https://go.googlesource.com/s=
ys 5b936e1f126baa13682eff91c2e4d5d9e3a0b71d
> +SRCREV_sys =3D "5b936e1f126baa13682eff91c2e4d5d9e3a0b71d"
> +SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x=
/sys"
> +
> +# [golang.org/x/sync v0.16.0] git ls-remote https://go.googlesource.com/=
sync 7fad2c9213e0821bd78435a9c106806f2fc383f1
> +SRCREV_sync =3D "7fad2c9213e0821bd78435a9c106806f2fc383f1"
> +SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org=
/x/sync"
> +
> +# [golang.org/x/term v0.34.0] git ls-remote https://go.googlesource.com/=
term a35244d18d7756b12deca31a518c0fa1327d050a
> +SRCREV_term =3D "a35244d18d7756b12deca31a518c0fa1327d050a"
> +SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org=
/x/term"
> +
> +# [golang.org/x/crypto v0.40.0] git ls-remote https://go.googlesource.co=
m/crypto 459a9db11b9c43bb1d61722bfd371751d6de05c9
> +SRCREV_crypto =3D "459a9db11b9c43bb1d61722bfd371751d6de05c9"
> +SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang=
.org/x/crypto"
> +
> +# [oras.land/oras-go/v2 v2.6.0] git ls-remote https://github.com/oras-pr=
oject/oras-go 05a2b09cbf2eab1df691411884dc4df741ec56ab
> +SRCREV_v2 =3D "05a2b09cbf2eab1df691411884dc4df741ec56ab"
> +SRC_URI +=3D "git://github.com/oras-project/oras-go;name=3Dv2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/ora=
s.land/oras-go/v2"
> +
> +# [github.com/spf13/cast v1.9.2] git ls-remote https://github.com/spf13/=
cast 40e8e077c1091d832abbde369bbf6cb6455d3335
> +SRCREV_cast =3D "40e8e077c1091d832abbde369bbf6cb6455d3335"
> +SRC_URI +=3D "git://github.com/spf13/cast;name=3Dcast;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/sp=
f13/cast"
> +
> +# [github.com/spf13/cobra v1.10.1] git ls-remote https://github.com/spf1=
3/cobra 7da941c3547e93b8c9f70bbd3befca79c6335388
> +SRCREV_cobra =3D "7da941c3547e93b8c9f70bbd3befca79c6335388"
> +SRC_URI +=3D "git://github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/=
spf13/cobra"
> +
> +# [github.com/spf13/pflag v1.0.9] git ls-remote https://github.com/spf13=
/pflag 10438578954bba2527fe5cae3684d4532b064bbe
> +SRCREV_pflag =3D "10438578954bba2527fe5cae3684d4532b064bbe"
> +SRC_URI +=3D "git://github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/=
spf13/pflag"
> +
> +# [github.com/google/uuid v1.6.0] git ls-remote https://github.com/googl=
e/uuid 0f11ee6918f41a04c201eceeadf612a377bc7fbc
> +SRCREV_uuid =3D "0f11ee6918f41a04c201eceeadf612a377bc7fbc"
> +SRC_URI +=3D "git://github.com/google/uuid;name=3Duuid;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/g=
oogle/uuid"
> +
> +# [github.com/morikuni/aec v1.0.0] git ls-remote https://github.com/mori=
kuni/aec 39771216ff4c63d11f5e604076f9c45e8be1067b
> +SRCREV_aec =3D "39771216ff4c63d11f5e604076f9c45e8be1067b"
> +SRC_URI +=3D "git://github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/m=
orikuni/aec"
> +
> +# [github.com/sirupsen/logrus v1.9.3] git ls-remote https://github.com/s=
irupsen/logrus d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd
> +SRCREV_logrus =3D "d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
> +SRC_URI +=3D "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github=
.com/sirupsen/logrus"
> +
> +# [github.com/huandu/xstrings v1.5.0] git ls-remote https://github.com/h=
uandu/xstrings 1040c040a86302c5a4de066f5653bccdff2ecd2f
> +SRCREV_xstrings =3D "1040c040a86302c5a4de066f5653bccdff2ecd2f"
> +SRC_URI +=3D "git://github.com/huandu/xstrings;name=3Dxstrings;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/huandu/xstrings"
> +
> +# [github.com/containerd/console v1.0.5] git ls-remote https://github.co=
m/containerd/console c8d962180f543ac07c008ecc79a413406ea10c0b
> +SRCREV_console =3D "c8d962180f543ac07c008ecc79a413406ea10c0b"
> +SRC_URI +=3D "git://github.com/containerd/console;name=3Dconsole;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gi=
thub.com/containerd/console"
> +
> +# [github.com/shopspring/decimal v1.4.0] git ls-remote https://github.co=
m/shopspring/decimal a1bdfc355e9c71119322b748c95f7d6b82566e30
> +SRCREV_decimal =3D "a1bdfc355e9c71119322b748c95f7d6b82566e30"
> +SRC_URI +=3D "git://github.com/shopspring/decimal;name=3Ddecimal;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gi=
thub.com/shopspring/decimal"
> +
> +# [github.com/Masterminds/goutils v1.1.1] git ls-remote https://github.c=
om/Masterminds/goutils f1923532a168b8203bfe956d8cd3b17ebece5982
> +SRCREV_goutils =3D "f1923532a168b8203bfe956d8cd3b17ebece5982"
> +SRC_URI +=3D "git://github.com/Masterminds/goutils;name=3Dgoutils;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/Masterminds/goutils"
> +
> +# [github.com/Masterminds/sprig/v3 v3.3.0] git ls-remote https://github.=
com/Masterminds/sprig e708470d529a10ac1a3f02ab6fdd339b65958372
> +SRCREV_v3 =3D "e708470d529a10ac1a3f02ab6fdd339b65958372"
> +SRC_URI +=3D "git://github.com/Masterminds/sprig;name=3Dv3;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.c=
om/Masterminds/sprig/v3"
> +
> +# [github.com/Masterminds/semver/v3 v3.4.0] git ls-remote https://github=
.com/Masterminds/semver 61fc460d28283a91c53be65c2e0f20b494ac8ad9
> +SRCREV_semver-v3 =3D "61fc460d28283a91c53be65c2e0f20b494ac8ad9"
> +SRC_URI +=3D "git://github.com/Masterminds/semver;name=3Dsemver-v3;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/=
github.com/Masterminds/semver/v3"
> +
> +# [github.com/mitchellh/reflectwalk v1.0.2] git ls-remote https://github=
.com/mitchellh/reflectwalk e0c24fdb021963cd2c4013097a0b993a7c4e344f
> +SRCREV_reflectwalk =3D "e0c24fdb021963cd2c4013097a0b993a7c4e344f"
> +SRC_URI +=3D "git://github.com/mitchellh/reflectwalk;name=3Dreflectwalk;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.f=
etch/github.com/mitchellh/reflectwalk"
> +
> +# [github.com/mitchellh/copystructure v1.2.0] git ls-remote https://gith=
ub.com/mitchellh/copystructure d4ce1f938f7a7ea2a40bff4544b56be9c00b5e84
> +SRCREV_copystructure =3D "d4ce1f938f7a7ea2a40bff4544b56be9c00b5e84"
> +SRC_URI +=3D "git://github.com/mitchellh/copystructure;name=3Dcopystruct=
ure;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vend=
or.fetch/github.com/mitchellh/copystructure"
> +
> +# [github.com/opencontainers/go-digest v1.0.0] git ls-remote https://git=
hub.com/opencontainers/go-digest ea51bea511f75cfa3ef6098cc253c5c3609b037a
> +SRCREV_go-digest =3D "ea51bea511f75cfa3ef6098cc253c5c3609b037a"
> +SRC_URI +=3D "git://github.com/opencontainers/go-digest;name=3Dgo-digest=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.=
fetch/github.com/opencontainers/go-digest"
> +
> +# [github.com/opencontainers/image-spec v1.1.1] git ls-remote https://gi=
thub.com/opencontainers/image-spec 147f9c13cedb47a0c4d9a11a222961073d585877
> +SRCREV_image-spec =3D "147f9c13cedb47a0c4d9a11a222961073d585877"
> +SRC_URI +=3D "git://github.com/opencontainers/image-spec;name=3Dimage-sp=
ec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/github.com/opencontainers/image-spec"
> +
> +# [github.com/inconshreveable/mousetrap v1.1.0] git ls-remote https://gi=
thub.com/inconshreveable/mousetrap 4e8053ee7ef85a6bd26368364a6d27f1641c1d21
> +SRCREV_mousetrap =3D "4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
> +SRC_URI +=3D "git://github.com/inconshreveable/mousetrap;name=3Dmousetra=
p;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor=
.fetch/github.com/inconshreveable/mousetrap"
> +
>
> ---
> base-commit: 26e2b40b91f2424b0b9318b50dbb700a67714b6f
> change-id: 20251215-add_oras_recipe-40ab44a8ad02
>
> Best regards,
> --
> Massimiliano Minella <massimiliano.minella@se.com>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9484): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9484
> Mute This Topic: https://lists.yoctoproject.org/mt/116794590/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

