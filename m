Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.6809.1593175304360344146
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 05:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=si3XJKsB;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id d16so152784edz.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jun 2020 05:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9hxxGxjVRH00PROwAHQ2s5JVJ+sf/CvqSoHX0I43UY=;
        b=si3XJKsBBj6Dhn/+4Ij77R+r11RWVwTunJXjX23gO9lujZT1QmjH/EJf5xcLpWa5aI
         uezrlOmCmHlw1NyTjzZ2x/VU1lgf4k2fHMkVVve72b854chOlNMJYt9Y3/jfGY5IV0Xu
         DFyqPqN29pbFu6OPWf5zCARKOUpHsOIt2Ojh2w/TFfhy2rp6lt+U5vAbMwTaj0OKFK/M
         VuFn73KcJNUi2WFZsJ/fkUlLRAM4OOjOfmnQL9nCZ6hcxqb+bosu/s8pNKDYFMLiDVbt
         g/CGsERz0F5dCPv1XDBOt7n/F1sNxHbhAEGpx+91b7u99UDhJbpA4KMY5G41nixRR6Qn
         sMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9hxxGxjVRH00PROwAHQ2s5JVJ+sf/CvqSoHX0I43UY=;
        b=BFrWtpZJ5PETw9epuSlWErTo+HDow8fdHDiE48hThOTJaLakTy2CzR13M/OBaTPj80
         nykSustkBkANyXjPE9JFE7D6Ub8VgeAKPd60q+jg24/Y1aAZVpWkRs362wocPh5baXfu
         ZMvWmpCxyFvf/uzjUiSPya5iqAaVaUrNMujPhHtMfGReh2dJ+4xbsowyggYWPW8K4sre
         JNPpOYtVaRGzf57rkEfYM9ovyjVwqI9EWsYtZcnZMyRa62cbWrJB2/w03MFCDZpKJtjD
         W3AKs+MiOrIhZdDynW/uh0eeeaZ4kwOyFciFhRDChjJ2Z5pNoFmWBrNci5QnBWNnZ7Zs
         LR+A==
X-Gm-Message-State: AOAM530WJJRrxEHMIFHLuqE5rxHjA8YL5qlJVWavKp2m+Ir3UckNghEP
	4jsVjkcXtvZZhj0M92Fm8nX5PHZPehct1EIGJRo=
X-Google-Smtp-Source: ABdhPJxTHO1kcNRQWQY4kXhJR6j9X/jsQKw24ujIsd34+wa+/1lRW26HaKkVXLsA2Ht8rHxuvggDEjOAQUMEindkkRQ=
X-Received: by 2002:aa7:db11:: with SMTP id t17mr3002325eds.365.1593175302814;
 Fri, 26 Jun 2020 05:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4Mt2z0czzJXuk7-S3XnGpCSwmMwG78fO3xV0KxrJWd_jQ@mail.gmail.com>
 <23596.1593145500118149399@lists.yoctoproject.org> <CACMJ4GZO22Cu1QbLrNdBrZdf7pguopmvsOPTpmPnbygXytOGgQ@mail.gmail.com>
In-Reply-To: <CACMJ4GZO22Cu1QbLrNdBrZdf7pguopmvsOPTpmPnbygXytOGgQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 26 Jun 2020 08:41:31 -0400
Message-ID: <CADkTA4M45LUymcpPiMx=LxRq+5-RQuSVoajVzL4Jw=jUNJ_5EQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 00/10] Xen on Raspberry Pi 4
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Ashishx88 <ashish.emailaddress@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 26, 2020 at 3:14 AM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Thu, Jun 25, 2020 at 9:25 PM Ashishx88 <ashish.emailaddress@gmail.com> wrote:
> >
> >  Hi Christopher / Bruce ,
> >
> > I have rpi-4 setup & would like to do an smoke test.
> > I am starting with meta-virtualization & if you help me with below query :-
> > 1) Should i try with (dunfell) branch for repo of poky , meta-openembedded , meta-virtualization , meta-raspberrypi
>
> I've been working with local checkouts from the main development
> branch of each repo, ie. a copy of master, not from a release branch
> such as dunfell. I suggest testing with these revisions:
>
> poky: 18b6b2ae819cbf0ef3858944b4cd02ab74df6607
> meta-openembedded: 463f9a3ef0935d772a0be0437a8c09df64ed2f07
> meta-raspberrypi: 5576a22061864bc451ec4fcacb7d830bf76b7ebd
> meta-virtualization: d75bc448866d2b36779251efb1310d0234ece30b, plus
> this patch series applied on top, or clone the
> raspberry-pi4-xen-series branch from my repository (link below).
>
> Unfortunately, I've just noticed that the versions of poky and
> meta-openembedded I've been working with above could do with being
> brought more up to date. I've just run a build with the tip of master
> of each, and that build is failing in both xen and xen-tools due to
> some interactions with the newer compiler (gcc 10.1.0-r0). I'll need
> to work out what's going on there.
> Bruce: Sorry for missing that before posting this series.

No worries.

I think you'll see a temp/WIP patch that I pushed for xen-tools to
mask the warning / errors, but I hadn't completed the rest of my
build/boot testing yet so may more be lurking (I'm trying to get a
runtime test of runX on qemuarm64).

My patch of course isn't a solution, so feel free to revert and drop
it in v2 of the series :D

Bruce

>
> > 2) w.r.t series of 11 patches ( 00/10 to 10/10 ) shared by Christopher ,
> >     is there any git from where i can clone the patches ( or is there any other way to clone the patches)
>
> Yes - I've just pushed a copy to my repository at github here:
> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-xen-series
>
> > Apologies if i am missing any aspect here .
>
> Not at all - good questions.
> thanks,
>
> Christopher
>
> >
> > Thanks ,
> > Ashish
> >
> >   



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
