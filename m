Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A63C433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 17:59:13 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web09.111.1652896750835054586
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 May 2022 10:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m5bHX5E2;
 spf=pass (domain: gmail.com, ip: 209.85.128.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2fed823dd32so32596677b3.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 May 2022 10:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f9Ep/8WPQWPeGflMc3/jGBpZVjLtkNtF4BGJnVyrcXo=;
        b=m5bHX5E2TPD8fQ7fhdbS214gmcxl7PpXIYBmyp3q5fcDAZLUM+KMfuHfWLiKcU6ncX
         aNZkoi4JeH2aqIjkglQkvC1glSc9NzbOlG8mg7J49qgxsF3zqjyw20LZzGxS3KPtkzWZ
         gbBZ2NmlbPF0dDOU7Lng0lOYIsUfuTounE6vMGXo6GLbQal/uHLSV0mR3+fum2Z30reI
         E52T44w4ABWezi++jYBCrSYlpvTYhbwDx0/5jHiyvZ/ttdJSFBlW1ypci1SqfesLwBKj
         c8OJ4GrOUIWi11wBRXkR8urXtuPGFB6nnID5YLC8nqMw+1oTsg2msFZmnnb3qpWG2QDk
         mfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f9Ep/8WPQWPeGflMc3/jGBpZVjLtkNtF4BGJnVyrcXo=;
        b=ebnpOCGZnHT9wAhzI0+qseb5FNfI3rgOV9fDU+jcvO13RY2mkfbsjxugLKgFnhH6cA
         /qd456agqLmkfGm2lAqBOvCQroiuILILW6CvMO06XN0Id+jJ1WtOzoLSCpfB2xtsjnbU
         pHleHALDp6vg+mrHa2cNnw56Oj8xJWtaRNPDXSeQnOPAIGZO+hdqKX7sAFKI6jZqar/n
         a2eF4ovi2+mQIJILMx7rU0AENyNh/ugyEsx7eiD0KgNhL/jd/wOZ9E2BCNmm7w+4+EdJ
         +qA+N/UmGSQCd0k5uDKy/T3DZGcidA78gFVoXtrTNK0yD7qEl3D4e+uws9n8E6YkCoP+
         4Akg==
X-Gm-Message-State: AOAM533yfGj/MgbUiBuoDyx1ebWDuoO+dwUvfzUeq4+ZYdCec2Vh//sj
	dIIhiiYwsx3+Tj9c17tVeP7VBPp4bN53yBwJ8rqLpEjZRSM=
X-Google-Smtp-Source: 
 ABdhPJwr8Q+STehjKxVHF/xXhb5Hd10apnuARN+H/Ku2XnU3dHVvllld+S1Mi9Ry27TA4BCkpsAurneS/eB/x4OLp+Q=
X-Received: by 2002:a81:6dd4:0:b0:2ff:413a:f812 with SMTP id
 i203-20020a816dd4000000b002ff413af812mr595146ywc.323.1652896749919; Wed, 18
 May 2022 10:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220517074907.419113-1-zhe.he@windriver.com>
In-Reply-To: <20220517074907.419113-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 May 2022 13:58:58 -0400
Message-ID: 
 <CADkTA4OxAOamXBKwc2NShsi=icMUY8nbffDLpRZSzpqtY85NPQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: Fix keeping restarting
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 May 2022 17:59:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7287

merged

Bruce

On Tue, May 17, 2022 at 3:49 AM He Zhe <zhe.he@windriver.com> wrote:
>
> LIBVIRTD_ARGS has been moved to libvirtd.service since v8.1.0. Move our mode
> setting accordingly, otherwise libvirt would keep restarting and VMs would be
> constantly stopped.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_8.1.0.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index f8deba45..89f82bf8 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -208,12 +208,11 @@ do_install:append() {
>                  rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
>              fi
>
> -           # This variable is used by libvirtd.service to start libvirtd in the right mode
> -           sed -i '/#LIBVIRTD_ARGS="--listen"/a LIBVIRTD_ARGS="--listen --daemon"' ${D}/${sysconfdir}/init.d/libvirtd
> -
>             # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
> +           # Change default LIBVIRTD_ARGS to start libvirtd in the right mode.
>             sed -i -e 's/Type=notify/Type=forking/' \
>                    -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
> +                  -e 's/\(Environment=LIBVIRTD_ARGS="--timeout 120"\)/#\1\nEnvironment=LIBVIRTD_ARGS="--listen --daemon"/' \
>                    ${D}/${systemd_system_unitdir}/libvirtd.service
>         fi
>
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

