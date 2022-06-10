Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92808C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 12:58:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.26752.1654865926481206765
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 05:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a0LwywSI;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d13so7059850plh.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/RkYn4sNn39wTTr1rGgMSLJ+Pf1G19aMd5Sfh8000yw=;
        b=a0LwywSIM2lJvWkk4kKCqFxi+6ocGhCtmAkTZ1XQR4+K/1lz3KlUeKklB4lkqJWYMl
         07Wc1fz3az/oXOgUFU05MI5+wAdRLFOq1rFxwAnRgPIdEotwEMNMkeqMZVP5EBj+qEnk
         s5y5lGIK9fyOHk01lxOxiy5dwf8DgAi2AMYI9zrUOxJpJQ/bOocHhUEVp+uKJoH6PR+d
         JKKlJfRmHd5orfeczvZZVawzDV78Ny8P1l1vq4IP6wHO/3iCVXT5mS95IQYPjrQGTLYT
         JZPBm/o8oZHbXxmM68wcHrPRMpAuSu4nt0cAct+kgpPP6wod+2OBCKh3eb4evXs1qdjm
         1wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/RkYn4sNn39wTTr1rGgMSLJ+Pf1G19aMd5Sfh8000yw=;
        b=flReCID+cZXYSajNxqnqP9rDp3xlzMerWoh51ZVkH5+dHjBF19GTCYPFMiN21u2NHc
         FAyTJOcfJB+SdPx8CCNTHg9wTWfHRBWLitdfv8DCl3/zeYYpFuJ2emfvXqHpYJu2gFwH
         aczxK9Nnul3bBQAipbh/UW8ppW2YVDVl1dNVjtYMTThq1yKz2klRa2KpIIqx9ZVZfn+G
         ICCbmvrfPVl8qb+FBTDNBc2DFjwrfPQccn24q58mleGg+JUajgw0PTT39z0iectNZfVN
         ztFujkiaqgCSu3AkqOHL1QBp2B4KJa9Vtc51LhdVSQBissLlGZUf2xGcLw0s+JtiLtGJ
         lbmQ==
X-Gm-Message-State: AOAM533YJ7P0G/gYDHpi41QZCFbt3bZDo9J1Lz0C06XHnsdHM5I0qk2Q
	B4A5pb2LkI5NLp3OJYeFh6OTJSj6Z8JG7R9OuXk=
X-Google-Smtp-Source: 
 ABdhPJzRC2n1Wa59tdukiqfeb8efZ+OjMa49IlGisXgl7C/FZA5qS3K/gBwYxgX45zVOBHa392hCTIvjhxvisEACJ08=
X-Received: by 2002:a17:90b:1d02:b0:1e6:961d:d56f with SMTP id
 on2-20020a17090b1d0200b001e6961dd56fmr8733526pjb.225.1654865925791; Fri, 10
 Jun 2022 05:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220610090253.81323-1-Qi.Chen@windriver.com>
In-Reply-To: <20220610090253.81323-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Jun 2022 08:58:34 -0400
Message-ID: 
 <CADkTA4ODwUMv1zn8wBkfrtT=_5QMiYnMDqnymskzDFnCLPK+Ug@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] skopeo: clean up depends and fix CGO
 settings
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 12:58:49 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7365

On Fri, Jun 10, 2022 at 5:03 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> According to https://github.com/containers/skopeo/blob/main/install.md#building-from-source,
> the ostree dependency is not needed.
>
> Also, remove the CGO settings which incorrectly use BUILDSDK_XXX.
> The CGO_CFLAGS and CGO_LDFALGS should use target flags instead of
> SDK ones. As the CGO_XXX vars have already been set in go.bbclass,
> there's no need to set them here.

I'll take the ostree change (it is now handled by vendor/), and that
wasn't always the case.

But like the others, I'm not going to drop the explicit arch/flag settings.

Cheers,

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/skopeo/skopeo_git.bb | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index f3217dbf..24d951ef 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -9,10 +9,9 @@ DEPENDS = " \
>      lvm2 \
>      btrfs-tools \
>      glib-2.0 \
> -    ostree \
>  "
>
> -inherit go
> +inherit go pkgconfig
>
>  RDEPENDS:${PN} = " \
>       gpgme \
> @@ -33,8 +32,6 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -inherit goarch
> -inherit pkgconfig
>
>  # This disables seccomp and apparmor, which are on by default in the
>  # go package.
> @@ -61,8 +58,6 @@ do_compile() {
>         export CGO_ENABLED="1"
>         export CFLAGS=""
>         export LDFLAGS=""
> -       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>         cd ${S}/src/import
>
>         export GO111MODULE=off
> --
> 2.36.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7358): https://lists.yoctoproject.org/g/meta-virtualization/message/7358
> Mute This Topic: https://lists.yoctoproject.org/mt/91664552/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

