Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F60CDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 18:22:52 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.134930.1697480569784473594
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 11:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SWnTjifK;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-79f95439795so138788439f.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697480569; x=1698085369; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUW1/AtMEVw3WssPwkwH+gXzMMjx2zBh8fpkhRiUgo0=;
        b=SWnTjifKiClRGzhbhqLVTRVwvXCWUcJKOFlmxtm0zOcJqIipv3vm5BIWioH9lZV6td
         rHCD8tsJSUNZQyR4wcv38nNclfYY19tLJk1KKPeZr5DKaNVAz8Eh3VYgIZQQQMvqmCxO
         OR5GRv628+kTJsyvt2zYzMYy7KpveEYxW4IsCun4LqK2avAaIr1D6L0FYYVmoFAfmzwp
         01Sr2cnxSnu2YwmZTi6ZffdBYyURzJaXoSTb56aeNEU8EEIeubcyNzVyoKWOoTzSlENj
         4GPxu+x1BAQ24jazLuuzQQ1lDpQR90IqMbMWGebQi5QhqXgnO5sQ5O8gUV3lXvbnVTOD
         wYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697480569; x=1698085369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUW1/AtMEVw3WssPwkwH+gXzMMjx2zBh8fpkhRiUgo0=;
        b=Kx1u1K68K4GDPNHZYIB/mZNUowBNgKhwQhHFYlWuCrXnJHYbjuQ6Fl03FoKkKzGQq9
         8LsW8GjI8GCrmh6L7kHeH4+HUKCYk8996igxis1+S5ZsNbAKNHR4tCAVSQvd+T/3xVZJ
         rjJJu+GXd5ptq4xPuV9fVrm3P63215br0DfwoUYpbSANin28w9Dz87KjxBWpboai5JuX
         DD0fdsnujrPCLq4Jnc6kJYgHY7DVYXwhDNiIKuxZmQHLMPpBPv5ypBbrQK/aANVswfFy
         ivBDybqU2Jbor0j/wOopKLnkcycdgjInfRVObkRLcvaSX9PAegXeltkMmgHWRaL0Zx3L
         /31Q==
X-Gm-Message-State: AOJu0YwbKpev9A+dRKER163idOLdw01hGnXte9QooDItuw7Rev/sPsrg
	7jEK6MPJu/2ag3DXUZ2Mu+WntTEHMrKePymFFkBVeqHgQnnYkiGu
X-Google-Smtp-Source: AGHT+IFrH7s/AWr8CK1fvjB97ung6CgIUgUaPtkSvR3WS2o3aLYLdggTNy1Au97EYuwAvTfQUIBsz8nx9a/n6WE/DsE=
X-Received: by 2002:a92:c5d0:0:b0:357:57c8:695e with SMTP id
 s16-20020a92c5d0000000b0035757c8695emr5361860ilt.3.1697480568987; Mon, 16 Oct
 2023 11:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <9ca767079c48373a2d3117217376b0ab5b2a3143.1697111572.git.joerg.sommer@navimatix.de>
In-Reply-To: <9ca767079c48373a2d3117217376b0ab5b2a3143.1697111572.git.joerg.sommer@navimatix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2023 14:22:52 -0400
Message-ID: <CADkTA4OUUU_U9-yC8W5zq8t4E5ceit=Fy1pSGnVVj2VvU6YjGA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] packagegroup-container: require
 ipv6 for podman
To: joerg.sommer@navimatix.de
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 18:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8371

This is staged on master-next.

I also had to do:  git commit --amend --author=3D"J=C3=B6rg Sommer
<joerg.sommer@navimatix.de>" --no-edit

Otherwise the Author of the commit was incorrectly set and the yocto
git hooks were preventing my push

I'm not sure how the patch was sent, but it is worth looking into.

Bruce

On Thu, Oct 12, 2023 at 7:53=E2=80=AFAM J=C3=B6rg Sommer via lists.yoctopro=
ject.org
<joerg.sommer=3Dnavimatix.de@lists.yoctoproject.org> wrote:
>
> The recipe *podman* requires the distro feature *ipv6*. Using a distro
> without it causes the build of *packagegroup-container* fails, even if
> *packagegroup-podman* is not used:
>
>     ERROR: Nothing RPROVIDES 'podman' (but /build/../work/layers-3rdparty=
/meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb R=
DEPENDS on or otherwise requires it)
>     podman was skipped: missing required distro feature 'ipv6' (not in DI=
STRO_FEATURES)
>     NOTE: Runtime target 'podman' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['podman']
>     NOTE: Runtime target 'packagegroup-docker' is unbuildable, removing..=
.
>     Missing or unbuildable dependency chain was: ['packagegroup-docker', =
'podman']
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recip=
es-core/packagegroups/packagegroup-container.bb
> index 8d418e9..8309a08 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -9,7 +9,7 @@ PACKAGES =3D "\
>      packagegroup-lxc \
>      packagegroup-docker \
>      packagegroup-oci \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp ipv6', \
>                           'packagegroup-podman', '', d)} \
>      packagegroup-containerd \
>      "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8351): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8351
> Mute This Topic: https://lists.yoctoproject.org/mt/101916200/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

