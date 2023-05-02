Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A320EC19F20
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:43:25 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.1906.1683060197274377141
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 13:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jM+ModnY;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-32b1ee270ebso11431815ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 13:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683060196; x=1685652196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frccRVgUWaTXGtHgHOqWKHpZEwS3cdo20iaaNfbpSvA=;
        b=jM+ModnYgKqMhKv7Y/halpmKDd8UKzucYeSMpCx7UzvB5XqC09x8+jJibtt0LJ36Uf
         kcV1ytXjYsMEqYb6aApRQUHEOMWjm54biMXiPttBZ14py9Q9iVEs+AaKwpA049Y0HPKn
         1kPNvoRyNyCFpa2tEkOg9HFpfkOUu3Gbpe2kbgsDlRq75CeJxStAJGfHpGonJ7fw0wqj
         W/tOIaJvqUyt+PdlU/GuKVpRN2/GxLNvC+2Ysyf5OjZoTrWUch7I55vWUHBOOZCFaXav
         xknIv4op39cG/GJO3rvIQ/Wp72NAtC63ws3SSnJFBgiw/oR1A57geQ+Ag6IVMqcOx1Zz
         Evow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683060196; x=1685652196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frccRVgUWaTXGtHgHOqWKHpZEwS3cdo20iaaNfbpSvA=;
        b=W0h13ORl7325o5YGoZGfGeW/hVW0XSxMzuFi/7ZhCQ7d244MPKPZItO1zn7b3OUrUS
         SY2GGJWnxkRNgYf56VQWxjwFU45Xak27vdbHvHrNl84IEsZJs/MXBsgvoNPV/4j7FwaI
         Lt7BXOz4lGWXVawk4vVr4eIibZK/zBCCjWOFkGILeX55XVBaztFUHaQTXGP/5BjmnkG1
         PLyrCBUrXNki13OHvwxtGBQwi2YWINFGYEcJ3omZJUqFLoUkvaHQYyKjJKDk/X49UvYm
         ldi5EyVASAxUBgFhVO+JH7c58JJ08Hmap/9kAF2xwETxExrPqSzdonljYKimePRE/LId
         DUew==
X-Gm-Message-State: AC+VfDynQvhiF6zzFGQ9z8CS+Goyw8G30eJS0Q3Rn1FKtSXngS4EO5Xk
	fWXVf+mjqtTgQZyKmwKalSsKNDg9b0ZdvGZgLn5YdFWUUpCzpg==
X-Google-Smtp-Source: ACHHUZ5si8E4huhbax+slrB6Ld1u1Qbwjd4TBEpsctb3m735Vw+OD2Vu3OrgE/X33v97KvPf0fremxslJeGlV4pV5xw=
X-Received: by 2002:a92:6f11:0:b0:32b:190f:5daa with SMTP id
 k17-20020a926f11000000b0032b190f5daamr11819626ilc.10.1683060196365; Tue, 02
 May 2023 13:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230502202631.2102074-1-pkj@axis.com> <20230502202631.2102074-7-pkj@axis.com>
In-Reply-To: <20230502202631.2102074-7-pkj@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 2 May 2023 16:43:08 -0400
Message-ID: <CADkTA4Mc4oEQmE32+Vj=PoVg2zxPnSvjZ0HK=9BxeyJovUirDw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 7/8] netavark: Rewrite the recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 20:43:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8027

On Tue, May 2, 2023 at 4:26=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Since the recipe is no longer expected to be updated using

The wording on this (and the other commits) isn't correct.

There is no compulsion to use any particular set of tools to update
and maintain recipes.

Perhaps just say "Switching to cargo-update-recipe-crates format, for the
following reasons ..."

Bruce

