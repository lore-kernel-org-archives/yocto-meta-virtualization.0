Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAED3C77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 12:27:48 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.18112.1682684867751042527
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 05:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pkxqznMP;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-32b1ee270ebso24581185ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Apr 2023 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682684867; x=1685276867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S67/jaa398ZE5n8nUiPnEL+FubJ/tx8a0MoAk3IQSbY=;
        b=pkxqznMPh1iRcsqBuXsGR5p95AaD52+05wtcv0tX3L7f4RtcuECp6WjpCuYgCdorPG
         pYV0XoxzmxBmSV1aNN/7fBuV1JIM6Am6PQRmAPTjOjJ5fd3kqcogOJofFsLRHx5LlLVz
         w/CUWzPId7V34y+MtQGH4nofDtzsPEHKCNpbpOIy6W/ppxEZcWGKlin4s11U4yw+7H6u
         BRda9DHK6xiGkDWQrwDKuue+beboTj/2+d9jNXFalx7YMP6/+dsurTVBPAa3xMIhCKfT
         Lky1flwiuI9z2wwN4Egg9Llr5oRgG0T1JZQinDrErTpwV16f3K5hbVvrlfJsxy/yqwXH
         tkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682684867; x=1685276867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S67/jaa398ZE5n8nUiPnEL+FubJ/tx8a0MoAk3IQSbY=;
        b=NC60xa+UX5IlI68GiZLFioOc0fASbtfe2NpDQHz2i1mf2tm5V6YjnCG8XlXRwc5aMQ
         sGILxsCbhZwCLw6jL0j2o2VC3WLbC0M1yt1JzHiAORb+HynosU+HPMU4a5JxAzyJVfEt
         g0L2X3S3/Hy7igeG78wGKEPREB0yiMz8bnXgSBJCaFM1At1hQuPdrplEUHPLTT5Y0+wF
         9AEbF5qAFpg7Y9aWE1J30WkhStg8Nf/xlH/tR3wc1Mm5llSjsNUcg/8FrXHsJho/8ok3
         FnnZ6rwklc7TFd0YfSdmmFWmOybO9QZc63+JBTBfD+OklLNRl5SLGbYHtFL8WKAEuEQ/
         BiTg==
X-Gm-Message-State: AC+VfDw1o1YfoE0DbVCNVUE93Btea1YgyPmAslEjwZlaTbvycyIc7d/H
	BKC242Oa7O051x8wM6KZnzzVHQmIsnh05ZHBvBD088I2kZs=
X-Google-Smtp-Source: ACHHUZ7otlp202D8+lKaMH39Ckqjair9uIOimSL4cUC1x1Dq0sa2R8G26b8MMxpc7ByrAypOf0JUdGfrhqpL85ArG/A=
X-Received: by 2002:a92:d6c4:0:b0:328:f4e8:8cfa with SMTP id
 z4-20020a92d6c4000000b00328f4e88cfamr3159528ilp.32.1682684866801; Fri, 28 Apr
 2023 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230428014534.2376049-1-Qi.Chen@windriver.com>
 <CADkTA4PssCvC3TXhFthgYX8QJ4fFtwQ83NEsFixo0L8OG5WNag@mail.gmail.com> <CO6PR11MB560243047C8CF556BB0411C8ED6B9@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560243047C8CF556BB0411C8ED6B9@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 28 Apr 2023 08:27:35 -0400
Message-ID: <CADkTA4PqzzRnfpyJX8MXNSVvTzQemQ7svnL+FJQ4SdeDS8-xLQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] docker-moby/docker-ce: merge
 into one
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Apr 2023 12:27:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8017

On Thu, Apr 27, 2023 at 11:11=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com> w=
rote:
>
> Hi Bruce,
>
> Sorry but I'm a little confused, as both recipes are now moby tracked.
> I can recall that in the past the moby repo did not have all those tags a=
nd branches while the docker repo did. Now the docker repo (https://github.=
com/docker/docker) is no longer available, it's redirected to the moby repo=
 (https://github.com/moby/moby). Plus the moby repo got all those tags and =
branches.
>
> So does it mean that the only requirement from use cases outside meta-vir=
t is the '-ce' tag? There's really no difference between these two recipes =
except for that.
>

It means there are use cases outside of meta-virt that have changes
based on whether something is docker vs moby, and that capability is
done via the different recipes at the moment.

As I said, I would have merged them by now already, as clearly, I've
been tracking and updating them for a lot of years now.

For the next release, I'm going to have some depreciation warnings for
a few legacy recipes and namespaces, but I need to do those in
coordination with other changes around the variables selecting the
CRI/CNI, etc.

Bruce

> Regards,
> Qi
>
> -----Original Message-----
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Friday, April 28, 2023 10:07 AM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH 1/2] docker-moby/docker-ce: merg=
e into one
>
> On Thu, Apr 27, 2023 at 9:45=E2=80=AFPM Chen Qi via lists.yoctoproject.or=
g <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
> >
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > Things have changed since these two recipe were added. Now
> > https://github.com/docker/docker has been redirected to
> > https://github.com/moby/moby. This means the contents of
> > docker-ce_git.bb and docker-moby_git.bb are essentially the same
> > except for some comments.
> >
>
> I'm going to keep them separate, I would have merged them together long a=
go otherwise.
>
> There are use cases outside of this layer, that need the separate -ce tag=
 and direction (+ patches) and not the moby tracking variant.
