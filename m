Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7464EC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 14:10:25 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web08.29290.1660745414145099272
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 07:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z5fD5QkE;
 spf=pass (domain: gmail.com, ip: 209.85.128.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-332fc508d88so164575977b3.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=l6SuTCydGVXtWZJixX20IfFRLL5CeS/QgRBq+9jDugk=;
        b=Z5fD5QkEfI1+NNjcvLBni6g3joNwO5n5wYEdyE6Kn8G33oz+NVrIeN9utxHCykdAYt
         REWaVLYMqTJtGUZNhfqMzkmMxToAuVAkLG3i9bDil2bl3UqvrWWSLRwABB88ICWQRS32
         0btpj2nufcSYrtCjN7iXq9+H1zSmOgFGhWE20wuqj7e4XGHIIZPgz80cEXm6ZFk2RgGy
         4xDFXYDn/5kNZCy9Yl6IhjKPWduhJALF6IabskIuATK1LtjGvtqpLTRqFpoaf15nrtVD
         WoYDKSLzrtmSQ//3LwaK9MOl5LjWUInWtSlJPe+M5PzKdce4hUv5SQxid1sSPB0Be+La
         FQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=l6SuTCydGVXtWZJixX20IfFRLL5CeS/QgRBq+9jDugk=;
        b=LZQiy0oLUUaVdBE8/wWpG1bzhrPJRyfp2nf4q3Kyb4otyos3jLUaNXvmkYvW0SH2MZ
         252SutoQjxHlNCov5yTptpS5oxq7QWAtKG+fNp5YxhPfTwftdrVizGLeW/woIJE5B6ik
         S/uAZAQYr5RLffEUhpzPNywuWPSZrQzklJCRENLWGJLOMcRhrwcy8teSL29oXcshevuu
         E1cmzzwOLGiq5UjUOfPFk0/++Xdp1RrWxiCegjYLypqVkwR+VCtzTmUTwI7SgpAjFObU
         HajSjbZ96P3lH+Ic39n6Q8b8K9nUmosCLWytzk0kQZVCYPmIF+Ys2Esg+Nt07zGpOhdI
         rU8w==
X-Gm-Message-State: ACgBeo3OiLTvXIXgBPhVAqlme1oOn1+4NzbklPzxr2T6RcO6gVY+yHnK
	TvbRWR1YNCAYP9/mIIoAI74cnHhxGAVo3ftHdy0=
X-Google-Smtp-Source: 
 AA6agR5EF653F+odFQ4iaueb2qxpYEDBAkhk2O/7FzBjcGkbJs61KPk0ogl5WTPskA6maRKoztnKRJ1y7q6u6vB3ZvA=
X-Received: by 2002:a5b:ad0:0:b0:671:76b7:95 with SMTP id
 a16-20020a5b0ad0000000b0067176b70095mr20969034ybr.295.1660745413166;
 Wed, 17 Aug 2022 07:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220817115051.353409-1-andrei@gherzan.com>
In-Reply-To: <20220817115051.353409-1-andrei@gherzan.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Aug 2022 07:09:46 -0700
Message-ID: 
 <CAMKF1sp61KuH21-T=Oqdq52DDAP6-uOjPbXZJQ1K-EGUL0Y0Aw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] singularity: Skip recipe on musl
 builds
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 14:10:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7530

On Wed, Aug 17, 2022 at 4:51 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> This recipe explicitely rdepends on glibc so trying to build this with
> musl will break world builds.
>

do you know why is it marked as glibc only.

> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  recipes-containers/singularity/singularity_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
> index 321a9a6..8e7ab76 100644
> --- a/recipes-containers/singularity/singularity_git.bb
> +++ b/recipes-containers/singularity/singularity_git.bb
> @@ -28,3 +28,5 @@ pkg_postinst:${PN}() {
>      rm -r $D${libdir}/ssl/certs
>      ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl
>  }
> +
> +COMPATIBLE_HOST:libc-musl:class-target = "null"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7526): https://lists.yoctoproject.org/g/meta-virtualization/message/7526
> Mute This Topic: https://lists.yoctoproject.org/mt/93078736/1997914
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

