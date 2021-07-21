Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.301.1626906868742162776
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 15:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MSacRKCn;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id h2so4389671edt.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jul 2021 15:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p8tlV5AY6LF0P4wJQG5j0EsMCtod6cYT0o6Es8YKPZs=;
        b=MSacRKCnS+hzoMtjyiR7w/GG3iPkM7hXXe3vWJ/4iI2d2PEb+V6FZo0pfW/DGtPZza
         ln8U6xttO97LTNiLsLSR/UBjhjKHU8oHbZjZE2bkmqBmNzQSU6U0iy5JazNvMmYAfwe+
         CvsasbaFacsdWDOTzU/uZ1G8fsbbsKwSOLIbr3qi0hDcahsYGOeR+XarSGnlwfsUnuO/
         DfJNpuT3LHgraoaWgU+93taQ2KvW/t6ys0TDKYFP42VpETK/iJ2UPNdFg+qy5tCh/aNi
         AGOql68vYQgUHrDFHiDaSWcgcP2EjRfLDXo3T0ad2peV+lLlf6+Uyuh6W7+Th/w8CWv+
         oP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p8tlV5AY6LF0P4wJQG5j0EsMCtod6cYT0o6Es8YKPZs=;
        b=HHSIn+fVeR72KEuD6GmvVzlRoDrhKQ8JU5UWtPoRvQNuZ3APAzyYHuTtOcUTQJO1bF
         Kq16crb/C/T2oTzo7zfk8JTWbi/WqckB+Ye4jzFfRCE+VwhJnjHpP6b1AeX7EQqCXVAU
         MxltnZJoeoixsNj4L+U0ypBpp5a0auJVBVn9/wDB6Tx3taWi26KxsIPhyIxZ4Pj9xs4v
         uc6Ng+1Uu51VFeVvNsJ96UiJJfJy11LfgjWZwqyMNY+pemkNPx8QcWQG/g0MHVhuRVVr
         JkR0oaHywTkUqUPAsng9xk9OIRrbzg/mnbwM/ZNOTdbZKnJ81xCbzINnppnBtDzgATKh
         Gh4Q==
X-Gm-Message-State: AOAM5317XrTwsG/zZgnjKW1YoXAivre9eB03e7eh/w7cMEdiLiGGrKag
	IdypEDkcTtb2lZxhU+gi59ka9VRB0Z876pYeEpM=
X-Google-Smtp-Source: ABdhPJxq/pBz15F6DjMzBq9yGh15yS1AOUnCjcEjy8CpfCwwVAySU7bhIlgAPDMrR5UOdQylbusRoQfCYvpgY0lbei0=
X-Received: by 2002:aa7:dc55:: with SMTP id g21mr41874415edu.129.1626906867147;
 Wed, 21 Jul 2021 15:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210721202955.137761-1-fib@cisco.com> <CADkTA4M_d3nrJWxo7rNJjPgZMus1jz_t2-y_qrTp3A4AnNL1QQ@mail.gmail.com>
 <1693E8C660DC5CDD.19034@lists.yoctoproject.org> <SJ0PR11MB47840ED9E9582FAD969BC68FADE39@SJ0PR11MB4784.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB47840ED9E9582FAD969BC68FADE39@SJ0PR11MB4784.namprd11.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 21 Jul 2021 18:34:16 -0400
Message-ID: <CADkTA4O7rWXuvZNVb95U8-amgo_R=QAty1Jz8hsqiDDX4sfEuw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] python3: unbreak python3-native when virtualization is in DISTRO_FEATURES
To: "Ruslan Babayev (fib)" <fib@cisco.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 4:49 PM Ruslan Babayev (fib) <fib@cisco.com> wrote:
>
> Just do add. I am not sure why the prepend with export LIBRARY_PATH was added to begin with. Perhaps it is no longer required.

It very likely isn't.

The git history shows me wondering that same thing in 2015.

When it was introduced, we needed a patch to make the ncurses DEPENDS
properly cross compile. That patch is gone, so the search path
modification is also probably not required.

If I can ask, what recipe are you building that is showing the error ?
That's really what I want to understand, since we are building many
images on a daily basis with host/target python packages and I've
never seen the issue.

If I can reproduce the breakage here, then I can also confirm that we
can just drop the configure prepend completely.

Bruce


>
> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org> On Behalf Of Ruslan Babayev (fib) via lists.yoctoproject.org
> Sent: Wednesday, July 21, 2021 1:37 PM
> To: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH] python3: unbreak python3-native when virtualization is in DISTRO_FEATURES
>
> Basically, python3-native recipe with DISTRO_FEATURES with virtualization is broken due to ${STAGING_DIR_TARGET} being undefined and LIBRARY_PATH ending up as "/lib".
>
> I can put the part about ${STAGING_DIR_TARGET} not defined for native recipes in the body of the commit if you like.
>
> -----Original Message-----
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Wednesday, July 21, 2021 1:32 PM
> To: Ruslan Babayev (fib) <fib@cisco.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH] python3: unbreak python3-native when virtualization is in DISTRO_FEATURES
>
> You need to elaborate much more in this commit message. We need to document what exactly were the symptoms, in what sort of build things weren't working, and how this fixes it.
>
> Cheers,
>
> Bruce
>
> On Wed, Jul 21, 2021 at 4:30 PM Ruslan Babayev <fib@cisco.com> wrote:
> >
> > Signed-off-by: Ruslan Babayev <fib@cisco.com>
> > ---
> >  recipes-devtools/python/python3_virtualization.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-devtools/python/python3_virtualization.inc
> > b/recipes-devtools/python/python3_virtualization.inc
> > index 55301c7..481db58 100644
> > --- a/recipes-devtools/python/python3_virtualization.inc
> > +++ b/recipes-devtools/python/python3_virtualization.inc
> > @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >
> >  DEPENDS += " ncurses"
> >
> > -do_compile_prepend() {
> > +do_compile_prepend_class-target() {
> >         export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
> >  }
> >
> > --
> > 2.26.2.Cisco
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
