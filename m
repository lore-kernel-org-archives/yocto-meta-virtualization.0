Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.5721.1606797661357565729
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Nov 2020 20:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XAgLtODA;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id f23so1323869ejk.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Nov 2020 20:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sTJz0R+U651cOo93by9dFOQcFpeV3vch2+JWwwqiqME=;
        b=XAgLtODAhOI7c/ttM2Lc3/jKgQkBD/Yl7lewmq6uFbhmzJi+xRh6+6QjiqCeNsip0v
         rEfwSxvuFEBzRCiW7aRMtGTjwyydW2WHnFV+4NbutwPtxw/UGEFO+RbjZu/3YTuRVPAN
         3L+DAs/GorHDDC+Zj9HhzNnkJqyRtDkVELf8V8oSjYyo7jXvdKYOjyHRgschLIFxSR+p
         wLdOm6ib4z9lZngThlHYPkgFUxatYW+BdmF84lNgswx6RoIcNmW3wKddmJQFKVCjHBld
         26PWdGJ56ChVyzxM6kGmCCYrxE/vviVRjtKCg0zjvXq2+XxBtJuuLNvHpjNsBOSOyrIM
         Zd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sTJz0R+U651cOo93by9dFOQcFpeV3vch2+JWwwqiqME=;
        b=cBq82Sxpv8NOJWenx4YhDd2U1GhLS5O5HL5zDKxdMGHT6ENXjvP4pKsQcCqQyvKq77
         CPwGMSDo5kdD+8JntJ6EVTP5X/KjxyOmsNVWDRtixAvS+D/OEnNfQXjNUikzVJahttZu
         6VUhz6wGgBJz9lEjVfcsPQb+bAclYrGZwzrZw9Kt1zNQVsUUmisVupQ8DIy7KP+8dGuR
         FppJBteW1eQvlpb19JA/fHaWDwr/ZUqUOYPZBLjlIMFJTQveWrxh+wmQJ4KMQ55zLeEt
         8YDDA/6KReT+gzMgHmMrFuPl9vTsp84CIDJSCszZGxBc4Qi9IDKLD/efNOJEqs99UTV4
         FBqQ==
X-Gm-Message-State: AOAM5323nen2P3pKaVDqYDpZPy7EkFXaRjDnxEsLVu9xBfmKboniKJ3g
	zsjJWH7Ybz8wevnD6Cu19SD7Hdd0GVQ3pMdaf4U=
X-Google-Smtp-Source: ABdhPJzIlwhGQBU0Kk/aG6Z2/Y8KfxPTWeiVkRZNcM64ophdUkruW4FVO7W/f+At4yvAOUj9QP4wYNjPYjTgoDJXD5E=
X-Received: by 2002:a17:907:d01:: with SMTP id gn1mr1268482ejc.357.1606797659563;
 Mon, 30 Nov 2020 20:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20201120180251.3612946-1-adrian.freihofer@siemens.com>
In-Reply-To: <20201120180251.3612946-1-adrian.freihofer@siemens.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 30 Nov 2020 23:40:48 -0500
Message-ID: <CADkTA4Ncm0xs8MfNTmrT2ttEWcQP9jJ9qFP-Guqq7R=9DqAqmg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-ce: update to 19.03.13
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the slow reply.

I've been buried in k3s, and already most of these updates are part of
that WIP branch. I also keep moby and docker-ce in sync, so I need to
do that update before can get the next round of updates pushed. I'll
double check against this and come up with a combined branch shortly.

Bruce

