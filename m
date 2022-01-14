Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD79C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:03:04 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.7413.1642168984144058484
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 06:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XewXuPwm;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 15so2103640edx.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 06:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BO8kxZOECfE0kwrvFfijTaha6pODiRmH69QUQcQxTzE=;
        b=XewXuPwmKfIQte8Z5plQnm+mwJoNar5d/qu3byS59o4JKyQeeb8rnbtJ4ry/RRTvU3
         W3HtJfH/6vxYrWOHxc17XDPjGmqMsKDIS4HYkARiorTxUDN0hVIaxtiLCgzy2lBPG96y
         yzjRUJZAbvn5gprMPxI7KMHvA3nNPeqV5DOnKdvZbbCH5bhWS+/7BzUtu0IYQ/6cwzpM
         hg19ShHsg8wmVRu54lLyJmPD66Hd1qdPxZh9+5aul/uQypb/RBViz+lDwSPQlzwJN1ZQ
         qhZIP3j4SKxa8d7jv6+FNzXygH3O9qmn/WqyjJPYtrIWGyEk4GnwvxwDfuSWHKVSype4
         GXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BO8kxZOECfE0kwrvFfijTaha6pODiRmH69QUQcQxTzE=;
        b=DfM2lzbgDfHZLX1snxhRx2CIHewBYajxHcTEdy9cvfyioNMXh1KlpwB3GXKEeFvLk2
         aklsDw9mg9zCF5VyYoQoX0aLNfngZaEdGaAjlhPzgskK0ZdjsRoEwaKIRTmfTtWlswSj
         PW8YdEqSYJlea+qZnmvgr0aHswZQufJdHQp4Y/GaeZnvh3jZ4+6HsV90Sjm3G5j7D2pm
         1iPgSKsBcfwumpOxTccZ9dtgfH62brIY19puluomTwlHd48Qaf86AVt+dLY/ADm/3zQU
         izGmB+Y2WUhiOTxFYeQzvo2dvmbbdpB9AQdRiPrPEQIhcW3j2hw7YrkP1+jDEPOH6ejU
         c68A==
X-Gm-Message-State: AOAM532kW+k+Vs/nLFd61jKSYn4Aix+4p7Ieo92tmMN6ihg1DfawVwTH
	RdVJIpjt+Fdv/tdzidGiA0HJuBLNrik05mJ9ngI=
X-Google-Smtp-Source: 
 ABdhPJw1xK9jwT5/pNU1CEik/39q6oOFXFtr/lVutejUug71vo17Z8nZtmb+GcqH+BgEhAihWxzUyG9dF4JJuLcwH7w=
X-Received: by 2002:a17:906:584d:: with SMTP id
 h13mr7294689ejs.141.1642168982564;
 Fri, 14 Jan 2022 06:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20220114112231.476679-1-vishal.bhoj@linaro.org>
In-Reply-To: <20220114112231.476679-1-vishal.bhoj@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 14 Jan 2022 09:02:51 -0500
Message-ID: 
 <CADkTA4Ow0EtC_tevLw7OZMRTX_WkH-_ivYFgiY8gx_q4W0pEEQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] go-fsnotify: switch to main branch
To: Vishal <vishal.bhoj@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org, patches@linaro.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Jan 2022 14:03:04 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7003

Thanks Vishal!

My latest runs picked up the same branch change, so I went ahead and
fixed it locally as well as updating to the latest version of the
project.

Assuming my integration tests pass, I expect to get the changes pushed
out today.

Bruce

On Fri, Jan 14, 2022 at 6:22 AM Vishal <vishal.bhoj@linaro.org> wrote:
>
> The maintainer has migrated from master branch to main
> branch and hence fetch is failing without this patch
>
> Signed-off-by: Vishal Bhoj <vishal.bhoj@linaro.org>
> ---
>  recipes-devtools/go/go-fsnotify_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
> index 8aa1c76..85350b0 100644
> --- a/recipes-devtools/go/go-fsnotify_git.bb
> +++ b/recipes-devtools/go/go-fsnotify_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
>  SRCNAME = "fsnotify"
>
>  PKG_NAME = "github.com/fsnotify/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
> +SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
>
>  SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
>  PV = "1.2.11+git${SRCPV}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7002): https://lists.yoctoproject.org/g/meta-virtualization/message/7002
> Mute This Topic: https://lists.yoctoproject.org/mt/88418583/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

