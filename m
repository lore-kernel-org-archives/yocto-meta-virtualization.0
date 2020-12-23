Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8932.1608730981834364317
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Dec 2020 05:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=USrAdwWk;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 3D69038C06B0
	for <meta-virtualization@yoctoproject.org>; Wed, 23 Dec 2020 13:43:01 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id dk8so16288478edb.1
        for <meta-virtualization@yoctoproject.org>; Wed, 23 Dec 2020 05:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ghJXmZCaQxMytvurkI8VEuW7bRnPhHCb1HcAkErzKVM=;
        b=USrAdwWkeLSTFNO0X0aeEBACV33AESzJpNF2jMrt8aGprxnoFKh+px7ODl4rwJGELp
         JRDtYxNx5xyDeIMbhAHbIsigqbu6Oz9COvynkjXih3Kz5MEeeZaOqTfiaB1/tf4XJOfL
         8IfJ7zzRp7NDtgYRZ6XYuY15C/heiPyP5KFEfbEOG53Yar/tBbuJj1HbRpz/pfZ22wex
         1+5Kk6/QXIiCskZrCqgTZpuRkoipSlEE71Rb6Favn9FNU1NA38AjJucmKBs9DKFD2Aac
         ktPrZFxUOsDOpFVHKQaj6Qja+vAL5kAJ8WlxOj/yR2UZO8bBvSf5A15ai2fFnXtlLx1B
         wIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghJXmZCaQxMytvurkI8VEuW7bRnPhHCb1HcAkErzKVM=;
        b=IguaxYieyi5MHUJgiiyZyd9SzqDqGBXvdwB9Ee+3YaAxjCbhTsfHacUWca/i1NmgPk
         7iq70lISfdwtBUxSVlpUbSKobNZKopNJKPnXYXcQSs4TrsLpuTOnT81WWWxaqfvEdIFI
         79lmsVRHxWiEGUD67z1oew0RhL622SnveIozr7YzVwsNqomaiTQig2tjmYVPeECosFyn
         xfWENpv5cBAXL45fDjjlF0bOqSq8x1Rxeb2X6NNmd/Ybi1TEogVcl0kuo73W0q7Nv79I
         70FGuQjWwCb017MCPYEcjVcfUqWSPDeyla7CCgXs5ycu7eeSlJa8Z9//FjM2Vet/GDjf
         hWow==
X-Gm-Message-State: AOAM5314ynq+4pGK8/cAOC0DOmg5e70UApLZeP60e1AW86AQ48FdDK/U
	5uos4g9WHAIZyKc0y1yGHY9uVN5njI25aAptMmM=
X-Google-Smtp-Source: ABdhPJy3SRRcsaYSIJZwwQ7Gk8ivh6f2p933fW9F3u3rKTvxbOblGQfdRXv51C90512Wj5dTtKl2u2jhvZcv1brYPEg=
X-Received: by 2002:a05:6402:1765:: with SMTP id da5mr25220711edb.27.1608730979814;
 Wed, 23 Dec 2020 05:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20201223033751.3553-1-mingli.yu@windriver.com>
In-Reply-To: <20201223033751.3553-1-mingli.yu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 23 Dec 2020 08:42:48 -0500
Message-ID: <CADkTA4PA6X0GZ4AbAugRvANHtb2udteZ6nTjj+OW5V+rMyiYsA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] containerd-docker: remove the recipe
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 22, 2020 at 10:39 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> There is build failure for containerd-docker as the below logic in
> containerd-docker recipe.
> do_compile_prepend() {
>         bberror "${PN} is depreciated and will be removed in the future"
>         bbfatal "use container-opencontainers for a working configuration"
> }
>
> So remove the containerd-docker recipe to avoid confusion.
>

As per some of my previous email, this is going to stay around for one
more release to go through the depreciation process.

And there's no confusion .. that message is very clear :D

Cheers,

bruce

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../containerd/containerd-docker_git.bb       | 22 -------------------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 recipes-containers/containerd/containerd-docker_git.bb
>
> diff --git a/recipes-containers/containerd/containerd-docker_git.bb b/recipes-containers/containerd/containerd-docker_git.bb
> deleted file mode 100644
> index 8d1a27a..0000000
> --- a/recipes-containers/containerd/containerd-docker_git.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SRCREV = "3addd840653146c90a254301d6c3a663c7fd6429"
> -SRC_URI = "\
> -       git://github.com/docker/containerd.git;branch=v0.2.x;destsuffix=git/src/github.com/containerd/containerd \
> -       "
> -
> -
> -LIC_FILES_CHKSUM = "file://LICENSE.code;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
> -
> -include containerd.inc
> -
> -CONTAINERD_VERSION = "v0.2.x"
> -S = "${WORKDIR}/git/src/github.com/containerd/containerd"
> -
> -PROVIDES += "virtual/containerd"
> -RPROVIDES_${PN} = "virtual/containerd"
> -
> -DEPENDS += "btrfs-tools"
> -
> -do_compile_prepend() {
> -       bberror "${PN} is depreciated and will be removed in the future"
> -       bbfatal "use container-opencontainers for a working configuration"
> -}
> --
> 2.26.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
