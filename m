Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02623C7EE23
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 03:15:26 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.15073.1677554120047694521
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 19:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iyHSKm1G;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id b16so5583912iln.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Feb 2023 19:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTry2l3t2CXp4LxzKt1ubnDdpdVs5+W11hSBz/NQqaI=;
        b=iyHSKm1GbJXtFlnh1WHdwvSdDe5SrPOmCaV1MYE2mzyXZOy/iNIjg0UdIeNblkLbCA
         Lio21aNpJumguYtgPF744oFS27DhlxouXxDpvaeZGdw8h7s5e9xEcddxZzyi5gSeHyuC
         gAfNjaPeIp+DdF9sZU0w3j3fTMjia4QyN9dDqnDVA8E9WLWuMNdvu7WmPORhwrpSp7WE
         m26I4QZoWxQTVp4lCaIh/qwLtHjMo7hWJgXccY7RioBpRIUM3uDhNPbnVhlwC+zC+/dr
         CHk/H9W6MOrP3xreQKbuLPiqRuBn0b9mHLMHVcVRLU4BB6XYJqXlEWIwJbEZP7MWaaWz
         uFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTry2l3t2CXp4LxzKt1ubnDdpdVs5+W11hSBz/NQqaI=;
        b=oxqHALgsfnr0TRTFXroJr+E8CYg1E1I46jAOKWgrTpTBevw5G+QtdRh+SAkq0MDcBu
         De7vsR7+pJ+Pnw9Byu9xO3floMppOA1Zxjdu6maTNYgUHoXBTQh3u8SW0pHvxie0pv3U
         7bc79TjT/IXVKYjIxNKdI1Jbo68kH6wNjf+gDSq33aQK854hRvTuXKJySUZBZ8ea/gow
         gNsVxh2OTWsClssqTIXXb0qZH/gLU/K5GZCVFTMh8vWMWWb3lsRsqu1PBzxcQ3eQI9RS
         iWChlixxDvmWAJwPV5pey/3kpL7JKuvIL2jYR9wV4v5Iy80rqsFrmMMZLby9Xaal6N+K
         IViQ==
X-Gm-Message-State: AO0yUKXO7JnB20ILyql9JfjJcGerIHaqb2+FXUo8enj8BINBaQWBNXfJ
	mz6zERQGV+qJwpG5BYajqPhbh8e3uramPcXPF/s=
X-Google-Smtp-Source: AK7set+ANnOUriKepUwzmMmiEL2kXFfxIPoqSVWMnEFqDlV1zCREFAqvmCx/VMoLuaO7s/fYSkMjRl2kqVB234IdCok=
X-Received: by 2002:a92:c269:0:b0:315:7a34:224 with SMTP id
 h9-20020a92c269000000b003157a340224mr7284401ild.3.1677554119257; Mon, 27 Feb
 2023 19:15:19 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4Nne7FGt6twF9MeJ7BxhGwmPCM95840xSDJU_7WkpD6Zw@mail.gmail.com>
 <CANPvuRm=zfh+BeAQFxoQXSK3wuboVV=kAQmh44GoUyDqGyeQbw@mail.gmail.com>
In-Reply-To: <CANPvuRm=zfh+BeAQFxoQXSK3wuboVV=kAQmh44GoUyDqGyeQbw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Feb 2023 22:15:09 -0500
Message-ID: <CADkTA4Pf4VqGjvrgjgxN84DkZRtDWnKoyfkPeozY3ctcxVC_jQ@mail.gmail.com>
Subject: Re: [meta-virtualization] go breakage in master
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, volodymyr.khoroz@foundries.io, 
	Ricardo Salveti <ricardo@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Feb 2023 03:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7906

On Mon, Feb 27, 2023 at 6:01 PM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
> Hi Bruce,
>
> I have seen recently some weird issues on the crypto/elliptic that is dep=
recated and replaced by crypto/ecdh on the 1.20 release [1].
> It looks like the crypto/elliptic is now no more than a compatibility wra=
pper and the new crypto/ecdh don't implement the P-224 curves [2].
>
> Are you facing something like this?

That is one of them, yes.

By removing the sharedlink, I was able to get it to build again. I
pushed a WIP patch to master-next just today.

Bruce

>
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).Add
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).Add
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).CombinedMult
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).CombinedMult
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).Double
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).Double
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).IsOnCurve
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).IsOnCurve
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).Params
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).Params
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).ScalarBaseMult
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).ScalarBaseMult
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).ScalarMult
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).ScalarMult
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).Unmarshal
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).Unmarshal
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).UnmarshalCompressed
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).UnmarshalCompressed
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).normalizeScalar
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).normalizeScalar
> type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).pointFromAffine
>
> [1] https://tip.golang.org/doc/go1.20
> [2] https://words.filippo.io/dispatches/go-1-20-cryptography
>
> Jose
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta, 23/02/2=
023 =C3=A0(s) 13:29:
>>
>> Just a heads up that some of the go applications are breaking in master.
>>
>> I'm aware of the issue, and have a general fix in progress.
>>
>> Bruce
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7896): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/7896
>> Mute This Topic: https://lists.yoctoproject.org/mt/97182310/5052612
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/=
11553848/5052612/94736074/xyzzy [quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

