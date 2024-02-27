Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2750CC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 13:49:01 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.12568.1709041739513040354
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 05:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=by1KYfu/;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60935a128f2so1619957b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 05:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709041738; x=1709646538; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbkzDZN3O/csd/oHma7L20dmKXfijsmI2setdZfRgGM=;
        b=by1KYfu/uxTM61CVZVGcTinfp+2+ER/GhQvYQGDShcxlweQ2TgpWAH9i8gWkUsUROF
         qVGqrtSjL3nQJpVY0dCkJ5GsAKG+DOcpBajFze0uEo5KnJbo1kSgllR+oyp4f34bJDWA
         yHSybnDROd/BvF1rSg3Pi6L+F2Fc0zavYTUbtiHAqLw4AOfpQNW6vomUJIHo2SAev5NV
         xS4zYEanwzmQNWBaNA8kUrpNhAtCIzT4jLmzde03A+4uGeqcxpranPZC+F8QT1G/egHJ
         IgzaXm7WQFQbsh6HbOvoyjl1Z0S5SqGW2xF+fo7WZtfPLGPvJhEtzfhu5phoMm3ZfE28
         W7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709041738; x=1709646538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbkzDZN3O/csd/oHma7L20dmKXfijsmI2setdZfRgGM=;
        b=PcMSSjrIiXhF2SiK24OMF5IgCew8j0bfziE4+k5FGCNYpQj0wRBRLfMCAgSa5mppHl
         hlw8+E+FjP9o3zvSsvTSCOi5DMcKZAfj7dDor09Im0J8vVcmnedXvHOkpwT2BPf8N9tr
         vhL7SwQqFj0BRTreVtcY4EO3oNnM4hk/47rBF2n3h7kld9kE6tg8GDKAfinc0jJNJ1pH
         h0VTJ6C5TMna11aCqWSzGYBo+vvusWA2m2+1oAEvjEZiPXq+Rp9nMDn5s7S1mhNDzNE+
         IMkYOW/a7M7xD61+Yd1MBkQWQk+BOpapmyvwvf1WPbVr9xqE/wohjeo2tbC3Q6zfNQF6
         v9rg==
X-Gm-Message-State: AOJu0Yyx7vCPZDdq+8ryZrm5kMKxsZLL5pXPK5eyAwzxD7Am7s7u238T
	QKm5sSP3Ls8rd99pd+J3EwN+YPoWU2VaUuAQnwPctSTkRH8w8WRhLPQA+PctxSvY/g9HWwS/kSo
	8B1VaLf5O4TsQpupa+DYas48mybk1lqGk
X-Google-Smtp-Source: AGHT+IGgy0P02+E/wfjR5/IelsFwupMkXLG1zVpfxWgFV0Zdtuwr1w0br4h5A/+87Wn/xf0ICiczwqtf6DCnFVns9VE=
X-Received: by 2002:a05:6902:2412:b0:dc7:4cb1:6817 with SMTP id
 dr18-20020a056902241200b00dc74cb16817mr2478618ybb.22.1709041738438; Tue, 27
 Feb 2024 05:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20240227051211.3390256-1-Qi.Chen@windriver.com> <20240227051211.3390256-3-Qi.Chen@windriver.com>
In-Reply-To: <20240227051211.3390256-3-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 08:48:45 -0500
Message-ID: <CADkTA4OioNcWGk4uvASJP4ugUDEb0Z9cKfL9eeUMoXf3PfWZXw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/4] meta-virt: remove pure go source packages
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 13:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8589

On Tue, Feb 27, 2024 at 12:12=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> These pure go source packages are no longer needed. They were added
> to satisfy build dependency. But we now have another way for the go
> mod vendoring, we don't need them any more. There recipes are also
> not depended upon by any recipe in meta-virt.

I'm actually going to mark them as depreciated and generate a build
warning if they are used.