> cargo-bitbake after switching to using cargo-update-recipe-crates to
> update the crate URIs, rewrite it to better conform to common recipe
> standards. Also fold netavark.inc into it as there is no longer any need
> to keep it separate from the main recipe.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  recipes-containers/netavark/netavark.inc      | 49 --------------
>  recipes-containers/netavark/netavark_1.2.0.bb | 66 +++++++++++++------
>  2 files changed, 46 insertions(+), 69 deletions(-)
>  delete mode 100644 recipes-containers/netavark/netavark.inc
>
> diff --git a/recipes-containers/netavark/netavark.inc b/recipes-container=
s/netavark/netavark.inc
> deleted file mode 100644
> index c15bbea..0000000
> --- a/recipes-containers/netavark/netavark.inc
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -inherit ptest
> -
> -PACKAGECONFIG ?=3D "aardvark-dns"
> -
> -# From the documentation of netavark
> -# https://github.com/containers/netavark/blob/v1.1.0/DISTRO_PACKAGE.md#d=
ependency-on-aardvark-dns
> -# The aardvark-dns will be installed by default with netavark, but
> -# netavark will be functional without it.
> -PACKAGECONFIG[aardvark-dns]=3D " , , , aardvark-dns"
> -
> -# Rdepends on aardvark-dns which rdepends on slirp4netns
> -inherit features_check
> -REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
> -
> -SRC_URI +=3D " \
> -    file://run-ptest \
> -    file://tests.patch \
> -"
> -
> -# Cargo installs the binary to bin so move it to where podman expects it
> -do_install:append() {
> -    install -d ${D}${libexecdir}/podman/
> -    mv ${D}${bindir}/* ${D}${libexecdir}/podman/
> -    rm -rf ${D}${bindir}/
> -}
> -
> -
> -do_install_ptest () {
> -       cp -r ${S}/test ${D}${PTEST_PATH}
> -}
> -
> -RDEPENDS:${PN}-ptest +=3D " \
> -    bats \
> -    bash \
> -    coreutils \
> -    jq \
> -    iproute2 \
> -    dbus-daemon-proxy \
> -    util-linux-unshare \
> -    nmap \
> -    procps-ps \
> -    util-linux-nsenter \
> -    bind-utils \
> -"
> -
> -
> -# bind-utils is used to install dig
> -# procps is necessary because the ps from busybox is
> -# not having the same behavior
> diff --git a/recipes-containers/netavark/netavark_1.2.0.bb b/recipes-cont=
ainers/netavark/netavark_1.2.0.bb
> index a3af083..be7cff5 100644
> --- a/recipes-containers/netavark/netavark_1.2.0.bb
> +++ b/recipes-containers/netavark/netavark_1.2.0.bb
> @@ -1,30 +1,56 @@
> -# Auto-Generated by cargo-bitbake 0.3.16
> -#
> -inherit cargo cargo-update-recipe-crates
> +SUMMARY =3D "A container network stack"
> +HOMEPAGE =3D "https://github.com/containers/netavark"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
>
> -# If this is git based prefer versioned ones if they exist
> -# DEFAULT_PREFERENCE =3D "-1"
> +SRCREV =3D "90cccc1c21f26fbc473a201ce3b30d77667c7635"
>
>  # how to get netavark could be as easy as but default to a git checkout:
>  # SRC_URI +=3D "crate://crates.io/netavark/1.2.0"
> -SRC_URI +=3D "git://github.com/containers/netavark.git;protocol=3Dhttps;=
nobranch=3D1"
> +SRC_URI =3D "git://github.com/containers/netavark.git;protocol=3Dhttps;n=
obranch=3D1 \
> +           file://tests.patch \
> +           file://run-ptest"
>  require ${BPN}-crates.inc
>
> -SRCREV =3D "90cccc1c21f26fbc473a201ce3b30d77667c7635"
>  S =3D "${WORKDIR}/git"
> -CARGO_SRC_DIR =3D ""
>
> -# FIXME: update generateme with the real MD5 of the license file
> -LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
> -"
> +PACKAGECONFIG ?=3D "aardvark-dns"
>
> -SUMMARY =3D "A container network stack"
> -HOMEPAGE =3D "https://github.com/containers/netavark"
> -LICENSE =3D "Apache-2.0"
> +# From the documentation of netavark
> +# https://github.com/containers/netavark/blob/v1.1.0/DISTRO_PACKAGE.md#d=
ependency-on-aardvark-dns
> +# The aardvark-dns will be installed by default with netavark, but
> +# netavark will be functional without it.
> +PACKAGECONFIG[aardvark-dns]=3D ",,, aardvark-dns"
> +
> +inherit cargo cargo-update-recipe-crates features_check ptest
> +
> +# Cargo installs the binary to bin so move it to where podman expects it
> +do_install:append() {
> +       install -d ${D}${libexecdir}
> +       mv ${D}${bindir} ${D}${libexecdir}/podman
> +}
>
> -# includes this file if it exists but does not fail
> -# this is useful for anything you may want to override from
> -# what cargo-bitbake generates.
> -include netavark-${PV}.inc
> -include netavark.inc
> +do_install_ptest() {
> +       cp -r ${S}/test ${D}${PTEST_PATH}
> +}
> +
> +# rdepends on aardvark-dns which rdepends on slirp4netns
> +REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
> +
> +# bind-utils is used to install dig
> +# procps-ps is necessary because the ps from busybox is
> +# not having the same behavior
> +RDEPENDS:${PN}-ptest +=3D " \
> +    bash \
> +    bats \
> +    bind-utils \
> +    coreutils \
> +    dbus-daemon-proxy \
> +    iproute2 \
> +    jq \
> +    nmap \
> +    procps-ps \
> +    util-linux-nsenter \
> +    util-linux-unshare \
> +"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8023): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8023
> Mute This Topic: https://lists.yoctoproject.org/mt/98647879/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

