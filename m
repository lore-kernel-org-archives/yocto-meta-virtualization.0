Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.2.1579716763936524642
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Jan 2020 10:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l5wUaZwt;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id e10so499946edv.9
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2020 10:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=keFhnaHUMX0BPm87C4xEG7m2zNrodwJrCZiv67E5NN8=;
        b=l5wUaZwt13WbiMe+ViCgTAvWKdwrktJs/Q4cJZ2YaIXrVSm1J/YbVXuQuh2z5salNZ
         ydnURIHNClbFfhl/6N2rKDcyRJ1vrZERr1B7sJcq9saq5ob1Qq2SZ3HbNfOaajZ6Sdhp
         DyVUN3XajlKUZtps9Qu7dyaTHZNJ13tOVNlMiaItamYpmQBNVu8Bzapw9h1wAycDQmzj
         vNCgFIXFQbS0m5SPu7cdgatuaqZccZNyNwXT0H5r8SivFToI7Veo2T7KgclqWxrjAgOm
         RLeED2J0wvMaXhIzvWzy3U+S+wbgyn5ZB7AabmeIVNQuKXnAjAiSB7mt2GhOVaDpEcrN
         mXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=keFhnaHUMX0BPm87C4xEG7m2zNrodwJrCZiv67E5NN8=;
        b=NeVoTOo6Wj6k0VyxM7b9AfTeJm8vTHpaleLfXMb70qK2eSPFzcDjmVIPv7EZhrbLce
         vKgbLa2oJoHsuWk19rWEVRn+6XanuqGYRjj4v+aiJ1K4TX0WoIUM1nmhWx1IkOWzCXnm
         xiiJINsDR7uxtnrkWQKJMfjJA2nuyhqakykc7CS/dFowJ18aHLb7bcjyv6Tp+e0js6NN
         WDCP1Iu40r2VoAnvfSaeHk09mpP5T57WR955A7k3mRErx4MGrZLDtAtI2mV9oZ3CoKs2
         9vlrERe3n7kwNRhLJzoqKggCyJgBQdl2mbu7QujDubMPNLmrMGyT4d9mlzLSydH8nBXD
         Q3ag==
X-Gm-Message-State: APjAAAWHm6CbGgOnJZeGaYVaa7+WzHEcvm3nrqS8iAor1Y8ykFdu6qlk
	5O/5LvDAkBSE3zNdz/Z47eugDFX3vlequbt47Uo=
X-Google-Smtp-Source: APXvYqy8LuuFOOfIusKc4Hh/tfY0Bn/UYJO3alE3ZOXsjR2eubOlOuNnmLEik6N2SqitYemHGOlhwMpK6UiMHFvIWMw=
X-Received: by 2002:a17:906:9248:: with SMTP id c8mr3681444ejx.37.1579716762389;
 Wed, 22 Jan 2020 10:12:42 -0800 (PST)
MIME-Version: 1.0
References: <15EBF06C76F77137.10760@lists.yoctoproject.org>
In-Reply-To: <15EBF06C76F77137.10760@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 22 Jan 2020 13:12:31 -0500
Message-ID: <CADkTA4MjbJphbnTRC7pC4o5+=F3NNQCCAHhNtFwOMeFTv+=qAA@mail.gmail.com>
Subject: Re: [meta-virtualization] python2 removal
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

FYI: The first pass is done, and I just pushed the following commits:

7f6f7a4 conf: remove unneeded preferred versions
d4b8bad xorg-xserver: make changes conditional on xen distro feature
56c3ce9 initscripts: make DISTRO_FEATURE safe
d10d310 python: make DISTRO_FEATURE safe
1d47e25 libibverbs: import frmo meta-cloud-services
8f6ebd2 python: update bbappend to python3.x
2c3206b xen: trivial: allow parsing in python3 only oe-core
407b822 libvirt: make python3 safe
7e9c4e6 ceph: update and make python3 safe
2ffc7a5 gunicorn: uprev and make python3 ready
a1e3f5c singularity: update for python3 support
67b237d criu: python3 update
52e67d4 python: update support packages to python3
cceef93 python: drop blinker specific version and python2 recipe
dc7ac8d python: drop python-backports-lzma
e57a346 devtools: drop python2 variant of python-sphinx
c3d92d9 docker: drop python2 variants

I uprev'd some packages, dropped others and made some brute force
modifications to get things to parse.

I've smoke tested an image that runs docker, and was able to pull and
execute containers, so the changes are at least minimally sane.

I'm still holding feature merges until the rest of the python3 changes
are done, but if people have a package they are working on, feel free
to follow up so we won't duplicate efforts.

Bruce

On Tue, Jan 21, 2020 at 10:27 AM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> Hi all,
>
> Just a heads up that I'm working through the fallout of python2 being
> removed from oe-core.
>
> As a first pass, the goal is to make meta-virt parse/build with only
> python3 components that already exist. I'll simply drop recipes that
> are python2 only, and then
>
> a) create a list of recipes to be updated that folks are welcome to help with
> b) eventually create a python2 dependency sublayer if we find
> something that we can't live without, but also doesn't easily update
> to python3 .. hopefully we won't need (b).
>
> Cheers,
>
> Bruce
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
