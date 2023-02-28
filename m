Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19EEC7EE23
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 03:32:15 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.15358.1677555134057803504
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 19:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IRvn3STs;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id bf15so3519550iob.7
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Feb 2023 19:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAlJ4ZqS+D0UNQFWxlH+ICEh2tJZSO72MFwiX9gPni0=;
        b=IRvn3STs8VwMJk6m2cF0+mlHFckC++OCBJZmxQqp2dCfosO8WlxIWm4+O3M+x5bgo9
         tVEH7ykBimDmiChQtcYWgeRV5xX/6CuJgZWDUAgULYTuiKbN+W6bUErBFyFXiIzvx5DK
         M5SPmEsRIOGCczJbo8lWxd7GGv7ikQOw4WIJ6WF76XZUfo6Q+Jgs9DFfSnOMY/OxQBq2
         oslzvOC6ocEgXewjw8qi7H3aje6YKIkg0qjaxlXItk75iKtMjdxDwZ7MlDIeH5t/zCf7
         xH/S7d5YrXuPQHA0rtCG2x7Nyj27dpu+z6ndajl1ekcpXmrqCC/kjlq1SXXdmJupoxQW
         SMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAlJ4ZqS+D0UNQFWxlH+ICEh2tJZSO72MFwiX9gPni0=;
        b=2OmXH9q6jtXIRc1Z3FXlQVXbzrWdKG3847tyaQMHjAI5yaQAEYiOnYkKkNmafRjeCy
         2+r4EkBZRQ+PnpOHluxj2UE2OMxIqArsKYXyB1Cp5HAbKfzXreWnaKvVXfJNsLcCufoA
         FwwtYPvVrXNGoLitItNFU4gdOJUrgI7gDWj8zlWYVN0CIeJiy9zQrF2vA4d3n47mlEOg
         VZgBUAo1OyaXFb+y/vrJ6C8muhNKCEw934wVT6PCR04wRf36GnURbXpkINRrx8wiz+T+
         FP1gomjPCEQuCSBet0ma8aB6Rd1UcHZL1PqzlMF1esk9L1FgbPSNIb2IKFDwuz9hIt6d
         vvhw==
X-Gm-Message-State: AO0yUKVX3L9MvMFWLnpXA4LYdDStk1Fr7JagM1hP1DvhRDJmtR8yZX3V
	idpL3z9lWx1k+VG8H+dhrrWZpTRdQs5QSVc7zpw=
X-Google-Smtp-Source: AK7set+iUEJjvrr9vknZ6HW2EavIz8BNqNi2SJK9zHinp7kqrul0JXrMVo8S+IYQlw7EOh/CnfWFE1UTsiBFZXGXORs=
X-Received: by 2002:a5d:840d:0:b0:745:a41c:7c97 with SMTP id
 i13-20020a5d840d000000b00745a41c7c97mr644043ion.3.1677555133302; Mon, 27 Feb
 2023 19:32:13 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4Nne7FGt6twF9MeJ7BxhGwmPCM95840xSDJU_7WkpD6Zw@mail.gmail.com>
 <CANPvuRm=zfh+BeAQFxoQXSK3wuboVV=kAQmh44GoUyDqGyeQbw@mail.gmail.com> <1747DE9593C63FFC.22517@lists.yoctoproject.org>
In-Reply-To: <1747DE9593C63FFC.22517@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Feb 2023 22:32:02 -0500
Message-ID: <CADkTA4OPjbwqKmnjdOosJR5wDvkNQbQ_nbkJReLkD_5ah0jDyg@mail.gmail.com>
Subject: Re: [meta-virtualization] go breakage in master
To: bruce.ashfield@gmail.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>, meta-virtualization@lists.yoctoproject.org, 
	volodymyr.khoroz@foundries.io, Ricardo Salveti <ricardo@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Feb 2023 03:32:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7907

On Mon, Feb 27, 2023 at 10:15 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, Feb 27, 2023 at 6:01 PM Jose Quaresma <quaresma.jose@gmail.com> w=
rote:
> >
> > Hi Bruce,
> >
> > I have seen recently some weird issues on the crypto/elliptic that is d=
eprecated and replaced by crypto/ecdh on the 1.20 release [1].
> > It looks like the crypto/elliptic is now no more than a compatibility w=
rapper and the new crypto/ecdh don't implement the P-224 curves [2].
> >
> > Are you facing something like this?
>
> That is one of them, yes.
>
> By removing the sharedlink, I was able to get it to build again. I
> pushed a WIP patch to master-next just today.

My mistake, I pushed it to master.

So if you are still seeing this with a master from today, my fix isn't
holding and we need to look into it more.

Bruce

>
> Bruce
>
> >
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).Add
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).Add
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).CombinedMult
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).CombinedMult
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).Double
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).Double
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).IsOnCurve
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).IsOnCurve
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).Params
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).Params
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).ScalarBaseMult
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).ScalarBaseMult
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).ScalarMult
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).ScalarMult
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).Unmarshal
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).Unmarshal
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).UnmarshalCompressed
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).UnmarshalCompressed
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).normalizeScalar
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).normalizeScalar
> > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).pointFromAffine
> >
> > [1] https://tip.golang.org/doc/go1.20
> > [2] https://words.filippo.io/dispatches/go-1-20-cryptography
> >
> > Jose
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta, 23/02=
/2023 =C3=A0(s) 13:29:
> >>
> >> Just a heads up that some of the go applications are breaking in maste=
r.
> >>
> >> I'm aware of the issue, and have a general fix in progress.
> >>
> >> Bruce
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7906): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7906
> Mute This Topic: https://lists.yoctoproject.org/mt/97182310/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

