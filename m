Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233E8CD98CF
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 17:57:43 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76284.1781287060357081332
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 10:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OgSvU0+0;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8cceb2ecc03so11734366d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781287059; x=1781891859; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8Cxpn21PgDhm/6qr0vFQerQINgQWx+cNfw6dYW+Y+Q=;
        b=OgSvU0+0SZHOStY1FJiYUJIEWvDIkEao/+VuzbmHHbWA3SuyqqcczmXxUvonmdhoXk
         uZGWIDz/Gk3OX9j9jHmLuSCMozQ8muOU3omWpRbmJqEWbj3ux7sADODisjf+8LaFU8i4
         ZKtUCmDdI3sUCZCNFSeyZ0Fc4Wy4lxV3/JIaZMQPGWb3gMpvS9jQUtWqev/QrHm5O7zQ
         3cha0Y9C78LuQ1sXYV6nClcid1SFj5nf7ewFWPLASpujjHYBRcC+xNGlt89w9OuqriDO
         bWY/Vgk2xZrVwb3IQtVwTAB4OzbGQwaLDEA0fY72jRy6jFWIc6rPptZfmNuww3yLw91v
         nLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781287059; x=1781891859;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8Cxpn21PgDhm/6qr0vFQerQINgQWx+cNfw6dYW+Y+Q=;
        b=MBjD451wgBlbkIUU19qrGHQ22wXJHDLaFZRl8kN1YWzcmKFKA4++4ttxFr8KQP5n6k
         B88CAZAae42EhFOTPsoor330cTDKCS61A/Bp6FqWlXLvPcaRbiqx/RSpP42JxmMlT2Rc
         iNw00oT8tS+0jTDiS0NnX3DCwkor3Vi0QIxaMBACC1PoOjiJKY6AcwH1K1+8hc+wCue2
         w1V6lEfqpR7CfVKe/j7xvDWMognqm8VUcedFZoRJr4dwgcraTHCFnAJzmcRPxbg2K7nO
         r4n2FMXqnKyB5gUNgHrR1lcQmIFS4c2VH+xthk/IDTe5Ps0PuXDbwu0d9T1cilc0aFZc
         W7aA==
X-Gm-Message-State: AOJu0YyjSPqJLP5pvtxBAx0lLY19VJoMZexLLYfiYcYLFBOW/1Jovgma
	DqgUVdSVGP36XhPBHyGGEtFjr4WiIcJ9BAPOM05KQXw5ZRKRASgn2f/L
X-Gm-Gg: Acq92OGXaH74RO/OuvrDVm//l4UDc/yNrptS2RdgOjdi1mGWTgLTpGC3StWhxdicuac
	O6frnaVdPkEt8jr9EmpCUFMQiBFZxPc8NvBrrdP07CyM/dGBAE3Rx/vAWRYcDudzKgBz8909qG8
	zBo2GvFbN//DIw0b898rEfuevgDfJYdVKophmg7Oo7pfmGcw1lkExuH+SnVMFawFRKEvBTs18im
	637hWztSUtP53caQtvkL5v+bmozh9yN7z9RWnIz6lP4zMXuBsx0aqTO61sovj8smI3pSVppNT+m
	6SOZiBVF3Gl4rdD3Op8+kWoon0S28uRv2p2HrYWPbjALtDTb9bAFzK2DlTyrpVM31vEp8mwQEJU
	zEuKk/z5mWlAwKhlvHRBKqGlEkJ7mGSiH3/Ki3PIVKnWxAC/+5b81R2mOYyPmut8Zf4QRHtjXYL
	on5qaQatfKrdxm0a5vkS8iJ9UtuzqAcyfo7UOqGah2DIc+UI/ZDDYODkRrqFd37EFUW3WYILXUB
	ZJh/ELFkoQphWxO38Cl9+5OJfPVTHdyBEmGhuZRCXz4njKUl7F3uvv4hEnz8ZCJ4A6x8BTXgmeR
	uF2H9u/7b62YNnHULzCyIDxN
