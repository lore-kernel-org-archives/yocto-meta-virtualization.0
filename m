Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC3CC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 13:10:46 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.56377.1718629837531413950
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 06:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ORLwo436;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c1a4192d55so3486304a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 06:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718629837; x=1719234637; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAT9piTauzTv5vCaw494P9tqNQx5pybHl0AIfkKCYHs=;
        b=ORLwo436RcnmTmaezqAE1VcmzxRTQLVG4+I9IddnpEUhNDoxxlieEMh+47XYIzWBsK
         nMPwCw8AKyzUm1gDzZSGHq6TiJ3shma+eNr4dtllbGs8j45w0AsdIdF+1oJbkJ/WpfZP
         T+dLe+x+L75eWmwRur2A3ZNeZyzuraVAcvti4KiNZXQau1TIkuwYqTyr6fyDMiv5bF/U
         UOFArheIoHLGfKc8LJ//yItdkPrYp8pmRnA4ObkpZzd+O9aaqn69xYg6xM1Eo+McqK1M
         Hu0s55XM+0JrzW9VR2XxjeAM4ns13zc4POz/T/vNDQIhBtW5nVvooP6SuBnIuawTU5Hz
         ez+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629837; x=1719234637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAT9piTauzTv5vCaw494P9tqNQx5pybHl0AIfkKCYHs=;
        b=jfDo4Y3djjd5P8Z64vLzhyZe59Avpa9vmBklBxtrZRyJSZmEyI4Gr2qjHSLw9Iyhah
         dE7acmwlxhVTUuLL5SiEU3hyIoK+yZ+3YInLbeyoXDomxn1ST61LoTFWun0M9TjRuztK
         BmdDEWwwb52BWFpmishmix4d+WBiGohTbvGVtzB0mmEYP7Qxn++g4JPiujktU1+s4uNm
         mxWZJTjHDgFbs5yKA/4SVDS9dYf7ElKqqbUq03IvcQ7RZHzK1HXDsUNaUDPLM7KVkVrS
         kMBe/iXkS+tU1ks544viXWaamVSNoSb1aXRFjD5AkAJjut9SUKmzUHy3ZCwOSP5B+uo5
         dTIg==
X-Gm-Message-State: AOJu0YzwuunBE0PlAgW5wBInLN9tFXC30rhm/ZlzkMKUQmFMKQyau1Os
	V6oHwDWshmm5xZEw5itQizVl7dJjB4ZafjsU3s59Rezv9q21NEm7ohijlzA4GCvCpV87ALUQt+/
	P8JWDYNPt5rfboEC6bz0+Od3Luuc=
X-Google-Smtp-Source: AGHT+IFVhpr6UKynbDeHpEiiVE8XpMZ6sdDwYAcxcdyyAZNmMp2mjyLPZ4IGCXD7i6bXGoNAk3kgupl1t77iWKARgUM=
X-Received: by 2002:a17:90a:8a85:b0:2c3:11fa:41f with SMTP id
 98e67ed59e1d1-2c4dc028a08mr8372403a91.45.1718629836798; Mon, 17 Jun 2024
 06:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <1718611999-8852-1-git-send-email-wangmy@fujitsu.com> <1718611999-8852-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1718611999-8852-2-git-send-email-wangmy@fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Jun 2024 09:10:24 -0400
Message-ID: <CADkTA4OXBvhJ-_VQ7=OKC9+hmiYo958v+sWOJgDbMJ1oN0FOpQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] lxc: Start WORKDIR -> UNPACKDIR transition
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 13:10:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8801

Double check your tree.

These conversions have been done some time ago.

Bruce

On Mon, Jun 17, 2024 at 4:13=E2=80=AFAM wangmy via lists.yoctoproject.org
<wangmy=3Dfujitsu.com@lists.yoctoproject.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Replace references of WORKDIR with UNPACKDIR where it makes sense to do s=
o in preparation for changing the default value of UNPACKDIR.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  recipes-containers/lxc/lxc_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/l=
xc_git.bb
> index ee0e442f..550f910e 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -161,12 +161,12 @@ do_install:append() {
>         # /etc/default/lxc sources lxc-net, this allows lxc bridge when l=
xc-networking
>         # is not installed this results in no lxcbr0, but when lxc-networ=
king is installed
>         # lxcbr0 will be fully configured.
> -       install -m 644 ${WORKDIR}/lxc-net ${D}${sysconfdir}/default/
> +       install -m 644 ${UNPACKDIR}/lxc-net ${D}${sysconfdir}/default/
>
>         # Force the main dnsmasq instance to bind only to specified inter=
faces and
>         # to not bind to virbr0. Libvirt will run its own instance on thi=
s interface.
>         install -d ${D}/${sysconfdir}/dnsmasq.d
> -       install -m 644 ${WORKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq=
.d/lxc
> +       install -m 644 ${UNPACKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsma=
sq.d/lxc
>  }
>
>  EXTRA_OEMAKE +=3D "TEST_DIR=3D${D}${PTEST_PATH}/src/tests"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8799): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8799
> Mute This Topic: https://lists.yoctoproject.org/mt/106717040/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

