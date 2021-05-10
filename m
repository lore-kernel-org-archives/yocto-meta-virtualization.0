Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.2093.1620674148979446673
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 May 2021 12:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G1bI9cOV;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7935138C11DF
	for <meta-virtualization@yoctoproject.org>; Mon, 10 May 2021 19:15:48 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id c22so20007226edn.7
        for <meta-virtualization@yoctoproject.org>; Mon, 10 May 2021 12:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vDyJZGmk3z3qeNaprb8VLQvPa+k+sWszlUCDgp6r+wE=;
        b=G1bI9cOV0wJn/RRABjEnUaLw/Qmy3aYlECgc3rKdh8U9yt+683J6RAswIBJSFT/w+u
         p4ViyCzEsrZld/AaVGAjcCnmuQArafSuq9YsTD82l5OIY+SUjb6tR8UBD/hRGKFSqWWD
         KpmSztuarfY58NpBUQho/VbWqbf9GRFewh5BDiqlJNFh+gosKvSiQPB0Uy0yjuPJKpXf
         tCyCHvqYSjn3QJAviujA7EglyV1jYTRrn63EAx+OZlmasSgUyvofG2O+xga9lrYJmPMR
         tViOxBmqryMOgImuqL/0obs3/S5gi0knR/KMAAceKn5zK9AyEi3TNvGwkwY9aJyeyFY4
         BwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vDyJZGmk3z3qeNaprb8VLQvPa+k+sWszlUCDgp6r+wE=;
        b=R+Dy6KI69DZPbc7Fe27Z1fIzMpIGdUWlE6vlwqncWtpPCUa3MTBrvAEAtVwDxm6xpC
         81xZKZNjVuRLYpmF39nNhqIYnatUi3HchB3E6VImG/PdPPh0PP9aatuPThkQ5quBEwm2
         LpI7PWSl2xBq+GSaNbPLK0n+FntG7fGhWkryNcnm+My0zi4IlRl0YV4+vyaQUDkqzEzG
         nWR4XqD5nzMeiy9HtBYFhfzxuSHOIErFJFamOZSVSxyIlBhEbklCUhY9yEkp2Dt9+qqG
         KPariEioBMI8Ss8TfnL5VcPxlMzMiWL/b5b5MMOVISTCNRPCL3rzvbOAqerNFTo4PLwS
         eqlQ==
X-Gm-Message-State: AOAM530/D/UMQ7igbi/l0zSWLdpIHTqlTRUfkTIfKiL7kROEaFPuk+jj
	nN78pO+QgcQQUlSDE8jQM22thIXhcE7c3SpbFhQ=
X-Google-Smtp-Source: ABdhPJz7FykMdF0fmGPyk+GP65GATUMpvRtrhl148O0lIXyo36L7Hcw7R4IE8OLAgnfC9jDhhstYGpP0ZfgGV7/RItk=
X-Received: by 2002:aa7:c789:: with SMTP id n9mr31861680eds.352.1620674145985;
 Mon, 10 May 2021 12:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
 <CADkTA4M0=xJ8Kt0k6ZHdT7Vy4CPQkZNsFHvCHMR=-4KM9hfcgQ@mail.gmail.com> <5bf45976-11c1-1184-f51b-e886c8aa301e@axis.com>
In-Reply-To: <5bf45976-11c1-1184-f51b-e886c8aa301e@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 10 May 2021 15:15:34 -0400
Message-ID: <CADkTA4Om89jd53seR=-exUp+_X0avvFUs2_K-5WzbYwysGz77w@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 10, 2021 at 12:59 PM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> On 2021-05-10 14:10, Bruce Ashfield wrote:
> >
> > I'm actually already working on it, and have been for about a month.
>
> Awesome!!
>
> > There's a few build issues remaining, but I expect to have it done in
> > the not to distant future.
>
> Great news, makes me think of that old movie title "Bruce Almighty".
> Kudos!

Ha. I wouldn't say that :D

When I was working on k3s I was adding sanity tests for containerd and
was reading about nerctl and the docker-like interface it provided ..
so I thought it was a good idea.

The issue with the recipe, is that it has an insane amount of go
dependencies and is heavily go.mod based.  I had 0.7x nearly working,
with only some go build errors due to may layout of the source not
being quite right .. I attempted to update to 0.8.x recently and the
amount of SRC_URI churn was huge .. so I wrote myself some helper
tools to generate things.

I'm still working through the fallout of that 0.8.x update, but
hopefully I'll get through it shortly.

Bruce

>
> BR,
>
> /J
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
