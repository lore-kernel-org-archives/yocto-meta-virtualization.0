Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C9BC4708D
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:53:14 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.30068.1670449990026046335
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 13:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ARj9gJfK;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id z9so8452620ilu.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 13:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7u2XrglQPJjHYnOBntoEXfyoGfV6BcXykCrIx7Ix5Y=;
        b=ARj9gJfKs9xFz7ZenrUWxZ0j/RJ+oqRM2wOU/0tCF7m1DJHmUhRGzY4Mqq3Ux4hHmb
         0aamMfQr4L0WCMCLBDSJXshJw2wytOjn9Hg/9nLdKk90YK1GSLR4Sp9hZVEfMKxVsZ9P
         4WGyhbwJ6u98mPxWVuWXwvbcTm2eslpZ7Xr/yq3901GMkVcdZn83adP8PNbE7Zxblo4J
         RJq0IH4qJH9exucVCsAsL8bihzO58T03iKAtQ68T+LB1ShD+ZO6wvJ0JPcWQ2m9IVS6/
         6RpEv9gDZUJjSYVXO3WkJgVlPaPTDMbchuVloh/DWGGOyz/gAemnLjpNRZwajLjp/OIg
         IbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7u2XrglQPJjHYnOBntoEXfyoGfV6BcXykCrIx7Ix5Y=;
        b=NF7YCxxJpgCNf0ucAru4nzGNsnJ3NNNb38ST4/jUSEU9BKpla6cIZuyEV3kiE/Osif
         SkkWXjk/7QDyO7oq92/Wyh72gW93AO57VdhbCSI2a+JKzQdNgdpIIcPbtu1GkSoCg3YP
         sT7//GqucXwZQTojpjq/WBxBkosbIYvCHb74Xtjw5NVs/VWkR4hbELBpMjlQEuuMQBpA
         cGQe66bGbHd4xbcjX/0RI2eZV7ZDoISFOk+o+9OTnDC+hkBFR0IqNw9UeGMEDQKIg1ej
         s6L9GAQg3kx7C4veL67IoUsOITfs2EmKOsoqxT0uNTcfF2u5ZHUvT0pbmnme1GBJJN25
         GxQw==
X-Gm-Message-State: ANoB5pnG9ZjWuk+783MxSwkqkV4y8l5f4DBIDvsR5pD2LhkhrGeiV5/Y
	1OJ1eAATJuhWONNzbOAsFrIPsu/WtCcaEdtvpL7EAv/y2XQ=
X-Google-Smtp-Source: AA0mqf7x81dgy9EAePDbCEgwz9ntJifdVSZmIBQhb2Tbcn97Qbtt05zde+QC4KgzPcxCrJJqsWLiuR9VCz/zk2N5veE=
X-Received: by 2002:a92:d34c:0:b0:303:2a4c:2912 with SMTP id
 a12-20020a92d34c000000b003032a4c2912mr16151052ilh.263.1670449989403; Wed, 07
 Dec 2022 13:53:09 -0800 (PST)
MIME-Version: 1.0
References: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
 <172CB2E0F08C4564.1705@lists.yoctoproject.org> <CADkTA4M=vRTm4Ty1Y1y_5Ehjb94Omk-MNeEFPtGZUsoS6xGsOw@mail.gmail.com>
 <75e9b925-a236-0809-49f1-f2f3cca0e263@axis.com> <CADkTA4PB0ntC1xpOnEgHK7eFiuyDEvvx9MpM=y=T2dBDd6s7Sw@mail.gmail.com>
 <dd323bc1-d1ac-ef32-7923-3b8f67fb19b5@axis.com>
In-Reply-To: <dd323bc1-d1ac-ef32-7923-3b8f67fb19b5@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Dec 2022 16:52:58 -0500
Message-ID: <CADkTA4M9jb3VyZA9j9_g7KvEy68doER3MiNybQE5i3t+VG5=tA@mail.gmail.com>
Subject: Re: [meta-virtualization] [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 21:53:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7749

On Mon, Dec 5, 2022 at 7:02 AM Joakim Roubert <joakim.roubert@axis.com> wro=
te:
>
> On 2022-12-02 14:11, Bruce Ashfield wrote:
> >
> > That being said, I've written multiple recipes like your follow up
> > patch, and I do prefer the clarity of everything being directly in the
> > SRC_URI.
>
> Excellent!
>
> On 2022-12-02 15:58, Bruce Ashfield wrote:
>  >
>  > I still can't reproduce the issue here, but everything still works
>  > with your patch on top .. so I've added it to the queue on
>  > master-next.
>
> Do you think it could be allowed to reach the kirkstone branch too?
>

I can do the cherry picks once I get master-next -> master ... which
is hopefully very soon.

Bruce

> BR,
>
> /Joakim
> --
> Joakim Roubert
> Senior Engineer
>
> Axis Communications AB
> Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> Fax: +46 46 13 61 30, www.axis.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7737): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7737
> Mute This Topic: https://lists.yoctoproject.org/mt/95382316/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

