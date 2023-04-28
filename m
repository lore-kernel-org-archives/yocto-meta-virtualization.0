Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6970BC77B7C
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 02:06:45 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.10172.1682647602578172242
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 19:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pcagSULJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-32f23e2249bso16155135ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Apr 2023 19:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682647602; x=1685239602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEKdVuozQw/qUyrSt2Dw12Q28vmhyFofAphcTi5quas=;
        b=pcagSULJY3n465iPLsvtJXJ36dLvGPSyAn+xCdJpq+nCj8Ln6KFSKlgqqsRhfAdXbr
         jm1cBvxtnm7Cd7DK3bXAcaYTRsv5nJLT5SAiIgY4gK3j9wCZiWASdJ17gqloxDIR713/
         ZXzdFkN61ePeDoSi5eeD3hvWWkbxwUJD+qi4h55XanT619gK7ru9sBD01xUCPyZtds8I
         tzNBvPPJj+Lfl6aWrEixNO84Hbx0fv8SofpUXmsL28XsSLU73aNl1v6NGJhOCsAJuS9Q
         VNvIn2OfjLf+fzPEHH+SUr+oo7Ef8nort2thyZpkKfMhaD/Aw0TFNMW4YMYfyGP/If3E
         JgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682647602; x=1685239602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEKdVuozQw/qUyrSt2Dw12Q28vmhyFofAphcTi5quas=;
        b=Wd92J9uPxPAdMvbfJ8nsLFAj8NtQn0K8Rsn4Xqkr0dMOsl2fMeKV4EgkJSMosY2K6/
         lwFtTpVAPyT1MOHSxvamxLD6UVXxfbfGfcNYzASRK1i8cWmUmZe++R7bG+md9cQ7psZ0
         p7j8Rf/4qRL08pC9g0yQLigdmG8CHztkryoLhB5fjkY9eF9WTTvARdKJNFNj0N6IXblR
         u4LSbl0khC1FhJN0OqmdvRZfQPQcXAm/w7EIyC/dUD+nSqt0b4AGrYhM4H9PjtsbANNT
         8rqs8r1gJI/MEY4w+Jm89q/KEW8wbWES6pbbgzAGH0aKdxy+FYHhXd1R6Hhy1RN+gK+B
         ztOg==
X-Gm-Message-State: AC+VfDxpBowcUVBiqjjezoLDqYbzIPdIEFfZs+ZF5TFyyFZrGw8w3DBo
	Lr3i5V/+yeCsNC7sUnQUXCm47n4DDiJTLpX++zNCinlXOgc=
X-Google-Smtp-Source: ACHHUZ7dP6xlkdtyNn5d/pQVyLhC5cI3LEow5Oh0+F2Kg+6Lx9aJz4Rfd/1PF6ptuDxIWqPTVu3wSOtdPGd7AKErZr4=
X-Received: by 2002:a05:6e02:154d:b0:328:edf8:be71 with SMTP id
 j13-20020a056e02154d00b00328edf8be71mr5046197ilu.0.1682647601651; Thu, 27 Apr
 2023 19:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230428014534.2376049-1-Qi.Chen@windriver.com>
In-Reply-To: <20230428014534.2376049-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 27 Apr 2023 22:06:43 -0400
Message-ID: <CADkTA4PssCvC3TXhFthgYX8QJ4fFtwQ83NEsFixo0L8OG5WNag@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] docker-moby/docker-ce: merge
 into one
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Apr 2023 02:06:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8015

On Thu, Apr 27, 2023 at 9:45=E2=80=AFPM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Things have changed since these two recipe were added. Now
> https://github.com/docker/docker has been redirected to
> https://github.com/moby/moby. This means the contents of
> docker-ce_git.bb and docker-moby_git.bb are essentially
> the same except for some comments.
>

I'm going to keep them separate, I would have merged them together
long ago otherwise.

There are use cases outside of this layer, that need the separate -ce
tag and direction (+ patches) and not the moby tracking variant.

Bruce

