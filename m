Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.28531.1598560125448244249
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Aug 2020 13:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jnztCdvl;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id c10so6083225edk.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Aug 2020 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7n3rG9CDdVrAb7N2R7qKWsnSslkHHpc/vpoe+crOmNM=;
        b=jnztCdvlNQT62IwXSMS3uCHW8wefBIbPCjh+1TxKJpa26ZW36zyT46c3bUuZWmbYAe
         7PUXES39OqjhqDdESLqFNXr2i9Mo/Xm0E8be5tmVmMubmuKBdVOiz4d+zKYyUGjpL/j2
         0U7uRrQ1Rrn+yslyU1AbGnBUfWuNZTK0aB0abg1FRRX6JqJLOxMccLQqMEE/L7egpDk5
         R8qN7OwY9iUeoZux48UVLOpH888hwwCvu1AjCSO9n6TqZS04udt+0O9m1cEwhLoTE5CQ
         YD4BY4CnIpWtpZJaMzUr/STkkH8hqOzT31I9pGezptEsK7Ds8pBW4Awr5rShAvbOQ4vX
         bgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7n3rG9CDdVrAb7N2R7qKWsnSslkHHpc/vpoe+crOmNM=;
        b=mZd17ebLcidLDwKle4YFog+/gomQ7GzNxcRVEeSSot+fnYiAUYbAISY7fCg9HmSx7n
         U5Svf+YApMgbuLPTZjau9eC/0jSxr01GONM/+jwWtohpWKFUubTFUBoa4wFWO+jUwRQj
         ehkUpLcqT6HF3ZvLIi4eIu71TbmN80LODtMURujE6G9B4qpWs7++u7bspJ2R+ie/EgZr
         ER16hlYxTWjYNUHMI2tW1oyqm+RwQnb+KFCOQOoA7fZu+O/DQ3/xKCZ9jOVz9F9GQw3o
         yODU8ULWCJ/gFjYXA1M8nGJ1RC7AcgPDwnV1xSp1TALGU+oN0COjuzgqDI6Lch/K7b+y
         rAHw==
X-Gm-Message-State: AOAM532GVmQciaWE4QhlZnhOKlrLYggfl8R/45MFMtul6y+X0/OivLnC
	Fm+4kNnynXIqA5P3QSuIi0Mm89TCUUSu8y7dCss=
X-Google-Smtp-Source: ABdhPJwrB7hOOrOf10LPNTyZ2ELK1CU3sFQLg7GzRsIKY8YctrL/trh1zy0XkrdGOOwnSw1I5ZoDDLIlEwdD9PYX91M=
X-Received: by 2002:aa7:c383:: with SMTP id k3mr20840435edq.164.1598560123737;
 Thu, 27 Aug 2020 13:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200825225552.780761-1-raj.khem@gmail.com>
In-Reply-To: <20200825225552.780761-1-raj.khem@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 27 Aug 2020 16:26:38 -0400
Message-ID: <CADkTA4M0KgPYcOBL4Uwir3Yp9VyFnHVoEU+U7BBEiH=-HQugfg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: Disable warnings as errors
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Aug 25, 2020 at 6:55 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Instead of disabling particular warnings, its better to use configure
> switch, since some of these warnings could be compiler specific
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-containers/lxc/lxc_4.0.4.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/recipes-containers/lxc/lxc_4.0.4.bb b/recipes-containers/lxc/lxc_4.0.4.bb
> index a8f9394..f526ab9 100644
> --- a/recipes-containers/lxc/lxc_4.0.4.bb
> +++ b/recipes-containers/lxc/lxc_4.0.4.bb
> @@ -67,9 +67,7 @@ EXTRA_OECONF += "--with-init-script=\
>  ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
>  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>
> -EXTRA_OECONF += "--enable-log-src-basename"
> -
> -CFLAGS_append = " -Wno-error=deprecated-declarations -Wno-error=stringop-overflow"
> +EXTRA_OECONF += "--enable-log-src-basename --disable-werror"
>
>  PACKAGECONFIG ??= "templates \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
> --
> 2.28.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