The plan was to remove them in the 2nd half of this year.

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/go-digest/go-digest_git.bb | 41 -----------------
>  recipes-containers/go-errors/go-errors_git.bb | 41 -----------------
>  .../go-spf13-cobra/spf13-cobra_git.bb         | 41 -----------------
>  .../go-spf13-pflag/spf13-pflag_git.bb         | 41 -----------------
>  recipes-devtools/go/compose-file_git.bb       | 41 -----------------
>  recipes-devtools/go/go-capability_git.bb      | 29 ------------
>  recipes-devtools/go/go-cli_git.bb             | 29 ------------
>  recipes-devtools/go/go-connections_git.bb     | 39 ----------------
>  recipes-devtools/go/go-context_git.bb         | 34 --------------
>  recipes-devtools/go/go-dbus_git.bb            | 29 ------------
>  recipes-devtools/go/go-distribution_git.bb    | 39 ----------------
>  recipes-devtools/go/go-fsnotify_git.bb        | 29 ------------
>  recipes-devtools/go/go-libtrust_git.bb        | 29 ------------
>  recipes-devtools/go/go-logrus_git.bb          | 29 ------------
>  recipes-devtools/go/go-mux_git.bb             | 31 -------------
>  recipes-devtools/go/go-patricia_git.bb        | 29 ------------
>  recipes-devtools/go/go-pty_git.bb             | 28 ------------
>  recipes-devtools/go/go-systemd_git.bb         | 31 -------------
>  recipes-devtools/go/grpc-go_git.bb            | 45 -------------------
>  recipes-devtools/go/notary_git.bb             | 39 ----------------
>  20 files changed, 694 deletions(-)
>  delete mode 100644 recipes-containers/go-digest/go-digest_git.bb
>  delete mode 100644 recipes-containers/go-errors/go-errors_git.bb
>  delete mode 100644 recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
>  delete mode 100644 recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
>  delete mode 100644 recipes-devtools/go/compose-file_git.bb
>  delete mode 100644 recipes-devtools/go/go-capability_git.bb
>  delete mode 100644 recipes-devtools/go/go-cli_git.bb
>  delete mode 100644 recipes-devtools/go/go-connections_git.bb
>  delete mode 100644 recipes-devtools/go/go-context_git.bb
>  delete mode 100644 recipes-devtools/go/go-dbus_git.bb
>  delete mode 100644 recipes-devtools/go/go-distribution_git.bb
>  delete mode 100644 recipes-devtools/go/go-fsnotify_git.bb
>  delete mode 100644 recipes-devtools/go/go-libtrust_git.bb
>  delete mode 100644 recipes-devtools/go/go-logrus_git.bb
>  delete mode 100644 recipes-devtools/go/go-mux_git.bb
>  delete mode 100644 recipes-devtools/go/go-patricia_git.bb
>  delete mode 100644 recipes-devtools/go/go-pty_git.bb
>  delete mode 100644 recipes-devtools/go/go-systemd_git.bb
>  delete mode 100644 recipes-devtools/go/grpc-go_git.bb
>  delete mode 100644 recipes-devtools/go/notary_git.bb
>
> diff --git a/recipes-containers/go-digest/go-digest_git.bb b/recipes-cont=
ainers/go-digest/go-digest_git.bb
> deleted file mode 100644
> index a231cf7b..00000000
> --- a/recipes-containers/go-digest/go-digest_git.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -DESCRIPTION =3D "Common digest package used across the container ecosyst=
em."
> -HOMEPAGE =3D "https://github.com/opencontainers/go-digest.git"
> -SECTION =3D "devel/go"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D2d6fc0e85c3f1=
18af64c85a78d56d3cf"
> -
> -SRCNAME =3D "go-digest"
> -
> -PKG_NAME =3D "github.com/opencontainers/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME};destsuffix=3Dgit/src/${PKG_NAME};branch=
=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "65fac7b55eb714642e9359458656939349dcb766"
> -PV =3D "v1.0.0-rc0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# NO-OP the do compile rule because this recipe is source only.
> -do_compile() {
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${P=
KG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_digest_file_sysroot_preprocess"
> -
> -go_digest_file_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> -
> -CLEANBROKEN =3D "1"
> diff --git a/recipes-containers/go-errors/go-errors_git.bb b/recipes-cont=
ainers/go-errors/go-errors_git.bb
> deleted file mode 100644
> index 87486358..00000000
> --- a/recipes-containers/go-errors/go-errors_git.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -DESCRIPTION =3D "Simple error handling primitives"
> -HOMEPAGE =3D "https://github.com/pkg/errors"
> -SECTION =3D "devel/go"
> -LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D6fe682a02df52=
c6653f33bd0f7126b5a"
> -
> -SRCNAME =3D "errors"
> -
> -PKG_NAME =3D "github.com/pkg/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME};destsuffix=3Dgit/src/${PKG_NAME};branch=
=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "5dd12d0cfe7f152f80558d591504ce685299311e"
> -PV =3D "v0.8.1+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# NO-OP the do compile rule because this recipe is source only.
> -do_compile() {
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" -not -pat=
h "*/.tool/*"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${P=
KG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_errors_file_sysroot_preprocess"
> -
> -go_errors_file_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> -
> -CLEANBROKEN =3D "1"
> diff --git a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb b/recip=
es-containers/go-spf13-cobra/spf13-cobra_git.bb
> deleted file mode 100644
> index c6629014..00000000
> --- a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -DESCRIPTION =3D "A Commander for modern Go CLI interactions"
> -HOMEPAGE =3D "https://github.com/spf13/cobra"
> -SECTION =3D "devel/go"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE.txt;md5=3D920d76114=
a32b0fb75b3f2718c5a91be"
> -
> -SRCNAME =3D "cobra"
> -
> -PKG_NAME =3D "github.com/spf13/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME};destsuffix=3Dgit/src/${PKG_NAME};branch=
=3Dmain;protocol=3Dhttps"
> -
> -SRCREV =3D "4dd4b25de38418174a6e859e8a32eaccca32dccc"
> -PV =3D "v1.6.0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# NO-OP the do compile rule because this recipe is source only.
> -do_compile() {
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" -not -pat=
h "*/.tool/*"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE.txt ${D}${prefix}/local/go/src=
/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "cobra_file_sysroot_preprocess"
> -
> -cobra_file_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> -
> -CLEANBROKEN =3D "1"
> diff --git a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb b/recip=
es-containers/go-spf13-pflag/spf13-pflag_git.bb
> deleted file mode 100644
> index 201f183a..00000000
> --- a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -DESCRIPTION =3D "Drop-in replacement for Go's flag package, implementing=
 POSIX/GNU-style --flags."
> -HOMEPAGE =3D "https://github.com/spf13/pflag"
> -SECTION =3D "devel/go"
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D1e8b7dc8b9067=
37639131047a590f21d"
> -
> -SRCNAME =3D "pflag"
> -
> -PKG_NAME =3D "github.com/spf13/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME};destsuffix=3Dgit/src/${PKG_NAME};branch=
=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "d5e0c0615acee7028e1e2740a11102313be88de1"
> -PV =3D "v1.0.5+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# NO-OP the do compile rule because this recipe is source only.
> -do_compile() {
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" -not -pat=
h "*/.tool/*"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${P=
KG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "pflag_file_sysroot_preprocess"
> -
> -pflag_file_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> -
> -CLEANBROKEN =3D "1"
> diff --git a/recipes-devtools/go/compose-file_git.bb b/recipes-devtools/g=
o/compose-file_git.bb
> deleted file mode 100644
> index 7fedc407..00000000
> --- a/recipes-devtools/go/compose-file_git.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -DESCRIPTION =3D "Parser for the Compose file format (version 3)"
> -HOMEPAGE =3D "https://github.com/aanand/compose-file"
> -SECTION =3D "devel/go"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D9cd86830b5572=
32ce55e2a6b47387471"
> -
> -SRCNAME =3D "compose-file"
> -
> -PKG_NAME =3D "github.com/aanand/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};bran=
ch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "a3e58764f50597b6217fec07e9bff7225c4a1719"
> -PV =3D "3.0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# NO-OP the do compile rule because this recipe is source only.
> -do_compile() {
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${P=
KG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_compose_file_sysroot_preprocess"
> -
> -go_compose_file_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> -
> -CLEANBROKEN =3D "1"
> diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-devtools/=
go/go-capability_git.bb
> deleted file mode 100644
> index e01a83d1..00000000
> --- a/recipes-devtools/go/go-capability_git.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION =3D "Utilities for manipulating POSIX capabilities in Go."
> -HOMEPAGE =3D "https://github.com/syndtr/gocapability"
> -SECTION =3D "devel/go"
> -LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da7304f5073e7be4ba7bffabbf9f2b=
bca"
> -
> -SRCNAME =3D "gocapability"
> -
> -PKG_NAME =3D "github.com/syndtr/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "2c00daeb6c3b45114c80ac44119e7b8801fdd852"
> -PV =3D "0.0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_capability_sysroot_preprocess"
> -
> -go_capability_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-c=
li_git.bb
> deleted file mode 100644
> index affe38ec..00000000
> --- a/recipes-devtools/go/go-cli_git.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION =3D "A small package for building command line apps in Go"
> -HOMEPAGE =3D "https://github.com/codegangsta/cli"
> -SECTION =3D "devel/go"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded9b539ed65d73926f30ff1f1587d=
c44"
> -
> -SRCNAME =3D "cli"
> -
> -PKG_NAME =3D "github.com/codegangsta/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "27ecc97192df1bf053a22b04463f2b51b8b8373e"
> -PV =3D "1.1.0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_cli_sysroot_preprocess"
> -
> -go_cli_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-connections_git.bb b/recipes-devtools=
/go/go-connections_git.bb
> deleted file mode 100644
> index 7e8f020d..00000000
> --- a/recipes-devtools/go/go-connections_git.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -DESCRIPTION =3D "Utility package to work with network connections"
> -HOMEPAGE =3D "https://github.com/docker/connections"
> -SECTION =3D "devel/go"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D04424bc6f5a5b=
e60691b9824d65c2ad8"
> -
> -SRCNAME =3D "go-connections"
> -
> -PKG_NAME =3D "github.com/docker/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};bran=
ch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "4ccf312bf1d35e5dbda654e57a9be4c3f3cd0366"
> -PV =3D "0.2.1+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# NO-OP the do compile rule because this recipe is source only.
> -do_compile() {
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${P=
KG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_connections_sysroot_preprocess"
> -
> -go_connections_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/=
go-context_git.bb
> deleted file mode 100644
> index 580463d3..00000000
> --- a/recipes-devtools/go/go-context_git.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -DESCRIPTION =3D "A golang registry for global request variables."
> -HOMEPAGE =3D "https://github.com/gorilla/context"
> -SECTION =3D "devel/go"
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc30eee78985cf2584cded5f89ba3d=
787"
> -
> -SRCNAME =3D "context"
> -
> -PKG_NAME =3D "github.com/gorilla/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
> -
> -SRCREV =3D "1cbd4c16de64273a6e63fc710b0d89bfad72cd32"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_compile() {
> -    true
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_context_sysroot_preprocess"
> -
> -go_context_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> -
> -CLEANBROKEN =3D "1"
> diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-=
dbus_git.bb
> deleted file mode 100644
> index 49b2de3b..00000000
> --- a/recipes-devtools/go/go-dbus_git.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION =3D "Native Go bindings for D-Bus"
> -HOMEPAGE =3D "https://github.com/godbus/dbus"
> -SECTION =3D "devel/go"
> -LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D09042bd5c6c96a2b9e45ddf1bc517=
eed"
> -
> -SRCNAME =3D "dbus"
> -
> -PKG_NAME =3D "github.com/godbus/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "5f6efc7ef2759c81b7ba876593971bfce311eab3"
> -PV =3D "4.0.0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_dbus_sysroot_preprocess"
> -
> -go_dbus_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devtool=
s/go/go-distribution_git.bb
> deleted file mode 100644
> index dd98a317..00000000
> --- a/recipes-devtools/go/go-distribution_git.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -DESCRIPTION =3D "The Docker toolset to pack, ship, store, and deliver co=
ntent"
> -HOMEPAGE =3D "https://github.com/docker/distribution"
> -SECTION =3D "devel/go"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3Dd2794c0df5b90=
7fdace235a619d80314"
> -
> -SRCNAME =3D "distribution"
> -
> -PKG_NAME =3D "github.com/docker/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Ddocker/1.13;destsuffix=3Dgit=
/src/${PKG_NAME};protocol=3Dhttps"
> -
> -SRCREV =3D "28602af35aceda2f8d571bad7ca37a54cf0250bc"
> -PV =3D "2.6.0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# NO-OP the do compile rule because this recipe is source only.
> -do_compile() {
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${P=
KG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_distribution_digeset_sysroot_preproces=
s"
> -
> -go_distribution_digeset_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go=
/go-fsnotify_git.bb
> deleted file mode 100644
> index 052658b8..00000000
> --- a/recipes-devtools/go/go-fsnotify_git.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION =3D "A golang registry for global request variables."
> -HOMEPAGE =3D "https://github.com/go-fsnotify/fsnotify"
> -SECTION =3D "devel/go"
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D68f2948d3c4943313d07e084a3624=
86c"
> -
> -SRCNAME =3D "fsnotify"
> -
> -PKG_NAME =3D "github.com/fsnotify/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
> -
> -SRCREV =3D "af855d7e6014ec848882bb2ed7d40d536872d275"
> -PV =3D "v1.5.1+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_fsnotify_sysroot_preprocess"
> -
> -go_fsnotify_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-devtools/go=
/go-libtrust_git.bb
> deleted file mode 100644
> index c578008a..00000000
> --- a/recipes-devtools/go/go-libtrust_git.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION =3D "Primitives for identity and authorization"
> -HOMEPAGE =3D "https://github.com/docker/libtrust"
> -SECTION =3D "devel/go"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435b266b3899aa8a959f17d41c56d=
ef8"
> -
> -SRCNAME =3D "libtrust"
> -
> -PKG_NAME =3D "github.com/docker/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "9cbd2a1374f46905c68a4eb3694a130610adc62a"
> -PV =3D "0.0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_libtrust_sysroot_preprocess"
> -
> -go_libtrust_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/g=
o-logrus_git.bb
> deleted file mode 100644
> index 211d07c9..00000000
> --- a/recipes-devtools/go/go-logrus_git.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION =3D "A golang registry for global request variables."
> -HOMEPAGE =3D "https://github.com/Sirupsen/logrus"
> -SECTION =3D "devel/go"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8dadfef729c08ec4e631c4f6fc5d4=
3a0"
> -
> -SRCNAME =3D "logrus"
> -
> -PKG_NAME =3D "github.com/sirupsen/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME};branch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "d26492970760ca5d33129d2d799e34be5c4782eb"
> -PV =3D "0.11.0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_logrus_sysroot_preprocess"
> -
> -go_logrus_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-m=
ux_git.bb
> deleted file mode 100644
> index 0d69fc58..00000000
> --- a/recipes-devtools/go/go-mux_git.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -DESCRIPTION =3D "A powerful URL router and dispatcher for golang."
> -HOMEPAGE =3D "https://github.com/gorilla/mux"
> -SECTION =3D "devel/go"
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc30eee78985cf2584cded5f89ba3d=
787"
> -
> -SRCNAME =3D "mux"
> -
> -PKG_NAME =3D "github.com/gorilla/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
> -
> -SRCREV =3D "85123bf20e069b156415b871dea10517f6a8938a"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_configure[noexec] =3D "1"
> -do_compile[noexec] =3D "1"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_mux_sysroot_preprocess"
> -
> -go_mux_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-devtools/go=
/go-patricia_git.bb
> deleted file mode 100644
> index 0a3c3f35..00000000
> --- a/recipes-devtools/go/go-patricia_git.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION =3D "A generic patricia trie (also called radix tree) implem=
ented in Go (Golang)"
> -HOMEPAGE =3D "https://github.com/gorilla/context"
> -SECTION =3D "devel/go"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9949b99212edd6b1e24ce702376c3=
baf"
> -
> -SRCNAME =3D "go-patricia"
> -
> -PKG_NAME =3D "github.com/tchap/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "666120de432aea38ab06bd5c818f04f4129882c9"
> -PV =3D "2.2.6+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_patricia_sysroot_preprocess"
> -
> -go_patricia_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-p=
ty_git.bb
> deleted file mode 100644
> index 132e82d1..00000000
> --- a/recipes-devtools/go/go-pty_git.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -DESCRIPTION =3D "PTY interface for Go"
> -HOMEPAGE =3D "https://github.com/creack/pty"
> -SECTION =3D "devel/go"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://License;md5=3D93958070863d769117fa33b129020=
050"
> -
> -SRCNAME =3D "pty"
> -
> -PKG_NAME =3D "github.com/creack/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "05017fcccf23c823bfdea560dcc958a136e54fb7"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_pty_sysroot_preprocess"
> -
> -go_pty_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/=
go-systemd_git.bb
> deleted file mode 100644
> index 3aa837aa..00000000
> --- a/recipes-devtools/go/go-systemd_git.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -DESCRIPTION =3D "Go bindings to systemd socket activation, journal, D-Bu=
s, and unit files"
> -HOMEPAGE =3D "https://github.com/coreos/go-systemd"
> -SECTION =3D "devel/go"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a=
8a5"
> -
> -SRCNAME =3D "systemd"
> -
> -PKG_NAME =3D "github.com/coreos/go-${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
> -
> -SRCREV =3D "b4a58d95188dd092ae20072bac14cece0e67c388"
> -PV =3D "4+git"
> -
> -RDEPENDS:${PN} +=3D "bash"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_systemd_sysroot_preprocess"
> -
> -go_systemd_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grp=
c-go_git.bb
> deleted file mode 100644
> index 7989c02f..00000000
> --- a/recipes-devtools/go/grpc-go_git.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -DESCRIPTION =3D "The Go language implementation of gRPC. HTTP/2 based RP=
C"
> -HOMEPAGE =3D "https://github.com/grpc/grpc-go"
> -SECTION =3D "devel/go"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
> -
> -SRCNAME =3D "grpc-go"
> -
> -PKG_NAME =3D "google.golang.org/grpc"
> -SRC_URI =3D "git://github.com/grpc/${SRCNAME}.git;destsuffix=3Dgit/src/$=
{PKG_NAME};branch=3Dv1.59.x;protocol=3Dhttps"
> -
> -SRCREV =3D "7765221f4bf6104973db7946d56936cf838cad46"
> -PV =3D "1.59.0+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# NO-OP the do compile rule because this recipe is source only.
> -do_compile() {
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${P=
KG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_grpc_sysroot_preprocess"
> -
> -go_grpc_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D " \
> -    ${prefix}/local/go/src/${PKG_NAME}/* \
> -"
> -
> -# some CVEs are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
> -# it's better to have false positives than false negatives
> -CVE_PRODUCT +=3D "grpc"
> diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/nota=
ry_git.bb
> deleted file mode 100644
> index 1b877d62..00000000
> --- a/recipes-devtools/go/notary_git.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -DESCRIPTION =3D "Notary is a Docker project that allows anyone to have t=
rust over arbitrary collections of data"
> -HOMEPAGE =3D "https://github.com/docker/notary"
> -SECTION =3D "devel/go"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D3596b980bb036=
e0875174ed15e4b982a"
> -
> -SRCNAME =3D "notary"
> -
> -PKG_NAME =3D "github.com/docker/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};bran=
ch=3Dmaster;protocol=3Dhttps"
> -
> -SRCREV =3D "d6e1431feb32348e0650bf7551ac5cffd01d857b"
> -PV =3D "0.6.1+git"
> -
> -S =3D "${WORKDIR}/git"
> -
> -# NO-OP the do compile rule because this recipe is source only.
> -do_compile() {
> -}
> -
> -do_install() {
> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> -           fi
> -           cp $j ${D}${prefix}/local/go/$j
> -       done
> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${P=
KG_NAME}/
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "go_notary_sysroot_preprocess"
> -
> -go_notary_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${pre=
fix}/local/go/src/$(dirname ${PKG_NAME})
> -}
> -
> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8587): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8587
> Mute This Topic: https://lists.yoctoproject.org/mt/104598181/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

