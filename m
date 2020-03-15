Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.44390.1584288913987144785
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Mar 2020 09:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gbDZ4+uM;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id v6so3714938edw.8
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Mar 2020 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s2zhIHXruADv/IH5mQZpfN5oKrQ7JjQsBbyxbx5vzDw=;
        b=gbDZ4+uMnJItfDYMAuaTu0OXGQJC4UpqvMmv5x88jcZ5qp4Ys3XYkk80xUmCYkAzjM
         5C1WYxWDzjbihvtjrdSz4NJ4RVcxK8152PguNWB/j3WuWbieh2XneM4SBYht/U+g/W70
         iTkaJ/ScZQptp5FP+CROKXDnxvxrj7ySOOyLESW8TUdyrlWhMBGEjOkQ9q5URJUnIfoZ
         2yIX0Z6wea1OgEI956B8ezvLOQy0EoZsj1yC4KTaX3P5fKm4v7cG0oG1x9uNtZ+I3/ze
         A6eN2TB8lzxClhNvl2udpb5Mde9o+mhnM6K775VztgjDZj18nfjnqSx3oP1xln7p3Lfu
         /Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s2zhIHXruADv/IH5mQZpfN5oKrQ7JjQsBbyxbx5vzDw=;
        b=hHfG2w53k/kcFwT3GuYdR/CTMdbKfiOCWxP8gN8vAZsb5uPFJwA6rRy/Fr0rmhornL
         D4fw9lkpsovyCAvfO0+yDQ5nwjogvfPj8YHX6lffd1Uwmq0CulpN2Kp17xN7inTrFz8T
         bvHS3ebwaWlkq6dD7T4OXygvVsCJkZdKpsE6KB5q8+zLFAAeX6lOtbnmEcKBEpFYmpyM
         jhOSGJVCp21+lvDrIIt3ZP1MiOV/vQc9H5MeAhxHUVkmnIwK0jUZX1EqtrISsSjLkYt0
         13Ft59QS68LIZi1Nw6H2AJe0rSzWVMOpN/BCvFP7ake8pUpM6DtCrQYgPhGIaU4vzWLH
         FXxg==
X-Gm-Message-State: ANhLgQ2sJVo0k2wILwZAwUuHxyibzMdE/dTpC2J4/3CMXQzcJ4pWu2VZ
	Pk09MRHumKiTopJdubVK7B6IWxkXGfWwYHlcD10=
X-Google-Smtp-Source: ADFU+vvHLhIiqcAut1mq51SGMQ6zgai8t8AG9XPiMvG3GVqhSkjRWHHMNxPauN49dK3Toe6vRB3GAiv2086tevW8+po=
X-Received: by 2002:a17:906:4bc8:: with SMTP id x8mr18549514ejv.339.1584288912204;
 Sun, 15 Mar 2020 09:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200315122008.22161-1-liu.ming50@gmail.com> <20200315122008.22161-3-liu.ming50@gmail.com>
In-Reply-To: <20200315122008.22161-3-liu.ming50@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 15 Mar 2020 12:15:01 -0400
Message-ID: <CADkTA4PV+y5VrfRpWGC23rN3cRPheLxd58mDRZMBMs48ntu+3w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/3] docker-ce: uprev to 19.03.8
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"

I already have this pending, so won't merge this change.

Cheers,

Bruce

On Sun, Mar 15, 2020 at 8:20 AM Ming Liu <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <ming.liu@toradex.com>
>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index e32a734..82cce73 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV_docker = "f0e27e52c1d57597a9b2e50baad33feb80474b76"
> +SRCREV_docker = "afacb8b7f0d8d4f9d2a8e8736e9c993e672b41f3"
>  SRCREV_libnetwork = "9fd385be8302dbe1071a3ce124891893ff27f90f"
>  SRC_URI = "\
>         git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "19.03.6-ce"
> +DOCKER_VERSION = "19.03.8-ce"
>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>
>  PACKAGES =+ "${PN}-contrib"
> --
> 2.25.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
