Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.35807.1634560019667229410
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 05:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eHV9wscG;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id y12so72276759eda.4
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Oct 2021 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SMhzLDMZqPbhHlQZ+M80bvTlPlxcfLBWef7O9PdSMm4=;
        b=eHV9wscGYWEguqDfLnYRQf+HfEjHOqmwSWWSYJtLDlYlHzgULvndgvVjhd34tFK4qA
         CsAvwYymXpuy4THmNK6eQPA7/c1wQN7SLXdYgh0fymui+XSieNYR8BMjOTmtb3fpRWG9
         iJwnxJIFK7Hf5Dj9WnBDitHD6X+u4KLWhNsOgfqirP5uSc4RCg2XcJgI+c/eKNCwYK+o
         h1TbB+BJoSVNn98BmsSckgfIW7G6sAxLNAvzr950M35AIS3SrOEfnjfnvjcIxq1Lhqdh
         SDc/ntMLT+Xsof0sQs+4Y3UBZ/dkDlAMfza6c8jmfSHYAfayzNdCekkTv60C1f2DPWJ6
         dk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SMhzLDMZqPbhHlQZ+M80bvTlPlxcfLBWef7O9PdSMm4=;
        b=WI19UqItGBCsh/dtokUGAXY3ZkLFT6S/ijxeXUePhRNq5mhHI1XV3p6PxP7ijhV9+L
         oECH+QCh+8w1Bix+QZKF3RB7slgUhFUN55D9J0rd9qBVBVQEzWOgxEa77/kOBoh1qN5b
         V4fv/qtqdH1O4DCxDH2axB4tSaAwapaBbBsBegDc4ilqDNuO2E9QUH7rMTvVUjCqa8uj
         sQZ4IvBfBUU+nzTX/CgnJt9We130qeBUya71tifUv/J7J8QqAMgB2qoRMus1t1oOmvrR
         mqIbiaZpH5mrQ7/e2NtrIBqn/vhU5OOyfsFzDca5ND544jcDtluR9onkAIT1yPpWQHB+
         eq4w==
X-Gm-Message-State: AOAM531T+2ZPNeye1gjc9ZAQBBQ/MbDx9Zb7c93ptp1IlJjgBBRf4/qS
	HuKh90EJXMKYvylRXr7+YHP9ooogIAmqAehtlII=
X-Google-Smtp-Source: ABdhPJwQcWva0KZKvqXijYqS4zokVk3v3CZ0uWqa2r9PSBpD24vXSIP1hECBRrFPmHWPQY6J9AmD9bRLtd9gXjbwFGo=
X-Received: by 2002:a05:6402:cb2:: with SMTP id cn18mr41339581edb.249.1634560016629;
 Mon, 18 Oct 2021 05:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211018040953.17905-1-Qi.Chen@windriver.com>
In-Reply-To: <20211018040953.17905-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 18 Oct 2021 08:26:45 -0400
Message-ID: <CADkTA4MOy2b=yOH974wjV5kDs3aDGZHc24E+vresF4PJLmRVnQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] criu: use a valid SRCREV
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I was just finishing up a move to the master branch of the repository
.. because it now seems that they are willing to force-push crui-dev.
At the same time, I'm moving it to 3.16.1.

But thanks for the patch, for a while, I thought I was seeing some
local breakage when that commit disappeared!

Bruce

On Mon, Oct 18, 2021 at 12:10 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Commit e49ce513c8df43e8d3b30b7acfbe7bd496d89862 is no longer in repo.
> Use 95ead14874244f3c12e5970a74d1f4dd2433d652 instead, which is tagged
> 3.14.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 045a431..6b1b809 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -13,7 +13,7 @@ EXCLUDE_FROM_WORLD = "1"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
>
> -SRCREV = "e49ce513c8df43e8d3b30b7acfbe7bd496d89862"
> +SRCREV = "95ead14874244f3c12e5970a74d1f4dd2433d652"
>  PV = "3.14+git${SRCPV}"
>
>  SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=criu-dev \
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
