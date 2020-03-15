Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.44633.1584289058933133452
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Mar 2020 09:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LYAdrpXq;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id dc19so18831839edb.10
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Mar 2020 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iSyzcLvOYa3aPFW9nZuD+ttqkj1F0ZKmaCU25IB68MY=;
        b=LYAdrpXqgGQT9a/iAUk0+sGnXwi8PqNYrDbvcM6xgnkpwUTXivqk/h9w1qNo3Op6OY
         5XA2R1921SZcZPckzaoXbegTJGyU9yyWLwkGYR6Gr3ya9812Wyaam07ojAbrs8SWBD+A
         /deSrTuua08qbZUtovIr6qJpngM+Ljc5QhwyCeziGsK4hOwz0QjC6SMxcQHehbF7K5Uj
         VugEOpfP6Fk44kDsTgySqaohC/q1ObCBo1kIe6C3l+KIZ2BvJN6RHPgM2cGzdoph/NZl
         cjGOeTYjU3XU/yAv53figizUAFRRn3qX6s8hi2dCLlGDxXaNbZuyw2OlEaBUMJAsNtTY
         n99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iSyzcLvOYa3aPFW9nZuD+ttqkj1F0ZKmaCU25IB68MY=;
        b=adM9FSSKRWO7Apx33cQEHPCS2AfClF9pmIrKHnYZOEj+ZpMrqKBx1HQQV98ET/Trxx
         rzQxL7S5llOzPXCts/H8FdBJW1C6X/MuanHvgn5qicSUODp780jRM/53y2Ixi8f+krF0
         OEVSqzQYhBCci6NOma/TX3I5IhMsq2d+kPyxdcig+6Z/UNab26+2RQ/4UhNXgsACnKdZ
         SiS9Li40okMQtycRSudKvdxT0XmYC29mOl6uyPrEg1DlKGiG1deGPu3xthU8chyb1HsC
         2avTHP0+D7GaSaa4zVg7S0pZMhP3x0Iujty6+L2bFFcdihjWOln/SpcqghECugkSb3sd
         lKWA==
X-Gm-Message-State: ANhLgQ21BPO1JUYEbsGjK6tEdcplud1sw0pUsP0m+lTce0Cw7y/cYje5
	0nA+rptMZirhDMV1FStBjc1ODeFq6HsguKMuNYs=
X-Google-Smtp-Source: ADFU+vtslhjbYH5wP+1eyaxnqo4bwJIYufGPjPUiZxcRiibXOQCei9HR062IfwNrQsdE6KAfc16XIzuHdceKUYIcY5s=
X-Received: by 2002:a17:906:9456:: with SMTP id z22mr20384190ejx.327.1584289057429;
 Sun, 15 Mar 2020 09:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200315122008.22161-1-liu.ming50@gmail.com> <20200315122008.22161-3-liu.ming50@gmail.com>
 <15FC865FAF3D1B8A.14917@lists.yoctoproject.org>
In-Reply-To: <15FC865FAF3D1B8A.14917@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 15 Mar 2020 12:17:26 -0400
Message-ID: <CADkTA4NtT2D2NyJzckUHMM-5yHS+QNH6qg2bYkZrT7FCWv9Wkw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/3] docker-ce: uprev to 19.03.8
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Also FYI.

We need to explicitly state what's in an uprev (short log capture) and
a reason for the shortlog, along with a short statement of testing.

That's what's in the other pending uprev's, so I thought I'd mention it here.

Bruce

On Sun, Mar 15, 2020 at 12:15 PM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> I already have this pending, so won't merge this change.
>
> Cheers,
>
> Bruce
>
> On Sun, Mar 15, 2020 at 8:20 AM Ming Liu <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <ming.liu@toradex.com>
> >
> > Signed-off-by: Ming Liu <ming.liu@toradex.com>
> > ---
> >  recipes-containers/docker/docker-ce_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> > index e32a734..82cce73 100644
> > --- a/recipes-containers/docker/docker-ce_git.bb
> > +++ b/recipes-containers/docker/docker-ce_git.bb
> > @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
> >   subtle and/or glaring issues. \
> >   "
> >
> > -SRCREV_docker = "f0e27e52c1d57597a9b2e50baad33feb80474b76"
> > +SRCREV_docker = "afacb8b7f0d8d4f9d2a8e8736e9c993e672b41f3"
> >  SRCREV_libnetwork = "9fd385be8302dbe1071a3ce124891893ff27f90f"
> >  SRC_URI = "\
> >         git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
> > @@ -38,7 +38,7 @@ GO_IMPORT = "import"
> >
> >  S = "${WORKDIR}/git"
> >
> > -DOCKER_VERSION = "19.03.6-ce"
> > +DOCKER_VERSION = "19.03.8-ce"
> >  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
> >
> >  PACKAGES =+ "${PN}-contrib"
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
