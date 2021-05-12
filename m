Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.2458.1620846462813537673
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 May 2021 12:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pk6dhEiK;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id r11so4312822edt.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 May 2021 12:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=903Ep3UubZy+R9z9qFtuYVOytsXgZfmWmEtvoDhVq1w=;
        b=Pk6dhEiKUZ4e9CdGuJ1QcgsbclDpaqcl5PoPehCH41WZ2wkc0twqi7F7KV5agAGqyh
         hMplqAi/lqfOJwTh2Dqy/T76CG6Oe/UT/gu5iogxi6PsKdh+Z+yjT1PNUzVAfIx1+o2q
         mr4yw9WzH2pw0ps0i2kYOoNgzBHt6GyykDmL6jVSlcNVItKf145hFpRipW4C2zjqQR/d
         hzETSmkZ/Y8OZ//ehX/Cnvj0KQvWDbCEeUxO3ZGppu9SOQj/ARsyxL4DImDfU1djKMhQ
         HKVwsZ9YD9NiYx254DnzTwgnk+t8i+sLkAAOPOSZM60nNLEidZ8jTH0rKkbjnFu8xI8e
         qOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=903Ep3UubZy+R9z9qFtuYVOytsXgZfmWmEtvoDhVq1w=;
        b=ozr1wqEWPYqtnnCez94+qUgshaxunPEniE9tqVZhpSIjFzYHS1NK5MZKr1lbNYPlb3
         /TA15fTSJ9VWKoUBkOCBYKXF+OaHHR8HNliiD4Gv4YhWbmNXCJsbFwlmhFslCnJ4X7Vd
         blsA1WstqjyM+JaQRYEQuBdu4/9icwqGKeZUSo54m1FuyACM6KXgeOzXrdzThYkU+rS4
         vYYNp21xm3EZn07zOpUaVefzQF5epfoZUv3cjcU2GhyeKw1+qfFiRH6u2iYIi5AmBhi9
         ht3NIEbYfrviyvTJp5AYRJgyDAd30lVOc8FgTBGVtwzu31rDMxS6PZYOmLabNpviez9D
         f1zw==
X-Gm-Message-State: AOAM531r/tqW+6ecVoAe5hB4yQD2hyD6Cwq+JLEkBvxsO3x12TsnhqpW
	n32zWb0Ut+jpd9IievhGbRlQuKvIUOiYk9Hc6VY=
X-Google-Smtp-Source: ABdhPJy3I9Kd4kwS3iARpe7MzV2vXCc066SbCgPe4MizhExNWQOKK2+UlqCX93PYe8UWH2F+RecKqSZ3TQRltYfHipk=
X-Received: by 2002:a05:6402:11c7:: with SMTP id j7mr45946487edw.129.1620846461258;
 Wed, 12 May 2021 12:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <29f9bb8975f085f2c86087938b383895a3e8871f.1620663255.git.diego.sueiro@arm.com>
In-Reply-To: <29f9bb8975f085f2c86087938b383895a3e8871f.1620663255.git.diego.sueiro@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 12 May 2021 15:07:30 -0400
Message-ID: <CADkTA4PCyLOpvZp8sD943Eb1w05+uV0Toii-QBoBypBJzwrDdQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH hardknott] podman: Update 3.0-rc2 -> 3.0.1
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, May 10, 2021 at 12:16 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Update podman to 3.0.1.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-containers/podman/{podman_git.bb => podman_3.0.1.bb} | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>  rename recipes-containers/podman/{podman_git.bb => podman_3.0.1.bb} (97%)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_3.0.1.bb
> similarity index 97%
> rename from recipes-containers/podman/podman_git.bb
> rename to recipes-containers/podman/podman_3.0.1.bb
> index 6fb803e..26e6637 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_3.0.1.bb
> @@ -16,7 +16,7 @@ DEPENDS = " \
>
>  PNBLACKLIST[podman] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'security', '', 'Depends on libseccomp from meta-security which is not included', d)}"
>
> -SRCREV = "288fb688964cb7fc7086d0728daa1f5f6b726dd6"
> +SRCREV = "c640670e85c4aaaff92741691d6a854a90229d8d"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v3.0 \
>  "
> @@ -28,8 +28,6 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -PV = "3.0-rc2+git${SRCPV}"
> -
>  PACKAGES =+ "${PN}-contrib"
>
>  PODMAN_PKG = "github.com/containers/libpod"
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
