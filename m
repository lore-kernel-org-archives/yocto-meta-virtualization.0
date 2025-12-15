Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C18ED5B861
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 18:01:19 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.869.1765821669915306034
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 10:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eSz0xiXw;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b983fbd45so30549371fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Dec 2025 10:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765821668; x=1766426468; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6UG4gmBwkceYMBajfu+TZmPxW/vta+QOXgnAx+/haI=;
        b=eSz0xiXwJtfCEdd5lLzSL0hXyhbZkIpZm0jKMDhgLT+p2DYdbiSmRTbEcK1JzRh7/Y
         X4ErqFFN51RFD+9ziELlq/oqaLpZKx6HU+3evOiLYzrySn6E1ag0v182U6KC690hNwFD
         sfafhFbTKOGWeJx3dFIUO8GxjeYXwJd+8Nqqv/4Ms/tidaxjw4chiPkcH2ff6U8L7tSi
         CEcnXNJXXrSozNOR95HZj+bbcOZUlB6PSURbTT+VfMUJPcny9f0Ru6hyx0mNxbJfsq5j
         sqZ+sTtm1U7/5k44mQqtifprojC675Jt1orQPvRj1JQupSkx4yz6Txr2B/lN67n+OSiM
         7Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765821668; x=1766426468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6UG4gmBwkceYMBajfu+TZmPxW/vta+QOXgnAx+/haI=;
        b=Z7z1RBruQny2MGTMmTVXfC85CFPtYiEqPnkGPAbFvwTL/vFEC2H6mq020+eDpD/RIu
         ijvFmiHxBgUHY8TTn0g1WVXPIQ6GmzROJVrpfnoEa56epgGcHRnaKaOvvfika28yhgHC
         5QLZSV4a+0BhOW4VWvbEY9TznX0fnmUPDlH4jzIZSGLezcGOxB/9k+FZkCDKQKiBWHPM
         mHxKCD4eLfnIPzlJQKs0ZU6C47vB8vhqLAY8WHMkbm8/l5wMPdm5yymGBSviKqJgfON0
         emTY3k0ffg/GzFwqXVTJZ4ASYBnPRttUhPdECqIeWwZ09qOLeCwRB03DEXiFBZupdWf7
         gwDQ==
X-Gm-Message-State: AOJu0YwvQqWGWLDkLw7yb+4JIHgPlrTp0hNTKE0nOTIFxFQdBEm4OjNh
	IsVxoF/J9imIYmqfSru0BiAS+3T+DvX0AKeaR0ooO0Cv7Y9V/ukYsS1OrYk61+KFO9ofX+5fSQW
	elD2YBgT019BeeqQX5KZ9DMi69tGm+bE=
X-Gm-Gg: AY/fxX4wUht6Mk6mXGUB9MkkGWYpmDi4TkOpzVFC1l8nXdht4Tz4ZkkGm0welRhedDY
	oZEYxDZ/Tn6ekwTVW0vWUGhIzfaEjjMsASMwENd4mif1UENcCqFBHfYmQNs+JUeXxW440U19lqG
	LlsfutxMnpcFmApGwAUi47ddq7hbs4mMm28T2RogbV6+a+w1w/5IdU7uYAXv93FO5+5YtRBcmdf
	3prt1h/ArkG4E7KDSGHwdRDuk/FjsS5/WeCAZkGsDLbdIhxu9K8OrfISP75N1ThJHxdjmIZMRJS
	LBGqZzXCxrV6KTmR4D8uv48FxKOX2DaE5OGNHIybkrFPKFuLKhUgnqE=
X-Google-Smtp-Source: AGHT+IERr4/FH5e4cpv59XWskLca2/KXC4Ql1jF960fjJK6Ribx3sCXUAizgshQ6L42/Gf+Ka017YS0EcCI5kVDoqgM=
X-Received: by 2002:a05:651c:2122:b0:37f:8d02:4f52 with SMTP id
 38308e7fff4ca-37fd08c7a2cmr39424941fa.40.1765821667413; Mon, 15 Dec 2025
 10:01:07 -0800 (PST)
MIME-Version: 1.0
References: <7a68aa42-0904-18cf-7619-c97b4bf310b1@crashcourse.ca>
In-Reply-To: <7a68aa42-0904-18cf-7619-c97b4bf310b1@crashcourse.ca>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 15 Dec 2025 18:00:55 +0000
X-Gm-Features: AQt7F2rXGy3_Zv4An-POledMj9e54FOnl4g2cE3uq-R8zzI4EWt5D7BTRKWBAgU
Message-ID: <CACMJ4GYXidSqvQtQC9iizONhj4mK15hzS7Y_dswgsf4uEnVQzA@mail.gmail.com>
Subject: Re: [meta-virtualization] Why do *all* xen-tools recipes set
 DEFAULT_PREFERENCE to '-1'?
To: rpjday@crashcourse.ca
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Dec 2025 18:01:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9485

On Thu, Dec 4, 2025 at 8:23=E2=80=AFPM Robert P. J. Day via
lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
wrote:
>
>   Working on enhancing some documentation and, regarding
> DEFAULT_PREFERENCE, I noticed that *every* version of the xen-tools
> recipes sets this variable weakly to "-1":
>
> https://git.yoctoproject.org/meta-virtualization/tree/recipes-extended/xe=
n
>
>   Is there some rationale for this that isn't obvious?

I don't believe so, just maintenance involved when looking at which version=
 is
most appropriate around time of releases. From testing with the latest Xen
recipes, there is work we can do to make the recipes better to work with:

Current x86 Xen host images are building in a wic task, introduced to build
multi-partition disk images via tooling integrated into OE.

With experience:

- the kickstart files aren't bringing much benefit in practice

- the implementation ends up distributed between wic, the wic plugin,
  kickstart files, image recipe and OE classes

- static bootloader configs aren't viable, because they're brittle:
  eg. need to be dynamic to respect KERNEL_IMAGETYPE
  and configuration is typically affected by settings from multiple places.

- the hddimg IMAGE_FSTYPE alternative only supports single-partition
  FAT filesystems, not sufficient for many systems, and not designed for
  flexible inclusion of guest VM images

We can make it easier: replace the use of wic by adding a class for a new
IMAGE_FSTYPE: it can write multi-partition output and enable simpler recipe=
s.
Should be more capable than hddimg for systems with more advanced filesyste=
ms
and boot requirements, with more accessible configuration than the
wic + kickstart + oe classes + image recipe machinery.

Thoughts?

Christopher



>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9478): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9478
> Mute This Topic: https://lists.yoctoproject.org/mt/116619103/3619036
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
christopher.w.clark+meta-virt@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

