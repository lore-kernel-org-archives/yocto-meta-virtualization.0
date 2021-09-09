Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.3330.1631212355822404009
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Sep 2021 11:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UrRn2iLJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id g21so3926967edw.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Sep 2021 11:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RSNDQevpFGrjY7bjxeEO4tY9YZvZ6+4hg4FMsOR8o0A=;
        b=UrRn2iLJ0HPOnd2CXbrauGpJc4rIb2qGFytWhIyOTJ7/+tUva0vaFfmafa1g0Na/+S
         PuabkNqFwXivtuJsdtcrasAHRg6IgRxTBWjf3enN9wsSYgFqWtUxubTSA4wGoVqRexjt
         tZLN0bIs/L/347HEF35d5WZt597Zvqn9tBtxy2heqY4rgmJqR1HC2GgAetsqjvdFQCw/
         9Ln4twhxEMNlH+94Vg8fx56Ne5dF/5nB9Tb8uGZSyp+BQSxqgY+SISb2EhrexDISiblm
         7qxaHoMXTRuwJ31IKsJMDvclNGgDeYD+eF0HasY4O3tXXALxPIar+6/49OokN5uBTLpN
         52Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RSNDQevpFGrjY7bjxeEO4tY9YZvZ6+4hg4FMsOR8o0A=;
        b=pLOTeUKgcK9ykcZNhNGSW1Br0Ec4Vd+qRj+8D92vkKWaRTVztDtqwg5MLUcHa6mTMC
         zdm4nETVs/kLGxbq52Osgeg4AAg1rD6lMBLlM4hp7MyamxG928pS+D21Dd3TdsMQRFfQ
         dQVIummUc5mudrcVI7E+zW/c0Q+6zhGKId0+pNMlUPB8rc4cLu8yGY8R4gQPEyqSMiRH
         bAWgqJnH/ozuW4TASt0UUAIa1ioiMVPLK6agDs1c3obgV1S2nEPGsfUQjU+we0L8E9tz
         Hc1grodGFCHuThznI107WiAjOK3enlIdUwFbTfYxFODxvBmsUJSxyT9H59EYHoNxDJKe
         j0Zw==
X-Gm-Message-State: AOAM530lsP61WQTd2lehH2vYErdVjQfI8/6SNDFs6Sy3fm8he8cy/xWy
	a8wNbjg60m46JPFOzy9pjkHQPOd9Mz0CA9E93F0=
X-Google-Smtp-Source: ABdhPJzLokfDNWXfevrJX6kn5t0lOs1IE0jm2teRJ7GFdTrdIpUihcJhf4JvfTI/J/6SwPw6H07Ss1yHIdVrTDvoR/Q=
X-Received: by 2002:aa7:dd57:: with SMTP id o23mr4677267edw.385.1631212354355;
 Thu, 09 Sep 2021 11:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210908180214.1302459-1-festevam@denx.de> <CADkTA4O92EpgmyNO1ZhBi0OV8hNdZO7=tNc8jZwfEDkDZFg0sg@mail.gmail.com>
 <2153cd79fc3fdeff42e8d0926adb7863@denx.de>
In-Reply-To: <2153cd79fc3fdeff42e8d0926adb7863@denx.de>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 9 Sep 2021 14:32:23 -0400
Message-ID: <CADkTA4NkfPNkDHZeGTbqRxOgecgEWyo19e6g8VpdJAL8JjwZiQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH dunfell] containers: Explictly reference a valid branch
To: Fabio Estevam <festevam@denx.de>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Otavio Salvador <otavio@ossystems.com.br>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 8, 2021 at 2:29 PM Fabio Estevam <festevam@denx.de> wrote:
>
> Hi Bruce,
>
> On 08/09/2021 15:07, Bruce Ashfield wrote:
> > On Wed, Sep 8, 2021 at 2:02 PM Fabio Estevam <festevam@denx.de> wrote:
> >>
> >> These repositories have dropped their master branches,
> >> so the fetcher default no longer works.
> >>
> >> Point to an existing branch to fix the fetch failure.
> >>
> >> Signed-off-by: Fabio Estevam <festevam@denx.de>
> >> ---
> >> Sorry for the resend.
> >>
> >> I was not subscribed to the list in the first time.
> >
> > You are working on an out of date master, or an old branch.
>
> I am working on dunfell.
>
> > If you want some of the branch changes cherry picked, specify the
> > commit and branch, and I can do that.
>
> Could you please cherry-pick the four commits below to dunfell to fix
> the build?
>
> oci-image-spec_git:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=96712be73dbca60fdceb4be68e5454944fe42d50
>
> podman compose:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-containers/podman-compose/podman-compose_0.1.5.bb?id=f32657ae6efd35e259147582ed12fb864688402a
>
> podman:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-containers/podman/podman_git.bb?id=4344c3db4054fae135d2d2d72c2300994f69f8d4
>
> skopeo:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-containers/skopeo/skopeo_git.bb?id=c3fe6ab4276444d0ac0c1de23a935d77fc2f4404
>

These have been cherry-picked into dunfell.

Cheers,

Bruce

> Thanks,
>
> Fabio Estevam
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email:
> festevam@denx.de



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
