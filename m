Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.22449.1630936015158980148
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 06:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LABtfryn;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id mf2so13596160ejb.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Sep 2021 06:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HqCd68PKteCFtad9xXd868ZbdaCWh+9rRQXf4Eu7MYg=;
        b=LABtfrynlk6c4snPT5wjEP3GPJq5zRJlZmVcwppiNDODu45N0kapg64By+iZnK7n/A
         IJgqZSREao7WWdOXOdmpP2pIW/REPPhb3UyBRSTFaaBxHoIo/FT/yBlHVrAQJpArPKF4
         6pqlkVKOKBvFeiRoUTj6Mmg2OVfBuUQ9wsTCNVSMVXtEqRwJyzLJ/ufZkVYGBLHSP13a
         0ksRfnOMEIVQT6R1zQKbj1JKtgcB2/vJ0XRKA2w2wvGd3+VnsWICvaLEuN00MzoXzgz/
         h/zu0yhHxwmegla8iJzPKt4bir7gB3mfRI9kcZXS4Ia5BHzFiypjm3cse0d6T/WxDzj9
         l5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HqCd68PKteCFtad9xXd868ZbdaCWh+9rRQXf4Eu7MYg=;
        b=scVDnMXSL+u5dqldLY6gt3LlF9mLehstSaEuqFqLB8xHYgdqvUMUaNCRcGpTbSBjRv
         58JKL+bxzPBD4UepxOEx+sLv+J7Jo2EUbCbH2a1hHsC0UV0S7trkGXtbhuRN1HDZwuzJ
         uGtCduAO22srEfgW3FxjzFtjLprieBs+io5Pm2MynFZhkOClT80yUsBNSmp14hkGvQ0/
         cSnx7a6RaneROzR1mwEWDhjZgsp60dBhiWuVh4QcK2HsvobXoa6+Q9wXNbC9noKLNB86
         1H94zLBrBizrsxq7mVRWOripncH/SNKOr2Z3nKs9ztpxdzsvhnEteApI0iB4IRKvEIEU
         wfKA==
X-Gm-Message-State: AOAM531w8ripkCrYZhC2QTRZIAfmIuzeBfPvIB89NriyeedueXTsyQvL
	Ow7M0M2xeWxkT4FEg9nuo500h2ZtwZThXMj+D+63Q8xKygU=
X-Google-Smtp-Source: ABdhPJxD0K3QV+xNEe2VFlveXwAwuKF9qyXyMNPU2kZ4MNXqJB1GePjnYtRP2btAX36jqRPAnwuaTGDQMmcMZdmRlZY=
X-Received: by 2002:a17:906:d94:: with SMTP id m20mr13663772eji.445.1630936013366;
 Mon, 06 Sep 2021 06:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210906080510.28468-1-mingli.yu@windriver.com> <20210906080510.28468-2-mingli.yu@windriver.com>
In-Reply-To: <20210906080510.28468-2-mingli.yu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 6 Sep 2021 09:46:41 -0400
Message-ID: <CADkTA4OJ1XKrGkUvbUCW6AyoGwK4rQaPhER4P0hzpb3xg1Fzdg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] skopeo: Upgrade to 1.4.1
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I also already have this version bump queued locally.


On Mon, Sep 6, 2021 at 4:09 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Remove the unvalid keys to silence the below warning:
>  # podman --version
>  WARN[0000] Failed to decode the keys ["storage.options.override_kernel_check" "storage.options.overlay.ostree_repo"] from "/etc/containers/storage.conf"
>  podman version 3.3.1
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/skopeo/files/storage.conf | 6 +++---
>  recipes-containers/skopeo/skopeo_git.bb      | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
> index 818cfe8..c0d512f 100644
> --- a/recipes-containers/skopeo/files/storage.conf
> +++ b/recipes-containers/skopeo/files/storage.conf
> @@ -30,7 +30,7 @@ size = ""
>  #mount_program = "/usr/bin/fuse-overlayfs"
>
>  # OverrideKernelCheck tells the driver to ignore kernel checks based on kernel version
> -override_kernel_check = "true"
> +#override_kernel_check = "true"

But there's no reason to drop this.

>
>  # mountopt specifies comma separated list of extra mount options
>  mountopt = "nodev"
> @@ -126,8 +126,8 @@ mountopt = "nodev"
>  # xfs_nospace_max_retries = "0"
>
>  # If specified, use OSTree to deduplicate files with the overlay backend
> -ostree_repo = ""
> +#ostree_repo = ""
>
>  # Set to skip a PRIVATE bind mount on the storage home directory.  Only supported by
>  # certain container storage drivers
> -skip_mount_home = "false"
> +#skip_mount_home = "false"

or any of these .. the skopeo configuration serves many different use
cases, if these are causing warnings in your setup, you need to carry
your own storage.conf

Bruce

> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index 39ee8ca..adb7de1 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -27,7 +27,7 @@ SRC_URI = " \
>      file://registries.conf \
>  "
>
> -SRCREV = "01e51ce610e3cfe1230a10af982e962c4ad1c990"
> +SRCREV = "130f32f047b7bf9b1fb4f95c4c5b1da6255e4829"
>  PV = "v1.4.1+git${SRCPV}"
>  GO_IMPORT = "import"
>
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
