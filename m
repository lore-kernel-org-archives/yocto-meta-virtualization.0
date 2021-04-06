Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.11678.1617714808745706069
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 06:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l+vuidhQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id s15so1538415edd.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZTxjWO1y1b3P6EivgUX833qiyWLwZO1ImBk3SA/5r9U=;
        b=l+vuidhQDkY3h89YU3lcIu8tk7tM+H4caSR8t4U5mJrWv97huQ7U2x1nHSINok1l6b
         AQIJH6veRxiy1g2KmV6pINe7sjhsCE8DygUsEs0OZJdxf6EpghOGdiMsjhHAXw3JSjw6
         IDUEUjIoTVm8pJiXWhJx7F09CYX0NzTNi+4BDv+BYom9Moh4r9nSYnNzayPzROQY0RIK
         c6ZOrHIIhYdxbNyr3SF8stjkGLsEMPgohvAScop32YlT8NX/h1jJ/48xbrPvotJBpUcJ
         fd92+9O8uIUoACWjtG9tzbqAXlg0z4zYhK1viT4umJYwETi0CP9sFIHeB5EqwWHzgTHu
         3xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZTxjWO1y1b3P6EivgUX833qiyWLwZO1ImBk3SA/5r9U=;
        b=XilgjhbUQC9h4sQAAl7NypvuhM137KbduUJaOw664RjZjLlQyopWDv+V4JjEIQiz8b
         FpZv575Wp7yrc8na6mi+qKlB8MQ5Rzvp65H9q2KgkorwROpFeX1ZX2U/FsoMZKkwJI0a
         jVSaSHTXKZ7TiUjjuWEdEGusfkw0AWYzFX8wOmRZTwFyXEiUAkE+Vty4AdbScE84/v6w
         6rPN+ZTCWQtdcfJkk8cnpij51TsuBQnw7Sry31eInhN/SJVEy2BmNH5zrZyChajEU+Gl
         nGagH4eGi1Kp64ilM1rUejpFW5wQFxo9Km0vdZQpFg+D/hRvi5pvCmb5Iuwiv8FozlBe
         L6tA==
X-Gm-Message-State: AOAM532OG/USEzhH9TBpSMRGAvweEI6QGzUBnKChwL55c6X+mNWx8Pbx
	/uy5StUhHdlhZnGfCEL8mBKSQuuFhpqY1BqyYYI=
X-Google-Smtp-Source: ABdhPJziN6GgM8E8iepywd7gA0LV8cLTgR8e6Ieoyy9Ep4nywS4SvwQaM5Q8Lfk7LyZuNxRDAU7jLRCArB5ht15uTas=
X-Received: by 2002:a05:6402:105a:: with SMTP id e26mr37957237edu.164.1617714807244;
 Tue, 06 Apr 2021 06:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>
 <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com>
 <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca> <CADkTA4PAUFvU=XNeksY8j9-SF+cJOHFbewHBw0s9ckju_Kw4Nw@mail.gmail.com>
 <541ead14-9177-a6be-c1ad-1c9640833646@crashcourse.ca>
In-Reply-To: <541ead14-9177-a6be-c1ad-1c9640833646@crashcourse.ca>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Apr 2021 09:13:16 -0400
Message-ID: <CADkTA4M8PpPDMf8hLQzZfsoyfDpZOeCvAhNMu5v1D39iU9s4Xw@mail.gmail.com>
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 9:07 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Tue, 6 Apr 2021, Bruce Ashfield wrote:
>
> > On Tue, Apr 6, 2021 at 8:40 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > > On Tue, 6 Apr 2021, Bruce Ashfield wrote:
> > >
> > > > On Tue, Apr 6, 2021 at 5:35 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > > >
> > > > >
> > > > >   this doesn't look right, but i don't know how one wants to resolve
> > > > > it:
> > > > >
> > > >
> > > > What part doesn't look right ? I don't see any issues with it.
> > > >
> > > > Bruce
> > > >
> > > > >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
> > >
> > >   isn't the colon on the wrong end?
> >
> > In a quick scan of other layers, they are all leaving the variable in
> > the same state (with a trailing colon), whether they are using
> > _prepend or _append.
>
>   i beg to differ -- here's a single example:
>
>   meta-intel/recipes-core/zlib/zlib-intel_1.2.11.1.jtkv6.3.bb:
>     FILESEXTRAPATHS_append = ":${COREBASE}/meta/recipes-core/zlib/zlib"

Do a build with that. You have a double colon, so you found a bad
example, unless
the double colon is expected.

FILESEXTRAPATHS="__default::/home/poky/meta/recipes-core/zlib/zlib"

Bruce

>
> anyway, i will defer to the community opinion on this.
>
> rday
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
