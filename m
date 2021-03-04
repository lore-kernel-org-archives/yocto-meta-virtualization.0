Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.6307.1614864988989777087
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 05:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mhWI6NzC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id b7so21352214edz.8
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Mar 2021 05:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5PDh5QAVdYVWQhSLzY9TIgvSd2xmqbM//+9QpMulqHE=;
        b=mhWI6NzCWnmonpe2eCJwUOEpe6QP2xoad72Q6DN+veAtfG53UUnoOyWLR3Eshat/rA
         M/SgP52XuIbnvtp54Aja80oSOdinqMAzjlwQVoC37bUtHaY7u9LvWqMG8Ts+P3v/LQoQ
         FMYY2bgk8NP4+FOPNqSSvqW07r3XPMFBaG8IKq+qJphdtPlR6xpE3PFwAZ/kfZmp+Ym8
         ClKN+fvoah1oLu1b+gkxhlqMC7h901ML8iXTtsopoVpqoQ3v/vl4lmVK8v5/Gu2xiwUz
         dya8yWChu9TXIAEW2u3poyX5mBmRcnpMjh5CcWC4haAvhAPowkyBe4kZPWtUCJLeXcZ0
         hfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5PDh5QAVdYVWQhSLzY9TIgvSd2xmqbM//+9QpMulqHE=;
        b=tZI9sLtO4XVh3VejfreoD6+swrjLpt9XeUnFSUKyr/klnAz2vGBoapGPkD5Z0pYFOi
         pLQK01eZcmbO3Mw/hRWpRMPSjLdWKZ+EDnhc2sp7A0kEEMY2+3bx9tAZCsyXOBQ/Ds44
         7kFzSJ7vKcXQKnytkMK5QY67CKU/VlzonGwQZ55jsnxu2IA65MYCmWc+84vOsP4dMd5z
         /RaMpoyCfrJ2ZrvJpEW3YfpwwRZ6SrE7gW1rI4jmogh6CCOA1FXl+dSlFhBBBftyAQt2
         q38jwRhzd0N/Y7N7asaVJtoAKUXxT62qFzocKIfVypgZFc4te0ojTwVu2O7hdJwVjsay
         ixDw==
X-Gm-Message-State: AOAM5309ont2rUqOKQRSyAVYE5qtviEpg0nU5BGihXwDGtP04ZJ78Clk
	Rq1KoZGe4rnmENe5zx8N42CGtCNNT9m0EO1Aa4g=
X-Google-Smtp-Source: ABdhPJzKYmJ4E/buUmP8cMGGyx//8HlcwtOXH0SsaxveDO7WHtucBrBfmm+aVg33Cjn3Zy5zqcse/ClgJ8ISXw6+47E=
X-Received: by 2002:a05:6402:27d3:: with SMTP id c19mr4404537ede.129.1614864987481;
 Thu, 04 Mar 2021 05:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20210304112033.3508867-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210304112033.3508867-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 4 Mar 2021 08:36:16 -0500
Message-ID: <CADkTA4PnZWiqm1YeQhWZ2TRLRKP-TZiEP7ZkmKsBkvEq1qP1fA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] riddler: export GO111MODULE=off
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

This one surprised me, since I knew that I had fixed riddler along
with my other changes .. apparently I didn't actually *commit* the
change.

Thanks for the patch, I just committed the file locally and pushed the change.

Bruce

On Thu, Mar 4, 2021 at 6:20 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> With the latest go version bump in oe-core export GO111MODULE is
> on by default. Our build is not setup to use go modules, so we
> disable it and avoid configuration errors:
>
> | + static
> | CGO_ENABLED=1 arm-webos-linux-gnueabi-go build -tags " cgo static_build" -ldflags "-w -extldflags -static" -o riddler .
> | go: cannot find main module, but found vendor/manifest in riddler/0.1.0+gitAUTOINC+23befa0b23-r0/git/src/import
> |       to create a module there, run:
> |       go mod init
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/riddler/riddler_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
> index 8f71649..7beaf29 100644
> --- a/recipes-containers/riddler/riddler_git.bb
> +++ b/recipes-containers/riddler/riddler_git.bb
> @@ -38,6 +38,7 @@ do_compile() {
>         mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/riddler"
>         ln -sfn "${S}/src/import/parse" "${S}/src/import/vendor/src/github.com/jessfraz/riddler/parse"
>         export GOPATH="${S}/src/import/vendor"
> +       export GO111MODULE=off
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> --
> 2.30.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