On Fri, Nov 20, 2020 at 1:03 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> This update comprises the following commits:
>
> 4484c46d9d Merge pull request #658 from tiborvass/bump_19.03.13
> 19498650c3 Bump VERSION to 19.03.13
> 9e4ef2803a Merge component 'engine' from git@github.com:moby/moby 19.03
> ac28add3de Merge pull request #41314 from thaJeztah/19.03_backport_fix_r=
acey_logger_test
> f0254fd65c Merge component 'packaging' from git@github.com:docker/docker=
-ce-packaging 19.03
> c78f28f23a Merge component 'engine' from git@github.com:moby/moby 19.03
> e0b868f387 Merge component 'cli' from git@github.com:docker/cli 19.03
> 2961931781 Merge pull request #493 from thaJeztah/19.03_backport_bump_go=
lang_1.13.15
> 38ac4c17da Merge pull request #41451 from thaJeztah/19.03_update_buildki=
t
> 131aed7afb Merge pull request #2674 from thaJeztah/19.03_backport_bump_g=
olang_1.13.15
> b99d176810 Merge pull request #41446 from thaJeztah/19.03_backport_swagg=
er_fixes
> 340e0f5aae Merge pull request #41312 from thaJeztah/19.03_backport_pass_=
network_error
> 71f2583eb1 Merge pull request #41334 from thaJeztah/19.03_backport_bump_=
golang_1.13.15
> 0d7a5f477d Merge pull request #40408 from thaJeztah/19.03_backport_updat=
e_containerd_1.3
> edb9fbffd5 Merge component 'cli' from git@github.com:docker/cli 19.03
> bcae92a97a Merge pull request #2720 from thaJeztah/19.03_remove_engine_a=
lias
> 6c6dd50ae8 Merge pull request #2719 from thaJeztah/19.03_update_buildkit
> 4056693640 [19.03] vendor: stop using docker/engine fork for vendoring
> f6cc6fa133 [19.03] vendor: buildkit v0.6.4-32-gdf89d4dc
> d61bf277b8 [19.03] vendor: tonistiigi/fsutil v0.0.0-20191018213012-0f039=
a052ca1
> 4024535260 [19.03] vendor: buildkit v0.6.4-32-gdf89d4dc
> 4a3bea631c Merge component 'cli' from git@github.com:docker/cli 19.03
> 1cab9568fa Merge pull request #2667 from thaJeztah/19.03_backport_remove=
_from_index
> d48744dd4e Merge pull request #2717 from thaJeztah/19.03_backport_update=
_git_remote_description
> 9a44f43fb9 swagger: fix MemTotal units in SystemInfo endpoint
> a75083ebf0 docs/build: add note about git subdirectories with BuildKit
> de666636a6 Merge component 'packaging' from git@github.com:docker/docker=
-ce-packaging 19.03
> 772ee04120 Merge pull request #498 from thaJeztah/19.03_backport_bump_bu=
ildx
> 112d03e8ea plugins: update buildx to v0.4.2
> ef44b94189 buildx: use v0.4.1
> 8a18415110 Bump buildx to master to check if it builds on the CI
> 4d7b3045be Merge component 'cli' from git@github.com:docker/cli 19.03
> 6002284d4d Merge pull request #2695 from thaJeztah/19.03_backport_fix_vb=
omml_util
> 0100e1c0be Replace vbom.ml/util with fvbommel/sortorder
> 53c69c574e Bump Golang 1.13.15
> 87867aff90 Bump Golang 1.13.15
> 76060cc4a0 Bump Golang 1.13.15
> 8a905386a1 update containerd to v1.3.7
> 0ffc8f1e55 update containerd to v1.3.6
> aff3f55db8 update containerd to v1.3.5
> 61f6fac7a1 update containerd to v1.3.4
> c938231789 update containerd binary to v1.3.3
> ba94dd5a0d Update containerd to v1.3.2
> 13106ca34e Update containerd to v1.3.1
> c5ad02b467 update containerd binary v1.3.0
> a0edb6a8cb Fix log file rotation test.
> b17b2f05b6 Fix flakey test for log file rotate.
> efe3cf2163 Replaces ADD with COPY in the COPY section
> 5a861b676c Check for context error that is wrapped in url.Error
> a438db9875 docs: remove docs for =E2=80=94-from=3Dindex
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-contai=
ners/docker/docker-ce_git.bb
> index 9835350..768cf25 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -18,7 +18,7 @@ DESCRIPTION =3D "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV_docker =3D "ff3fbc9d55de9fce497cd058411f21f4a4dcdb7c"
> +SRCREV_docker =3D "4484c46d9d1a2d10b8fc662923ad586daeedb04f"
>  SRCREV_libnetwork =3D "026aabaa659832804b01754aaadd2c0f420c68b6"
>  SRC_URI =3D "\
>         git://github.com/docker/docker-ce.git;branch=3D19.03;name=3Ddock=
er \
> --
> 2.26.2
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
