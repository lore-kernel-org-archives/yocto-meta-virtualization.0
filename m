Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.2738.1620765504392274790
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 May 2021 13:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EoVuqjs2;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id gx5so31672537ejb.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 May 2021 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vsBCj/i3E7UP777NRg4ty9AxKAgF/KtjzUJ4dfDUCMY=;
        b=EoVuqjs2mvdzhOVF4RKUz9NlewyjsRl954cchuGppJ7DewXgx6+Na36XcqiMvhJ1n2
         UdpkYTRSND9f/yyhcVE10q3GOUQgVoOuxnuyIBAYIF+QinLtazGT8MfIPISthLmr9Vz9
         zH/CS352yCf4d2/0l4ZAMmURJxWYjoPtquoZQ/h+8JlwLzd5xlxQTSzgoOykd6NMLBv3
         zr8/gRuBe5nWDgm4A5m2s8s0MCJg27cA3OaWlI0QLWmObxicfqvIUbq7ge/9HnSYdIoj
         ExtpRwuIx1NlaslDl9ksvWYAK2Egsg0JayPIzW2VjL43SRCRDzzZTQ0gg8+vdk1yGUw1
         RR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vsBCj/i3E7UP777NRg4ty9AxKAgF/KtjzUJ4dfDUCMY=;
        b=YrhmAYAm+UtOfsDzS2pDAUe9gQ0xoLtA2FIO2nmWP0Mt8h/0MAOpnr+Tr+p6kpfp9m
         RmTi2egGcviMCZa6zwy1XVhl6nXNsry3BYz5hPMQucNUE/CzAbpLzvqfpQpO4G3mxD7G
         dLZDXAxwZYD9Q4l6BiglyZQ2uWEo3SOvkE2epUTuIjob8etI5Wh+J3GEhzImmSnnOL8f
         aXsO2r2SDyAmebtQiOhR6yWui+F/rr+ja9J64xq+5hP9/dC4HvKnLDxPPJ1+s0Q4odPn
         zanhhV9yDFeJGoABl6UVsXmCJLgklZVIfLPyxJ5oW2s6KWEgS2Q39qmQGu2rNj+iphQr
         2BBQ==
X-Gm-Message-State: AOAM531jZwJzmQnEqDfaeQwR4BuuFGqKzTbzCkyDghu1iKL4zJPSCCNH
	SGdo3EHBnmchhZ0w9QbYOI4jRfsfXVREVE6HXOs=
X-Google-Smtp-Source: ABdhPJz10OJHUMwJV6wHOkVy+WhqMTtxy1BZTiA9YVitDXbjMqPP/sUKKij0gvxLATBVsdJ2HeMLEpsBOGMEt4SW3go=
X-Received: by 2002:a17:906:5617:: with SMTP id f23mr2254561ejq.298.1620765502859;
 Tue, 11 May 2021 13:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210511203317.53030-1-Daniel.Dragomir@windriver.com>
In-Reply-To: <20210511203317.53030-1-Daniel.Dragomir@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 11 May 2021 16:38:11 -0400
Message-ID: <CADkTA4PCmHbufbMB7ikrn8NYrmjcdwHpV3MSsZyy5cFsn8irHQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-virtualization master..thud][PATCH] go-systemd: Fix branch name (main instead master)
To: Daniel Dragomir <Daniel.Dragomir@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I had this one queued as well, but need to do a bit more testing.

I'd actually prefer that the fetch fix this, since the renaming of
branches by the upstreams is such a pain.

To avoid this, I've actually changed it to nobranch, and will run with
that for a bit.

Cheers,

Bruce

On Tue, May 11, 2021 at 4:33 PM Daniel Dragomir
<Daniel.Dragomir@windriver.com> wrote:
>
> Upstream has renamed the master branch to main.
>
> ERROR: go-systemd-4+gitAUTOINC+b4a58d9518-r0 do_fetch:
> Fetcher failure: Unable to find revision b4a58d95188dd092ae20072bac14cece0e67c388
>    in branch master even from upstream
>
> Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
> ---
>  recipes-devtools/go/go-systemd_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
> index 0f89c0f..c21a0f9 100644
> --- a/recipes-devtools/go/go-systemd_git.bb
> +++ b/recipes-devtools/go/go-systemd_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
>  SRCNAME = "systemd"
>
>  PKG_NAME = "github.com/coreos/go-${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git"
> +SRC_URI = "git://${PKG_NAME}.git;branch=main"
>
>  SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
>  PV = "4+git${SRCPV}"
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
