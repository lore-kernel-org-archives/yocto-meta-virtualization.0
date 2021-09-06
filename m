Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.22505.1630937311799733900
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 07:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ol6z+3/C;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n27so13759029eja.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Sep 2021 07:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kzX4MYMCKkw1XgUxhKZh1JZllVItXjwIIli9JbhgZAs=;
        b=Ol6z+3/CshXCufKJO9vKENQx81TKsjxuWog4t5y1IWrPtQv8Nq4naE4xuP6sXLElm1
         Bi9YMWu08Z5EDUNewWDWzPET1su9pGwyFqwRNuZmLuhrfYtkYcstrpob0r+G0NDfixhH
         T/BOMed4HSRNDF1qc+V0c4cAl1XhACwgzaK5W4x3JvYeOxr3apcAQgKXl0g1ytCU0NCO
         u2AXioBsm1WXIxysQ576IBQRSr1vj0LPgAv/n64u/Py9rsl2/Qi8P9Nn5yehVErmQ4/8
         CeH+7YZuW9vpK455SiLorjqxFhOsBMvb/EAAzW0QAR+WQbe7k1O+cIJP4zStHiB9njUK
         avJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kzX4MYMCKkw1XgUxhKZh1JZllVItXjwIIli9JbhgZAs=;
        b=N7hN/c6BB0LDfP2TAFHZbOelfU9NLE46u2UigySVU5dvcjqUq7vEJyP6tamBuH/iGc
         JnaZkmEvBlxqJLyCg+c9VletY8x5hNNNZi37LEwU+EZhuGKyBhAeQ4E0Td0VM55vQ7Vq
         lDFgBowT08cWM/lG0SX/9NDi8vSwVQfX1OOHAuc91Ei/YoSr+P5Ht/S9+iYW1oCsOE5G
         ikqxsM7HV2sgEgjcszXW6ErssJhRukECtj8b6cYn2E3dLZUoL3hXgyZ8meLo07bEx5+v
         9r5hm33xhyQGN1MwahqgNysIw4KD+0OHsoCZAzln27GZMua/9hMY7YMN4Yzfd4Gd2va0
         7APQ==
X-Gm-Message-State: AOAM533naDZVWu8ymjuwMq2mPrZOnRhgTOwYGtXGcxw/BTlYQGpWq9dI
	TpYivMRqpiPtrZ2l0OxXuZ2frT9geaxbLrOnG9A=
X-Google-Smtp-Source: ABdhPJz+/aPMaYMq9NZocvQWDj4HCKAfphQaYmBa3zJRqcw0dfqxthIyC+6o68fow2xPIRA0dkHr/sW6GvYxhNHeLrc=
X-Received: by 2002:a17:907:174b:: with SMTP id lf11mr13910301ejc.35.1630937309760;
 Mon, 06 Sep 2021 07:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210906080510.28468-1-mingli.yu@windriver.com>
 <20210906080510.28468-2-mingli.yu@windriver.com> <CADkTA4OJ1XKrGkUvbUCW6AyoGwK4rQaPhER4P0hzpb3xg1Fzdg@mail.gmail.com>
In-Reply-To: <CADkTA4OJ1XKrGkUvbUCW6AyoGwK4rQaPhER4P0hzpb3xg1Fzdg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 6 Sep 2021 10:08:18 -0400
Message-ID: <CADkTA4PujyTHtFxOt0DodPQQGBS=bwAC-4FC7pVG4jLrQfVaRQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] skopeo: Upgrade to 1.4.1
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 9:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> I also already have this version bump queued locally.

Actually cancel that. I have more -dev versions under test (I got my
uprev's confused for a moment).

But we don't want this SRCREV change. I put it to the tip of the
release branch on purpose, this rewinds the SRCREV, and it isn't
something I'd merge.

But the packageconfig change can be valid, and is something I'd take.

Bruce

>
>
> On Mon, Sep 6, 2021 at 4:09 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Remove the unvalid keys to silence the below warning:
> >  # podman --version
> >  WARN[0000] Failed to decode the keys ["storage.options.override_kernel_check" "storage.options.overlay.ostree_repo"] from "/etc/containers/storage.conf"
> >  podman version 3.3.1
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  recipes-containers/skopeo/files/storage.conf | 6 +++---
> >  recipes-containers/skopeo/skopeo_git.bb      | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
> > index 818cfe8..c0d512f 100644
> > --- a/recipes-containers/skopeo/files/storage.conf
> > +++ b/recipes-containers/skopeo/files/storage.conf
> > @@ -30,7 +30,7 @@ size = ""
> >  #mount_program = "/usr/bin/fuse-overlayfs"
> >
> >  # OverrideKernelCheck tells the driver to ignore kernel checks based on kernel version
> > -override_kernel_check = "true"
> > +#override_kernel_check = "true"
>
> But there's no reason to drop this.
>
> >
> >  # mountopt specifies comma separated list of extra mount options
> >  mountopt = "nodev"
> > @@ -126,8 +126,8 @@ mountopt = "nodev"
> >  # xfs_nospace_max_retries = "0"
> >
> >  # If specified, use OSTree to deduplicate files with the overlay backend
> > -ostree_repo = ""
> > +#ostree_repo = ""
> >
> >  # Set to skip a PRIVATE bind mount on the storage home directory.  Only supported by
> >  # certain container storage drivers
> > -skip_mount_home = "false"
> > +#skip_mount_home = "false"
>
> or any of these .. the skopeo configuration serves many different use
> cases, if these are causing warnings in your setup, you need to carry
> your own storage.conf
>
> Bruce
>
> > diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> > index 39ee8ca..adb7de1 100644
> > --- a/recipes-containers/skopeo/skopeo_git.bb
> > +++ b/recipes-containers/skopeo/skopeo_git.bb
> > @@ -27,7 +27,7 @@ SRC_URI = " \
> >      file://registries.conf \
> >  "
> >
> > -SRCREV = "01e51ce610e3cfe1230a10af982e962c4ad1c990"
> > +SRCREV = "130f32f047b7bf9b1fb4f95c4c5b1da6255e4829"
> >  PV = "v1.4.1+git${SRCPV}"
> >  GO_IMPORT = "import"
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
