Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.46978.1624280911837252013
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 06:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h3zDxb5a;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id nd37so28746575ejc.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jun 2021 06:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYcSruXftXaBd5fOlbEMOlIUJIJ3PAZsjXlkqCDCQhQ=;
        b=h3zDxb5apZhB4TyByF1Elnw8omb88Tm6BhGdh3exNC3kGRCO1USqhMTDhPqOmpNK91
         r3rEnLjNwczNBvVakBZTAbM6X2veE9x0iWPypO8gM9CJsTQ5lKsYGatIBGp5m0U+CG/6
         gYDbmdxamMJGsTFJmeGlpuQ9+kGiHmFYPBoLaQO3FY0xn45a6K5DWSBfymekvZP7pJqT
         2LSk0ssATja16iE80heqkKKhCX/k8hxklmRUb/mvNZM7WYY+4/QF/7GPSbCdr0mSQHxi
         9Jx8Jq7TO3MDQKUnbSPiMxXi9EvFZ8yY8FL89gjwFRo5Lw4scjIDyyExiBZU3lfybFn0
         svyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYcSruXftXaBd5fOlbEMOlIUJIJ3PAZsjXlkqCDCQhQ=;
        b=U6vMGVo83Yd/5pNrIKwYfPZFVTJ/0cxhaefheRyQ3zSNvSR7IuZPRciueJNSEDrFON
         q90pbPcsklr7QeS+qnSDraHJL86WWkKzs/1haZdmvt2J2oBBpcuFpdRGhmfTy2is4dDQ
         SOqvXR4mO9Ny6kldv/MsFnwr99ijqQAAVyhwV5XMHrd/edXWcR4+UEfh1sKkuDUR05G8
         dl3I/7+mfiw4OlPmhTR+vllEgepXAkmDPWENzipAs4cJbqdStw2mcMUMt5ERwDhD0gZQ
         FHOQDDLpxp2fNJ/1XDiy3n4MMOSZaevuGvEQMX5mSiEVHCxu1lqFJj/ckWojN8B6jXD9
         /GuA==
X-Gm-Message-State: AOAM531uPz4SbV5usXjF76ah2T7Yedhn2+pKyviTawWj598FIIikntaC
	pb8a3Q2O16+OKbd6VyoTbLeAO6NoB+Kkk/h/Stw=
X-Google-Smtp-Source: ABdhPJwJm4U+3giYSOW8IessQng9aiTBVGIowGDG3Bl+jEc5SdKuPdUkJZ6wlyZ4QNcocVJem0iqS0h5v9WivqeRhBc=
X-Received: by 2002:a17:906:ca17:: with SMTP id jt23mr24986273ejb.334.1624280910099;
 Mon, 21 Jun 2021 06:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210616074153.31524-1-yanfei.xu@windriver.com>
In-Reply-To: <20210616074153.31524-1-yanfei.xu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 21 Jun 2021 09:08:19 -0400
Message-ID: <CADkTA4OmZbh_0CGbGCmrRcOdmDF=nftB9ihukHvJhQGJVvT9OQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] umoci: add nativesdk to BBCLASSEXTEND
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Jun 16, 2021 at 3:42 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> add nativesdk to BBCLASSEXTEND
>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  recipes-containers/umoci/umoci_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
> index 7cd147b2..f83a35a7 100644
> --- a/recipes-containers/umoci/umoci_git.bb
> +++ b/recipes-containers/umoci/umoci_git.bb
> @@ -77,4 +77,4 @@ do_install() {
>  }
>
>  INSANE_SKIP_${PN} += "ldflags already-stripped"
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.27.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
