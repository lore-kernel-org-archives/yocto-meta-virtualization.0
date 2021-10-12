Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.17767.1634061733687092963
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 11:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qkm3arCi;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id w14so2610808edv.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Oct 2021 11:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UCvcL6CHKC0/E7/o9NcaXY4hR2C579BqUK+9S1n0Als=;
        b=qkm3arCiMgGjMG13GywrCtM9vTNr/FXOZ0xUCCUFWutWSUDe0JY+vyPpK5pe+Z734M
         ix6cnPWmlZXKkqYuHrrPj1IFoaC6Q+HxxPykrbdoZH3We2/uwpo4xyLopfu8/tTN1uBk
         wt2sq7s9ToQKFVGDnLb34ZPvXQVIl6jXEinV7YiZsS56P4MTa3/IxpYOIs+gHBfOdA9T
         NBPNA3BrD4IE1DeJ1r8Q3DIvWR5N9IyZV4aOvxZdFqRCT4TKt1JDiSXD48YB2HHVBGLB
         RGXQ0BfzNjILqqxCbppqYHDN0jH/jRSwrbs5Dct2mj/z9EAA3AYQG13ApVU0XBkGSIGc
         ttiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UCvcL6CHKC0/E7/o9NcaXY4hR2C579BqUK+9S1n0Als=;
        b=YU57sI01WAI5a1HJgOfhYQJ919hHrYSSu135NNASbm6rt8Lx9il6XyD68PMjZsgrWt
         RNQZjKXRsF6KKWHE7SSPpmqbSHuBff4/0Xct6XJMIzgHlCyQI7L44Pk0XCWOCgaXdxbe
         uCsbI5Tl9sKt9QaQbT13Ru5IvowKf+W0aC95Bx9DaWxWiGn8kquAlzkSOX68P+QiBs8l
         1P1IqwZio/bxfTSNbcmLlbkRTLje7CqCsN1ZO4q4fJOtvUc3Y1Umw8jSfNK5PWfMrnDw
         y7DUpvZnKEDf/us4gplT6XI2vKvky3SoOdRj0I1AvJuqV6oetnzCiv1pZSh0dN8Q2vbQ
         roOw==
X-Gm-Message-State: AOAM531FzOM+Hlg1qGp9XNwV/673BTmNxKv4epCZnpwUgTSs7dl4uyXk
	I7yOT20cm+Z4eqgE0FjPtwBlZX0RbjydZI1wrQ4=
X-Google-Smtp-Source: ABdhPJzGNBgqcpjsmj1eacMJNeg5CBqkXzytvP264aTyob4Pep0C9I/UQdy/Jwgh8R5WnK4Goc85QbyQw8e41R813QM=
X-Received: by 2002:a50:9347:: with SMTP id n7mr1625636eda.249.1634061732020;
 Tue, 12 Oct 2021 11:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <9b56a9db183fd6725e570d16365e627905cdbbdf.1634060903.git.diego.sueiro@arm.com>
In-Reply-To: <9b56a9db183fd6725e570d16365e627905cdbbdf.1634060903.git.diego.sueiro@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 12 Oct 2021 14:02:01 -0400
Message-ID: <CADkTA4MtVO9=6=mi2W8YDAVSPV9KwTx+H3BLpUgi++zqqnWRVg@mail.gmail.com>
Subject: Re: [meta-virtualization][hardknott][PATCH] k3s: Bump to v1.20.11+k3s2
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

We can't bump hardknott ahead of master, but as it turns out, I
already have pending k*s updates for master, so I can cherry pick them
to the stable branches after I'm finished testing.

Bruce

On Tue, Oct 12, 2021 at 1:52 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-containers/k3s/k3s_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
> index 2811fb8..f51d9d4 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -13,9 +13,9 @@ SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.20;name=k3s \
>             file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
>            "
>  SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
> -SRCREV_k3s = "bc400f5396a3dd05584c5f45768a5ea6c43971d1"
> +SRCREV_k3s = "9cb5fb5716bdfb13e755206aff5688961f5bafb3"
>
> -PV = "v1.20.4+k3s1"
> +PV = "v1.20.11+k3s2"
>
>  CNI_NETWORKING_FILES ?= "${WORKDIR}/cni-containerd-net.conf"
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
