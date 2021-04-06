Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.11622.1617713905521505687
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 05:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QRT5Pnnt;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id e14so21745172ejz.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qfhC6PmpENhB71hfwiSSs3GMSm0Qr7asXzpdi8NLw8o=;
        b=QRT5PnntFkyKhH1B6d3SOiLjfe5UuTx3EC871vSsGDEXNOOxobyh+xUZxuWgbAB4gd
         ZU82Cl7cF8VFXOiZ6Tuutt7JVvXdScztn/XjtmCTTa+tstKFP93+sijtMfKT24eIHy29
         nwSYymbfYADJHf2L6MlN9DFnlmBAdDdsWyYcv+XVRQUBHwpYoIj6Kmw9t58UFBqmuO7l
         LLWTK8RO4fWGeCjhQNXhlUGmare1YNJwDG9NBniPHRWZgX9DLvf+FXorhGkWWoDIPBNW
         IQOo66L31axWTj2uN0+5Cmj8pZ4qra58VYj2AoyH4HEjqh7GJ8gKF6KN2nf5bOlTsvIU
         0Hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qfhC6PmpENhB71hfwiSSs3GMSm0Qr7asXzpdi8NLw8o=;
        b=dPRw/a9attdMwFA1JeImD0+nD+Vg1Rf3zPXI0eruMJ2Nd+Cfe1y3/SVQAq1lYKR6fA
         G5BcJJi3nCnfgecPC7TldiRfqBpLVoHWA8t7bLcF4nyMXP8bS9elFRFt1MOCggseKA3Y
         /YWePBtUmtBVZBeg1qXCRS4gCpbrdcc8iPQH5xYF72clso/vF+v4yab9T2Qk1zVGTfig
         4Ta7LJUqd8hxqXvdSvKd2m6KnPy1I37L9IvXy75NjLct9qkdKO/71GTxOAMLVSfuXwP+
         XSZwpn97v2oyglach1xThiIfoTumhNTFhRnmvc2ydIuKBDJuf8hp9oMuZEoJdmnbkAE/
         +trA==
X-Gm-Message-State: AOAM531tQxcE9op6a81X99cIwybTpCCHTi4IAxzn++/FtXPJMf7VA1ZG
	oq3x5gnMCITU386p2mRWRTegkz1M41ImknQW3vkBxfBwg58=
X-Google-Smtp-Source: ABdhPJzyLP3El0K3IeCnJkoTg8xF1cgFQ5JaKO6kv3LzzxieHVnJUOBNcZupSIdluhvOTtRE2J3VAXSqcG3hCGFFIG8=
X-Received: by 2002:a17:906:a103:: with SMTP id t3mr7826422ejy.334.1617713903910;
 Tue, 06 Apr 2021 05:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210403195133.1401406-1-Martin.Jansa@gmail.com> <20210403195133.1401406-3-Martin.Jansa@gmail.com>
In-Reply-To: <20210403195133.1401406-3-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Apr 2021 08:58:13 -0400
Message-ID: <CADkTA4OUZYj1GfcRr3zXQCjru4LA_a2EgCx+qRbFozgx4q1QAA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/5] cri-o, podman, packagegroup-container: replace anonymous python function calling bb.parse.SkipRecipe with conditional PNBLACKLISTs
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 3, 2021 at 3:51 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * PNBLACKLISTs are IMHO a bit easier to read and easier to override from=
 distro
>   which e.g. provides own recipe for libseccomp

Thanks Martin,

I'm trying to decide if I should just give up and make meta-security a
hard/full layer dependency. More and more of the container components
just don't work if we don't have seccomp enabled.

But I agree that the blacklist technique is easier to read than the
proliferating anonymous python. I'll merge it while I ponder the above
question.

On that topic, would adding meta-security as a layer dependency cause
any issues in your setup/distros/builds ?

Bruce

>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb            | 16 +---------------
>  recipes-containers/podman/podman_git.bb          | 10 +---------
>  .../packagegroups/packagegroup-container.bb      | 10 +---------
>  3 files changed, 3 insertions(+), 33 deletions(-)
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/=
cri-o/cri-o_git.bb
> index 2d6187a..0ac5ddc 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -43,21 +43,7 @@ RDEPENDS_${PN} =3D " \
>      libdevmapper \
>      "
>
> -python __anonymous() {
> -    msg =3D ""
> -    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/meta-=
virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwis=
e requires it).
> -    # ERROR: Required build target 'meta-world-pkgdata' has no buildabl=
e providers.
> -    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata=
', 'cri-o', 'libseccomp']
> -    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> -        msg +=3D "Make sure meta-security should be present as it provi=
des 'libseccomp'"
> -        raise bb.parse.SkipRecipe(msg)
> -    # ERROR: Nothing PROVIDES 'libselinux' (but /buildarea/layers/meta-=
virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwis=
e requires it).
> -    # ERROR: Required build target 'meta-world-pkgdata' has no buildabl=
e providers.
> -    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata=
', 'cri-o', 'libselinux']
> -    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
> -        msg +=3D "Make sure meta-selinux should be present as it provid=
es 'libselinux'"
> -        raise bb.parse.SkipRecipe(msg)
> -}
> +PNBLACKLIST[cri-o] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS', 'se=
curity', bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on=
 libselinux from meta-selinux which is not included', d), 'Depends on libse=
ccomp from meta-security which is not included', d)}"
>
>  PACKAGES =3D+ "${PN}-config"
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-container=
s/podman/podman_git.bb
> index a552a7f..62ae024 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -14,15 +14,7 @@ DEPENDS =3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>  "
>
> -python __anonymous() {
> -    msg =3D ""
> -    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/rec=
ipes-containers/podman/ DEPENDS on or otherwise requires it).
> -    # ERROR: Required build target 'meta-world-pkgdata' has no buildabl=
e providers.
> -    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata=
', 'podman', 'libseccomp']
> -    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> -        msg +=3D "Make sure meta-security should be present as it provi=
des 'libseccomp'"
> -        raise bb.parse.SkipRecipe(msg)
> -}
> +PNBLACKLIST[podman] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS', 's=
ecurity', '', 'Depends on libseccomp from meta-security which is not includ=
ed', d)}"
>
>  SRCREV =3D "288fb688964cb7fc7086d0728daa1f5f6b726dd6"
>  SRC_URI =3D " \
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/reci=
pes-core/packagegroups/packagegroup-container.bb
> index b3b0d4c..b06a7c7 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -44,12 +44,4 @@ RDEPENDS_packagegroup-containerd =3D " \
>      virtual/containerd \
>  "
>
> -python __anonymous() {
> -    msg =3D ""
> -    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/rec=
ipes-containers/podman/ DEPENDS on or otherwise requires it).
> -    # ERROR: Required build target 'meta-world-pkgdata' has no buildabl=
e providers.
> -    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata=
', 'podman', 'libseccomp']
> -    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> -        msg +=3D "Make sure meta-security should be present as it provi=
des 'libseccomp'"
> -        raise bb.parse.SkipRecipe(msg)
> -}
> +PNBLACKLIST[packagegroup-container] ?=3D "${@bb.utils.contains('BBFILE_=
COLLECTIONS', 'security', '', 'Depends on podman which depends on libseccom=
p from meta-security which is not included', d)}"
> --
> 2.30.2
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
