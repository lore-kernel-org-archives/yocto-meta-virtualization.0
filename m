Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.632.1634857062746468325
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 15:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p5cJUFvM;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id y12so4626219eda.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Oct 2021 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Kd8+6+2fWaBAYKqmVdC0uI7RFjlD/497PnIrIgeHPg=;
        b=p5cJUFvM1oj5ODTakWYCRoIgdeRkot9OoghdYJ1AQjpjz3xojtxpZiOmUHveu4uvJV
         /LCMfuMtZtt9zVTSf5Em/LjABLWFuu5LD8JdCPPny9q4c60NtHHVJCtmuMA+90fWjG9Y
         wZILInj+kpxlg/3Gj26ehCQSB52TiVEdO/rrLpZQSK4SuM4jJoYxMzq32gU1JsGta0qR
         Sx3lYEeVBnW5EZJ1ahMoKlV9o76h1wzREu83bE9gS1oBBmbW9/B2n5Wbo4cZMB2xcaa6
         5zXSaJCfyTHEL4D06L0f5cI8ViUA3N80ebm9OXNJDxTyjENaB4AZ3MWgWMXUoWxQxOas
         s+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Kd8+6+2fWaBAYKqmVdC0uI7RFjlD/497PnIrIgeHPg=;
        b=wduwwdF2qoI6UZl51upO1ZVxtn7sfKcJLjOIgDBnUUKUgw0XzJjwMvfngjRKVxv4Dc
         sNW2D8jZOixMKu5wHmAwh4oOe2PoFI6eIAVMuZh0D/LR5lLufcjEELwfVOab9ZQSNLc2
         CCwdScaojSquI0FtIzJKIVvQI9TpfvqOCUObOoc2vXhPtGQIEnjKhN/QCQ0USSUdFlSS
         CTM8MYuQ/UN8m2k8An3ExfybG8NNLtMorXno0zvQ9SYrrJzFGHSBmTqGXuq6rXSydBUe
         M6TUKHrO6nYzm5UiPqZbddnenpQrajd3grFQs1r2i6XwgKuKxaqc1esIBXf0o+JLgBmp
         sVxg==
X-Gm-Message-State: AOAM5312vW7tTgN0VKgkSS5hOf/lZYkgJYwYghgEPm74CoISdDhMvGAV
	qeUtSKoPRahNlm8dxt18CdBob2aPgT98XaTucYo=
X-Google-Smtp-Source: ABdhPJxGoCPd1JtL3xnjd/YSCMDbYNXrDTouDvD6nHwVdg7rP1H5QcNf44Fe6SG6K8VrskuWo3zoCMabSyxwSQfXU3g=
X-Received: by 2002:a05:6402:cb2:: with SMTP id cn18mr11445273edb.249.1634857061264;
 Thu, 21 Oct 2021 15:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAGDtK5=sGMC0dTiK7b=ag8WWusQh6+7VWcZOBzN9s5H4GiUWdA@mail.gmail.com>
In-Reply-To: <CAGDtK5=sGMC0dTiK7b=ag8WWusQh6+7VWcZOBzN9s5H4GiUWdA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 21 Oct 2021 18:57:30 -0400
Message-ID: <CADkTA4MoPFtWX4FNvBuypsjW5_CgSzkkrppG7L8y8JOKgE_vCQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] rename git branch to "main"
To: Nicolas Adell <nicolas.nadell@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the patch!

i have the same changes  locally, as I ran into this today. I've
queued it for master and the supported release branches. I expect to
push it shortly, once I've sorted out another set of changes.

Bruce

On Thu, Oct 21, 2021 at 6:08 PM Nicolas Adell <nicolas.nadell@gmail.com> wrote:
>
> From 6193c0b2415073d2bba106f013ac1ddd3c1ecf4c Mon Sep 17 00:00:00 2001
> From: Nicolas Adell <nicolas.nadell@gmail.com>
> Date: Thu, 21 Oct 2021 23:49:47 +0200
> Subject: [PATCH] umoci: rename git branch to "main"
>
> The upstream project switched from master to main, so we align
> to avoid fetch errors (as the default of master no longer works).
>
> Signed-off-by: Nicolas Adell <nicolas.nadell@gmail.com>
> ---
>  recipes-containers/umoci/umoci_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/umoci/umoci_git.bb
> b/recipes-containers/umoci/umoci_git.bb
> index 69325d1..3c8b2fb 100644
> --- a/recipes-containers/umoci/umoci_git.bb
> +++ b/recipes-containers/umoci/umoci_git.bb
> @@ -7,7 +7,7 @@ RDEPENDS:${PN} = "skopeo"
>  RDEPENDS:${PN}:class-native = ""
>
>  SRCREV_umoci = "758044fc26ad65eb900143e90d1e22c2d6e4484d"
> -SRC_URI = "git://github.com/opencontainers/umoci.git;branch=master;name=umoci;destsuffix=github.com/opencontainers/umoci
> \
> +SRC_URI = "git://github.com/opencontainers/umoci.git;branch=main;name=umoci;destsuffix=github.com/opencontainers/umoci
> \
>            "
>
>  PV = "v0.4.7-dev+git${SRCPV}"
> --
> 2.32.0



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
