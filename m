Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA276E92726
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 01:21:21 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17581.1766884879186045487
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 Dec 2025 17:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QHg8NKIg;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c71f462d2so8661644a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 Dec 2025 17:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766884878; x=1767489678; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X1YU8+a7Pi8y1PHrKFkswxIf7u+7pdSmldPKhhHLL8=;
        b=QHg8NKIgbK+3IUgK/72zhds3BWTv794edDz7R6Mpgjzfd0fhVshSM0jDuktQSGcCen
         haQG+QziDknTSBUltIFspqBLmCsW1zj/oObMVdTLX6QlcyvDImTvPm38zAMHwFQYlaEG
         jo8oxARbAex7cUWPumdz9Iw3ROUIHxtsNFBZgQAxoe9dyPxkI+b7wk33PPLcblOdRBJS
         OjFs8r2cOiOjKOJc9vBhiD3ar1TBqVqb5E5BiWkwbLBl/QKroJ2PXbrjW35U8X3hDQWU
         8m3hR+rtkOmCvAitEN3G3MuNVKFM1N+ithAUjqTiMo5INNLQ6Axy+NfV/oEVaV3FfDDL
         H0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766884878; x=1767489678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1X1YU8+a7Pi8y1PHrKFkswxIf7u+7pdSmldPKhhHLL8=;
        b=w9YkxNj1eUNH1KrKPy2m1qF5VDSko/dSSiH+5KmzvZXqGVoF0jpEVIE7PS9jcvpy7k
         iBAbfbexddsqjCiE7yQCVfIb28T+C+M0FYYZMk5cMDNXiQC+PfAmP2Li+W40eaRepDnw
         c/4AaS9teR+3ev7a7qD0kBLTbl/myih7hZe/lF7IpPNX3511UEG2GEQGoifngZa/Nq22
         lL7mkKar7U98oebfaSi2FA3G4sQP1yV0MdloBoxKMVhHd6UmS9VixWd6SoWOLf9tiRFm
         yCOtj1l9G0nCZD0BgJzE5AfBdTPvQrKO99FPnaMX3XV/zMpHP/H5/zpwdFnxT+Pxqj6p
         Pq8g==
X-Forwarded-Encrypted: i=1; AJvYcCXrOdXH88wubcfWm80Bmbo/mpPGBVMjRWKG87b3JeQPFs7Mhse0KOnaNyDKJlo4ZUUBqM24oa/Nww2BABrk5KEAenkE@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yzb8fBxI0NI+WG2IJdYgJ4CTNeaOL/5xDEjlzi7RFAZuiC+h68M
	0NPE3+4Oju9ovqeBTEDo3pTTnXNTZsa/RtVltj62Xfs/boqNnuLKLFjx8HUn3/EqU8HFhi9Qb9w
	7m2bgWZmA2HKyWiUc9+9jdTGvj3qbSj0=
X-Gm-Gg: AY/fxX6Xl4cnBfllVVfYpxDcj0Q31lJMD1hAvdKTpb5ELqF2C/IC6t+Q0ebCqZutDAU
	YDwKbEBgDYDkF6bknOPcZbAVobADD5zOapYf7gqP5lqkMQoGQDeHtfPFybJwOh6vFiW1y4pG+41
	NjCsCRh+6xACmQNtTaeQpC5fCRg/2ZEax63WifWGvw9zeGPyAks6J9HhiwUluTts9WSjcEp3BQ6
	KNdEFIaCZwC2Udi0tk1XArr/wMgxEKz+8HUYv3K2uLVKltGiVeOxsAtPiWJrXLvW3D56wc1AKmD
	p/x/
X-Google-Smtp-Source: AGHT+IGGyLv0dyiLdY4ix7eDqEJnRCyOT8D4hU0UaaRu/HI5e2/jXi5xu7ZKbReWL7cWp+D9qC16A40k7zRhma36Pic=
X-Received: by 2002:a17:90b:2f05:b0:343:a631:28b1 with SMTP id
 98e67ed59e1d1-34e9214e781mr26974815a91.16.1766884878616; Sat, 27 Dec 2025
 17:21:18 -0800 (PST)
MIME-Version: 1.0
References: <3pakbkmf474bma2anwabz4e6t674vsqr6lpksnqy3ix6d33i7e@4lrzjpkmt6kw> <18853C3B26E55FCF.1706869@lists.yoctoproject.org>
In-Reply-To: <18853C3B26E55FCF.1706869@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 27 Dec 2025 20:21:07 -0500
X-Gm-Features: AQt7F2qgvqAdkham03aft_VctBLpUys1A3FVlvv3mGDItAL37JMJ7jZzsAQWT_U
Message-ID: <CADkTA4MvRWxn3OhQnEAsJ5W6jneZks=3PE0T=WijYw=EGLoJ5g@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl fails in rm_work
To: bruce.ashfield@gmail.com
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Dec 2025 01:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9507

On Sat, Dec 27, 2025 at 9:17=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Sat, Dec 27, 2025 at 7:37=E2=80=AFPM Dmitry Baryshkov via
> lists.yoctoproject.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:
> >
> > Hello,
> >
> > Our builds stopped to work because the updated nerdctl recipe fails to
> > remove the sources in do_rm_work, because all the source files now have
> > 0444 permissions (0555 for the directories). Could you possibly take a
> > look and fix that?
>
> I don't run with rm work enabled, but there are functions that deal with
> permissions.
>
> I'd recommend looking at the classes and what they are doing and why
> it might not be firing (or finding a non rm-work use case), as
> I'm still working on release items and won't be switching / using / testi=
ng
> rm_work any time soon.

I have started a few build cycles on nerdctl here since I'm waiting for
some long running tests. If I can reproduce an issue (I had many while
developing the new feature), I'll follow up and throw together a fix.

Bruce

>
> Cheers,
>
> Bruce
>
> >
> > --
> > With best wishes
> > Dmitry
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9506): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9506
> Mute This Topic: https://lists.yoctoproject.org/mt/116966533/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

