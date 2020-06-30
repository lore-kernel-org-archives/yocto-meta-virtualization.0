Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.17533.1593595396303132804
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 02:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@gmail.com header.s=20161025 header.b=AoHV66yQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id b15so18972539edy.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Jul 2020 02:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=40YdKNTX87bg0bLdWlWLxB9Jjm7D/o3p9eHKkrJ9v64=;
        b=GY8G6mY6WYcCB98sHZkYbAGr4C8NpV8lygXZp2MxHCRDoYoCLYJIYzHD7z15GJHwa0
         mlan0Lviyo/UlVamFkXZMWsFdRTMI3zd0e2vncjgwvkJXXw/Fz5xvJ9TRvBuohmBKCrl
         8SlK0Ii+1roJw+985Ku3fHRmsVxKzsHzQTneh9a+fKQgbainX5uW+hG7vUwVqxqKREqc
         3IgAqOkzdcHbmCoT51C3EESw5tpBRcIchNyEi9im6d2B152+24ICdAJssRdj/WTlnsYd
         PfS2MM4QL+inrNYTNgptHUqY/svjeBAolDfSUx2U7f1tEl3r5hXb/Fg8CxZF8vey88mY
         QSFg==
X-Gm-Message-State: AOAM5304UIKza6eE0RHhukMCLRJyfila9hHv7ETGFBtv/7tZpTbp3xUe
	ar6HJDS91jJDa9tGa2Lf+J7yu+L3
X-Google-Smtp-Source: ABdhPJzRZiGpKK/v5vcFDUe7kXtGrIC2sn0RxhNwBd//wYT72RXQV54Sv95I2Sji8Ra2H6oRV0QOHg==
X-Received: by 2002:aa7:c31a:: with SMTP id l26mr26860034edq.61.1593595394616;
        Wed, 01 Jul 2020 02:23:14 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w18sm5912003edv.11.2020.07.01.02.23.14
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:23:14 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Bruce Ashfield <bruce.ashfield@gmail.com>
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Wed, 1 Jul 2020 11:23:13 +0200
Resent-Message-ID: <20200701092313.3gt37qqv4s435d2z@jama>
Resent-To: meta-virtualization@lists.yoctoproject.org
Received: by 2002:aa7:c143:0:0:0:0:0 with SMTP id r3csp2624841edp;
        Tue, 30 Jun 2020 05:47:52 -0700 (PDT)
