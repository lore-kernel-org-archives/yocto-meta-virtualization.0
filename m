Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD1BC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:15:42 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.9392.1643984141234555114
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 06:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F9YigXW9;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a8so19794472ejc.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IDTXrk/cFhzGLYWtfHo2vFr/8sDcmp5w4VQ2a1GIE/k=;
        b=F9YigXW90LYyBv1hr1n2Cbrh8l0gRiym6nmmD0JRWmPxeT6eLF+jFKvysTaw58EnKq
         v1YuZ5OPA46L0KRl28FE4dtedkCNnaf8tfY33jjk24XtXxbKHzRS3G3G4dszBJW9MmqZ
         6Sjy8BBxZMEWjfAXlHmi2XMbzI6IqrKZqMreYcrJS2LSAlWSeXliZjGQwlvunu1aLalG
         ds7t5ED179ok0Ky8jXok9pdkdYerOX3s5p3e1XGwj5rXdom34Zo2wVe79kenyBXfFTpY
         QnPi7kHO5NF1YT+B/EYdK5uUzo+sykhZ5znnHt7byPkiCHyKD36Zs1hjdsvtXlJzKEsE
         z+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IDTXrk/cFhzGLYWtfHo2vFr/8sDcmp5w4VQ2a1GIE/k=;
        b=O+g9ewbBhKJhmTgaqbwSIbLynDJC9jkPI9XpHWuDI3J3THlTFjmlG7/iQzoZ8vCPDT
         CzkdugjUuVmRnKPgKIQPFgVc2dziN9y6Xix1wh9dUB/jQ+w0Ap9G/HTX4JioEXY/WFkn
         kH9YvM0ZcJNWwWg/z3fHeNWHfyFkUPYaER8MJ1JNTd+p66znRB+YRPfYzRsa7cQXG3fH
         Jy88HDpzyszQ+GvGjj2NxQ3JLXZ9L5yGgIgsdzfbfH5SZSpx+wd59tlJ4N5W3hUCFF9X
         6dmSiQMN+CsVHGJuXGTt/VGY53WYbgwInr4TNSTmOaz4dc5EAYDaP3rqNfpXn21BAnJu
         rWSQ==
X-Gm-Message-State: AOAM532aWxOZCV1eN1m3KZt/IwI5W8xW0+ThgdSRvBdcEdvXDRrzRlgM
	dTACs08N7n9LoZ/d1Mlk7DgNx7GHrBqHbE4Q4vo=
X-Google-Smtp-Source: 
 ABdhPJzi0OwF3DW+CQt4Ugy5dyldoPztZ/XXh0YqchBfh8/ZmxbV5rVu1z7CBP4Z5ZdFEHjp3Rtnu92Qu9Kx+jd0mbQ=
X-Received: by 2002:a17:906:6a93:: with SMTP id
 p19mr2713813ejr.711.1643984139438;
 Fri, 04 Feb 2022 06:15:39 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
In-Reply-To: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 4 Feb 2022 09:15:28 -0500
Message-ID: 
 <CADkTA4PdJ5u7Mwm1sB9pceGXDhZQfm6gpBm5VEr7ggRnqH44+g@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker and GPLv3
To: Mans Zigher <mans.zigher@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 14:15:42 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7042

On Fri, Feb 4, 2022 at 3:53 AM Mans Zigher <mans.zigher@gmail.com> wrote:
>
> Hi,
>
> A client of mine wants to have docker on it's product and they are
> having secure boot enabled which prevents us from having any GPLv3
> licensed code on the target. We have successfully managed to add
> docker to the target but we noticed that several packages have also
> been added that is GPLv3
>
> bash, gmp, gzip, libidn, libunistring, nettle, rsync, tar, wget

Those shouldn't be coming directly from the docker dependencies, but of
course packages that it depends on, may pull other dependencies, etc.

What branch are you using ?

If you look at docker.inc in the layer, it has our known dependencies:

DEPENDS =3D " \
    go-cli \
    go-pty \
    go-context \
    go-mux \
    go-patricia \
    go-logrus \
    go-fsnotify \
    go-dbus \
    go-capability \
    go-systemd \
    btrfs-tools \
    sqlite3 \
    go-distribution \
    compose-file \
    go-connections \
    notary \
    grpc-go \
    libtool-native \
    libtool \
    "

DEPENDS:append:class-target =3D " lvm2"
RDEPENDS:${PN} =3D "util-linux util-linux-unshare iptables \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'aufs',
'aufs-util', '', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
'', 'cgroup-lite', d)} \
                  bridge-utils \
                  ca-certificates \
                 "
RDEPENDS:${PN} +=3D "virtual-containerd virtual-runc"


>
> 1. Does docker have a strict dependency to GPLv3 code?

There may be ways to avoid some GPLv3 dependencies, but it isn't
something that we've actively explored or tested. So it would be
an effort that needs experimentation.

> 2. For some reason that I don't understand, docker seems to pull in
> LXC which in turn will pull in many of the packages. Is Docker using
> LXC? I thought docker was replacing LXC doing the same thing as LXC.
> 3. Do you have any suggestions on how to have container support and
> not pull in GPLv3 code? Is Docker moby an alternative?

It depends on how you are installing docker to your image. In the latest
branches, it doesn't have a dependency on lxc. There are some package
groups and kernel configurations that are shared, but you don't have to
install using those packagegroups if they are pulling in elements that
you don't want or need.

Bruce

>
> BR
> M=C3=A5ns Zigher
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7040): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7040
> Mute This Topic: https://lists.yoctoproject.org/mt/88903092/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

