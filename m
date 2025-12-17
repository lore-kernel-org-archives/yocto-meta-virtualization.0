Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1564CD65C48
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 13:27:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14842.1765978031198536733
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 05:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SRxffbH0;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so3748838a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 05:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765978030; x=1766582830; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3hytwannLXzATg9sXHoIHrqicvh2NHA8QMKL32bchI=;
        b=SRxffbH0aX9VPoOA7lNrLFHI3RU1Zo6sN71dXK1+RixoWzR4OZ2GL/rM9ASI2xoT7z
         I/d6JqskQAOKA2WUa9VYgcQnn3BbNv2cbqGErqZiLaR4pVBTWXsI9EzOwM7c7Kx6U0gX
         k5Z1CdW937LknTPr8KyWE5d1oNJNgnaNymSxU8AI1JI9o1PlngPdo4IzYr72kGGqRYt2
         cXbYrv6dxRP9HBgR1NBXTZGxwmOEZVFw5c/cVUISHr+Rzo3u6S1NBcYEwpFPEU6SD0kN
         miIBZ/KVuhyu1Py8ssQurJtka2XiV/4FuqlGY1mYz1GXJ1VlDq1iJoYLHbYvsLE5rIGt
         PvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978030; x=1766582830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3hytwannLXzATg9sXHoIHrqicvh2NHA8QMKL32bchI=;
        b=XgA+QEirrwWoQofduh11FRG1aSTHShnhQgnycaBAbQ0+FNFfxfX6oBLv5hb+kUOfor
         gMOJuV2jhYQIwpPTFCkz6oDez/+fLaEeD5jq0F19WxjQBO4YWPtFwvYWpFwt/N1x3RWs
         jFtU5AEo4O+BR3Vtfq7i6LPtB1zSWyujcfc1nrXD/CQz08kDDXzTIoOH+3KXnE6ynGxh
         ZwCKibxDTiPKAtm0PjVR0zV3CzOhY+NgvugsqOV6Rc+ah3kqkm/o6AW2cHy1jppXWl60
         Cn4oYpKbmC8lp5PWlE+9ciTHAgNY+5Z1ZEHlH4DmU00RLd8b+2kiKMoeZfC0afDg6li6
         UhwA==
X-Gm-Message-State: AOJu0YxiRTqTRVOecjs33Cmlsgq04mYD2qawxcwLyKEtNwCKZh5wNopX
	ANe8dh4WgF1xT4Xi9blZ58ZL4P3DbTAYSUQ4t601cJe5eyoborG2Sm8hrFl6zm6KLyyUAcm0h+v
	sAH7bWNM/3xN2+QiwJX1i/FNVwaCqCr8=
X-Gm-Gg: AY/fxX7RZ9uQEudPSmSQiXwgwbMWSrvzvGgDf6bDi3fNwiBMjonwmQAyGFtQSF6AJhN
	anqgaK+D0lz0gNdaImoLjnyPV1yajdKNeL/aV8i8YW20WF0X1mNg97Xn0cIvkxy8VCNrYXJvJML
	UGuilJMsA7ihDoPdz3kuosIgUX9rxi/aZH4CM7zCQ5/Cn4w/pYu3HFBrINZpDMK/CSQKQZOEoGy
	l25hNPayZAO7nKDtEsvnKDmgWPy+Qvd67557fWCHG7wcZzsQkmquAWJzMWLAfPzbXnkztg6
X-Google-Smtp-Source: AGHT+IG4v553USYEBw7l4e0ryOdbx2+Eb02kobxGfW5BnnQpIfik+uxMKPjgLgydeAYjHc3wwAU50Dr6UQhdLDhCZNM=
X-Received: by 2002:a17:90b:2fc8:b0:330:bca5:13d9 with SMTP id
 98e67ed59e1d1-34abd827162mr15147477a91.32.1765978030389; Wed, 17 Dec 2025
 05:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20251217092132.18256-1-paul.leguendekerneizon@savoirfairelinux.com>
In-Reply-To: <20251217092132.18256-1-paul.leguendekerneizon@savoirfairelinux.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 17 Dec 2025 08:26:58 -0500
X-Gm-Features: AQt7F2rssYO93NW0NVKZV3092tHesXiwQc-0BusG7vzqtexCKtJES6MvESXTQ5c
Message-ID: <CADkTA4Prr_u7grQ_9DWF183LDka+2nu2yGdpYeA1XC4rWkaCRw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/1] add support of cockpit-machines
To: paul.leguendekerneizon@savoirfairelinux.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Dec 2025 13:27:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9490

On Wed, Dec 17, 2025 at 4:21=E2=80=AFAM Paul Le Guen de Kerneizon via
lists.yoctoproject.org
<paul.leguendekerneizon=3Dsavoirfairelinux.com@lists.yoctoproject.org>
wrote:
>
> Hello community,
>
> Since version 242 of Cockpit package, plugin `cockpit-machines` has been =
moved
> to a dedicated repository. This cockpit plugin is used to manage in web U=
I
> virtual machines. There is currently no support of the new cockpit-machin=
es
> package in any Yocto meta and the following patch bring it.
> This recipe is suggested to be added in the meta-virtualization in
> order to fulfill the needed dependencies on `virt-manager` and
> `libvirt-dbus` recipes.

Hi Paul,

Thanks for the contribution!

The recipe itself is simple enough, so no concerns there.

The medium sized question is the dependency on cockpit, which is
maintained in meta-webserver (from the check I just did on the layer
index).

meta-webserver is currently in the layer conf file in the
LAYERRECOMMENDS_virtualization-layer variable (but not mentioned
in the README.md .. I can fix that part though). So we do already have
recipes in meta-virt that need meta-webserver. I'm just pondering whether
adding this bumps it up to LAYERDEPENDS_virtualization-layer.

I think we can still hold off on that, but it would be nice to put a commen=
t
above LAYERRECOMMENDS_virtualization-layer to indicate that this
package also required meta-webserver

The next question is: can you put a description of how someone would
test / use the package into the commit message ? Nothing elaborate, but
just something to help me later when I'm potentially upreving it.

Last question .. the recipe excludes musl (fine with me), but are there
any arch considerations ? I don't think there should be given how it is
configured and built and the description, but if there are, we should just
restrict it up front versus someone asking questions about riscv64 later :)

Cheers,

Bruce


>
> Waiting for your review, feel free to ask any questions or remarks.
> Regards,
> Paul Le Guen de Kerneizon, Savoir-faire Linux
>
> Paul Le Guen de Kerneizon (1):
>   cockpit-machines: add recipe
>
>  .../cockpit-machines/cockpit-machines_346.bb  | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 recipes-extended/cockpit-machines/cockpit-machines_34=
6.bb
>
> --
> 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9488): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9488
> Mute This Topic: https://lists.yoctoproject.org/mt/116824038/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

