Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.15689.1631124436169118441
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Sep 2021 11:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q1RxCj28;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id jg16so5952846ejc.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Sep 2021 11:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N/o2aiGbF2GnLnR9/i9pFlOZQEBYrNUcZfGa1DFKuvw=;
        b=Q1RxCj28WNVEUmivRrBuTh9WtUoG6bBHWFTrzqJ3wZkgDAcWdqDuySiOSA/bdgLdVu
         RxvI4vWxWHWmo31tROberOzIpQoIaWsAM7ApCh2JIupSiolMnfeMJ7XJvVDgXY2JOBmE
         GUYS2QvvIq4cgIfl/adIZEqIy9JWQCsLHc1EPnUvfZOTPgea3sl7A1pKlburxe3JKp1H
         cLdVjEgacPomh4LnbJIGsKo1CoCE5xFSWMZ+O7V0NFB2RebDULvMebZbreeYh14buh2U
         I1w01i1pX60MW4sHSoK6528WZUcse+ZNRF25+wKf21BHDfm9HPxllOoO8pLP65o9G3Ti
         rwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N/o2aiGbF2GnLnR9/i9pFlOZQEBYrNUcZfGa1DFKuvw=;
        b=qAkNq5mHEijLMLTUJNCO19zIlqi3Az+xaw5KOlkzFrmdlqrx5WoknENL7+pnF9d8+J
         WuFXcMI3t3TT8wQmoZOkjT8aseOj5VsuMcD3Movb5CSmy8gRm9W4cPN57dKC1ray5cf/
         2qTuBl7e5qE0+Avvp/wq63vQkLp/Msc2Y2y7R+fCa+qu8m1a6bzI1JhfCY9noP0H/OZp
         G8wuISCbzdJ7RMcAYsmeFEPz9q2UPOeufGtnSpiof0mVPuJxaRtpCtYWCoJ0LqDYXsil
         GXupAXVl+h42w/2zyrldQ+HaiWPlDtURBvGGBTM5T8cLpDWJoiJs0ezeKFcEq3RdSuHv
         WQiw==
X-Gm-Message-State: AOAM533PuBul8ow8Pr07+/UQ0euFQAmL2RFbGPkQhYT3Uv/bVeNHXJyd
	aIODB/CgavuMG1BSLec5JVo9AXA6TA+np14eRA0=
X-Google-Smtp-Source: ABdhPJz2lAM2I3UJg06vE/rVLRhSYpeivQU8cInc3r+k6io+RW58uf6+USHfySD5nNFW1lTOug1XaDg/2xeYcurUPeg=
X-Received: by 2002:a17:907:1df1:: with SMTP id og49mr1192058ejc.35.1631124434651;
 Wed, 08 Sep 2021 11:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210908180214.1302459-1-festevam@denx.de>
In-Reply-To: <20210908180214.1302459-1-festevam@denx.de>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 8 Sep 2021 14:07:03 -0400
Message-ID: <CADkTA4O92EpgmyNO1ZhBi0OV8hNdZO7=tNc8jZwfEDkDZFg0sg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH dunfell] containers: Explictly reference a valid branch
To: Fabio Estevam <festevam@denx.de>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Otavio Salvador <otavio@ossystems.com.br>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 8, 2021 at 2:02 PM Fabio Estevam <festevam@denx.de> wrote:
>
> These repositories have dropped their master branches,
> so the fetcher default no longer works.
>
> Point to an existing branch to fix the fetch failure.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Sorry for the resend.
>
> I was not subscribed to the list in the first time.

You are working on an out of date master, or an old branch.

If you want some of the branch changes cherry picked, specify the
commit and branch, and I can do that.

Bruce

>
>  recipes-containers/oci-image-spec/oci-image-spec_git.bb   | 2 +-
>  recipes-containers/podman-compose/podman-compose_0.1.5.bb | 2 +-
>  recipes-containers/podman/podman_git.bb                   | 2 +-
>  recipes-containers/skopeo/skopeo_git.bb                   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/oci-image-spec/oci-image-spec_git.bb b/recipes-containers/oci-image-spec/oci-image-spec_git.bb
> index 5805740..a137bc8 100644
> --- a/recipes-containers/oci-image-spec/oci-image-spec_git.bb
> +++ b/recipes-containers/oci-image-spec/oci-image-spec_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=27ef03aa2da6e424307f102e8
>  SRCNAME = "image-spec"
>
>  PKG_NAME = "github.com/opencontainers/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
> +SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=main"
>
>  SRCREV = "bd4f8fcb0979a663d8b97a1d4d9b030b3d2ca1fa"
>  PV = "v1.0.1+git${SRCPV}"
> diff --git a/recipes-containers/podman-compose/podman-compose_0.1.5.bb b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
> index 4015069..b9eb1c8 100644
> --- a/recipes-containers/podman-compose/podman-compose_0.1.5.bb
> +++ b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  inherit setuptools3 pypi
>
> -SRC_URI = "git://github.com/containers/podman-compose.git"
> +SRC_URI = "git://github.com/containers/podman-compose.git;branch=devel"
>
>  SRCREV = "f008986633879acf3f54848dabbf07cef8e9c68f"
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index aa6b25b..a8a6b02 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -26,7 +26,7 @@ python __anonymous() {
>
>  SRCREV = "444a19cdd2e6108c75f6c1aadc1a2a9138a8bd73"
>  SRC_URI = " \
> -    git://github.com/containers/libpod.git;branch=master \
> +    git://github.com/containers/libpod.git;branch=main \
>  "
>
>  LICENSE = "Apache-2.0"
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index f5a6231..b14c293 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -20,7 +20,7 @@ RDEPENDS_${PN} = " \
>  "
>
>  SRC_URI = " \
> -    git://github.com/containers/skopeo \
> +    git://github.com/containers/skopeo;branch=main \
>      file://storage.conf \
>      file://registries.conf \
>  "
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
