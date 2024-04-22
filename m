Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8253C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 15:03:53 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.20791.1713798230088875746
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 08:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FLLMDwcj;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-43716c1616dso22327811cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713798229; x=1714403029; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMjinYISXAQRUs49upObEW8V77UJgCApHZMBNAJyrrY=;
        b=FLLMDwcjGfWXB8cExYQrhg9uPKaatduX+kfDAnJOjupBb8AtHs+A/z3efAcelj1ahA
         NwRJA0el8rKExyz3tXH9c2Yxs9cKTNRX7XlTtQH4VXi8bKgWfjS7dRDVfUBmszuZcg3y
         I49fSUOmt1rsl+funZ1PzyEsk//NvXjvX+77j4zVjLQ2w/lra77uyc0SBV+EikpvjdUE
         tmlND1DFNQEIYKiJHTY2qXWrzgmI/Yc3ttJIKWPBnMkm/ZOvwlPUdZ0EOrzQV9syWI20
         dzCGKThHCvZDyiO2qpJH5nLYnFJmFB9OCInGVbgxddw/peaYFigfjngnU/xCkmoLYf7b
         f8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713798229; x=1714403029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMjinYISXAQRUs49upObEW8V77UJgCApHZMBNAJyrrY=;
        b=ly8bo5IB5CPdUJ/LI93TmvkzwG4sLPrWztieTuggiXw9Aba9AcATqrVgLR3nLzpKmm
         ONoqp17Zhaq2ANygOcPvhsdX77E1fXzegCtT90IljshCrmO/9VBJSXbj99reGR0wzLm1
         /C2MjqI73vq0jXfJNvbw2hL3wJqSmgitPSSj9RwA9Eiuq3486CNXJIq8rjWa+S6dZ2GL
         pU9Na5Kb0TshFNnXtw0nQjQHFeO020PLGgozFr6XweOEuwtdcWyeqk0r/8saX9RD+lFn
         sL9Awe1CzqHcL1lBHt1I/BaZYE3UQbs1GLrPppW5v7CNZWkV6VYBfpiII6ZeDnldAQAl
         RcTA==
X-Gm-Message-State: AOJu0Yx5MvgfqXY64TrC8Tj93nfs8XRFom67ulGyhupv9dMMSXta0sOA
	XuQDUavwQOFt2NTjBC/eJtk5p5DgbekrfZCzJdb3JW3A/m0Z2hiQ
X-Google-Smtp-Source: AGHT+IElFh2MqLPamZHSkiQbJpSKO6q0Ps8B1tupuafRAR3fYUEH2mAULq13ANRgPFLPrI4eez6olw==
X-Received: by 2002:a05:622a:1787:b0:434:ffe6:140b with SMTP id s7-20020a05622a178700b00434ffe6140bmr13312621qtk.37.1713798228939;
        Mon, 22 Apr 2024 08:03:48 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id f18-20020ac840d2000000b004378ec294f9sm4327241qtm.72.2024.04.22.08.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 08:03:48 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:03:46 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: lukasz.czechowski@thaumatec.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] podman: fix location of user
 systemd service units
Message-ID: <ZiZ8UpRSfDbkzocJ@gmail.com>
References: <20240416225615.165473-1-lukasz.czechowski@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416225615.165473-1-lukasz.czechowski@thaumatec.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 15:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8691

merged to master and scarthgap.

Bruce

In message: [meta-virtualization][PATCH v2] podman: fix location of user systemd service units
on 17/04/2024 lukasz.czechowski@thaumatec.com wrote:

> From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> 
> The value of USERSYSTEMDDIR is currently set to
> ${systemd_unitdir}/user, which might not be present in user unit
> search path.
> Use dedicated bitbake variable ${systemd_user_unitdir} instead.
> 
> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 3eadd202..f69dec16 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -62,7 +62,7 @@ do_configure[noexec] = "1"
>  EXTRA_OEMAKE = " \
>       PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir} \
>       ETCDIR=${sysconfdir} TMPFILESDIR=${nonarch_libdir}/tmpfiles.d \
> -     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_unitdir}/user \
> +     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_user_unitdir} \
>  "
>  
>  # remove 'docker' from the packageconfig if you don't want podman to
> @@ -134,7 +134,7 @@ do_install_ptest () {
>  FILES:${PN} += " \
>      ${systemd_unitdir}/system/* \
>      ${nonarch_libdir}/systemd/* \
> -    ${systemd_unitdir}/user/* \
> +    ${systemd_user_unitdir/* \
>      ${nonarch_libdir}/tmpfiles.d/* \
>      ${datadir}/user-tmpfiles.d/* \
>      ${sysconfdir}/cni \
> -- 
> 2.34.1
> 

