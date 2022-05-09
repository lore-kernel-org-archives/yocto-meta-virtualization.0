Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B453C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:39:13 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web09.371.1652117945231891142
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X3tUlCEF;
 spf=pass (domain: gmail.com, ip: 209.85.128.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2ebf4b91212so152976307b3.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FZoXm/16cZli43ZlvAF1ByAb8RDRsunbnQ/MGI52nR8=;
        b=X3tUlCEFbt4JkV360jTliQN9T1Lu33qqYeTsPInMrOnN+DJvHOGtaCg3o2afS/i+E6
         gl8H/OKUbv0lDvFNc9uBNh+o1JqgVPij/L5M/lzWresnQIjp7pdgeboLHmC/1I/OT95Q
         nuA2Vp65g94eb5qIViXrpMaTP/BSp3rASXux9vF3MFDQwx92AsKamD3VjVtJYTSu1IGm
         3Wxg95YE3njEv1QMAAOwVaG5ORJBIxVfFVNDnvScRwFc8heEZxwQRFPb4uOa1TaHIAK8
         1dwUszMJcGyEvHnMZVVF7mBUru3Pv6+7gkwom1NUQf48PGnq/OeVVnd/+ZfNntmAtWZZ
         Addw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FZoXm/16cZli43ZlvAF1ByAb8RDRsunbnQ/MGI52nR8=;
        b=7aHU77zWpRTX1hQpXPExwiGVj3jLpN7gVlBVJeU58ZUPt/7HCs0Omja/fMt/X8gZiL
         Gr4VsHkB7uknTLXOC/10XKA40lfBM52RSvZP3XZ2p+q/ZpGDECxAl55e3uxzDbxyV9Xw
         GzM9XYmNt9eEIFwFcOYOV+1H7YgYESh27Z8NAOudNkI0dF+MfNba+bHWbP6H3HHf5+vj
         UF8Z/qcUIYTbaKgUxQ3JhnpblIaqbzxI49qSk5SDDF2y6HguSw+lw8KZto9E8w0ksZNx
         pj2Njcgpdd5YW8SOJFWagBRnrUa/hIzTWI41EM6azaE/o1Ccx1z7GPxlRyuuSk44QCRX
         UePA==
X-Gm-Message-State: AOAM530AFyXJuYGMsta//gzawMzcA6ewe7ySgSWNRDbnEK3Wyhy2lBKv
	a4nqCDgRUUqXmG14NSKD6h5u2g7ko1U9uxq0TcI=
X-Google-Smtp-Source: 
 ABdhPJwA6sb1RHHhQdSRsYwvTKrowUcdCDvD93bsviZ9+Wh9h+B1zVnn8g7YTQ77+vTeiU1qT0tl/ouH7yQQbFkXIK0=
X-Received: by 2002:a0d:dbcd:0:b0:2f8:f2ff:9697 with SMTP id
 d196-20020a0ddbcd000000b002f8f2ff9697mr14778455ywe.34.1652117944305; Mon, 09
 May 2022 10:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220509170059.2751954-1-raj.khem@gmail.com>
In-Reply-To: <20220509170059.2751954-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 May 2022 13:38:53 -0400
Message-ID: 
 <CADkTA4N+OHdQPRpgNvrcmWqYmFD8jdSb3Xx5+734GMNAmk15qw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] xen-tools: Fix build with GCC 12
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 17:39:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7267

It built fine here.

merged

Bruce

On Mon, May 9, 2022 at 1:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-extended/xen/xen-tools_4.16.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/xen/xen-tools_4.16.bb b/recipes-extended/xen/xen-tools_4.16.bb
> index ae1ae8a..be27cf7 100644
> --- a/recipes-extended/xen/xen-tools_4.16.bb
> +++ b/recipes-extended/xen/xen-tools_4.16.bb
> @@ -7,6 +7,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> +    file://xen-fix-gcc12-build-issues.patch \
>      "
>
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> --
> 2.36.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

