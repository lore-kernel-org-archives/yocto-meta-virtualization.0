Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.22480.1630936159452624455
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 06:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eSLNPtxH;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id bt14so13677495ejb.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Sep 2021 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LoQlQgv+sV2ZLS5x7izoT1Pjj/6MePJlG7Sa2/CWr/0=;
        b=eSLNPtxHNjoHV387pI+lT2Mh+iUYXffWuH6ARZC3psxldb3gqJFgwQcaXvoF23osPW
         JqrMdh/rMxCZoPBreh+bJnKDWedqaI2a9auCLQiVHDKMz0lfKlCK/4cYX5tc2MdLmtBl
         +gpsDuZ5JUXrZh4psWZzQddkIZTF8TKKMe/EekTD8DOfA+S+pOHu4IvUcXK0fEo8rORN
         Pd7uQsqZboAXYrlOG7MbETi6QH7GoCzu+n8rfXegBICSt96E0VirsDUEDUSQ9nFRXJoR
         p8hFkkpe4XXuNVxhHkSTEBtkESHOTqI/DSl0vToM1n/SzYzEDECegxWPPAGIE1xxK1mC
         8YCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LoQlQgv+sV2ZLS5x7izoT1Pjj/6MePJlG7Sa2/CWr/0=;
        b=Tf0HldIFM1kb01nwmN4vx0ZkRqBNoG8t3q2XJPZYmFdCDIZdYlfq9xxsRVbNjTfRuC
         wm0Xx/aBKLs2UVrt2SMoIUAWgszzHGcJDr0bJbaMYxrG4mjaA6Qrv8eL7iPq66xHHamg
         6t0eEj6BJY8vENYArvxktMrmwfZKAEISxvzXLos4esma0BJWeKFF4MUr559gsRzSeOGJ
         JqPsqyeFXoevSAuIvmV4YJCA9EEWb1XI6eM7QRZzt68gcODFtqK6L79Wg9g2kcBiWd6a
         I7wndAimFM9DGQL5ZHUgh7awYis5GDqwNmku2nE1OPxli5TGoucqWFS/u+CraQt9GLUI
         pCSQ==
X-Gm-Message-State: AOAM530b/81CtiQ0CABJw5v1S85Kp+5OPXp0mBXgTWVWv752f+3D4oVa
	XRfQuH6KPSnjBrgkXc/l2oCrO3AGNKv7zdjDg0CEk10Oy0/vfg==
X-Google-Smtp-Source: ABdhPJwBav0owTtHknXleakjHJtHAc0uxsNOAFSl5YD88520ngakQCCk9Wr5LhhyrTgm0OayXwaoEkzzkSIVdZhzuTM=
X-Received: by 2002:a17:906:d94:: with SMTP id m20mr13673838eji.445.1630936157923;
 Mon, 06 Sep 2021 06:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <16A22D3D64290A4D.1519@lists.yoctoproject.org> <20210906090018.22247-1-mingli.yu@windriver.com>
In-Reply-To: <20210906090018.22247-1-mingli.yu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 6 Sep 2021 09:49:06 -0400
Message-ID: <CADkTA4NKdRKFDNiejJPtJJPLBNKPAEWBGsQ1K4Uo4VqnWFcnHg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2] podman: upgrade to 3.3.1
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Send the fuse change separately from the version bumps, as I
mentioned, I already have them.

On Mon, Sep 6, 2021 at 5:04 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add fuse-overlayfs rdepends to support rootless.
>  Fixes:
>  intel-x86-64:~$ podman run -it  busybox
>  Error: kernel does not support overlay fs: 'overlay' is not supported over <unknown> at "/home/test/.local/share/containers/storage/overlay": backing file system is unsupported for this graph driver

I don't get that message, because my kernel is properly configured ;)

>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/podman/podman_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index ab9aef1..bbbbb91 100644
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
> @@ -109,6 +109,6 @@ FILES:${PN} += " \
>
>  SYSTEMD_SERVICE:${PN} = "podman.service podman.socket"
>
> -RDEPENDS:${PN} += "conmon virtual/runc iptables cni skopeo"
> +RDEPENDS:${PN} += "conmon virtual/runc iptables cni skopeo fuse-overlayfs"

This shouldn't be on by default, many of us have a fully configured
kernel and this is just extra bloat.

This is something that could be a packageconfig, but shouldn't be on by default.

Bruce

>  RRECOMMENDS:${PN} += "slirp4netns kernel-module-xt-masquerade kernel-module-xt-comment"
>  RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
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
