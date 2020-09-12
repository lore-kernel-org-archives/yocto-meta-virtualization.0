Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.10973.1599879823674873377
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Sep 2020 20:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NuSsR0Dq;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7334538C14CE
	for <meta-virtualization@yoctoproject.org>; Fri, 11 Sep 2020 20:03:42 -0700 (PDT)
Received: by mail-ej1-f67.google.com with SMTP id u21so16120619eja.2
        for <meta-virtualization@yoctoproject.org>; Fri, 11 Sep 2020 20:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xIm+UyXAvFE+ucd256JJ0FVodHGnrWcYmiZdc7czdf0=;
        b=NuSsR0DqsZgvxaEmCcE/5zkYhjad8f7jhWmCrhq2yKGdOysgbXGTlge6jeoo3AVwYj
         JtY5i1VdPx5QdZIqIRajyIN09jBpcG+fdgU9S6Z/MM2xT34sqAKfhv9rcOaEvfXWfQIE
         aotucuzNqLWmTFRLMqfOngT4uXW2MK00SnwtQyOSKbetVLT2FB1RmQ4kVO4KT2LlGKs7
         Gh+3wsb+wHEbtMrslh4o/+zNxnBkkev2BYRAuddksMeXbcCfopZRK+TmGEEAb87r98+N
         nCkfTFcKs7xt8SqlVRWzomueTOUOnOhkZUaybSH3wc2lt9fr1lOPIp60vVxXBZWwH/6I
         stsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xIm+UyXAvFE+ucd256JJ0FVodHGnrWcYmiZdc7czdf0=;
        b=NCJ/cMz4k3IIrLl7E5qqVa/VB09dh5OVG52UqXfROI58a3e7h2Kh2inO/8nuHU6sBk
         ey8I0MpMxjxMYbtq0hnBo3iRsi3aLPvNaAw+yqdM9lZceer6LFWIXKiDr3ethsM3cg2r
         ifZCpIE6B8zwLLz08yp4Q+CiL+HvlQqdWe/PAn1HT6Pc2KGrxEqnqPa1UsZNGfwhhqNj
         iIL6iogG/eMP3EnmHuEXKKPYW5QPop7xLpKqdRhupAIJ/IAOE0QMxEht2k3lP7lHEdjJ
         7SMzB1q96VXEoaeYTQqiIKGjgIEkmuiqhF7Qt6eY+AlVwTjeTIbk4PMpjNTeP9EEYhfb
         Zddw==
X-Gm-Message-State: AOAM532MdUY34a6MlOlX6lFk8kXxyGsZ0IN2q1eTKh4wS/UFrZAgOijL
	wq3b4pkfwe1ywplkAtAmUwVjm6upWWXoNBSC7yQ=
X-Google-Smtp-Source: ABdhPJwceLmaCVR7InrnV0zfdT43jKVRDRl0doEdcGyS5zvvtqNX1liFEdFTDd7y14GTtEBQjcqB45pBMre1Zf11QYk=
X-Received: by 2002:a17:906:46d5:: with SMTP id k21mr4585547ejs.247.1599879820946;
 Fri, 11 Sep 2020 20:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200909220248.17026-1-joe.slater@windriver.com>
 <CADkTA4PcUcYvC2ZG0scMOvOZcPCLzdt9VQECwZiHO_V61chNeQ@mail.gmail.com> <f45e74f6adb043339b97f7c328a8c79c@XBOX03.axis.com>
In-Reply-To: <f45e74f6adb043339b97f7c328a8c79c@XBOX03.axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 11 Sep 2020 23:02:05 -0400
Message-ID: <CADkTA4Ntj0qCFsdzudeFvEjHZqOmgR1mCTHOi02Wvq7Z=BB6Uw@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] container-base: rename recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Joe Slater <joe.slater@windriver.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 11, 2020 at 1:11 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-
> > virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield
> > Sent: den 10 september 2020 02:03
> > To: Joe Slater <joe.slater@windriver.com>
> > Cc: meta-virtualization <meta-virtualization@yoctoproject.org>; Randy
> > MacLeod <randy.macleod@windriver.com>
> > Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] container-base:
> > rename recipe
> >
> > Except that this breaks existing users.
> >
> > We'll leave this as-is.
>
> Well, you could add a new container-base.bb recipe that only does:
>

Of course .. there's literally 10 different ways it could be done.

But in the end, it is all churn for the sake of churn, and I'll opt to
leave things as-is, since nothing is broken and no harm is being done.

Cheers,

Bruce

> # This recipe is deprecated. Please use container-base-image instead
>
> require container-base-image.bb
>
> to care for backwards compatibility. You could also add an anonymous
> Python function, or probably better, hook into
> ROOTFS_PREPROCESS_COMMAND, with a bb.warn() about the deprecation
> state of the old name.
>
> Regarding the name of the image recipe, wouldn't
> "container-image-base" be more in line with existing image recipes?
>
> > Bruce
> >
> > On Wed, Sep 9, 2020 at 6:03 PM Joe Slater <joe.slater@windriver.com>
> > wrote:
> > >
> > > Change to container-base-image since the convention is to
> > > have "image" in image recipe names.
> > >
> > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > ---
> > >  recipes-extended/images/{container-base.bb => contain-base-image.bb} | 0
>
> I believe the intended name was "container-base-image.bb"?
>
> > >  1 file changed, 0 insertions(+), 0 deletions(-)
> > >  rename recipes-extended/images/{container-base.bb => contain-base-image.bb} (100%)
> > >
> > > diff --git a/recipes-extended/images/container-base.bb b/recipes-extended/images/contain-base-image.bb
> > > similarity index 100%
> > > rename from recipes-extended/images/container-base.bb
> > > rename to recipes-extended/images/contain-base-image.bb
>
> //Peter
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
