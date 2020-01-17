Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.2705.1579296634656391826
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2020 13:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vfkno9W7;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id l8so23620823edw.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2020 13:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cvw6WkGvG+5EZvW7Dvr2t9HurHknGKGRO/8u+P/zWOg=;
        b=vfkno9W7OPz4+/i14rvon+HATDNBA7Y3d+8wNm4pI+ZsdMQ//VJ9Iy9HN0RSmHk6yB
         R4B5D1TBfQ7kB7rvY+NT7Rff1WvY+8PDbPU+Mfj+CSGuWxyD1Pt7Rr5Ri9bcdLs9GAN+
         rzAsRJlFi8hbtrmKhGtTMV0SofbaoUBy0L9Wmw/4z+XbQlssEb04omesWhTe1JqYaqz0
         wlxG/sUDH+0cJNHLLDTnX4HdCNsXRWcHUgSWfytyLAj8TCpOq+nUmEMGRdUFB6fZEa2I
         Jxk5bMETMHHq5Ed7ttmvynJfbCrNxdBAXZM7THxfjnx+mAYlR+iWbNo+ygFsQKAYu0He
         5pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cvw6WkGvG+5EZvW7Dvr2t9HurHknGKGRO/8u+P/zWOg=;
        b=KEI3FsT/8/RscLI2V7/tqRMkkLEUUW+Fves2Oc6tSMU/dZb4HQNCPh32caFkyY8jWJ
         g1kyv9ASjrXt+YzB3rOYUZnlHQVabyWcDNKqahKzZuEAvHyWAvhsY+1cnTFEf01Sp8hr
         VnJvFvYJi2Sn5WreCMazjckWCDTM587CVo2vY9HxEGRVtkysSzdd9zcxk+VLFW/3K2VR
         8Q6QfSJn8t4KgxUqsN35h7Ek1rxD6Hjyq/xiccWa7aKbV8zM75iLBerQU8sMqD/nBsYL
         x61uFFbYLPdTxy2Gz/XCNJFUGphtHIf2ebUwxOw3oNQTMRqwITiPlpvIzvCCZUYkcIse
         YkSQ==
X-Gm-Message-State: APjAAAUPN9FgLOwfxkpV0GsnW9mD+FQEHsjKbCB8R1frzaPF8Sgu6ktx
	32wJq34xu5rm7n5jc2mvm9AKa/B805pgUCyx7YY=
X-Google-Smtp-Source: APXvYqxirBBpPnX9o1Ll67TBPkqz/PXQPdQoWjnBe5UvBGtGnxUNNUkuL0h0Fp4IUgFwTCSOPyycGZQVTlZSBaIQQhs=
X-Received: by 2002:aa7:c656:: with SMTP id z22mr5853493edr.352.1579296633215;
 Fri, 17 Jan 2020 13:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20200109151533.16876-1-stefan@agner.ch>
In-Reply-To: <20200109151533.16876-1-stefan@agner.ch>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 17 Jan 2020 16:30:22 -0500
Message-ID: <CADkTA4M+N=W9-pAAajhYYjxFbFV1GY+pvYZnweFsivzKbhgrQg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-ce: update to v19.03.5
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>
Content-Type: text/plain; charset="UTF-8"

Similar to the podman patches, I've merged this to master.

But I'm not really seeing a compelling security or serious bug fix
that makes it something I'd want to also apply to Zeus.

Again, I'm open to being convinced.

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
