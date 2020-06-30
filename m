Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.17722.1593595392633046621
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 02:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@gmail.com header.s=20161025 header.b=ROKz/Pn3;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id n26so9839314ejx.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Jul 2020 02:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gnWvMQewC5dWqXYJaEzvgm+NagmbBLguY4jQBQnd4cI=;
        b=Cjk+I9QfCpth/4T8EF2AmPjeep1vNQZamW2WNDrllnsBDygtk6mTvvKVvREPSCZ08g
         38FZi1wZOm8VpZEZm2wN+YI5CNhprugP0nv0Tlj1ushUB9ab0OBkuJDViE5ognUcc+fE
         U6Hj/+IwWBUKtEQzxyRDPxsnsXaQzQylHE68wZ4WDgHdHBAJrv+wMGfqVW6QT2VMp662
         rn3x5vcBszBsm362bQNIGy6cqH6z8Js8hsd9Bzmu1vkM4EuItz6ir/kpAeGUcs6jCvB0
         OOSc+Qf/bXTy7eND9oKaUnprrpvE71q8fU5MdSr10EVF6fkDk1ttj6iVZpkiM1x8MO1h
         IGmw==
X-Gm-Message-State: AOAM530ICXIHWU/v1a9Qj9OT30wHQ1L5QgG3EdapoV0EKCUHW/QpDSyT
	C4/6K0ug8mGf/Ynhg9Mq+k9TonR3
X-Google-Smtp-Source: ABdhPJxHWRJCFYEB0MAgWXISIHbT0hovXIEhHLhIgkevpbtPn3QgVD0IjH5t4iW1uHpXYWQktLIsMg==
X-Received: by 2002:a17:906:a156:: with SMTP id bu22mr21469620ejb.322.1593595391021;
        Wed, 01 Jul 2020 02:23:11 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lv17sm4244712ejb.56.2020.07.01.02.23.10
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 02:23:10 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Bruce Ashfield <bruce.ashfield@gmail.com>
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Wed, 1 Jul 2020 11:23:10 +0200
Resent-Message-ID: <20200701092310.fnazd254q5vafzpj@jama>
Resent-To: meta-virtualization@lists.yoctoproject.org
Received: by 2002:aa7:c143:0:0:0:0:0 with SMTP id r3csp2618193edp;
        Tue, 30 Jun 2020 05:37:48 -0700 (PDT)