X-Received: by 2002:a05:6402:3113:: with SMTP id dc19mr21710602edb.20.1593521272582;
        Tue, 30 Jun 2020 05:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593521272; cv=none;
        d=google.com; s=arc-20160816;
        b=jfB4E42PaZNDoTvcRDgu2YON4bni15NmCnKCOe9Ll2Cdl4huVXTbNkz0JcfhY9FZMX
         MxgqQgzS0PobVwsCK/nNWVCuLnaENnxweI0B3VOyc4HFI+NOpyaYMX1FUQDDi27GgdiH
         CVJcI/UMQCH9rwPkUVJ2k9Mos1yRKE/1PaQrbs8UFJQU8babmGpuaZ9G5Zp6gVc2WgkQ
         nEkkt1fcLTJJNkzr8x2qJ548ggt3cJn9JpxsA528wKEneQ5lgzRdqUio7rtLgb0FJerL
         Dbh7+x2HjocU/oioR13u2OYZ4HsCR9UvcsGCR2xa27NkvUtmdt5ihRVbrZNcUtTCivZA
         sbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=40YdKNTX87bg0bLdWlWLxB9Jjm7D/o3p9eHKkrJ9v64=;
        b=sKyAXlyDyO/7E6Z/xxKNbf7AR66sKM+sl3co34eNt7rPxF/DjxbmQQKoA85Hk2kZ7K
         xVIMH+vOvq+okGlvyzhwDi8ffG3hL935MZEMkoSjNrkVV098+rKG/pwz5d99PG0vUeVn
         fHGfwOO7yATI+f46MZNK/MvCtY60VLzxZ3ivaDO35D5DyFJ6rk3K3XHDydlb6OcYz6sa
         Ecy8CBU7Dkp4CibZmMP6YQfsYTrhBKXYkg8LnZnSYl8wvw1oTkMQzIIlnPVsDsXOKSr/
         ozeYm1TaMVjqpzR1jsXXRo2+wwLs/dva/dPbRQBVpXqKtwWXvWIHAby4NRgr8Yu/BZe/
         7m7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AoHV66yQ;
       spf=pass (google.com: domain of bruce.ashfield@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bruce.ashfield@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id cx5sor3312575edb.7.2020.06.30.05.47.52
        (Google Transport Security);
        Tue, 30 Jun 2020 05:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of bruce.ashfield@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=40YdKNTX87bg0bLdWlWLxB9Jjm7D/o3p9eHKkrJ9v64=;
        b=AoHV66yQw+qFjErPmFlz8eGXhxM4UL3LdnhRWDEUnmxpUfbWdbhH6u/0ihtvCSj86w
         Ufs2Z80DlJybXAHFOaZS2zI0/F83p+y14WQTHne4MNi1Qg7wsKYtU/N407UrEAv3C00c
         tyXOm2DQtpRo4xRJOJ2oOuU78CHy3g19Fi7Twc48uZ4KWAM9pppCH+ygV1YOU7PZ3X8p
         5HaiTCxK0LmpO5eSNKmzLWiJF2ItMI8VKgwWQIgPejsP5PgbgyCf6NYys6sw85gNb/Zi
         gdo4knQiOpFk7vcIbmPv/ZfglR7gbNmz8J6GO4JSXsDigTJDI5N/dYwa1legwFFsg7fo
         7z9w==
X-Received: by 2002:a05:6402:1614:: with SMTP id f20mr21832974edv.129.1593521272038;
 Tue, 30 Jun 2020 05:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200626161705.32600-1-liu.ming50@gmail.com> <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
 <161C28A10F0C0173.4849@lists.yoctoproject.org> <CADkTA4NCh2F1=-aX7zwOaZvEC1as-r7=s=+C3HoWNr7MwyGh=A@mail.gmail.com>
 <CA+chaQemwGtgKjGqbdnaeEVG7st0QoM3o1JwppiVFY=2Hx6D4A@mail.gmail.com>
 <161C29D35303F5F1.8018@lists.yoctoproject.org> <CADkTA4OGYEC2=wuMfY4adbn2V4oyH02oac_=TqCURZUuY=pkTA@mail.gmail.com>
 <CA+chaQejB_++EQN4SX_R1PfXGOb=HSpQy9EtOPQe4SxVDXDSUA@mail.gmail.com>
 <CADkTA4OfHD+tV1d920bkY0pp=+ArRVDUmBhAejySHOmmb7Zs9A@mail.gmail.com>
 <619B9396-3C30-422E-ADF6-06A05B7EB2F9@arm.com> <CADkTA4PDkvqZcktkx1+RY--zV5JWK1WmspuJdWQ_js+jjuOVRA@mail.gmail.com>
 <CADkTA4M7kUqBGW52YWSK4+gQoH7n5P1Rdwd3RRENJXv_2YiVtA@mail.gmail.com> <CA+chaQdAqpF=uOCdnXVqUghMRtNj9NtweLf+NwPZG5vaq+PfLw@mail.gmail.com>
In-Reply-To: <CA+chaQdAqpF=uOCdnXVqUghMRtNj9NtweLf+NwPZG5vaq+PfLw@mail.gmail.com>
Date: Tue, 30 Jun 2020 08:47:41 -0400
Message-ID: <CADkTA4OxzRm6siKyqxxqdHSF+gwrQfcG-g3cYWCVYBezgvubQg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, Ming Liu <liu.ming50@gmail.com>, 
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <ming.liu@toradex.com>
X-TUID: BETAxAfPK1A9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 8:44 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> Hi,
>
> thanks for working on this. I'm still don't know anything about golang in=
 OE, but from earlier post from Ross:
> https://lists.openembedded.org/g/openembedded-core/message/139437?p=3D,,,=
20,0,0,0::Created,,go,20,2,40,74838027
> it sounds like these recipes shouldn't be using go-native-binary, but go-=
cross-${TUNE_PKGARCH} which isn't prebuilt and will probably point to the r=
ight header files in OE sysroot.

I was thinking that as well, but wasn't sure if I'd be switching some
sort of default that is really a distro decision.

I'll poke at that angle, and if it is just a recipe depends I can use,
I'll go that route.

Bruce

>
> Regards,
>
> On Tue, Jun 30, 2020 at 2:37 PM Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
>>
>> On Mon, Jun 29, 2020 at 8:30 AM Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
>> >
>> > On Mon, Jun 29, 2020 at 4:38 AM Ross Burton <Ross.Burton@arm.com> wrot=
e:
>> > >
>> > > On 29/06/2020, 03:48, "Bruce Ashfield" <bruce.ashfield@gmail.com> wr=
ote:
>> > > >     Indeed that was the thing I was missing.
>> > > >
>> > > >     I've reproduced the error, and it is where I thought it was. I=
'll poke
>> > > >     away at a fix while I listen to ELC during the day on Monday.
>> > >
>> > > Thanks Bruce.  Did I break anything, or did I just expose historical=
 breakage?
>> >
>> > As far as I can tell, a bit of both :D
>> >
>> > It shouldn't have broken it, but yet it did, without mass breakage
>> > everywhere else .. which means there's something funky with the
>> > structure of the recipes in meta-virt.
>>
>> I wasn't able to put my finger on exactly what is the problem, but it
>> looks like the go-native-binary is somehow not able to find the
>> sysroot components and/or is making a different tune decision than the
>> one we build.
>>
>> For example, I can find no evidence of the gnu/stubs-soft.h it is
>> looking for, all of the CC defines and tunes we have for the builds
>> are hard-fp, but yet it wanders off looking for that include. If I
>> specify hard-fp, it claims that the model/soc has no fpu .. and insert
>> a lot of different combinations after those attempts where you play
>> whack a mole with various other missing headers files.
>>
>> I did find a thread on the mender support forum, that has the exact
>> same problem, with the same diagnosis:
>>
>> https://hub.mender.io/t/go-error-occurred-by-attempting-to-build-mender-=
master-branch-via-cross-compiling/1849/15
>>
>> Does anyone have thoughts on this ?
>>
>> Could we just blacklist 32 bit ARM and these recipes (docker and friends=
) ?
>>
>> I will continue working on this, but I also won't hold the pending
>> upgrades much longer if I don't get a better understanding of why it
>> is going wrong today. (I was poking at the docker build itself since
>> it happily clobbers some of our settings and that could be why some of
>> my recipe changes aren't making it through).
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Bruce
>> >
>> > >
>> > > Cheers,
>> > > Ross
>> > >
>> > > IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
>> >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
