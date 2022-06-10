Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCCCC43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 13:00:59 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.26774.1654866052441195701
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 06:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o193AEpH;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id x4so15236983pfj.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 06:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iUZXDY15AitHThZyh2/41Z5sCsUywfa+ch+Moyfi6gg=;
        b=o193AEpHSSru6kCcxxXgIUFAZ1SUOuBHmmphBbAbzvpIz0+Nv+IsDj9Q6yAGSAKSnm
         pFkgduoD70E2n9JTQnT+Bkc9hvtJa6iNWucA5hIHDNSTUbxzotxZK3SLXjFNya2Rr/wx
         clTgk+SgWy0ijrUSDORXxqdlSuCqhyHJaggGyuGKUy96MzTubMutx8yZW7KXPcUvcpEh
         PG9pNqF0GaZ9+7+h1G2k7dykGusNS7ZjAcSEEpxjkpRTb3SpFUmgXJV8CqHZ6CDtFUqd
         se2TMCeqwMfvEGrkat+WcRWCxu6p2t1IRxnq21p7qPWjt2sENN+d5/HfWbMK1qZum0CZ
         coDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iUZXDY15AitHThZyh2/41Z5sCsUywfa+ch+Moyfi6gg=;
        b=o2Fq9MJ1w/9dGXI0T1riEJJcz/szZ5jDXHBaKBrFc58fUW3bmbGkdUawkEhTnK5hhp
         LQCq+sC318nO2UfZDxftLOYKCfPEaUa6DnALCqfchZTlLzj+3R8oZ89lxbwZA05zSP7Q
         pW3mcJjC1WMNY4MSL74zzk0uOe656hv4D5XZvQcxTHHeUBpNtkmQlJ0p/ONh3WCkd9ls
         fMDKalXDgfu/NSoLMnb2ENitVJwRLC53/xbFzDMda6H1RJg6PfiuJ0m0IziJL8b/zG93
         i/yEVE3xfwHjq2AcL/q8yr3BUoLriifveITdHEyJSeTmiT6HpjmpD27swiuTQWVSi+7T
         V0JQ==
X-Gm-Message-State: AOAM530148qRo6fXUgSSAP1rMbBFThAeAeDv61xJ2L2cGJARdRxDXjH+
	z6B5WwUl8OEiU94D8ct1niqfCKiB3hij7CTEnr4=
X-Google-Smtp-Source: 
 ABdhPJwwtjEdihfud38PvGYLTDh8zH33J9GggpWq8amvJfngkQtg0mC8NaIU+uxNuldQb8o+4I5wYWWHkDo09P1sPu8=
X-Received: by 2002:a63:4a4d:0:b0:401:9f40:26a7 with SMTP id
 j13-20020a634a4d000000b004019f4026a7mr6636756pgl.282.1654866051400; Fri, 10
 Jun 2022 06:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220610042053.4051-1-Qi.Chen@windriver.com>
 <20220610042053.4051-2-Qi.Chen@windriver.com>
In-Reply-To: <20220610042053.4051-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Jun 2022 09:00:39 -0400
Message-ID: 
 <CADkTA4OVCWoKY3TLAtAqzkGGUgsJt_Dgh=iHpwnDJdugWDD=tg@mail.gmail.com>
Subject: Re: [meta-virtualization][master][kirkstone][PATCH 2/3]
 docker-distribution: fix build error on new hosts
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 13:00:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7366

On Fri, Jun 10, 2022 at 12:21 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> The CGO_CFLAGS and other related variables have already been set
> appropriately by the go.bbclass in oe-core. Setting them in this
> recipe is not only unncessary but also error prone.
>
> For example CGO_CFLAGS is set to use BUILDSDK_CFLAGS, and this is
> incorrect. We need target flags instead of SDK related flags. Such
> setting happens to work for some hosts. However, when building on
> newer hosts, we get QA error like below:
>
>   ERROR: docker-distribution-v2.7.1-r0 do_package_qa:
>   QA Issue: /usr/sbin/registry contained in package docker-registry requires
>   libc.so.6(GLIBC_2.34)(64bit), but no providers found in RDEPENDS_docker-registry? [file-rdeps]
>
> The above error was found on hardknott on host Fedora 35.
> Tracking down the error and I found it's using host stuff which is likely
> to be caused by using incorrect CGO_CFLAGS. As the master branch is
> using the same settings, it has the same issue.

And as I mentioned, feel free to adjust the flags and explicit
settings, but I won't be dropping them.

I've been through 6 years of getting these recipes working, and
continually being broken by changes in the core classes, so I'm not
going to drop the explicit settings.

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb       | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index 1d074bf3..679bcf8b 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -23,17 +23,8 @@ inherit go systemd
>  EXTRA_OEMAKE="BUILDTAGS=''"
>
>  do_compile() {
> -       export GOARCH="${TARGET_GOARCH}"
>         export GOPATH="${WORKDIR}/git/"
> -       export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export CGO_ENABLED="1"
> -       export CFLAGS=""
> -       export LDFLAGS=""
> -       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>         export GO_GCFLAGS=""
> -       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>         export GO111MODULE=off
>
>         cd ${S}
> --
> 2.36.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7356): https://lists.yoctoproject.org/g/meta-virtualization/message/7356
> Mute This Topic: https://lists.yoctoproject.org/mt/91662218/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