X-Received: by 2002:a50:cc8a:: with SMTP id q10mr23281921edi.257.1593520668032;
        Tue, 30 Jun 2020 05:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593520668; cv=none;
        d=google.com; s=arc-20160816;
        b=Qblft88VZi8EwiEiyF2Well7lthmBrjNaV8nHV/vTEedUlzN9gVkgP3mENI+4588Bb
         nvbWo7bPDO3bm7b8NugOqGI7fUsFTL94U0VFxd0LBrDOYdamvvS9UKPcpu+51luKw5As
         9oAKGaVtAJfNIyQoa4Nw35uwccYKdcIHOe6E7EUKlqvz7RMzylbAzYXXV4bO01DYD5xh
         7mcAcKtL/x1REwO47HOw806MpjhjRAJ5OdFM4ibE+hWoY5It+UZvWSMpIwkSmr2UCmn5
         s4LYSLeNTLS9q6TddO+FGmfSkpG+kYNw5T+hH7+woV/DKjwLSqto8IyzMdAh7exHumNJ
         8QmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gnWvMQewC5dWqXYJaEzvgm+NagmbBLguY4jQBQnd4cI=;
        b=lYlmjmdFGS3EMA7RhHzs3x5wQFQGhpdZxtfrVlEFcaOVmpKkOYhbooacVRI6oSW+M7
         CeDsKsTPYoc4rXWF2llETajCZKtWF4D2YyX7nypj16seuDjFd5jj6YOjcKkygCuwx+3B
         qMyniSEMYSu8FD+fwedspGR8D0Z5FrhVQy7Bx88ajDtI43xzXTHWPGlsP64PPNlMXGnM
         srwbmuJOoBIXhSpzmPqV5rHdWXOdEZHrM+51PS8Z3JsMa6s/14CcIlSVYm4GkxSk6bSc
         QgZT0wj17mdNqINtjsMFztjrBjzKoCMdKhoDhDWmX/d/bgOu3JzPfOkTX3e5FM7AnfKL
         8/DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="ROKz/Pn3";
       spf=pass (google.com: domain of bruce.ashfield@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bruce.ashfield@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y24sor3305952edm.3.2020.06.30.05.37.47
        (Google Transport Security);
        Tue, 30 Jun 2020 05:37:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of bruce.ashfield@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gnWvMQewC5dWqXYJaEzvgm+NagmbBLguY4jQBQnd4cI=;
        b=ROKz/Pn3cCONeIpMpJ60tYl8UdGRkXgiK35v/JleJifwU6r/pjWiLz77G1hh4Oxp0j
         N6NxWZY8NEKzsaBrMHro5dCx7EdvdMJ/gQ6ENi9Eq1Nxby9ufoO4Jir6kjxj7EfIqK+G
         h6zY73arns83CelN1z6YXzN8JlL9oG+RrPnmPs/Rf+ZfBWdtgf1Rxj3hDePPQOwLulWW
         AsAVWncApQsBbkkXCnthlERF4wKaFFif9adAeqmO4nBUthdkyyiIhlZgu/7GXLgzt+yV
         7GrrmnUINvwVPngu8QWu+9cupxbKOLxQDD2wwrS3/cenNTiMxMGdiP4d1ZvBpIQYxbbG
         jiFA==
X-Received: by 2002:a05:6402:1614:: with SMTP id f20mr21789192edv.129.1593520667487;
 Tue, 30 Jun 2020 05:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200626161705.32600-1-liu.ming50@gmail.com> <CA+chaQei6WPUNkN0OOkk+MxEsWmnPSkTBAnrUq9KLbXmx87y1g@mail.gmail.com>
 <161C28A10F0C0173.4849@lists.yoctoproject.org> <CADkTA4NCh2F1=-aX7zwOaZvEC1as-r7=s=+C3HoWNr7MwyGh=A@mail.gmail.com>
 <CA+chaQemwGtgKjGqbdnaeEVG7st0QoM3o1JwppiVFY=2Hx6D4A@mail.gmail.com>
 <161C29D35303F5F1.8018@lists.yoctoproject.org> <CADkTA4OGYEC2=wuMfY4adbn2V4oyH02oac_=TqCURZUuY=pkTA@mail.gmail.com>
 <CA+chaQejB_++EQN4SX_R1PfXGOb=HSpQy9EtOPQe4SxVDXDSUA@mail.gmail.com>
 <CADkTA4OfHD+tV1d920bkY0pp=+ArRVDUmBhAejySHOmmb7Zs9A@mail.gmail.com>
 <619B9396-3C30-422E-ADF6-06A05B7EB2F9@arm.com> <CADkTA4PDkvqZcktkx1+RY--zV5JWK1WmspuJdWQ_js+jjuOVRA@mail.gmail.com>
In-Reply-To: <CADkTA4PDkvqZcktkx1+RY--zV5JWK1WmspuJdWQ_js+jjuOVRA@mail.gmail.com>
Date: Tue, 30 Jun 2020 08:37:36 -0400
Message-ID: <CADkTA4M7kUqBGW52YWSK4+gQoH7n5P1Rdwd3RRENJXv_2YiVtA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-moby: update to v19.03.12
To: Ross Burton <Ross.Burton@arm.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Ming Liu <liu.ming50@gmail.com>, 
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <ming.liu@toradex.com>
X-TUID: CxrN+QLFaEgS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 8:30 AM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Mon, Jun 29, 2020 at 4:38 AM Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 29/06/2020, 03:48, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote=
:
> > >     Indeed that was the thing I was missing.
> > >
> > >     I've reproduced the error, and it is where I thought it was. I'll=
 poke
> > >     away at a fix while I listen to ELC during the day on Monday.
> >
> > Thanks Bruce.  Did I break anything, or did I just expose historical br=
eakage?
>
> As far as I can tell, a bit of both :D
>
> It shouldn't have broken it, but yet it did, without mass breakage
> everywhere else .. which means there's something funky with the
> structure of the recipes in meta-virt.

I wasn't able to put my finger on exactly what is the problem, but it
looks like the go-native-binary is somehow not able to find the
sysroot components and/or is making a different tune decision than the
one we build.

For example, I can find no evidence of the gnu/stubs-soft.h it is
looking for, all of the CC defines and tunes we have for the builds
are hard-fp, but yet it wanders off looking for that include. If I
specify hard-fp, it claims that the model/soc has no fpu .. and insert
a lot of different combinations after those attempts where you play
whack a mole with various other missing headers files.

I did find a thread on the mender support forum, that has the exact
same problem, with the same diagnosis:

https://hub.mender.io/t/go-error-occurred-by-attempting-to-build-mender-mas=
ter-branch-via-cross-compiling/1849/15

Does anyone have thoughts on this ?

Could we just blacklist 32 bit ARM and these recipes (docker and friends) ?

I will continue working on this, but I also won't hold the pending
upgrades much longer if I don't get a better understanding of why it
is going wrong today. (I was poking at the docker build itself since
it happily clobbers some of our settings and that could be why some of
my recipe changes aren't making it through).

Cheers,

Bruce

>
> Bruce
>
> >
> > Cheers,
> > Ross
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
