Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web10.620.1591389070178914009
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 13:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RSJG2daS;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: persaur@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id l6so10958514ilo.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2020 13:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=jUGY96cjFy1mzqzFKulXx1NLE22XToq+Ulva2GmpCow=;
        b=RSJG2daSPMVuXX4CsqhALK1cMlKe1vpVgih9hXNeltQnN0PHc1lfSYSwGcG+Za2vyI
         Tjq9xBG67ok1W9bkGbZ3eTOQegWrMWoMBOESQGs88LhTF2Yfh4A1EXHIKxAor8wzDENE
         kxGc4OhNTM6FSJhIF4R/1B/QGH207wSdI8I1ut7gJTo685uMzcD0BsbLuB72B2xzYdkr
         TIbKqmVzAG4CdGMUq0zmsS8qXhTQ2sR756ES3IXgiN2+qGM87RF3jPVwFopRdOKaPsrJ
         oGTG/qHl9UfrZSgYrqz7/a46lRbDPlR5i7x+IJLrLHe3H4Lo6eiKCoTKgOknv6SeoJ/U
         qfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=jUGY96cjFy1mzqzFKulXx1NLE22XToq+Ulva2GmpCow=;
        b=nXzrCMlxlwRyy5mnzaNmX5WmvaREsM8mXQJBWnAKYUN6JShU5UtaOIu6RtvHhmGFSR
         bstm2xy7N+9OZmmPoQrceiVlDjkyiI+pg+Yrd+7Vu6LV4+1Cn6bFR0FPJgDEQi7vs9nU
         vwCFgg0EnwE7fbEwRGE7ky3T728JskBi9atm/jiZfO4E/zYdEsBtYpk5ClSQsxZ86yPs
         UWPuoJi2eSerpUFbqQ9j9tCTN2lMuzdPcty8Kz53UH8Wh8WbVYvrDEjKPz690a5xYqNj
         aVD32AJHj58EZPhCfmZ0Dqh9MuX3d69hmKqXm8geP+eHW3pp8h7z4bfqMHHGKBgv9TH2
         ppnQ==
X-Gm-Message-State: AOAM533xOGoeUpRdsaeGC0V1IJi8ufKftXV71T+n2FvriGKljcJuI7ZD
	B5toqzgrF6n4BPjYdVFfv1M=
X-Google-Smtp-Source: ABdhPJxF6w1JqsAeWMlxy5VyOcElXNdllsBuhiqOmIiYhioWTd4bvPufTG/DQR4woGO4iHEXSE9mIg==
X-Received: by 2002:a92:40d4:: with SMTP id d81mr9780816ill.120.1591389069596;
        Fri, 05 Jun 2020 13:31:09 -0700 (PDT)
Return-Path: <persaur@gmail.com>
Received: from [100.64.73.63] ([173.245.215.240])
        by smtp.gmail.com with ESMTPSA id v18sm2885643ilk.6.2020.06.05.13.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 13:31:08 -0700 (PDT)
From: "Rich Persaud" <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-virtualization] How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf.
Date: Fri, 5 Jun 2020 16:31:07 -0400
Message-Id: <A84953E0-C571-434D-B0BD-6B1C4D30345E@gmail.com>
References: <CADkTA4MC7ineV5KfEGGNOC35EMxvVLrbGUxHzp1ESpo4rxstAQ@mail.gmail.com>
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Siddhartha V <Siddhuvgowda.18695@gmail.com>,
 "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>,
 Corey Minyard <cminyard@mvista.com>
In-Reply-To: <CADkTA4MC7ineV5KfEGGNOC35EMxvVLrbGUxHzp1ESpo4rxstAQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: iPhone Mail (17F75)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Jun 5, 2020, at 15:20, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>=20
> =EF=BB=BFOn Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand
> <stewart.hildebrand@dornerworks.com> wrote:
>>=20
>>> On Thursday, June 4, 2020 5:13 PM, Christopher Clark wrote:
>>> Hello Siddhartha,
>>>=20
>>> I am also interested in running Xen on the Raspberry Pi 4. I hope to hav=
e time next week to be able to look into it.
>>>=20
>>> Christopher
>>>=20
>>>=20
>>>> On Jun 4, 2020, at 5:05 AM, Siddhartha V wrote:
>>>>=20
>>>> Hello dear meta-virtualization team,
>>>> I am building the xen minimal image using yocto warrior ("bitbake xen-i=
mage-minimal") by giving the target machine as "raspberrypi4".
>>=20
>> Corey Minyard created a layer for Xen on Raspberry Pi 4 here https://gith=
ub.com/MontaVista-OpenSourceTechnology/meta-raspberrypi-xen
>>=20
>=20
> Someone needs to lean on them to get patches submitted to meta-virt.
>=20
> Having a layer like that, with fixes missing from meta-virt, makes no sens=
e.
>=20
> Bruce

(cc Corey)

I think that layer was originally for xen management tools on RPi.  It has l=
ikely accumulated fixes that could be upstreamed to meta-raspberrypi or meta=
-virt, until those fixes are finalized in upstream Xen or Linux kernel.

Rich=
