Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6592EC001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 17:44:34 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.41471.1691430269465990524
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Aug 2023 10:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g5qyrAD9;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a5ad4477a7so3611736b6e.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Aug 2023 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691430269; x=1692035069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNx8E1cYFsP4ooY5hnRSErUVUsdJu/X8tnuUZ3JP1P0=;
        b=g5qyrAD9vwhbn++cSr5ErxOLTSjhILrGnBc2PU/Hj9hczRnzCl/QZoxoNLyPG8SDK3
         KLsGgf/URsXtstd16FfTmOJgkDCSgVa7ZCUwHO48VzXj0/IW71Zj2nKlGQUifC53NPad
         +FzxWO+Vl0CEB5NdPAZLsKChfTM8adxtkjGA5cWMXiwB4lVOb48LFjUs7x+6jT4pPJ4u
         DCNn3l8OW4NVExeTXQYReYDIJ5cOVtqqib5drvXXFKHLC8xdTlm6SdRwMQQsei0o8ayS
         JFXfDxwrG1jJCcv/2vMV9po5oDJj9wJQBEFwAzCks5Q6k9lQ89mXz65ixCTai2Z/4X5e
         NLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691430269; x=1692035069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNx8E1cYFsP4ooY5hnRSErUVUsdJu/X8tnuUZ3JP1P0=;
        b=LJN9Sf6PwCe2+n9WhKMOreFL3x3gcZpRvjcsUkSNCfoNgNtP6revdSNe4ocfjtbqvK
         kopKisHSLttDVsmZ+MdIOa0J+MmZfGGTMAvuAEwSuXt1vux+73nW7UyQfhUadHXkoulw
         Q92zuZaXDm3g0jYzu9QOWDKyWj1rIZY+Rw/YyfopUHEoipf1gIl5gU/Vcd3pYg2Kcokb
         omoxq4zoF3oj1LF2dD3l3EOY9zdheGJMkj99Zl0LkzPffsqaLSiWDDWg4UvxJeMHv8Wb
         PbbvM7wdcgFYa/pD3l6t4x2h1OMLktxFXlQb5Ribc+geU+Xy9dy86ePzfqJStiNWQMyT
         +zqQ==
X-Gm-Message-State: AOJu0YwvX76njDM0BMIxG7Jhn1tuNcl7jRUe63fYJ+fmcxldWzX2hH+E
	MupLQsQ/3DhbmFgHEyA2iNkAhBOYp2CqdRm02z4=
X-Google-Smtp-Source: AGHT+IEf/VFpVo+tCI5r6PKL9SqCCckHnE4u96ipXDXPKu+R3CxyBuqY/o31Cli01c//Lo9ACK2wX1xsQlWYyLIKhZk=
X-Received: by 2002:aca:2b14:0:b0:3a7:22f0:1fc2 with SMTP id
 i20-20020aca2b14000000b003a722f01fc2mr11613849oik.13.1691430268659; Mon, 07
 Aug 2023 10:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230807083835.26844-1-changqing.li@windriver.com>
In-Reply-To: <20230807083835.26844-1-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 7 Aug 2023 13:44:17 -0400
Message-ID: <CADkTA4P7oQ39Dup+0ae+QaoAPVN=CqMe3vLkZmEO1y4FZ94Auw@mail.gmail.com>
Subject: Re: [meta-virtualization] [master][PATCH] libvirt: upgrade 9.2.0 -> 9.6.0
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Aug 2023 17:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8168

On Mon, Aug 7, 2023 at 4:38=E2=80=AFAM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Refer the changes here:
> https://gitlab.com/libvirt/libvirt/-/blob/master/NEWS.rst

master-next has the uprev under test:
https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&id=
=3Dc6eda020fc971599c54d12723f670d7e45aa7282

Bruce

>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc                     | 2 +-
>  recipes-extended/libvirt/{libvirt_9.2.0.bb =3D> libvirt_9.6.0.bb} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_9.2.0.bb =3D> libvirt_9.6.0.bb}=
 (99%)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extend=
ed/libvirt/libvirt-python.inc
> index e4806df0..a8c31e6a 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -20,7 +20,7 @@ INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
>
>  SRC_URI +=3D "http://libvirt.org/sources/python/libvirt-python-${PV}.tar=
.gz;name=3Dlibvirt_python"
>
> -SRC_URI[libvirt_python.sha256sum] =3D "95cc190c57cb84e8ed2e1b8205b01a937=
e1a4bc19cc8865df19ca4470e6d7c1b"
> +SRC_URI[libvirt_python.sha256sum] =3D "53422d8e3110139655c3d9c2ff2602b23=
8f8a39b7bf61a92a620119b45550a99"
>
>  export LIBVIRT_API_PATH =3D "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS =3D "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended=
/libvirt/libvirt_9.6.0.bb
> similarity index 99%
> rename from recipes-extended/libvirt/libvirt_9.2.0.bb
> rename to recipes-extended/libvirt/libvirt_9.6.0.bb
> index 5e704704..6c5d3298 100644
> --- a/recipes-extended/libvirt/libvirt_9.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_9.6.0.bb
> @@ -32,7 +32,7 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.t=
ar.xz;name=3Dlibvirt \
>             file://0001-messon.build-remove-build-path-information-to-avo=
id-.patch \
>            "
>
> -SRC_URI[libvirt.sha256sum] =3D "a07f501e99093ac1374888312be32182e799de17=
407ed7547d0e469fae8188c5"
> +SRC_URI[libvirt.sha256sum] =3D "10f2e52dbb5df90410594a8e36d0e0587d38f11e=
fb64ff32cbec422b93b70c52"
>
>  inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
>  USERADD_PACKAGES =3D "${PN}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8167): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8167
> Mute This Topic: https://lists.yoctoproject.org/mt/100595821/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

