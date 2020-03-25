Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.10727.1585141766694218375
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 06:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qclc90Nk;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id w26so2238526edu.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Mar 2020 06:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qod2sY7H36RM1gjwEhxzFNTXhyBNQ29skv5jQWxYnsk=;
        b=Qclc90Nklex1VL3jk3i+/8bCBYC6KpamlEjR9Dp0NHwCE6AN/Yqse5/WUgD6kKPfBR
         WVf8jhqC+qv/lSKW/2PScbHTaNf2+rqpNxzjqphCfgll+36vyaIGbBB2XDxD2lC8vdmF
         8/VtTs8avquYk6CTb/lRkjo+l2Ql5TvXY1uD7RB/46GcjkSimLYUiwd4ZLFXUSnA76iG
         YFeUNKzuOwEtdDiVhM4mqGMm2+9Pi64H9k8jrHs4piKybBYeK0ZTuvhwumd/+b6mX50e
         GHsL+yv8TWetz5Yo4nDRiXKIOtn8AQqvMR//x/OZZShXKKJlhOjVjf0XUtsUi4IUjjdV
         zAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qod2sY7H36RM1gjwEhxzFNTXhyBNQ29skv5jQWxYnsk=;
        b=i8s/5hRomS/jQuVKAOucPrE6K+82U+RqJV+yxyHFtkL5tM8som6C8PDW/kYlK86XFc
         eHTuRdX/v97V5KiuePe9iwvJv0n1Xm54EVvccQw6zfmSU3K0ER8Ft/F9EwTrWAC/a3DI
         bXPFTk68W0YdmsL/Y6lcLKskSPsHHI7Ym5grSpz7o3DCQp8PMzlaitwzhGJQn7WjRLsY
         Q+Fb2rptB+8fp1jC196u4GsXq6lPxRqJu6uwXLemvUZIhYNL+mv01WPwS7F20z0oDgsk
         cqCmmVEHBljjIrqJaH04Ik7ZLSb+LJZirZjPSXJBv/j8iYUQFpw7SLTTd9HqGXe/QqTd
         ql1Q==
X-Gm-Message-State: ANhLgQ3KF4F1fk5n6m67W+08si+gb6t6jb8qGHB7YpHqwli0JIeZzKQc
	rmeUtIG9Ik2iMNBCGsbxdWhm4jia8elyL9zDjTQ=
X-Google-Smtp-Source: ADFU+vtiFyoFd9eYUN8psrGqgI4wTvqZLFaXr6+1IqdtHJM/m6748/O8tM/p0CkZurTnV51kOWURMvacahuaUjrZKIY=
X-Received: by 2002:a17:906:251a:: with SMTP id i26mr2857272ejb.233.1585141764921;
 Wed, 25 Mar 2020 06:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAE5JARmTU0siEsyQxW601h=A2e=aY64ZqnYCsN=OD0kupeeR1Q@mail.gmail.com>
 <CAE5JARkEA_NQnOL3ukKg4RA_AofQTA7JZ3MZhK7gb1F0cGEdeA@mail.gmail.com>
In-Reply-To: <CAE5JARkEA_NQnOL3ukKg4RA_AofQTA7JZ3MZhK7gb1F0cGEdeA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2020 09:09:13 -0400
Message-ID: <CADkTA4PiUe-jotSZqq2_pE+WzDE_Ak3RCrsH7Oc9Y8cEVw7=6A@mail.gmail.com>
Subject: Re: [meta-virtualization] consistency clarification for INITSCRIPT_NAME in docker-ce recipe
To: =?UTF-8?B?Q3Jpc3TDs3bDo28gQ29yZGVpcm8=?= <cristovao.cordeiro@sixsq.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 7:41 AM Crist=C3=B3v=C3=A3o Cordeiro
<cristovao.cordeiro@sixsq.com> wrote:
>
> Dear Bruce,
>
> I've been trying to build docker-ce with the meta-rapsberrrypi layer. I'=
ve appended "systemd" distro to my build. When doing `bitbake docker-ce` I =
get an error about
>
>
> update-rc.d: /home/ubuntu/os-raspberrypi/tmp/work/raspberrypi3-poky-linu=
x-gnueabi/core-image-base/1.0-r0/rootfs/etc/init.d/docker.init: file does n=
ot
>
>  exist
>
>
> After digging for a bit, I've traced this to the following lines:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/reci=
pes-containers/docker/docker-ce_git.bb?h=3Dzeus#n105 , where it states that=
 docker.init shall not be installed if systemd in DISTRO. That's ok.
>
> But then, in https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizat=
ion/tree/recipes-containers/docker/docker.inc?h=3Dzeus#n56 , INITSCRIPT_NAM=
E is set to docker.init cause sysvinit is also in DISTRO.
>
> Isn't this an inconsistency? Those two conditions should be similar IMO.=
 The only way to bypass this is to add DISTRO_FEATURES_BACKFILL_CONSIDERED =
=
=3D "sysvinit" to the build.
>

Last I checked, you need to have DISTRO_FEATURES_BACKFILL_CONSIDERED =3D
"sysvinit" to enable systemd. It still is in the example .conf files
that I see in master.  But it is possible, I missed a change that it
is no longer required.

So what you've ended up is with both init systems active at the same
time, and yes, I'm sure that it causing trouble. The check in question
has been there for some time, without issue, so there's definitely
something different in your config than most of the current users

FWIW: I don't know of many (any) sysvinit users and docker, so I'm
considering dropping the support completely.

Bruce


> Best regards,
>
> Cristovao
>=20



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