> So let's merge them into one and keep the merged recipe's name
> docker-moby, as the repo's name is moby.
>
> The PROVIDES and RPROVIDES are added 'docker-ce' for backward
> compatibility.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  conf/layer.conf                              |  1 -
>  recipes-containers/docker/docker-ce_git.bb   | 59 --------------------
>  recipes-containers/docker/docker-moby_git.bb | 27 ++++-----
>  recipes-containers/docker/docker.inc         |  8 ++-
>  4 files changed, 17 insertions(+), 78 deletions(-)
>  delete mode 100644 recipes-containers/docker/docker-ce_git.bb
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 88ac390..9a26bcc 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -41,7 +41,6 @@ require conf/distro/include/virt_security_flags.inc
>
>  PREFERRED_PROVIDER_virtual/runc ?=3D "runc-opencontainers"
>  PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd-opencontainers"
> -PREFERRED_PROVIDER_virtual/docker ?=3D "docker-ce"
>
>  # Sanity check for meta-virtualization layer.
>  # Setting SKIP_META_VIRT_SANITY_CHECK to "1" would skip the bbappend fil=
es check.
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-contain=
ers/docker/docker-ce_git.bb
> deleted file mode 100644
> index 6781c77..0000000
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -HOMEPAGE =3D "http://www.docker.com"
> -SUMMARY =3D "Linux container runtime"
> -DESCRIPTION =3D "Linux container runtime \
> - Docker complements kernel namespacing with a high-level API which \
> - operates at the process level. It runs unix processes with strong \
> - guarantees of isolation and repeatability across servers. \
> - . \
> - Docker is a great building block for automating distributed systems: \
> - large-scale web deployments, database clusters, continuous deployment \
> - systems, private PaaS, service-oriented architectures, etc. \
> - . \
> - This package contains the daemon and client, which are \
> - officially supported on x86_64 and arm hosts. \
> - Other architectures are considered experimental. \
> - . \
> - Also, note that kernel version 3.10 or above is required for proper \
> - operation of the daemon process, and that any lower versions may have \
> - subtle and/or glaring issues. \
> - "
> -
> -#
> -# https://github.com/docker/docker-ce-packaging.git
> -#  common.mk:
> -#    DOCKER_CLI_REPO    ?=3D https://github.com/docker/cli.git
> -#    DOCKER_ENGINE_REPO ?=3D https://github.com/docker/docker.git
> -#    REF                ?=3D HEAD
> -#    DOCKER_CLI_REF     ?=3D $(REF)
> -#    DOCKER_ENGINE_REF  ?=3D $(REF)
> -#
> -# These follow the tags for our releases in the listed repositories
> -# so we get that tag, and make it our SRCREVS:
> -#
> -
> -SRCREV_docker =3D "219f21bf07502b447095649b5a2764661737f164"
> -SRCREV_libnetwork =3D "25ec449c45d2075c85fb3688ef4c1730be0466e0"
> -SRCREV_cli =3D "569dd73db13099a7c3104d73aa15117b359045bc"
> -SRCREV_FORMAT =3D "docker_libnetwork"
> -SRC_URI =3D "\
> -       git://github.com/docker/docker.git;branch=3D23.0;name=3Ddocker;pr=
otocol=3Dhttps \
> -       git://github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dlib=
network;destsuffix=3Dgit/libnetwork;protocol=3Dhttps \
> -       git://github.com/docker/cli;branch=3D23.0;name=3Dcli;destsuffix=
=3Dgit/cli;protocol=3Dhttps \
> -       file://0001-libnetwork-use-GO-instead-of-go.patch \
> -       file://docker.init \
> -        file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc=
/import \
> -        file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patc=
h \
> -       "
> -
> -DOCKER_COMMIT =3D "${SRCREV_docker}"
> -
> -require docker.inc
> -
> -# Apache-2.0 for docker
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D4859e97a9c7780e779=
72d989f0823f28"
> -
> -DOCKER_VERSION =3D "23.0.2-ce"
> -PV =3D "${DOCKER_VERSION}+git${SRCREV_docker}"
> -
> -CVE_PRODUCT =3D "docker mobyproject:moby"
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
> index cd6a741..94c72e7 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -18,21 +18,18 @@ DESCRIPTION =3D "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -# Notes:
> -#   - This docker variant uses moby and the other individually maintaine=
d
> -#     upstream variants for SRCREVs
> -#   - It is a true community / upstream tracking build, and is not a
> -#     docker curated set of commits or additions
> -#   - The version number on this package tracks the versions assigned to
> -#     the curated docker-ce repository. This allows compatibility and
> -#     functional equivalence, while allowing new features to be more
> -#     easily added.
> -#   - This could be called "docker-moby" or just "moby" in the future, b=
ut
> -#     that would require the creation of a virtual/docker dependency, wh=
ich
> -#     is possible, but overkill at the moment (while we wait for the ups=
tream
> -#     to stop changing).
> -#   - The common components of this recipe and docker-ce do need to be m=
oved
> -#     to a docker.inc recipe
> +#
> +# https://github.com/docker/docker-ce-packaging.git
> +#  common.mk:
> +#    DOCKER_CLI_REPO    ?=3D https://github.com/docker/cli.git
> +#    DOCKER_ENGINE_REPO ?=3D https://github.com/docker/docker.git
> +#    REF                ?=3D HEAD
> +#    DOCKER_CLI_REF     ?=3D $(REF)
> +#    DOCKER_ENGINE_REF  ?=3D $(REF)
> +#
> +# These follow the tags for our releases in the listed repositories
> +# so we get that tag, and make it our SRCREVS:
> +#
>
>  SRCREV_moby =3D "219f21bf07502b447095649b5a2764661737f164"
>  SRCREV_libnetwork =3D "25ec449c45d2075c85fb3688ef4c1730be0466e0"
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/do=
cker/docker.inc
> index 4a4bc4f..5cd8bdc 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -31,15 +31,17 @@ RDEPENDS:${PN} +=3D "virtual-containerd ${VIRTUAL-RUN=
TIME_container_runtime}"
>
>  RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool kernel-module-nf-nat k=
ernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-x=
t-masquerade"
>
> -PROVIDES +=3D "virtual/docker"
> -
> -# we want all the docker variant recpes to be installable via "docker"
> +# make it installable via "docker"
>  PACKAGE_NAME =3D "docker"
>  RPROVIDES:${PN} +=3D "docker"
>  RPROVIDES:${PN}-dbg +=3D "docker-dbg"
>  RPROVIDES:${PN}-dev +=3D "docker-dev"
>  RPROVIDES:${PN}-contrip +=3D "docker-dev"
>
> +# For docker-ce backward compatibility
> +PROVIDES +=3D "docker-ce"
> +RPROVIDES:${PN} +=3D "docker-ce"
> +
>  inherit pkgconfig
>  PACKAGECONFIG ??=3D "docker-init seccomp"
>  PACKAGECONFIG[seccomp] =3D "seccomp,,libseccomp"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8014): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8014
> Mute This Topic: https://lists.yoctoproject.org/mt/98550499/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

