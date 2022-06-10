Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E581C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 12:55:59 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.26539.1654865751310787736
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 05:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DK56I5fH;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id i1so22711725plg.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j+IcjdDvKkCP6aa4TndVhPnXQf89d4eKGp+kxDAgqOg=;
        b=DK56I5fHjswU8W2cDqCVZ7U723T0qmhVgKDnU3uRccodaJqn0W3S+PgGOe9rzh5NtP
         KqXa3nMKX3llnJHq5NLaHdHobmBAMDOnHBN5EDL8EZS1OPF+s0KUEI42HZtTVtk00E+u
         TCs9LSsk/RsyRQkG19LMiaCQbOiiKXwK0hpSqBqhOnjv1WkscNCuCTzJ4lJjKsL2BHhu
         0tM6y9xSxzyKBsEB69p2PJUBbMmRYcyjuylAu6Eldnxq8IeI25fzwvhg4K3vErvazpLC
         hJTuQyaglKICXepuYlEDASWdukZ9X8wzJtb0iEAdZJ6/sPZ16ssFQWy6Ft5V7DOJA6xc
         qvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j+IcjdDvKkCP6aa4TndVhPnXQf89d4eKGp+kxDAgqOg=;
        b=b7sMBhMMV61F6jZvaCMNdkH6suvFW9LLft3igTxIyV6/fuGWIX81VVuKSPoBajMTUd
         e9Jc5FNSTUURoq2T1+EpECbHfdA+gHBWqyCtbG82iMw+3LA6O8/V557U3evzU/8duj/J
         eNxZy8SFgT7RT6RJMhixc1rirpzQuCpNSo1KLP5QI3qqk2Pn7+ckO2onwjRlf8LzjAbF
         cHoSNSy4K4z+H0c1jAxZ81UZ8IYqoUTJbhYfyZsNx+dPKYfSuvWXJiO8B7FCwsyf1WM/
         QiLYy3tznIzj96F8kySga+0SQ5nKL9MGBT/l4ZdkGxxu0+lkwxfEgrEp0mNyL3xFEIvK
         T3Ew==
X-Gm-Message-State: AOAM530KzqtUYeDTZuQ6nXc80lv7VShyeL7Wfd3C26x3OLf84wWvGs6c
	6gp2MUyMeU5QTwV3lWsjqgcjUAQBRt0vxOVQiCw=
X-Google-Smtp-Source: 
 ABdhPJxn71QzUC61/RL+vvhKqWOIDKNdB1Fl9lNR6i9W7HyUy8dV9KeqyM9ueYVKiQgtcRz90pHa+sgT9tY458JUTDY=
X-Received: by 2002:a17:902:d5ce:b0:167:6c02:754c with SMTP id
 g14-20020a170902d5ce00b001676c02754cmr30202417plh.135.1654865750655; Fri, 10
 Jun 2022 05:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220610094507.74342-1-Qi.Chen@windriver.com>
 <20220610094507.74342-2-Qi.Chen@windriver.com>
In-Reply-To: <20220610094507.74342-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Jun 2022 08:55:39 -0400
Message-ID: 
 <CADkTA4Nr=ZxgEHQP5gU83OO38xARMjKBHo0GOXy3qfrJrf9iwg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/5] oci-runtime-tools: adjust
 inherit and fix CGO settings
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 12:55:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7364

On Fri, Jun 10, 2022 at 5:45 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> go.bbclass already inherits goarch.bbclass.
>
> The CGO_CFLAGS and CGO_LDFLAGS should use target flags as set in
> oe-core's go.bbclass, not the SDK related ones.

While that may be true, I've had significant issues with the go
bbclass in the past, so I'm going to keep all of the explicit flag
setting.

Feel free to send adjustments to the flags, but I won't be dropping them.

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../oci-runtime-tools/oci-runtime-tools_git.bb               | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> index 838d24b..b953ab4 100644
> --- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> +++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> @@ -13,12 +13,9 @@ GO_IMPORT = "import"
>
>  INSANE_SKIP:${PN} += "ldflags textrel"
>
> -inherit goarch
>  inherit go
>
>  do_compile() {
> -       export GOARCH="${TARGET_GOARCH}"
> -       export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>         export GOPATH="${S}/src/import:${S}/src/import/vendor"
>
>         # Pass the needed cflags/ldflags so that cgo
> @@ -26,8 +23,6 @@ do_compile() {
>         export CGO_ENABLED="1"
>         export CFLAGS=""
>         export LDFLAGS=""
> -       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>         export GO111MODULE=off
>
>         # fixes:
> --
> 2.36.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7359): https://lists.yoctoproject.org/g/meta-virtualization/message/7359
> Mute This Topic: https://lists.yoctoproject.org/mt/91664849/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

