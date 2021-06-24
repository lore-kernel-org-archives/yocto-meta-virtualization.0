Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.1430.1624563903273474582
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 12:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZV7fCUqQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id gn32so11336831ejc.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Jun 2021 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68qD6MnSOTlGXHaciXAlqnYGbXp90ynz7xNiFnRzasQ=;
        b=ZV7fCUqQYB+4O+Uz0VESFKcGBL3kRbJ+YmSTFw5yrIqB7vGYCp+qedpBaCNZ1tVZ+9
         ntM0mOisUygInIN1sS2yIdR+V/CKHDYfWf/DlcxcZzGw7aYFxAa7g+DVMdl9bdaVVzh4
         4PBW9DJL2bKj7I0lmktvlBtZAnYha/kDmlxCfq0PdVcbxZh8DLdZyQsvNcgwXDpOZwuV
         rD04mJSf7uNO5pRFpvJ0ysdmKWGIA6iST+8US5g24deM4GD7gPtfN6R4tGsfdQT+TOsx
         ozuUN92W24oRk2nQVAkSepOPxdcSSHSz0tjIWfp/MbPjnWilbSiqK+6+5m1aHu4zZafG
         /IRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68qD6MnSOTlGXHaciXAlqnYGbXp90ynz7xNiFnRzasQ=;
        b=qpi4r985tn/QBhuczLObdlQF7oFSRXm2Uv428xo/CbPzqOIugeLGR+5iFvF179/v5y
         Lj9jNQPVRoHg7D0XwCcfgrE2mBLf2vm6wHAjxalEstmUE7bdHjqFw55nnx2had2FmmQX
         I+Yw0mE8io+YxLl4XgnLtqt4HypYSz7lATqrO2lM5KPLIUVp1NrpdF+g/XMIBPwFbFi0
         mUJex6Id1Z5lwpPntixMi2a4iW5hhx96g2mHCQuWGFnTNd/kalD7leD9B2Ui6UZYfzcM
         4gsldsLCisQgwRj0rq9tacpvHclhU95mo3TXLnc9d76tm9/gh3Q9soMQNPjvJcb3eG7K
         QRhA==
X-Gm-Message-State: AOAM533lmm/EV9WWwKd8Abl72EZlLv3/cBFeFt2KKsydThpBT7H2STQt
	z1u/9xddZyjmKUq2bw1KFiZvI9NqExxksi84FCw=
X-Google-Smtp-Source: ABdhPJyGecq5gfdNNcOYArz20aeBW2yUjLXPG75bHf+WzL/2X3Z2MX1vgDld3xKiVG78nGl91IgNAPVLbeDKzhDUAio=
X-Received: by 2002:a17:906:180a:: with SMTP id v10mr6812474eje.22.1624563901622;
 Thu, 24 Jun 2021 12:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
In-Reply-To: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 24 Jun 2021 15:44:50 -0400
Message-ID: <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

What branch are you working with ?

Now that seccomp is in core, we no longer have those restrictions, so
I assume this is on an older branch ?

Bruce

On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> The libseccomp package is only available if seccomp is in DISTRO_FEATURES.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-containers/podman/podman_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 9dcb21c..351f38b 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -6,6 +6,9 @@ DESCRIPTION = "Podman is a daemonless container engine for developing, \
>      `alias docker=podman`. \
>      "
>
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES ?= "seccomp"
> +
>  DEPENDS = " \
>      go-metalinter-native \
>      go-md2man-native \
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
