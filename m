Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.22153.1630935874912784376
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 06:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RgLvqILj;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id n27so13626451eja.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Sep 2021 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RUiZx/IT8lZBRYL/mvivTTQBxLT97Scu+Te/oTfZiaI=;
        b=RgLvqILjrfbbPoTqfz7C37z7sz255gOU3eTv50z1WjvCDjrcoFFmpZ8Cx/Yu8nz547
         LEMRRMNSDqwwDHxLomMvFHKtuvD9qDNIR4kZT6SqC83r8i+txrBwf8ZZ4I0rYEhl9x3C
         04XWCL7xbpGtCXjGirKYWGIpMK+aWO6NnXRX9u+LTidbAuYOK7A8iC0VsEDCvbXTyTO8
         6mEhYrNJgoxjTIGB3czD5d79tjgHx7tDN6YI19ViZMTnnAaHwdRML/T+fT5UKRIYSNOA
         rpJaMq++xHspQSHJqbi2eLk6TfgBXDmKqISOtj+GmGYw/p8PI81casROzfUoB8Ztiu41
         Gdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RUiZx/IT8lZBRYL/mvivTTQBxLT97Scu+Te/oTfZiaI=;
        b=orQjrHgWL7SemIwGW2uWK3796lihtGxmYaKyOGu5RBKGMZmtGCR+qzTZWHucH0SFeY
         mKpks/RbYaDAk+KErx9hiOjR9gE2xOZgvzqPfu+KI4zqHDNsMCG6AkKsgakMBUypVDcW
         IzptmkZmYR//Ba7Rs00gS8uesRktxe4iz+bZlPY/MpzWcnaASaALmwS5MgG6WnsXZdV+
         7ttCj0t4/WGILq+F3RDWoorbkV9aRWvBanjWI6QDqNhlqP2FktR1Hxa9QLOJdKtrEpof
         Z2O+KANM2TuKJH6ty4R3OLM2gJt3zoBMmB1pK99wV7/EPxfyVhnN2JcMlHjhKGGhU26k
         Xj9w==
X-Gm-Message-State: AOAM5331rT2cOE74t4/HXeA5Fe5dZ8OxcZIuhrjmaaCtZMvyX/iTfat/
	CU9FioSTIwedm68oCyeUS4nbOXxNJUMcoFVLhifnaCRwDHc=
X-Google-Smtp-Source: ABdhPJww4/mnCWxYm4FS0VlG2z/moMdLk/KoC3li2VtjKrMSu8mDpQ53bMX1hEX8K6WWhbNeBiJycOq89UiOMTfbzeA=
X-Received: by 2002:a17:906:3542:: with SMTP id s2mr13924142eja.379.1630935873119;
 Mon, 06 Sep 2021 06:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210906080510.28468-1-mingli.yu@windriver.com>
In-Reply-To: <20210906080510.28468-1-mingli.yu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 6 Sep 2021 09:44:22 -0400
Message-ID: <CADkTA4P80XcwdZjGYocm4v0bB_3o+QMX1Rb173RurQHFZajC_g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] podman: upgrade to 3.3.1
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I already have this update queued and under test locally, but thanks
for the patch!

Bruce

On Mon, Sep 6, 2021 at 4:09 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/podman/podman_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index ab9aef1..d5f19ab 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -17,9 +17,9 @@ DEPENDS = " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>  "
>
> -SRCREV = "8809aed5647b61abb14970d409ff7c99c7fbdc34"
> +SRCREV = "4c5283fabff2de5145838f1847a5a7b2b1fbc0a5"
>  SRC_URI = " \
> -    git://github.com/containers/libpod.git;branch=v3.3 \
> +    git://github.com/containers/podman.git;branch=v3.3 \
>  "
>
>  LICENSE = "Apache-2.0"
> @@ -29,7 +29,7 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -PV = "3.3.0+git${SRCPV}"
> +PV = "3.3.1+git${SRCPV}"
>
>  PACKAGES =+ "${PN}-contrib"
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
