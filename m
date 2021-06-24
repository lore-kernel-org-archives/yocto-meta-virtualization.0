Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.46.1624553391543414407
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 09:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qgaTSPyu;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id s6so9448856edu.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Jun 2021 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+JKwEmhu0+/Y2CPa3o6ui7gcOGbvoVqcrcVUITb69Aw=;
        b=qgaTSPyufOG/igzVfjMJeguRC9lfgVmV8GoAMg8se5CFCSLUkdJbppSZKnGu76Wdzu
         XuzB7+b/wKFZBiU+COy1ZWji8RARLkP/+IRe0nIWL77Guw56Dw8GGSWRIajbOno1Pyp8
         s2IyqGVWmBOrJjCt9ZHEZ5RY2P5SHuGmatpfu2zaHOFiX+luILEi+Shl5STdmqyp7xtl
         tpqYDG8+wcGY1T0LdJm+Zt/JL5k4XampXQZ3s5IJHZG82HqybGlXBM7y56+FGQq07pGI
         iRtb5GugDoLqAEGTlyN52iERkfApBa/4mgMwEO1q7OyYyTH07ERRMScMECeuu1Cbt7dP
         UbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+JKwEmhu0+/Y2CPa3o6ui7gcOGbvoVqcrcVUITb69Aw=;
        b=imm6Er8pQjtMw/u6GcwN6Kvt5vWEgF7i5W6ypXijsW6FyS3RX9kOkYDpSxkCW5hJwT
         mzLwTdMZ0qaruy1adU4wxKlXJINT06LLkaD316vWkkc+47tWJjwH+O/2H+wRUv6TUivk
         RFy3t2o/j0hL4Mc+JWYDvU55Jfo72tu1d6oEL94/RQ03M9YJ6efKTnbQjgoBI65J4amS
         CX2sUo7fSAhW2lN8pyPhn1S2hRKYgVim/0ICG93PR2SDnObOKRKJMFfzT23J4tlQy1Ld
         l15ZrzUhsk7Bv6sjHV4rMG5sbpX7BZlY5JMsI16NhT2LN4ATPMw/cW3Io9yyoGrxFXNP
         3TSQ==
X-Gm-Message-State: AOAM532L2Y95vKNoqmCyrAAdk9W4liwK6p7XVlO6G9u8Vg2fa2pEQcWi
	r77C8pZ6LzLBmlSLZmhyscwA1ing0lC3HwUBPos=
X-Google-Smtp-Source: ABdhPJzwhYdssoe8Zc2BGmHPxdkD26etExzQXs+xhfpAm6mr5Gr2dbY7ZTbFodV+YVNmAdz29IDK95/3TxCXK7GU4uk=
X-Received: by 2002:a05:6402:90a:: with SMTP id g10mr8391002edz.365.1624553389894;
 Thu, 24 Jun 2021 09:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210622095531.33700-1-yanfei.xu@windriver.com>
In-Reply-To: <20210622095531.33700-1-yanfei.xu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 24 Jun 2021 12:49:38 -0400
Message-ID: <CADkTA4NanrTDpF=mLypqD4aTj+6osr_w6yA684kNivjKtPh6DQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] skopeo: add native and nativesdk support
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Jun 22, 2021 at 5:55 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> 1.Add native and nativesdk support.
>
> 2.Replace "multipath-tools" with "libdevmapper" and "lvm2". Because
> the really direct DEPENDS package is "libdevmapper" and "lvm2". Log
> of do_comopile as below:
>
> -----------------[cut here]---------------------
> DEBUG: Executing shell function do_compile
> NOTE: make -j 40 BUILDTAGS= bin/skopeo
> CGO_CFLAGS="-I/...../usr/include"
> CGO_LDFLAGS="-L/...../usr/lib
> -lgpgme -lgpg-error -lassuan" GO111MODULE=on go build -mod=vendor
> "-buildmode=pie" -ldflags '-X
> main.gitCommit=8efffce8befc2de87670ba75d6c86ada61e869fd ' -gcflags ""
> -tags "" -o bin/skopeo ./cmd/skopeo
> Package devmapper was not found in the pkg-config search path.
> Perhaps you should add the directory containing `devmapper.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'devmapper' found
> pkg-config: exit status 1
> make: *** [Makefile:134: bin/skopeo] Error 2
>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  recipes-containers/skopeo/skopeo_git.bb | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index 2c292463..6c95bf3e 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c4385
>
>  DEPENDS = " \
>      gpgme \
> -    multipath-tools \
> +    libdevmapper \
> +    lvm2 \
>      btrfs-tools \
>      glib-2.0 \
>      ostree \
> @@ -80,4 +81,16 @@ do_install() {
>         install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
>  }
>
> +do_install_append_class-native() {
> +    create_cmdline_wrapper ${D}/${sbindir}/skopeo \
> +        --policy ${sysconfdir}/containers/policy.json
> +}
> +
> +do_install_append_class-nativesdk() {
> +    create_cmdline_wrapper ${D}/${sbindir}/skopeo \
> +        --policy ${sysconfdir}/containers/policy.json
> +}
> +
>  INSANE_SKIP_${PN} += "ldflags"
> +
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
