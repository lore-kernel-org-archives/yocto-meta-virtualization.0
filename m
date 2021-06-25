Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.6916.1624625176486757884
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Jun 2021 05:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aNFzTFVy;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id hq39so14914789ejc.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Jun 2021 05:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SiYZ2kpvC2UqNiPyxFzaopO+oAMmmZ7+1/5mfWIctfw=;
        b=aNFzTFVyr5jprqZXftOIgl/Egz8tpEjY9scp8OapwXeUCf3lOh/4xTse7pjgFPNtUG
         tcqTHC9pqSVPiAVBJsEpNs62GrrscpeddhPLFeLhhMFDiahd3JYLQLn46vv470UOUEeC
         o429ZjfmPiF+AzUNFdZpTKokHWR7ZsCE/5ST9bTfyIgY+mpDgKM8WSLbl7gX3X1iW3qp
         3S7J/dTwfKVHi8L+IodDpXjIYXai9ea0qCp7NpFT8En0xUw3tGSrywqq08oEXrWQ9B7i
         yo2Rfr9kI00pSloFhwR6dDKGtbFwIYDZs5fJl/N8UlilrJ1EPTHVYCPzOQ3IfzDepiav
         SDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SiYZ2kpvC2UqNiPyxFzaopO+oAMmmZ7+1/5mfWIctfw=;
        b=TrEBQ04yVSMEwTjcWd/p1UAHihxFCaYLBfxlRYqpqHabsX0/VZOGo7W/jVH0G+3pBr
         sebMca65bz0SYhquhDXf+hUF0Mpbn2zdh1bu7tRCndwWXAc0Tqm+NfD1DgG3qB3+62QQ
         Z+PXlWMAlYMYNSzrfjKyYBAB15/h2uJyVLyGmMOCs1YacUiCEyuJgKo8kNXJde52SFge
         BOllii16V0xTRDERIxczPDBqaHEHjb30GgOMWamMOsI26rgahiTBKiHvAqhlgz5c9XZ8
         2GT45auCL9AzVpi/xABAyzYHaMV7Bx8RxdNyPcP6WuwKtsNt4eJeWs6+51EXuo/oAn3k
         3wpg==
X-Gm-Message-State: AOAM533HiiaYAy4X530nOe5tuozkP9Ubzy4hmXp6RDTWqJ1zZ2d0OZmy
	ZC7uUJFxQjtax+Ar0p5ijUvLMtdrQdAycdmW2YA=
X-Google-Smtp-Source: ABdhPJyg/98laEJndqksLivZYYyZ7rZU68bthc1jO+TOdprdRv6H0KN99wyysL5B3pFqY7ZTAv3X0E3XMHJ3ePRu2hQ=
X-Received: by 2002:a17:906:4c58:: with SMTP id d24mr10453295ejw.298.1624625174894;
 Fri, 25 Jun 2021 05:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
 <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com> <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 25 Jun 2021 08:46:03 -0400
Message-ID: <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 25, 2021 at 4:11 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> >-----Original Message-----
> >From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >Sent: 25 June 2021 03:49
> >To: Martin Jansa <martin.jansa@gmail.com>
> >Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-
> >virtualization@lists.yoctoproject.org; nd <nd@arm.com>
> >Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as
> >REQUIRED_DISTRO_FEATURES
> >
> >On Thu, Jun 24, 2021 at 5:01 PM Martin Jansa <martin.jansa@gmail.com>
> >wrote:
> >>
> >> This change is correct, libseccomp still requires seccomp in
> >DISTRO_FEATURES, so anything depending on it should have the same
> >restriction.
> >>
> >
> >Right, I understand how/why it works like this .. but it is super clunky when we
> >can't just depend on something that is now in core, without needing to
> >sprinkle distro checks everywhere.
> >
> >As the list of recipes gets larger with that check, it really isn't an optional distro
> >feature for using meta virt at all, and it would be nice if we could just do the
> >check once and be done with it.
>
> Just a side note that these patches fix issues with yocto-check-layer.

I've disagreed with check-layer before (and we've changed how it works)

That being said, the layer is checked on the AB, and Richard hasn't
reported any issues. So clearly there's something wrong with the AB
test or with something else.

Bruce

>
> Diego
>
> >
> >Bruce
> >
> >> seccomp is now in default DISTRO_FEATURES, but not through BACKFILL
> >feature, so many existing DISTROs didn't get it automatically added and
> >requiring it is the right way to automatically skip such recipes.
> >>
> >> On Thu, Jun 24, 2021 at 12:45 PM Bruce Ashfield
> ><bruce.ashfield@gmail.com> wrote:
> >>>
> >>> What branch are you working with ?
> >>>
> >>> Now that seccomp is in core, we no longer have those restrictions, so
> >>> I assume this is on an older branch ?
> >>>
> >>> Bruce
> >>>
> >>> On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro <diego.sueiro@arm.com>
> >wrote:
> >>> >
> >>> > The libseccomp package is only available if seccomp is in
> >DISTRO_FEATURES.
> >>> >
> >>> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> >>> > ---
> >>> >  recipes-containers/podman/podman_git.bb | 3 +++
> >>> >  1 file changed, 3 insertions(+)
> >>> >
> >>> > diff --git a/recipes-containers/podman/podman_git.bb
> >>> > b/recipes-containers/podman/podman_git.bb
> >>> > index 9dcb21c..351f38b 100644
> >>> > --- a/recipes-containers/podman/podman_git.bb
> >>> > +++ b/recipes-containers/podman/podman_git.bb
> >>> > @@ -6,6 +6,9 @@ DESCRIPTION = "Podman is a daemonless container
> >engine for developing, \
> >>> >      `alias docker=podman`. \
> >>> >      "
> >>> >
> >>> > +inherit features_check
> >>> > +REQUIRED_DISTRO_FEATURES ?= "seccomp"
> >>> > +
> >>> >  DEPENDS = " \
> >>> >      go-metalinter-native \
> >>> >      go-md2man-native \
> >>> > --
> >>> > 2.17.1
> >>> >
> >>> >
> >>> >
> >>> >
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >>> 
> >>>
> >
> >
> >--
> >- Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> >its end
> >- "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
