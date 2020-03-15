Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.51650.1584307056890449078
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Mar 2020 14:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MMi20IOx;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id b21so9191969edy.9
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Mar 2020 14:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8oGcNYG5rfn3xRVU5gHkV57Nz8xvEXJLEFJz3mQzpcA=;
        b=MMi20IOxDGWLBnjWfA4gJY+6yGIGgRkKdmMiYp2ENMb/lxmD9tZbYiyYI05lFRlkso
         dojgHwH/clgq7FksgiDVuIzVZeuITfq2kl3aBY7InnFputkyShbknctbgHtIGQekL3px
         8jbKXDr0zi4VoqDtwJYQIW6oCCMWqX8UWrWuPs5VhSB5qpxX+s6+0Ouom22p04dGp4iG
         aTnrFZbIb2muvK4Tt+WgRY9JnRa2Jdr6R+kgN9vXnohI5Y2rQ0fHd5xV0vnyIHAK4dBI
         XEUkfSad704cO6M8EOamQ7vg9PlTDSMOL+Z62t5Ep32AlijSDlGXEAvTDguXcko2pQJJ
         QQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8oGcNYG5rfn3xRVU5gHkV57Nz8xvEXJLEFJz3mQzpcA=;
        b=oJjNmt/b4fpFtVCQBfOKXb5pFk3CxLfQLBJKtFHFgpv0d+X1jBfMPzUvBvdj+PVUH1
         L9oCwl/z9/q28tjZRs0Q3UV7XBz/oMGxiQHXYgZ22exogtsTHY/qHHUxh1i4LFFpWkwp
         zA+wGL9gPUEytWVCV6ziUVm4DRlu6E4Ak25gj5G3tVfaxPOI7bzDGEkH7OZOadGJK12q
         oySLULtczFTk8SFjcNrog3rHDtDquLxx8FicKaWfbD5qekjqzu6OynUslbfruCPsuIzT
         NuFlWGutq6fB3BQtJmJa7/wmWDT+Tf0npI05DTNmTv4+a9OzR3mIB/oTH/7aU5wwf+Zp
         B5VQ==
X-Gm-Message-State: ANhLgQ0JjUknpbdO9uL3AL1KoU15yFpH7e9tV4OTbjOaM6//gTWy6uyP
	WdU3QCMHUOSUDnaHuffLeGLX2/eaVM23/ayRtPw=
X-Google-Smtp-Source: ADFU+vunarrOeOOePiHKW+RPLjR9JxUlYee05YZd7Ck4vWyqfeZjzUKinCZD2cjgc8uzu6TECrfvgJsLZ9zQYrz8z4I=
X-Received: by 2002:aa7:dd01:: with SMTP id i1mr23174179edv.164.1584307055378;
 Sun, 15 Mar 2020 14:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200315122008.22161-1-liu.ming50@gmail.com> <15FC866E5C0C937A.14939@lists.yoctoproject.org>
In-Reply-To: <15FC866E5C0C937A.14939@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 15 Mar 2020 17:17:24 -0400
Message-ID: <CADkTA4N2V4KohpwXFtpkbUsp32m0HaaFUq2UxnVwNdKrdq3Abg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] runx: drop distro_features_check
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

FYI: master-next has the in-test changes.

Bruce

On Sun, Mar 15, 2020 at 12:16 PM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> There are more pending runx change, I won't merge this either, until
> I've completed a full round of testing.
>
> Cheers,
>
> Bruce
>
> On Sun, Mar 15, 2020 at 8:19 AM Ming Liu <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <ming.liu@toradex.com>
> >
> > distro_features_check bbclass is deprecated, inherit features_check
> > instead.
> >
> > Signed-off-by: Ming Liu <ming.liu@toradex.com>
> > ---
> >  recipes-core/runx/runx_git.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
> > index 36fede6..9517d89 100644
> > --- a/recipes-core/runx/runx_git.bb
> > +++ b/recipes-core/runx/runx_git.bb
> > @@ -18,10 +18,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=945fc9aa694796a6337395cc291ddd8c"
> >  S = "${WORKDIR}/git"
> >  PV = "0.1-git${SRCREV_runx}"
> >
> > -inherit distro_features_check
> > +inherit features_check
> >  REQUIRED_DISTRO_FEATURES = "vmsep"
> >
> > -
> >  # TODO: for if we need a go shim
> >  # GO_IMPORT = "import"
> >  # inherit go
> > --
> > 2.25.1
> >
> >
>
>
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
