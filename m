Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAA2C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 18:22:59 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.4881.1704738176414005561
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 10:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GtoG8FpL;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7bb99f77f97so61849339f.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jan 2024 10:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704738175; x=1705342975; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVHR2ZCExIodGNhsVW6E3A/4/8preBAghTfjS48tx7A=;
        b=GtoG8FpL3vsGqM/9zrEmP/+a/ZkLPevXkRLeIRm6NFhrI1NMdfJqMduVTASYwr+MaL
         Z2DoDh+Q7l615NXpA1Qq2ljlQlzHutkP1H3lM42Z7XGJXmTiH2X+tPMAeQ6IbuZbRmOZ
         t+3YtBM4yoDW4dBDe1ZseV3Mb62hOJeEFvRd1lKGHzWZ2XCa7g2ks89Lc91MRN5p8Rb6
         /WViZm5jc1uPsVF0yjEr7/1ASvqKJO9GP3+a/nQLLqP44QvaeMykEYOhCzPEvYJQAGj0
         +d2wpSJmlxjhSiKcTFf7P/jRPQiXQVChy3vpblzRya3DMJ4fDw0HEw3mIjxVZYHIaUmc
         KVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704738175; x=1705342975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVHR2ZCExIodGNhsVW6E3A/4/8preBAghTfjS48tx7A=;
        b=fvQAUf5cq32xGnod8F8nTuDaVhTvMnrW/k/POB8zklOak9GDlnv+qybfsViK4hcMqE
         Ytax/8jAofK81KSyeO5DpV5TSzWQVcgK+c6ZKGPg4gicFhTqKgEt2jOtsUqrNgSQ1f36
         uxGUOv7GUagfTLyCm/RZgJBqFz3gOPFtIzn8jP5iH8oj6MYsAJydmaaatFdq/nsy3xAR
         3Y7LXT7fm9xJtZLrppm6BjGZPiJ8VH5ur3dPuWJ1QdY6c5dNlbyMm2wC/IzQtqC2ymTg
         55MBNCw3wofDr61ZiPnzznNRpxnrzoavuQOyplR9houqAj6y2FhuAwepcbYlqyaRYfjX
         auag==
X-Gm-Message-State: AOJu0Yxbbcpva5ovYGZGEgW7HloMDWKg2XlHYkxh5bADp77T5j62k+Pt
	GTdUrqPchjlKWMX6sNiKFZ2lPALLdPc3VyuFo14=
X-Google-Smtp-Source: AGHT+IGifRQXkZBB0QPbN5X4Bx6paO+fgfPK9G4u6Vku7fIDv515rCOu7s+dCRN/llFikIP4gpK1oVEzBdmwlyP4WNE=
X-Received: by 2002:a6b:a10:0:b0:7bc:157c:8aa6 with SMTP id
 z16-20020a6b0a10000000b007bc157c8aa6mr137624ioi.0.1704738175547; Mon, 08 Jan
 2024 10:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20240108180933.2362963-1-liu.ming50@gmail.com>
In-Reply-To: <20240108180933.2362963-1-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Jan 2024 13:22:44 -0500
Message-ID: <CADkTA4NwrXFJ0b_2x0GDhVNeSUFVGOvWuXRKu+Wj1ckE=CtSEA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: support bash completions for podman/docker
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jan 2024 18:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8532

On Mon, Jan 8, 2024 at 1:09=E2=80=AFPM Ming Liu <liu.ming50@gmail.com> wrot=
e:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> Generate podman bash completion script with qemu wrapper.
>
> When docker pkgconfig is enabled, also generate bash completion script
> for docker.

Just to get bash-completions, this is too complicated and brittle.

In this situation, we need to figure out what it is generating, do it
once, and capture
the output (or otherwise simulate it).

Bruce

>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-containers/podman/podman_git.bb | 29 +++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
> index 33d437a3..1c64272a 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -68,6 +68,18 @@ EXTRA_OEMAKE =3D " \
>  # packageconfig, the podman package will rconfict with docker.
>  PACKAGECONFIG ?=3D "docker"
>
> +# podman builds bash completion with the help of podman binary, only the=
 machines
> +# that support qemu usermode can enable this pkgconfig.
> +PACKAGECONFIG:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', 'qem=
u-usermode', 'completion', '', d)}"
> +DEPENDS:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-user=
mode', 'qemu-native', '', d)}"
> +
> +inherit qemu bash-completion
> +
> +# To avoid breaking the recipes without 'completion' enabled.
> +ALLOW_EMPTY:${PN}-bash-completion =3D "1"
> +
> +QEMU_OPTIONS =3D ""
> +
>  do_compile() {
>         cd ${S}/src
>         rm -rf .gopath
> @@ -116,6 +128,23 @@ do_install() {
>                 install -d "${D}${sysconfdir}/sysctl.d"
>                 install -m 0644 "${WORKDIR}/50-podman-rootless.conf" "${D=
}${sysconfdir}/sysctl.d"
>         fi
> +
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'completion', 'true', 'f=
alse', d)}; then
> +               qemu_binary=3D"${@qemu_wrapper_cmdline(d, '${STAGING_DIR_=
TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
> +               cat > ${WORKDIR}/podman-qemuwrapper << EOF
> +#!/bin/sh
> +
> +$qemu_binary "\$@"
> +EOF
> +               chmod +x ${WORKDIR}/podman-qemuwrapper
> +               ${WORKDIR}/podman-qemuwrapper ./bin/podman completion bas=
h > ${B}/podman-bash-completion
> +               install -d ${D}${datadir}/bash-completion/completions
> +               install -m 0644 ${B}/podman-bash-completion ${D}${datadir=
}/bash-completion/completions/podman
> +               if ${@bb.utils.contains('PACKAGECONFIG', 'docker', 'true'=
, 'false', d)}; then
> +                       sed "s/podman/docker/g" ${B}/podman-bash-completi=
on > ${B}/docker-bash-completion
> +                       install -m 0644 ${B}/docker-bash-completion ${D}$=
{datadir}/bash-completion/completions/docker
> +               fi
> +       fi
>  }
>
>  do_install_ptest () {
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8531): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8531
> Mute This Topic: https://lists.yoctoproject.org/mt/103603296/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

