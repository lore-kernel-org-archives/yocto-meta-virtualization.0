Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0331AC433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 18:42:57 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.18706.1658083367168615605
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 17 Jul 2022 11:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DtSPklIG;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e132so8824033pgc.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 17 Jul 2022 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h7SROzorbBAn9qCadcnFnsU5tymHVyLSt9q4eSgroV8=;
        b=DtSPklIGFhKZghAvA/QQi2PS9qdSZHJuC5txhTC109a2sItDK+a+3HBvMWtN0f2nmx
         0PES7zre6AOz0Rj0OIfVBHLn5bDQvRIyo/m12ieqQaWg3PgC4vpgBv9dIqeFqzCQBvhZ
         2OO/sqMMda8RnEZZklQa00zjz/pcHtefupybSN0NUi3NjFkqeq67+4SUNZplo3ESMfut
         lUIRd0nr8bpoAY+wrWftQM23rFxdWEfXWFRmeeHILe9NDCE3HQRwXg13tRJb20+7P0KK
         bTeweexCtIiveQAY/BzqtQV2unpLZ4C3x7dc+RUS7IaXJL105jJy9VqMJ9sE3nnnXn63
         Jh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h7SROzorbBAn9qCadcnFnsU5tymHVyLSt9q4eSgroV8=;
        b=6jeUPNzjVSpmvVtkwTAy57NGXri6VLmJcoioHbtOZiCPhICvalRA5Y7JTpj07yxQwI
         NK1UQc2pLhNoD9ykmDdO4O56MvXTDma161cVRjMGnNUYolHgss/SZfIU7HwT4yPSqm0m
         hibKNFj2BHa4SydSOIiIFXLt48C0YiByrimGkXXcavdIZFPCl4aF8YyRMuv3+X2cdtp0
         uHskfGqFMs/D7DAwRIDyzpkkt5prJDiVzAkHpEGTE3NisfN8TiopIwTBMxfUdBAY2qtM
         pO+KIZlQ/oTNKGvub+Z5AdTnenjEOYFoi9dCybLdIpYy49K33HsftsGj7uIZ77DwS1qi
         U6NA==
X-Gm-Message-State: AJIora+V0MJ0YaJaDsGtz5vzTTAZGIzmKKrZQGpWO0poepxJpqIUrP3z
	JYaMPg+rvEvidS+KEvQ0/eq/pSG2/fJdWvRppgc=
X-Google-Smtp-Source: 
 AGRyM1uDEahzlADIVSMEEnrz9GnLjjoDjAB2rqHXiDDiQIdfRwEA1G8OxqRU0giwQm29yCojuYoiUe8ZxxP4g+OcvrU=
X-Received: by 2002:aa7:888a:0:b0:52b:17e8:fd1 with SMTP id
 z10-20020aa7888a000000b0052b17e80fd1mr21348204pfe.46.1658083366429; Sun, 17
 Jul 2022 11:42:46 -0700 (PDT)
MIME-Version: 1.0
References: 
 <BY5PR14MB389313571AD8B0342EBB19E7868A9@BY5PR14MB3893.namprd14.prod.outlook.com>
 <BY5PR14MB38931183FDDBF76A031B4EC7868A9@BY5PR14MB3893.namprd14.prod.outlook.com>
In-Reply-To: 
 <BY5PR14MB38931183FDDBF76A031B4EC7868A9@BY5PR14MB3893.namprd14.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 17 Jul 2022 14:42:34 -0400
Message-ID: 
 <CADkTA4Nw8iNm8rjR=BvOsdPjPFybn9eLQ--3cn9_Au6a2H80wA@mail.gmail.com>
Subject: Re: [meta-virtualization] pthreads dependency error in building
 podman
To: "Pra.. Dew.." <linux_learner@outlook.com>,
 Andrei Gherzan <andrei.gherzan@huawei.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 17 Jul 2022 18:42:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7464

On Sat, Jul 16, 2022 at 2:50 AM Pra.. Dew.. <linux_learner@outlook.com> wro=
te:
>
>
>
>
>
> I added the meta-virtualization layer to a Yocto (Kirkstone) project usin=
g KAS. When I try to compile the project  I get the following errors. I was=
 hoping that the layer should build cleanly since I have not modified anyth=
ing in the layer. Tanks for all your guidance and help.
>
>

master looks like it has a problem with a patch I recently merged from
Andrei, but I've fixed that here and pushed a change.

kirskstone doesn't have that change, so should be fine. I'm getting
patches for podman on kirkstone, so there are people building and
running without issues.

Bruce

>
> buM_iMH1g6GesQ1UE_c\n"
>
> | HASH[link github.com/containernetworking/cni/cnitool]: "packagefile git=
hub.com/containernetworking/cni/pkg/types/020=3DoY1xAj97Tqs0jbqIHGIg\n"
>
> | HASH[link github.com/containernetworking/cni/cnitool]: 803d1b283174051e=
aa86b7a946484a68a9626fcebff229bc3c414c4222c4badc
>
>
>
> # github.com/containernetworking/cni/cnitool
>
> | runtime/cgo(.text.fatalf): unknown symbol fputs in callarm64
>
> | runtime/cgo(.text.fatalf): unknown symbol __vfprintf_chk in callarm64
>
> | runtime/cgo(.text.fatalf): unknown symbol fputc in callarm64
>
> | runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pthre=
ad_mutex_lock in callarm64
>
> | runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pthre=
ad_cond_broadcast in callarm64
>
> | runtime/cgo(.text.x_cgo_notify_runtime_init_done): unknown symbol pthre=
ad_mutex_unlock in callarm64
>
> | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol pthread_crea=
te in callarm64
>
> | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol pthread_deta=
ch in callarm64
>
> | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol __stack_chk_=
fail in callarm64
>
> | runtime/cgo(.text._cgo_try_pthread_create): unknown symbol nanosleep in=
 callarm64
>
> | runtime/cgo(.text.threadentry): unknown symbol free in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol sigfillset in =
callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_sigmas=
k in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_attr_i=
nit in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_attr_g=
etstacksize in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol pthread_sigmas=
k in callarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol strerror in ca=
llarm64
>
> | runtime/cgo(.text._cgo_sys_thread_start): unknown symbol __stack_chk_fa=
il in callarm64
>
> | runtime/cgo(.text.x_cgo_init): unknown symbol malloc in callarm64
>
> | runtime/cgo(.text.x_cgo_init): unknown symbol __errno_location in calla=
rm64
>
> | runtime/cgo(.text.x_cgo_init): unknown symbol strerror in callarm64
>
>
>
> Sent from Mail for Windows
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7463): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7463
> Mute This Topic: https://lists.yoctoproject.org/mt/92416761/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