>
> Bruce
>
> > So let's merge them into one and keep the merged recipe's name
> > docker-moby, as the repo's name is moby.
> >
> > The PROVIDES and RPROVIDES are added 'docker-ce' for backward
> > compatibility.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  conf/layer.conf                              |  1 -
> >  recipes-containers/docker/docker-ce_git.bb   | 59 --------------------
> >  recipes-containers/docker/docker-moby_git.bb | 27 ++++-----
> >  recipes-containers/docker/docker.inc         |  8 ++-
> >  4 files changed, 17 insertions(+), 78 deletions(-)  delete mode
> > 100644 recipes-containers/docker/docker-ce_git.bb
> >
> > diff --git a/conf/layer.conf b/conf/layer.conf index 88ac390..9a26bcc
> > 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -41,7 +41,6 @@ require conf/distro/include/virt_security_flags.inc
> >
> >  PREFERRED_PROVIDER_virtual/runc ?=3D "runc-opencontainers"
> >  PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd-opencontainers"
> > -PREFERRED_PROVIDER_virtual/docker ?=3D "docker-ce"
> >
> >  # Sanity check for meta-virtualization layer.
> >  # Setting SKIP_META_VIRT_SANITY_CHECK to "1" would skip the bbappend f=
iles check.
> > diff --git a/recipes-containers/docker/docker-ce_git.bb
> > b/recipes-containers/docker/docker-ce_git.bb
> > deleted file mode 100644
> > index 6781c77..0000000
> > --- a/recipes-containers/docker/docker-ce_git.bb
> > +++ /dev/null
> > @@ -1,59 +0,0 @@
> > -HOMEPAGE =3D "http://www.docker.com"
> > -SUMMARY =3D "Linux container runtime"
> > -DESCRIPTION =3D "Linux container runtime \
> > - Docker complements kernel namespacing with a high-level API which \
> > - operates at the process level. It runs unix processes with strong \
> > - guarantees of isolation and repeatability across servers. \
> > - . \
> > - Docker is a great building block for automating distributed systems:
> > \
> > - large-scale web deployments, database clusters, continuous
> > deployment \
> > - systems, private PaaS, service-oriented architectures, etc. \
> > - . \
> > - This package contains the daemon and client, which are \
> > - officially supported on x86_64 and arm hosts. \
> > - Other architectures are considered experimental. \
> > - . \
> > - Also, note that kernel version 3.10 or above is required for proper
> > \
> > - operation of the daemon process, and that any lower versions may
> > have \
> > - subtle and/or glaring issues. \
> > - "
> > -
> > -#
> > -# https://github.com/docker/docker-ce-packaging.git
> > -#  common.mk:
> > -#    DOCKER_CLI_REPO    ?=3D https://github.com/docker/cli.git
> > -#    DOCKER_ENGINE_REPO ?=3D https://github.com/docker/docker.git
> > -#    REF                ?=3D HEAD
> > -#    DOCKER_CLI_REF     ?=3D $(REF)
> > -#    DOCKER_ENGINE_REF  ?=3D $(REF)
> > -#
> > -# These follow the tags for our releases in the listed repositories
> > -# so we get that tag, and make it our SRCREVS:
> > -#
> > -
> > -SRCREV_docker =3D "219f21bf07502b447095649b5a2764661737f164"
> > -SRCREV_libnetwork =3D "25ec449c45d2075c85fb3688ef4c1730be0466e0"
> > -SRCREV_cli =3D "569dd73db13099a7c3104d73aa15117b359045bc"
> > -SRCREV_FORMAT =3D "docker_libnetwork"
> > -SRC_URI =3D "\
> > -       git://github.com/docker/docker.git;branch=3D23.0;name=3Ddocker;=
protocol=3Dhttps \
> > -       git://github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dl=
ibnetwork;destsuffix=3Dgit/libnetwork;protocol=3Dhttps \
> > -       git://github.com/docker/cli;branch=3D23.0;name=3Dcli;destsuffix=
=3Dgit/cli;protocol=3Dhttps \
> > -       file://0001-libnetwork-use-GO-instead-of-go.patch \
> > -       file://docker.init \
> > -        file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Ds=
rc/import \
> > -        file://0001-cli-use-external-GO111MODULE-and-cross-compiler.pa=
tch \
> > -       "
> > -
> > -DOCKER_COMMIT =3D "${SRCREV_docker}"
> > -
> > -require docker.inc
> > -
> > -# Apache-2.0 for docker
> > -LICENSE =3D "Apache-2.0"
> > -LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D4859e97a9c7780e7=
7972d989f0823f28"
> > -
> > -DOCKER_VERSION =3D "23.0.2-ce"
> > -PV =3D "${DOCKER_VERSION}+git${SRCREV_docker}"
> > -
> > -CVE_PRODUCT =3D "docker mobyproject:moby"
> > diff --git a/recipes-containers/docker/docker-moby_git.bb
> > b/recipes-containers/docker/docker-moby_git.bb
> > index cd6a741..94c72e7 100644
> > --- a/recipes-containers/docker/docker-moby_git.bb
> > +++ b/recipes-containers/docker/docker-moby_git.bb
> > @@ -18,21 +18,18 @@ DESCRIPTION =3D "Linux container runtime \
> >   subtle and/or glaring issues. \
> >   "
> >
> > -# Notes:
> > -#   - This docker variant uses moby and the other individually maintai=
ned
> > -#     upstream variants for SRCREVs
> > -#   - It is a true community / upstream tracking build, and is not a
> > -#     docker curated set of commits or additions
> > -#   - The version number on this package tracks the versions assigned =
to
> > -#     the curated docker-ce repository. This allows compatibility and
> > -#     functional equivalence, while allowing new features to be more
> > -#     easily added.
> > -#   - This could be called "docker-moby" or just "moby" in the future,=
 but
