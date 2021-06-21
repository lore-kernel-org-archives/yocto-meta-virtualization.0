Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.46834.1624280306320828470
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 05:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zsj4NM4d;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id s15so18786783edt.13
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jun 2021 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vActVgXbbkaO7EVVqSFH/F1Q3gfLZ45yYwO+j3BKass=;
        b=Zsj4NM4dPqZvw9/9jPsthTrykn6lEfx3Ui27KI6UIAnkV+hbq5n1f2nXYfBK5h8xhr
         4s66VtCo/zjzweDkwVkVGRIqfE8U8hobqu5XA3xa30vS61vVR4Th/ppJAjw6XUuu5azW
         Ql9iywXGVBN6X7RCaO2JrvTjlyc5hMkllAFtSzvRmJU9IKhXAlFbZaaOV2aR1M2h4Wyf
         V4JUvUc5Ygy3A58Tuw9t9Di7c72e3/K8yyNyqoMLompUWcrqx98ovGgszFVbtJJ/pYo4
         /S71yZKmOTE9N4aIkDI5Pm203EgXtjrLsOJFJzZgLwbwlyK945KgvXt8z81vy2mwfiLG
         HyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vActVgXbbkaO7EVVqSFH/F1Q3gfLZ45yYwO+j3BKass=;
        b=Xe/T5F5WOAHXdJmaSz5vhxLN+yK/F+M98mAg/kOgOX1vDLpcnewQpUitxqMHMCMmcl
         l5XtVg0zCHDk70ct70sdzZaRioQmgyiz+LVqq2A3RHNVoj9gld86AMv/NKczO7cSAlVu
         JIxJAS/aQiUtFLAOdtsUvVhLKl5b4xlUGz32NPRiQluj4uBkGcgOpM8nbQ7RO8MixuK5
         Vxc/Aeyc28qt92T+vcF5WQkcopMBhqbLnOkJtP+IcZLGOyN+Mq3vSxX3WWH9ChtVeD0e
         dPj7wL3dcBx+Y0UKvq3PsGUTPXcCpbwLE2S1FWSUgud4OFv4oSZxJySWfV4dmbQvSr3N
         RRBg==
X-Gm-Message-State: AOAM530o193Kzg02JOjdbyGRvba1tYcW+/YROBfAGcn8goZf9E/3INpL
	BITLhM5JK+OJW+9P+OKPJVcTFJyNav0HArTPH4I=
X-Google-Smtp-Source: ABdhPJxQNF99iz4S1XLcSk9C5E8WfLpnaTJOWp9NN/9Jpqn9Z4Yx1BH2h/5V9HDSKf5umXV6/vIgRxR/Bm9iu7fL/4c=
X-Received: by 2002:a05:6402:31a9:: with SMTP id dj9mr21208065edb.164.1624280304647;
 Mon, 21 Jun 2021 05:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210621054046.15518-1-mingli.yu@windriver.com>
In-Reply-To: <20210621054046.15518-1-mingli.yu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 21 Jun 2021 08:58:13 -0400
Message-ID: <CADkTA4ONqYOzDL2qJZDR0Wt3o6U+VZAzPEUew9sVX9wz+XtXWg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] conmon: switch to main branch
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the change.

I had done the same myself over the weekend, but was still doing a few tests.

I pushed the change this morning, and have also cherry picked it to
older releases.

Bruce

On Mon, Jun 21, 2021 at 1:41 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Switch to main branch to fix do_fetch error.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/conmon/conmon_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/conmon/conmon_git.bb b/recipes-containers/conmon/conmon_git.bb
> index 74f5bfa..974eb07 100644
> --- a/recipes-containers/conmon/conmon_git.bb
> +++ b/recipes-containers/conmon/conmon_git.bb
> @@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 go-md2man-native"
>
>  SRCREV = "31614525ebc5fd9668a6e084b5638d71b903bf6d"
>  SRC_URI = "\
> -    git://github.com/containers/conmon.git \
> +    git://github.com/containers/conmon.git;branch=main \
>  "
>
>  PV = "2.0.28+git${SRCPV}"
> --
> 2.29.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
