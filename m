Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.11377.1617713703790766834
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 05:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=syXRFa8p;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id f8so12413177edd.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 05:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+V/jeVa/6Z70Il8TKfKRcZfyLZWC5gjnTloE8bvMYY=;
        b=syXRFa8pxg1mDm9zzLnd37xq/UbH0gFVoroVYzAnyICkWvm/zrjTUEVlrBFVDlMmg7
         cArs8uSCovr8IC8yaVNijL6JOh+QmZJ8hEMdWPdZW72NCKjzVAHRT85MKumJczMepcrc
         QIfnvs5IZHh0ETlO7E5Ia4MdwUlaA/Skqe2D/TYy7zU11dRaMfAfOIB3m1OfqQ4pW+Nc
         RJWEJjJ2W3jmwIDhDg4f32aUz8Hgwwsvy7QE+FV119x40lqQKkxu3oYwDS8El9XRUeoP
         o7i1ZlgSkuPUFyiV3DAIKmviL81bMYgxfUUVJiNQhiefXyIMLKkzGbaYyrcwIw51iyVt
         GV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+V/jeVa/6Z70Il8TKfKRcZfyLZWC5gjnTloE8bvMYY=;
        b=lN5wWbf5WKgUAVnZzk1IPaGwQF3QZEMrbj2NvEX104g0cRpQwmGVJJ6JW239OhaoRq
         WO4bQdkUJkjku2cascm6CCJZGpRw5AnXUAVbtuijildHtZzKObuXlZBSre66/sIecQbA
         jGRJlpcTw3lpOkHn6sUneLCFFI+x7/AqtnAvC2YOQ0KNg/WOCwbMwbZxr+SmKQsP05/3
         MO6v6UIZSUENiGu3/aNDoD3ToFira1Ivoh9dwXxXyzGCpbQvqTnjAaArc0MSfyJdE/LO
         z4DJH/o0TwbQrD4oNtHuV+F2Pr6Zzg0KfQcV2wCLSJwExXG/CE7uQtvYf5U1yi+HG75i
         C+gg==
X-Gm-Message-State: AOAM532Awcl4qIfTHb25coBo7a0U2rS128xSuTC4pPfhkKJKSvm2F7W+
	86kWEKVSPu1FVIsRYEH5syounb532+zAU7JFdGBrhBMqvNcaPA==
X-Google-Smtp-Source: ABdhPJx9MkPx6L4SZsqFEEWQB0Xn1Xot1f+UD1nJzsvMhLnX5WIhNElQgOETcUNB92W0y7TA5EZ+bE2Vpj2pZqOTNbo=
X-Received: by 2002:a05:6402:2744:: with SMTP id z4mr38009798edd.347.1617713702193;
 Tue, 06 Apr 2021 05:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>
 <CADkTA4OhSe3z5Dv=SSFBA2dg_GZurw2QqjW=jxdu1ZFW__8EZg@mail.gmail.com> <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca>
In-Reply-To: <2ae08013-4ca0-d661-fb8c-e8b8164bef29@crashcourse.ca>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Apr 2021 08:54:51 -0400
Message-ID: <CADkTA4PAUFvU=XNeksY8j9-SF+cJOHFbewHBw0s9ckju_Kw4Nw@mail.gmail.com>
Subject: Re: [meta-virtualization] "FILESEXTRAPATHS_append" error in openvswitch_git.bb
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 8:40 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Tue, 6 Apr 2021, Bruce Ashfield wrote:
>
> > On Tue, Apr 6, 2021 at 5:35 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > >
> > >   this doesn't look right, but i don't know how one wants to resolve
> > > it:
> > >
> >
> > What part doesn't look right ? I don't see any issues with it.
> >
> > Bruce
> >
> > >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
>   isn't the colon on the wrong end?

In a quick scan of other layers, they are all leaving the variable in
the same state (with a trailing colon), whether they are using
_prepend or _append.

So while it does count on the existing variable to end with a colon,
that seems to be no different than other places. I quickly dumped the
environment for an openvswitch build and the default FILESEXTRAPATHS
does end with a colon, so it should be safe. Whether it is perfect
form or not, I can't say, since I've never looked at that in detail
either.

But I very well could be missing something! (I haven't had a coffee yet).

Bruce

>
> rday



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
