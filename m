Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.17802.1634062046314763124
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 11:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jcsMRQLL;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id w14so2664038edv.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Oct 2021 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hu0ZjbL4ei0m4zJXjF8INkCnCe5Hh+So/3QNlfRMzzc=;
        b=jcsMRQLL8fL7ScQZX4SX3G/6eWkm5+CbZPhzNKtYmV7/9j1S4Lsdrr21eGojuoCHHq
         H0i4ewCmxkcbLdpy792d2E/O/PrGkgQgSgyEG2SHy4hi7ZZMYB167c/G4RcDQjwU16nB
         DJLthNFL866HrdQPEfOx40/IqN7zGRrCR+arPIHfk1AQsWD+2e/U+TPVlT2sw1hSwj52
         oRid3cwmZ5DmMZ//TFqqgs9PulPCKtKo87FjFm2a7pCZW9JF4VpdEUUgT3AgGExDwEN7
         0mFpaiSwrSEcIgul8qqRhPFp9Px8qG0Ww7+zY6OIaX4Xk79GuzyUBmxF5/FjyVrNXA7g
         VHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hu0ZjbL4ei0m4zJXjF8INkCnCe5Hh+So/3QNlfRMzzc=;
        b=B/BfPwczLXvZIcyIowCop/wn8xIclKISD4UMDRs7uE4FuY4jlm7/+O8DkruarG0C5P
         ebI32MKvnkE1hEMlHflndtc3VlksPukRVH358oGLTUc5uuAj2Nj12f/ZdThIvIafuhHb
         ouRf9bQbP4Fi9cCzD+Z9rFOweZf80SsZ2Xqwv22PFeqfgAG1VWFM6nTc7IrMLUperKTw
         KU7IcYUtmmRboGRSs+ALfsvJ5W+m6WUsY3ep5yCMLFP79Uo2b43KYTSgGcZ3wfR4o/hk
         KUNR5ycBeaHOdsSEL+bWjsSi6AQISouvJvDAL4K5xRKHElDLbhfV9NGT5GfTPVadeSqd
         69iw==
X-Gm-Message-State: AOAM532gNVszDXLDllV1L6+GewsHrJe+DEzb+IMaLUY+5ZsZFt2U5Pwa
	MBskhH3iZkCN1REVDeh8xiMriKo581eK3gv8MGI=
X-Google-Smtp-Source: ABdhPJztjK9+Yie0rDJZO7cellkl1xfZ1McUX6LnfLyZzSeFpOGzY/AxZLrMVPFx20VG0Z4yPm/zxWMUrB0fUuyfBDM=
X-Received: by 2002:a05:6402:11ca:: with SMTP id j10mr1709722edw.223.1634062044562;
 Tue, 12 Oct 2021 11:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <9b56a9db183fd6725e570d16365e627905cdbbdf.1634060903.git.diego.sueiro@arm.com>
 <CADkTA4MtVO9=6=mi2W8YDAVSPV9KwTx+H3BLpUgi++zqqnWRVg@mail.gmail.com>
In-Reply-To: <CADkTA4MtVO9=6=mi2W8YDAVSPV9KwTx+H3BLpUgi++zqqnWRVg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 12 Oct 2021 14:07:13 -0400
Message-ID: <CADkTA4MZdLwbFcM2+W_d9dgH9ajTRh65MW7EQ_KkdcfgviwYog@mail.gmail.com>
Subject: Re: [meta-virtualization][hardknott][PATCH] k3s: Bump to v1.20.11+k3s2
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 2:02 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> We can't bump hardknott ahead of master, but as it turns out, I
> already have pending k*s updates for master, so I can cherry pick them
> to the stable branches after I'm finished testing.

Ooops. My mistake, I read that version number as 1.21, not 1.20.

This is fine for hardknott and won't interfere with my master /
release branch bumps.

Bruce

>
> Bruce
>
> On Tue, Oct 12, 2021 at 1:52 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
> >
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > ---
> >  recipes-containers/k3s/k3s_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
> > index 2811fb8..f51d9d4 100644
> > --- a/recipes-containers/k3s/k3s_git.bb
> > +++ b/recipes-containers/k3s/k3s_git.bb
> > @@ -13,9 +13,9 @@ SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.20;name=k3s \
> >             file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
> >            "
> >  SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
> > -SRCREV_k3s = "bc400f5396a3dd05584c5f45768a5ea6c43971d1"
> > +SRCREV_k3s = "9cb5fb5716bdfb13e755206aff5688961f5bafb3"
> >
> > -PV = "v1.20.4+k3s1"
> > +PV = "v1.20.11+k3s2"
> >
> >  CNI_NETWORKING_FILES ?= "${WORKDIR}/cni-containerd-net.conf"
> >
> > --
> > 2.17.1
> >
> >
> > 
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