X-Received: by 2002:a05:6214:5b09:b0:8d1:4126:bcff with SMTP id 6a1803df08f44-8d44d04fdd4mr7739056d6.9.1781287059203;
        Fri, 12 Jun 2026 10:57:39 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d302211f20sm29921806d6.21.2026.06.12.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:57:38 -0700 (PDT)
Message-ID: <6a2c4892.b63906d5.2d75f7.2d6d@mx.google.com>
Date: Fri, 12 Jun 2026 10:57:38 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 2/7] recipes-containers/images: add
 app-container-python
In-Reply-To: =?utf-8?q?=3C2c612245431bf2ebcfe9c4f188be1e27117cc0db=2E1780104?=
 =?utf-8?q?071=2Egit=2Etim=2Eorling=40konsulko=2Ecom=3E?=
References: <cover.1780104071.git.tim.orling@konsulko.com> =?utf-8?q?=3C2c61?=
 =?utf-8?q?2245431bf2ebcfe9c4f188be1e27117cc0db=2E1780104071=2Egit=2Etim=2Eo?=
 =?utf-8?q?rling=40konsulko=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 17:57:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9871

Hi Tim,

Just a couple of comments ...

On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> Add OCI container image recipe for Python to use as a base for
> other Python app containers. The image uses multi-layer mode with
> separate base, terminal and python layers.
[...]
> +OCI_LAYERS =3D "\
> +    base:packages:base-files+base-passwd+netbase \
> +    terminal:packages:ncurses-terminfo-base \
> +    python:packages:python3+coreutils${@bb.utils.contains('PACKAGECONFIG',=
 'dev', '+python3-pip', '', d)} \
> +"

I like this conditional. Putting the bb.utils.contains() directly inside
the layer's package list (instead of duplicating the OCI_LAYERS
declaration in two PACKAGECONFIG branches).

Worth calling out in our multi-layer mode docs as the recommended way
to do conditional packages-per-layer. I'll do a patch for that.

> +# IMAGE_INSTALL triggers package builds via do_rootfs recrdeptask.
> +# Even for multi-layer mode, list packages here to ensure they're built.
> +# The PM will install them directly to layers from DEPLOY_DIR_IPK.
> +# Note: IMAGE_ROOTFS is still created but ignored for packages layers.
> +IMAGE_INSTALL =3D "base-files base-passwd netbase"
> +IMAGE_INSTALL +=3D "ncurses-terminfo-base"
> +IMAGE_INSTALL +=3D "python3 coreutils"
> +IMAGE_INSTALL +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dev', 'python3-=
pip', '', d)}"

This is correct today but it doubles the source of truth. The packages
listed in OCI_LAYERS:packages: and the packages listed in IMAGE_INSTALL
have to be kept in sync.

If they drift (change OCI_LAYERS but forget IMAGE_INSTALL or vice
versa), the build silently breaks at layer assembly time when the
missing package isn't in DEPLOY_DIR_IPK.

Two paths I'd consider, either as part of this series or as a follow-up:

  a) Add a "# KEEP IN SYNC WITH OCI_LAYERS" comment so the next
     maintainer knows.

  b) Better: derive IMAGE_INSTALL from OCI_LAYERS:packages: layers
     inside image-oci.bbclass, so the recipe only sets it once. That
     fixes the problem for every multi-layer recipe, not just python.

I've staged b) on master-next (shortly), if you can do a) .. or maybe
it isn't needed at all now.

We can do the same for all the other similar recipes in the series.

One more, also non-blocking =E2=80=94 the other 4 new image recipes in this
series (mosquitto, valkey, nginx, curl) all carry the
rootfs_fixup_var_volatile postprocess to create /var/volatile/{tmp,log}.

This one doesn't. Intentional because python doesn't touch /var/log? Or
worth adding for consistency in case someone runs as 'dev' and pip
wants a writable spot?

Bruce

