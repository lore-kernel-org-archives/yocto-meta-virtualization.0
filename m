Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03464C54E49
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 13:42:30 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.20206.1708954945163542831
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 05:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWG8oABj;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so3118521a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 05:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708954944; x=1709559744; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8RDqA46XR2tPiD8/MLZNyBw5VEuw6h6MjS/shXCCeo=;
        b=eWG8oABjpGkVwNtt2VE9W162eOftH636yZbxj0jJLNiYdY10kZvRqrrLFpjsLc/6MJ
         SxbqfTCpaFYf21vY4IqsaOFNVKfVBhiuiSQnjt4K4iophWVNGImrirjJDlje/UXkiTjx
         DtL1ML7w2zHiFg+HQN1ZMkdTaBY1dlXS/wKJ5WJV+lOElz8QzTC1I3Oy81sAtjJRGH5L
         JfIlcvex/u0MSoNcgkSq6JYILR2HYx+6ivX8hEATQpuYwXRX4TCs0VelW7SkzOTIX6Sd
         L99dzr7D3d8YymQDSSHbPawqurzIR8CoI/lYzRFltIBiltrGaF/xrWQMlhOm3Wd1oxIK
         G2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708954944; x=1709559744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8RDqA46XR2tPiD8/MLZNyBw5VEuw6h6MjS/shXCCeo=;
        b=qCS8f8uB6SXXDXcemRnCPR6CYC/E+f236IXP0aAidTQwG9QWeiTO7CISyGfHeLxse/
         EsGWexdSp4RAmzPWG3RK2KwH1s4eFM5GH8wHlt4rHOF89yhv+NXKahzbJiea6U3Ixwel
         4c02NY0twSw8IaoaPiMKq1TmRD77ZN1AN9pun0nKdVlasmUJBXjGPnhEFXVQrdQfvN0G
         9F8hqRlgQhAXRpXCPQRBO3nik6ACFqCuGIiNzPn700L/wQt41c/DwZCHXyLPOF2MPpoN
         hlzQeKzvrLRtgxtvSCGbGuD78mpYStqoJkSKvFO5bIhSa3NKSPv243MYOUMu3iqtNHI4
         qASA==
X-Gm-Message-State: AOJu0YwrOBQRPG7mApcJf35aJCpH471BTnuxDZs3PkrfVo31ilQ36Wvi
	qzYHGqDMS7vs2BbDVIB+MGlMMluF8TyLkUBodm2RhK2ZzM9/CfYGoJQyqhONkR2fDo8ZVTss6/2
	O460QMaUvqScUsYBWvenQ6t8/HcI=
X-Google-Smtp-Source: AGHT+IE6fTCydLle6XSzcG5ehHFRQsa+LWPrJbazWcCtLnW9TECnoLE6q5fdVnR4BgHW8XiG60ycafq9G5OJJc826rg=
X-Received: by 2002:a05:6a21:3a44:b0:1a0:f451:bf5 with SMTP id
 zu4-20020a056a213a4400b001a0f4510bf5mr6236736pzb.56.1708954944278; Mon, 26
 Feb 2024 05:42:24 -0800 (PST)
MIME-Version: 1.0
References: <8uml.1708927764963219775.KWwp@lists.yoctoproject.org>
In-Reply-To: <8uml.1708927764963219775.KWwp@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 26 Feb 2024 08:42:12 -0500
Message-ID: <CADkTA4NPmYW-0qvwv7ketysjm=8ibWeM6d78P2xSpupkF-6sTg@mail.gmail.com>
Subject: Re: [meta-virtualization] Reduce Docker installation size in the disk
 #meta-virtualization #yocto
To: vivsundar@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 13:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8583

On Mon, Feb 26, 2024 at 1:09=E2=80=AFAM <vivsundar@gmail.com> wrote:
>
> I use yocto build for creating Kernel and Rootfs images to be used in CM4=
 module.  I use core-image-minimal which produces a nice 30M (Kernel + RFS)=
 image.  But when is include docker with:
>
> IMAGE_INSTALL:append =3D " python3-docker-compose"

Unless you are actively building docker deployments on the target, you
shouldn't need anything related to docker-compose.

> IMAGE_INSTALL:append =3D " docker-ce"
>
> The image size increases by 320M(Kernel + RFS).  Is there a way to remove=
 some unnecessary components from docker?  I am quite new to docker and its=
 internal components.
> I have fixed offsets in by boot loader, so, I am finding it hard to boot =
the board with the new Kernel and RFS.

Docker is not a small / light stack (when considered in embedded
terms). Most of the backends and broad support are not from external
libraries, etc, and as such are not easy to configure out of the
build. I've never spent much time looking to see if we could make any
of them optional. I set the default build options (DOCKER_BUILDTAGS)
to already be fairly light in the recipe, but you could always look to
see if more could be removed. I don't think you'll find significant
things to remove and not much size removed. golang itself is going to
take up quite a bit of space, as will the other package dependencies
of docker.

If you are size constrained on your target, my suggestion is to just
use the container runtimes directly.  Just putting runc or crun on the
target to execute OCI containers is much lighter than any of the
container frameworks.

Bruce

>
> Any help will be greatly appreciated. Thanks.
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8582): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8582
> Mute This Topic: https://lists.yoctoproject.org/mt/104577876/1050810
> Mute #meta-virtualization:https://lists.yoctoproject.org/g/meta-virtualiz=
ation/mutehashtag/meta-virtualization
> Mute #yocto:https://lists.yoctoproject.org/g/meta-virtualization/mutehash=
tag/yocto
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