> > -#     that would require the creation of a virtual/docker dependency, =
which
> > -#     is possible, but overkill at the moment (while we wait for the u=
pstream
> > -#     to stop changing).
> > -#   - The common components of this recipe and docker-ce do need to be=
 moved
> > -#     to a docker.inc recipe
> > +#
> > +# https://github.com/docker/docker-ce-packaging.git
> > +#  common.mk:
> > +#    DOCKER_CLI_REPO    ?=3D https://github.com/docker/cli.git
> > +#    DOCKER_ENGINE_REPO ?=3D https://github.com/docker/docker.git
> > +#    REF                ?=3D HEAD
> > +#    DOCKER_CLI_REF     ?=3D $(REF)
> > +#    DOCKER_ENGINE_REF  ?=3D $(REF)
> > +#
> > +# These follow the tags for our releases in the listed repositories #
> > +so we get that tag, and make it our SRCREVS:
> > +#
> >
> >  SRCREV_moby =3D "219f21bf07502b447095649b5a2764661737f164"
> >  SRCREV_libnetwork =3D "25ec449c45d2075c85fb3688ef4c1730be0466e0"
> > diff --git a/recipes-containers/docker/docker.inc
> > b/recipes-containers/docker/docker.inc
> > index 4a4bc4f..5cd8bdc 100644
> > --- a/recipes-containers/docker/docker.inc
> > +++ b/recipes-containers/docker/docker.inc
> > @@ -31,15 +31,17 @@ RDEPENDS:${PN} +=3D "virtual-containerd ${VIRTUAL-R=
UNTIME_container_runtime}"
> >
> >  RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool kernel-module-nf-nat=
 kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module=
-xt-masquerade"
> >
> > -PROVIDES +=3D "virtual/docker"
> > -
> > -# we want all the docker variant recpes to be installable via "docker"
> > +# make it installable via "docker"
> >  PACKAGE_NAME =3D "docker"
> >  RPROVIDES:${PN} +=3D "docker"
> >  RPROVIDES:${PN}-dbg +=3D "docker-dbg"
> >  RPROVIDES:${PN}-dev +=3D "docker-dev"
> >  RPROVIDES:${PN}-contrip +=3D "docker-dev"
> >
> > +# For docker-ce backward compatibility PROVIDES +=3D "docker-ce"
> > +RPROVIDES:${PN} +=3D "docker-ce"
> > +
> >  inherit pkgconfig
> >  PACKAGECONFIG ??=3D "docker-init seccomp"
> >  PACKAGECONFIG[seccomp] =3D "seccomp,,libseccomp"
> > --
> > 2.40.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8014):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/8014
> > Mute This Topic: https://lists.yoctoproject.org/mt/98550499/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe:
> > https://lists.yoctoproject.org/g/meta-virtualization/unsub
> > [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

