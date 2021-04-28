Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.6670.1619578285837428608
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 19:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hE4Vp2gw;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id j28so8342302edy.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Apr 2021 19:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FSPZRqAnwSzq/H3xfMdDSDwx36eOdJ6RQYxT0Hoqvgk=;
        b=hE4Vp2gwAwFRELCPYbKpAECJ5ivzzPkDf4WnC/KUhZeAyNYQIHFRP77gPppoWm5Xmd
         54A1VwpRGjuQEz8PArLdYfbnqK0V9AaDhSP1D9BzfdlwUQ61wWqvo44Hc6Ep94BcQyLv
         BQ/5BjYcjwazEbDrKHwcNqeuXxKA9IolquDVn8rXta4QQGCD25GHPIOUaeFxvIkelLMb
         2LojIrDBTUmusKv/wYMFiyV6WxYUUwnB9xBo3bSTxlREJ5wehX0mpYj+IdEULz9Z8+oW
         wK/MkitB0ilUFocYEW6XdL7JjOBCHM4/T61QiOrqK3/T91mQVemmVxlAFFINCB7xP9tM
         NiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FSPZRqAnwSzq/H3xfMdDSDwx36eOdJ6RQYxT0Hoqvgk=;
        b=AaqkrBnNS/x2+ha3GaOUkc68hwU+RqiIcNpU2zJ5aRJh5lqAhYf6kHPS0B0iEGsQ8M
         QQzwEK7JN8OZr+8nu+KJzV9eXnhZ3uOqtL1foMywHucbsdOUg6WFTREW8ibCQo9I8OkC
         KEkeVvzX2H2xpDj+g09uKcRv3DWxsar4ggxB8plSbXHkTXibbbNFrIA9HrVYJVW59qyJ
         YWktf33SwTNiLKgXSIvqhlnnO1l6bbzm/shFnHCXrBxmZNXtnRnU5ozs0vthd+T+LNya
         wmWIBpFhA9kzIFbLx134wZv+OxTfj4WkRlr+f8/Vlftr5Nfnj5S2OSzp0sJUOdjn/UL3
         BcGQ==
X-Gm-Message-State: AOAM532Y/ITgaLk6vFrc6xa3vq5/qjmhIXRYlbAHXrvvs8SJnk3TjqNK
	BC4Wwlu+qYQ6A4NzLeqrCH3Mset5gUiY74d3iisT6gOCQbY=
X-Google-Smtp-Source: ABdhPJyEMBr5Pbf7g27JuIjgeDK/ztNn4rIW3tdePcPL9Or2xubK3uDM+8857T5iuI9Z6X33qhD5CQr5gfgMNo9Npi4=
X-Received: by 2002:a05:6402:105a:: with SMTP id e26mr8051953edu.164.1619578284361;
 Tue, 27 Apr 2021 19:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210427181011.6193-1-ralph.siemsen@linaro.org>
In-Reply-To: <20210427181011.6193-1-ralph.siemsen@linaro.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 27 Apr 2021 22:51:13 -0400
Message-ID: <CADkTA4PX+xUC1q6--KnGBQF00FwyJ7Kdb0c02O2r5-_pxssQUg@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][dunfell][PATCH] add CVE_PRODUCT for docker, containerd, runc
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 2:10 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> This is more of an RFC than an actual review request. Currently, the
> yocto CVE checker fails to report CVEs in docker, due to mismatch of the
> package names (eg "docker-moby" versus just "docker" in NVD).
>
> So set CVE_PRODUCT in each recipe to match up the names. I have only
> done this for docker, containerd and runc. Perhaps there are more
> components needing similar treatment.

There likely are more components that need this, in particular where I used
to have support for docker variants, but we don't need to solve the entire
problem now .. just starting is enough.

It's easy enough to port this to master, only that runc version being caught
in the context might make it fail to apply .. and that's an easy fix.

>
> Possible TODOs include:
> * rebase/update this to master, and test it there
> * split into separate commits, one per component

I'd suggest the split into the three, and go ahead and do the change on
master. I'll carry it back to the released branches and pickup dunfell.

The testing is pretty simple, so I'll make sure master is ok and you've
already tested on dunfell, so that is enough.

Bruce

> ---
>  recipes-containers/containerd/containerd-docker_git.bb         | 2 ++
>  recipes-containers/containerd/containerd-opencontainers_git.bb | 2 ++
>  recipes-containers/docker/docker-ce_git.bb                     | 2 ++
>  recipes-containers/docker/docker-moby.bb                       | 2 ++
>  recipes-containers/runc/runc-docker_git.bb                     | 2 ++
>  recipes-containers/runc/runc-opencontainers_git.bb             | 2 ++
>  6 files changed, 12 insertions(+)
>
> diff --git a/recipes-containers/containerd/containerd-docker_git.bb b/recipes-containers/containerd/containerd-docker_git.bb
> index b18a9bb..2a3cd34 100644
> --- a/recipes-containers/containerd/containerd-docker_git.bb
> +++ b/recipes-containers/containerd/containerd-docker_git.bb
> @@ -12,3 +12,5 @@ PROVIDES += "virtual/containerd"
>  RPROVIDES_${PN} = "virtual/containerd"
>
>  DEPENDS += "btrfs-tools"
> +
> +CVE_PRODUCT = "containerd"
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 347eae5..2bcff1e 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -14,3 +14,5 @@ EXTRA_OEMAKE += "GODEBUG=1"
>
>  PROVIDES += "virtual/containerd"
>  RPROVIDES_${PN} = "virtual/containerd"
> +
> +CVE_PRODUCT = "containerd"
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 14182d1..adffcec 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -129,3 +129,5 @@ FILES_${PN} += "${systemd_unitdir}/system/* ${sysconfdir}/docker"
>
>  FILES_${PN}-contrib += "${datadir}/docker/check-config.sh"
>  RDEPENDS_${PN}-contrib += "bash"
> +
> +CVE_PRODUCT = "docker"
> diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
> index 762a785..600603f 100644
> --- a/recipes-containers/docker/docker-moby.bb
> +++ b/recipes-containers/docker/docker-moby.bb
> @@ -148,3 +148,5 @@ FILES_${PN} += "${systemd_unitdir}/system/* ${sysconfdir}/docker"
>
>  FILES_${PN}-contrib += "${datadir}/docker/check-config.sh"
>  RDEPENDS_${PN}-contrib += "bash"
> +
> +CVE_PRODUCT = "docker"
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index 8d810d0..3684366 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -11,3 +11,5 @@ SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
>            "
>
>  RUNC_VERSION = "1.0.0-rc8"
> +
> +CVE_PRODUCT = "runc"
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
> index 3a7e7aa..a1271f6 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -7,3 +7,5 @@ SRC_URI = " \
>      file://0001-Only-allow-proc-mount-if-it-is-procfs.patch \
>      "
>  RUNC_VERSION = "1.0.0-rc8"
> +
> +CVE_PRODUCT = "runc"
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
