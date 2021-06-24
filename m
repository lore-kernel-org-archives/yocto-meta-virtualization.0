Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.57.1624553444084516676
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 09:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hsnpvNLd;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id gn32so10616442ejc.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Jun 2021 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EpXW1Qy5WX5qeF2KjvRjW+d/OXFfH5kPRZDjs4YZTek=;
        b=hsnpvNLdLli/c/qusJiAIoI4/fnPvyrRDhMk4VPz9aiENwIMCRKPrST7ffmyzfMVc0
         C1WUCiADWVQ8Ke2QeEUVVUA1ePWQyxdptferFFdXM1hVd5dLXUfC8du61TbK9nnJNatG
         OhwEBgqEg+LoJmrvmzucdK4bOifFkz/qJZauHyPsVcacMg/TbU0m2UeYEl9NIBUyFWlq
         huFsXJlmFYksgr13y3r3a24iSeKfa0lSNQHnoMqN95j7Yqy505rEskcVaBxVGufEAlGj
         iwVOWLJaEGlAu68kEybJbQegKx9jnQ2vt9rQDC9CAeX0BA/ZYPX8UysIFtp3Xl6OpniX
         d83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EpXW1Qy5WX5qeF2KjvRjW+d/OXFfH5kPRZDjs4YZTek=;
        b=KtEBohDYvKGIxCAXoFWeyGQtc+gTudKFFbMQrKvCjebG4HEc02x/2sbb80rimNr/P7
         l4A3IhQeQAK8rFSRfo8kOKUAS/OUHn7zil50GODf5k/sv5Mz9Wiazv3mdXV3aBgC4Gsq
         wo7odnIg3iZcB5C4YnkO4ukankFZvuRoIBz6PPDWjnvSkk3pT9gQJ1P/DKbOUsfgfmqi
         oeZTvvf2+gN5o12fYaOxwurnXBCGT9jYpEHLtESxTCbq80cj/tNyn7xGQy2aWoMEc8y0
         FiubUuKvZpWutmWSJri7ajv/TJsi9wcyq+huttFOfjV0RXC4WBwMlQ0fmmf2/LNQxxxp
         6rUw==
X-Gm-Message-State: AOAM533aYZ1bWXIs1+QMup6/P1HYF22SqeblmB9Gi9h4w3VzKcg6f09V
	ipPASE5i9NxJIyBRmlv3KrZwuRHnVc8/yxZWThA=
X-Google-Smtp-Source: ABdhPJwsmm2wXZnT7KVg1fnTQ/IqYO6pWcpu9xsffBbVJEn7nlMz8t0Apupu+XiZTXzFYcAZhUjXxNxPcRzvEUYQJio=
X-Received: by 2002:a17:907:a8f:: with SMTP id by15mr6248136ejc.357.1624553442361;
 Thu, 24 Jun 2021 09:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210623163527.2150181-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210623163527.2150181-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 24 Jun 2021 12:50:31 -0400
Message-ID: <CADkTA4Oi4mJSFRe5dH_C5HanHbozD1VJM=KH4NHij4Gf_pj5aw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] conmon: add dependency on libseccomp and seccomp to REQUIRED_DISTRO_FEATURES
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Thanks Martin,

This is now merged.

Bruce

On Wed, Jun 23, 2021 at 12:35 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * added with to v2.0.29 commit:
>   106cad5 seccomp: add support for seccomp notify
> * fixes:
>   | src/seccomp_notify.c:9:10: fatal error: seccomp.h: No such file or directory
>   |     9 | #include <seccomp.h>
>   |       |          ^~~~~~~~~~~
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/conmon/conmon_git.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/conmon/conmon_git.bb b/recipes-containers/conmon/conmon_git.bb
> index 5c45ce0..e2f452c 100644
> --- a/recipes-containers/conmon/conmon_git.bb
> +++ b/recipes-containers/conmon/conmon_git.bb
> @@ -4,7 +4,10 @@ HOMEPAGE = "https://github.com/containers/conmon"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
>
> -DEPENDS = "glib-2.0 go-md2man-native"
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES ?= "seccomp"
> +
> +DEPENDS = "glib-2.0 go-md2man-native libseccomp"
>
>  SRCREV = "1ef246896b4f6566964ed861b98cd32d0e7bf7a2"
>  SRC_URI = "\
> --
> 2.30.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
