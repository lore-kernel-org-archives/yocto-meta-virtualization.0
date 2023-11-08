Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E19FC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:57:57 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.14197.1699451870652624050
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 05:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JoBqzJHF;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7a94de8c70cso215149739f.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Nov 2023 05:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699451870; x=1700056670; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v09jCPVb3xYjJGjB2ZodDsa1b1mWzAWGH2FRWq1QpDw=;
        b=JoBqzJHFOPuDVV21DwhQUDsmcZq7YjkLtl49Wyaww3IZekfzjAkISSIQrP8CaO6Lkt
         wuc+do25s9OzqS3jksgIxfeWj46OQiaQhm9YudgurCpm5kiASivZ4CrIsIfYZI8Qrlk7
         Rl1jXSx3hcwNOENxrOb/yOeEjW552HqaRVMxokLXVmuudkQ+v9Kunk2Xvodxt6jQLqq/
         fSx0UBpgm0GAmWBZ/7T8anJjloj7X/pBsH/ZawSD62ZjgAKnWDGQpFkFKKqvr1oYQTk4
         QMikqljVIndp+Doxl+urFn2+iPkH8BVptCD+24ndg/4T+ylSc4ClpgEmBCLa1w+W8b4q
         Z6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451870; x=1700056670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v09jCPVb3xYjJGjB2ZodDsa1b1mWzAWGH2FRWq1QpDw=;
        b=ltGnGMYjfe+z8SQ07h1wmGqziZF1z8Jx+eNsWq73TiamGJ3eEbAuiR5/5FduNsiA9y
         4e+JxTrgPhWSjJulI3vmlDynTVs4ITd0NbKscq7MnxXjrslv6Jr03ub0rOgIeFoKx5Pk
         055xDCtdDFK5VsB6cLHkMCIXhi3X/lBoMPjoCs1G+TiMKB0RrKGXoz2WZGxQH9/S29qN
         0bLWRsd7DSYxZ1siDPQERjru0l0+02MBQyCHVZ3Y//5CTUxpYpd/djZ5DSHQklH5kqnr
         gHp5ah2jhLCve+MLL8b09mXkhgiXJV0gu6r/VnH+z7l8vEdAF7n9SnOI/iEKDCvaw+/7
         qMww==
X-Gm-Message-State: AOJu0Yx+0vibVFR2DFV6iDcGaRVW652HwKaR/JNwObUrA0GZ9jtqrE5W
	4iJ1Lza69dJzuUT2IPGJFb9uMKHN9yh6uDic11u+0nHDbe6ZSpIB
X-Google-Smtp-Source: AGHT+IFcs9+cJ5tERkmbmxSKIlAEWo82LVCGqA7nzVlWgVc6DccWTCweOkamVe4oQ4uZOnId3x6xxWJ1bm5sJkbAQu0=
X-Received: by 2002:a5d:944e:0:b0:780:d76c:b640 with SMTP id
 x14-20020a5d944e000000b00780d76cb640mr1731217ior.9.1699451869709; Wed, 08 Nov
 2023 05:57:49 -0800 (PST)
MIME-Version: 1.0
References: <9ca767079c48373a2d3117217376b0ab5b2a3143.1699439788.git.joerg.sommer@navimatix.de>
In-Reply-To: <9ca767079c48373a2d3117217376b0ab5b2a3143.1699439788.git.joerg.sommer@navimatix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 8 Nov 2023 08:57:38 -0500
Message-ID: <CADkTA4Mg1svgE7t1Xr8=OMvtCswN3UH6ARzTizY5JRJJPaV3jw@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone] packagegroup-container: require
 ipv6 for podman
To: joerg.sommer@navimatix.de
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Nov 2023 13:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8448

I'll do this as a cherry-pick, since when I apply this patch:

remote: ##############################################
remote: Invalid author J=C3=B6rg Sommer via lists.yoctoproject.org
remote: ##############################################
To ssh://push.yoctoproject.org/meta-virtualization
 ! [remote rejected] kirkstone -> kirkstone (pre-receive hook declined)
error: failed to push some refs to
'ssh://push.yoctoproject.org/meta-virtualization'

Which is fixable via:

https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixing-=
your-from-identity

Bruce

On Wed, Nov 8, 2023 at 5:38=E2=80=AFAM J=C3=B6rg Sommer via lists.yoctoproj=
ect.org
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
> Cherry-pick-of: 002aaf7029b8002acc69c9d4beea89039410d7cd
> ---
>  recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recip=
es-core/packagegroups/packagegroup-container.bb
> index 8d418e95..8309a086 100644
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
> View/Reply Online (#8447): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8447
> Mute This Topic: https://lists.yoctoproject.org/mt/102461172/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

