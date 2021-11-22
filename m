Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.6490.1637589252827779239
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 05:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JYhOhIfW;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id r11so77215788edd.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Nov 2021 05:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AqjygwEuL4lilaB0pAw/zSlSvOsuA5BV1daMCFDZolc=;
        b=JYhOhIfW5PCmxfIxotL0IgaPIfdZqM8/C4W6G8BhpCDoK7Ajq6vehc49z65+AD6uZW
         KldQkoM+rZmHYJgETtgMvwRXmrTSVPDK3Xf4Nfyv1BotaHRN5AC7Mv1p7yUMvVPdBCV9
         gSDztoqg/dgdowDszmE+DZXFvfNCTEBxd8toH/IGe55OeSjSYaBDHZkj0VRECElE/1PM
         okxaqiwTXRVc9Vtd26Kb1Jk5FaF+iqArh3h6D0J81FIMug1gglocNy9jg8VaYAIXsFNd
         /Yz4SJBvvJmqOKhQOPFpPhF2pQ9m/g5Hp8Clb7tTGmZIYY2wHU9EmVimXG2no5VsvIXq
         Zvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AqjygwEuL4lilaB0pAw/zSlSvOsuA5BV1daMCFDZolc=;
        b=KdnOKiN6+G9JiUlc/VVv2VowpWKVq6BeX48ei4Z6f1prHT7QQrJbo83HBafwVzjiyR
         /t9GWzBI9IwQNrEbM6DbWHzXq+C+/Mooi/Wnz65vEX0IpJt4TwefUnd1d0NAERmtZq8L
         ZEgyPOFp//04kV+aNVcIgmWlw9wg65Fk6S0Ki4ZvUnbQQGseAwYewULo+YjmA/RV86DA
         M5aHMS9skJlv9CxpO79bxJG3YHA9PsAMFED4CW8X69ZgFk3otTGdVCy5Qrz06raYfIQG
         AL2Jbx7VtH35EO5Kpq4cYlBQuvhzyXEv4rLqf00twbnHa8x47XKZepGb6itd7nQ8/3hS
         jX/A==
X-Gm-Message-State: AOAM532Jl4jCl3hTtIc6bHHD6bBJMOu0XMI/C60iallExwK34Av87DxL
	3DwDvsOlTy/lSReL5q66yNO3LKaTHRnSuVRkhjF1gcPoWBI=
X-Google-Smtp-Source: ABdhPJwOgxLppIkjeAJ23PNcTzhOMiOQUjpzli3MFHvWCpXqqF7ZDSFJIN6wkeHaGW3pF5hyJoc31PfaX4aaqdKoNvE=
X-Received: by 2002:a05:6402:908:: with SMTP id g8mr60735640edz.59.1637589250031;
 Mon, 22 Nov 2021 05:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20211122073735.99777-1-Qi.Chen@windriver.com>
In-Reply-To: <20211122073735.99777-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 22 Nov 2021 08:53:58 -0500
Message-ID: <CADkTA4N6rp1xi7CtiGrHwd8frAjjU6p59jY08kdRZtgnnAN8Lg@mail.gmail.com>
Subject: Re: [meta-virtualization][hardknott][PATCH] containerd-opencontainers: bump to v1.4.12
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I already have version bumps for all of the related components under
test, they'll show up in master-next shortly, and should cover this.

Cheers,

Bruce

On Mon, Nov 22, 2021 at 2:37 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Bump from v1.4.4 to v.1.4.12 so that some CVEs are resolved,
> e.g. CVE-2021-41103.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../containerd/containerd-opencontainers_git.bb               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 774a28c..7f6c75d 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
>                 support as well as checkpoint and restore for cloning and live migration of containers."
>
>
> -SRCREV = "409c87ba59dd96965239573aa9458a3585c05468"
> +SRCREV = "7b11cfaabd73bb80907dd23182b9347b4245eb5d"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
>             file://0001-build-use-oe-provided-GO-and-flags.patch \
>             file://0001-Add-build-option-GODEBUG-1.patch \
> @@ -15,7 +15,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
>
> -CONTAINERD_VERSION = "v1.4.4"
> +CONTAINERD_VERSION = "v1.4.12"
>
>  EXTRA_OEMAKE += "GODEBUG=1"
>
> --
> 2.33.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
