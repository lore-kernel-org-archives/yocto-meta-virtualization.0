Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.1505.1624564121302492507
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 12:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RpVxnX4J;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id bu12so11397233ejb.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Jun 2021 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8CX3QArfV5cpm/bTLqZFiC1X8PHEMqZN68Wa2lrMpBA=;
        b=RpVxnX4JoHfFm5NnWh02NEASLKkK8r6tbApOKLKYPs7cRxnT037zpmwl1P5IfF+VP+
         NDdTo1j6xSK+tPDvjLb9OX724Xiyh5j/+BmmXCe3pQkOK18eoC8HDAKaC3UryjWLl+BO
         DX6ToU/VVRcBg0jv9T44xCGrsGdoaVh/8SzyLDQOqZAzmBO7nG0MwGUwc31iRadfbqzO
         FuE119Dc61ASLvobwM3GvaqkEZ3Ol2ZG0E8hwDRJGnDg+WlrBygqF/JY2NFVvBVhk8v7
         vJjJp0IT2qfS88xa6UERtO5dAGlSMzqQ6u3u13vNJZmqzqcxt29mmDmFou3MpXt+B05V
         48YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8CX3QArfV5cpm/bTLqZFiC1X8PHEMqZN68Wa2lrMpBA=;
        b=CrsHir+ZsPphbfaaX7BXQmqoUX+P/kwvROh5VdliS8fP0AK1mbOTOBxKLYbknH+djl
         kGLGSMNmRQAIwzTGfWWBCjrhJ/pIWrLbhqYEjIzRNEgwUr73qAy1/lG9coxOWrQMVMpO
         luwvRQ0FkikUK4akeZU2ds6GD9Ovk7L8yqdcDgz6JjscwemFPr+03r2NOPVI4JYdZYAl
         +VlYJNMRPyBGIKGgS+muLeB26japMCiiDxsB38OvXz8/pfTU2a+3KKI8vXaqjR1XHstA
         bjc1fLncGrd+1Cci2LaQl/HB8B+9RKB25zj7TDvZdvGMmXBk/NI9phL5RKB4hf6oE/f4
         /sbw==
X-Gm-Message-State: AOAM530+G5OYzwon2FF5DV/gBxEhzEYEqRVfoazTeMsQeOWcv3MQntkS
	7hWaXJdLfHXcgxKv0HM57wv5cBNpTFQ8IVRgRXI=
X-Google-Smtp-Source: ABdhPJwAVPasW4TbSI8jFwWC6cok7miWsIx1rZO+RTvSiSMuPkCaCYQR9QV4sHuwb5mvgWxL+SwE5VMmmRJJ+LoPpPs=
X-Received: by 2002:a17:907:1b29:: with SMTP id mp41mr6926477ejc.459.1624564119857;
 Thu, 24 Jun 2021 12:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <168B9C435EB7F916.14800@lists.yoctoproject.org>
In-Reply-To: <168B9C435EB7F916.14800@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 24 Jun 2021 15:48:28 -0400
Message-ID: <CADkTA4P5nTDNHYUbHwUxsuah+tT3Usic_W0p0-qdvP1DbeuccA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-virtualization@lists.yoctoproject.org, 
	nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 3:45 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> What branch are you working with ?
>
> Now that seccomp is in core, we no longer have those restrictions, so
> I assume this is on an older branch ?

aha. never mind, I misread the change.

That being said, I honestly think this is a bug. If the main
libseccomp is dependent on a distro feature, each and every recipe
that has a hard dependency on it, should not have to do the distro
check.

so for now, I'm going to not apply these while I look for a better method.

Bruce

>
> Bruce
>
> On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
> >
> > The libseccomp package is only available if seccomp is in DISTRO_FEATURES.
> >
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > ---
> >  recipes-containers/podman/podman_git.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> > index 9dcb21c..351f38b 100644
> > --- a/recipes-containers/podman/podman_git.bb
> > +++ b/recipes-containers/podman/podman_git.bb
> > @@ -6,6 +6,9 @@ DESCRIPTION = "Podman is a daemonless container engine for developing, \
> >      `alias docker=podman`. \
> >      "
> >
> > +inherit features_check
> > +REQUIRED_DISTRO_FEATURES ?= "seccomp"
> > +
> >  DEPENDS = " \
> >      go-metalinter-native \
> >      go-md2man-native \
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
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
