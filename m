Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.21451.1636218915137477919
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 06 Nov 2021 10:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=qTAziBOz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id az8so11721588qkb.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 06 Nov 2021 10:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/idOF6ehYPANugpRAMPGynk6BSROpMjq7C8rBRvpyw=;
        b=qTAziBOz4uMU/XWgJls5Juc81X9w5ALig2Bn1oKeyCkQ9czMfBaYfxvVZt3p8TMy7Q
         k9FMwnGt2N3Vxz6nBY9pDYbJ60lKLsFF96IE1gewSwSP0H/CGhsSNFEg2GU4OJIhOoEw
         u+y/fQn6AAHelSk+UwULKmag+nmvci9r0Bmlu8kpt0UWWJa3S1cnr+E8GN/19O8GUm9/
         CALqWMKapMezs9RAQehcWfo7ghIRNe4KG6rcUth8M2LmfhSKvFk1viPQw+VVq8i0Mulv
         JMO0FtFDncMjLBBpWDpEQT0/uEmH4jCJ5nYWe6jXv/gzsXlAM1pxpD21UsNSOxvXdA+n
         nNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/idOF6ehYPANugpRAMPGynk6BSROpMjq7C8rBRvpyw=;
        b=605pybq+V+9fexSmLGtIhHSt629VuT8w1IUuwnQaij9mZXUSRfCgJ2Twh6lmmXfZb6
         EYYUL+mSwQKCaQICVd/8nOXcgXrSwD6CRxpCyKxy+KLb6XDmgCRvnHhld+zXN6v10q7/
         5e0iEhrLxU73K1432nnvG/m56jtn7xyzsz27XUvu8R4yoQb1xFydW9fx37E2Y96dot42
         7pDQE0+KL+0WlGoMzS/hzHsKaEEifmdwo+U4MEYBLuU9ue/2RUCNvZ7tTjz5iP+ciLWu
         z3gQ85emFwoSW6xBFFN9wrJWa5WpnSm3pHjtDHCnCxJiXHfqUcHKpvkaFEMwi2egrbBF
         z7pQ==
X-Gm-Message-State: AOAM533pOmYn0+Olz/iQEJCyGagaWe58Ag5c7QQBFKH0BbZN6meTavam
	zOqaoZ1I+GCEQyy19xRDaysfQXxbVb6/AkrQxNjZuw==
X-Google-Smtp-Source: ABdhPJwn3LyYBqWS/CGsRPyXpaP2FRZyy883nrJP5yVXruSHJZNRRl/+SlZvZD6EvRKd+16bNtLaS6q8UpNBujMlEUw=
X-Received: by 2002:a37:9244:: with SMTP id u65mr54858512qkd.46.1636218914159;
 Sat, 06 Nov 2021 10:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211105145840.1721877-1-Martin.Jansa@gmail.com>
In-Reply-To: <20211105145840.1721877-1-Martin.Jansa@gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Sat, 6 Nov 2021 13:15:03 -0400
Message-ID: <CAPoiz9waxNrJmBPas4LBg+hjvQ15u2rZjroZm+SLnLO_nxtnyQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] go-{distribution,systemd}: convert github SRC_URIs to use https protocol
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 10:58 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Please apply this patch as soon as possible, qemuarm + xen is seeing
warnings for this (and it's quite annoying).

Thanks,
Jon

> ---
>  recipes-devtools/go/go-distribution_git.bb | 2 +-
>  recipes-devtools/go/go-systemd_git.bb      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devtools/go/go-distribution_git.bb
> index f481d61..948831b 100644
> --- a/recipes-devtools/go/go-distribution_git.bb
> +++ b/recipes-devtools/go/go-distribution_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=d2794c0df5b907fdace235a61
>  SRCNAME = "distribution"
>
>  PKG_NAME = "github.com/docker/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME}"
> +SRC_URI = "git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME};protocol=https"
>
>  SRCREV = "28602af35aceda2f8d571bad7ca37a54cf0250bc"
>  PV = "2.6.0+git${SRCPV}"
> diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
> index 130ef8b..91f67da 100644
> --- a/recipes-devtools/go/go-systemd_git.bb
> +++ b/recipes-devtools/go/go-systemd_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
>  SRCNAME = "systemd"
>
>  PKG_NAME = "github.com/coreos/go-${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;branch=main"
> +SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
>
>  SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
>  PV = "4+git${SRCPV}"
> --
> 2.32.0
>
>
> 
>
