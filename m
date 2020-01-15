Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.119.1579116419017209182
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 11:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dtfyHfLD;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id f8so16606917edv.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2020 11:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8qs52vsvQevr1rYlro2aecAI4ZTocBSm4PYwFIO/ObI=;
        b=dtfyHfLDyA3q2aGLH/sZZUAtHJCy7tYk6upVdhxxSEu/yNhYZYbxFh4+X//mYtcHGg
         YalCO6knanebhK2JYCSEPDrqGfBZWOdAcMq+CigkpdKF7XNGDkgHfKLfxhBUbjg3vkU6
         AOaFgQQXJzWpZpoVBmn7nwdfALJh6O5wf4xmztJqLSSPyfNWbDZkwccWhVAgVZpUZEw4
         034zbdmonbUR6fY7GlLcYdab7b/IEj2j/abpsvW+bnGQacBNBirqt4PQnHvqFy/XfdAl
         OX4NSh9kECsLukwptovVSLk2vHfe9VHgLHytQt1njPTyK60t+E77gWKmfbPs9o0dUJr6
         mS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8qs52vsvQevr1rYlro2aecAI4ZTocBSm4PYwFIO/ObI=;
        b=L7/FYEVtu2UZfT6SdtVnx23E2G7Lnl5krcD1gDF7Xdb6EZFyjYIULdEylD0+Km+H5r
         5ADmpeMgRg2aXyLz9ySsxsdEPIF8eiHV4Ek+GQxQCjwjBysrg/5GvrnyxRhlzrXJOfwi
         U5VsTz0HHOFyWF2/+Qmni/zz2Gg7vq3IBnKpz64zSISfqPMRrZqt/NIeBBg8YFQ7Aov8
         I439nivZgVKnFItV+wcscwQazI6uTeofGPEqnkwHF7itcNOJlOXKBgDbuCNbzD0e0+H9
         gblnP71R4sdXdDpmfoSReq1zUk5gh2RzhRGxcinuSNhpjtbuAFQ38jXP8/r4sw+acBgJ
         ydkQ==
X-Gm-Message-State: APjAAAVuEJ0gPsDhQqwqvUeyqNkEzdILGF2mbVc9pDBh4+dH4qKOJPI6
	/ttnFG9mZekGPj/TAIBQKPZCE8fRFqJjjiR39eM=
X-Google-Smtp-Source: APXvYqzQULSPlaVoBF6yrVuPcR4pYtkCiLQ5kY1ppQe9AaFcQ8C5zx/z6/4HQojy6wtJSOMHfTBMGgoOAGmqNl3IuoU=
X-Received: by 2002:aa7:c74f:: with SMTP id c15mr32606080eds.304.1579116417498;
 Wed, 15 Jan 2020 11:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20200109151533.16876-1-stefan@agner.ch>
In-Reply-To: <20200109151533.16876-1-stefan@agner.ch>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 15 Jan 2020 14:26:46 -0500
Message-ID: <CADkTA4NXM2zakdsv1JsmuzW-s-3jHKK=nx65LT_uvuuxKwuM-w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-ce: update to v19.03.5
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>
Content-Type: text/plain; charset="UTF-8"

Sorry for the delays on this. I'm working through some kernel issues.
I do expect to have this merged in the next couple of days (I just
want to sync moby, and run some tests first).

Bruce

On Thu, Jan 9, 2020 at 10:15 AM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Bump the git hashes to Docker CE v19.03.5. This requires to get the
> docker daemon binary from a different location as the symlink from
> the latest/ subdirectory has been removed. See also commit deaac5d4b3fa
> ("hack/make.sh remove "latest" symlink") in the docker-ce repository.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 817795f..0d088da 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
> +SRCREV_docker = "633a0ea838f10e000b7c6d6eed1623e6e988b5bb"
>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>  SRC_URI = "\
>         git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "19.03.2-ce"
> +DOCKER_VERSION = "19.03.5-ce"
>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>
>  PACKAGES =+ "${PN}-contrib"
> @@ -99,7 +99,7 @@ do_compile() {
>  do_install() {
>         mkdir -p ${D}/${bindir}
>         cp ${S}/src/import/components/cli/build/docker ${D}/${bindir}/docker
> -       cp ${S}/src/import/components/engine/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
> +       cp ${S}/src/import/components/engine/bundles/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
>         cp ${WORKDIR}/git/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
>
>         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> --
> 2.17.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
