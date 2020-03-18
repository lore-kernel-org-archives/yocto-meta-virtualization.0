Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.16514.1584541776164019300
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Mar 2020 07:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BaxA85ZG;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id i24so27330692eds.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Mar 2020 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ev6GGB/AWF5frdGKEf4kaAOYeVxgpEP9Fw4LENEVeM=;
        b=BaxA85ZGRykRPr79AGPkn8VMfiyH446QmnAjtlq0Z2ILXsEx2RG3Ko+NmU7CcgYNtl
         EOfVneC03/IC1/ftB0rNqv7FpsBh26w9bFUTDuWFg5MwrEIzKQknO9TmO6hlj3Muez1x
         KE+Ir47PxpDX+yH0id66hectLnbD1fjLnpvCvkxpdKVCsAV9az8FNcMDqrnLeQu8bEv3
         ScPVdpCxDIGZ8t/Iry5cZ7yBUxBzsswwGu2bBsclOgV5W1XtqS2CJGOXr+tknSwUtAd2
         02BP2qEXsHXpg2EvWHfjBAfDvaF73LV/iOoCrZttR5Z4rBNFzYZtz7DWiiDrXW1WzIwE
         oLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ev6GGB/AWF5frdGKEf4kaAOYeVxgpEP9Fw4LENEVeM=;
        b=XcBQiDfL7DKuY21m7J1jLUCLRzO3ifvJJ/Lg9Q7OZ+ZEASeW8EN0mzpxSQf5aBQeYA
         sVjjAHNKXhtOPUKjxAZ7CkNgEmx8rpGQgjT+EOnBw5YrFxZbczTftwWdSvc1hTUEha+6
         WoQtnySRFTm/REJNFt6NqCvqwI0aw/7vgtLyPO9s9pxkMpk3rT4FQACdXAkRsfROpcJV
         ZtEbL80/UVjsMp8sItTPwobFDKMVRRLVWpcSWxe57wFTcjVc3AWcTTyn5iVZDJ1d+NB4
         vwjR68M12Ab+X7sE7cfHgew3DpfsKh+78qy+J+Nzhs6g3cxlAA8t2c/FwyOkP4PrIuNO
         h0RA==
X-Gm-Message-State: ANhLgQ1fULTCwk0nSQVWU64Ms6su07siInvW5cy7agZy0hkwzrmZLtrC
	43xjDjGsfO7nEPXKlL2rST/jV3BRmyOC38jXd3U=
X-Google-Smtp-Source: ADFU+vshY7ccH1Hnnb1C9K0ip+7+bgIfwVudr/fHKe8eLyEjTz0cP23TnbnJKbLdmUnYorpmHerwYM209+pnQH8X/AE=
X-Received: by 2002:aa7:dd01:: with SMTP id i1mr4105254edv.164.1584541774467;
 Wed, 18 Mar 2020 07:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200318161231.62892-1-Daniel.Dragomir@windriver.com> <20200318161231.62892-2-Daniel.Dragomir@windriver.com>
In-Reply-To: <20200318161231.62892-2-Daniel.Dragomir@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 18 Mar 2020 10:29:23 -0400
Message-ID: <CADkTA4Oi7YtuLC0RyUT-JBQodp7DWmy=rGt+FJ1w=t=czJCoWg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] runx: drop distro_features_check
To: Daniel Dragomir <Daniel.Dragomir@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

This change is already in tree.

Cheers,

Bruce

On Wed, Mar 18, 2020 at 10:22 AM Daniel Dragomir
<Daniel.Dragomir@windriver.com> wrote:
>
> From: Ming Liu <ming.liu@toradex.com>
>
> distro_features_check bbclass is deprecated, inherit features_check
> instead.
>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  recipes-core/runx/runx_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
> index e405df7..e1c1928 100644
> --- a/recipes-core/runx/runx_git.bb
> +++ b/recipes-core/runx/runx_git.bb
> @@ -18,11 +18,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=945fc9aa694796a6337395cc291ddd8c"
>  S = "${WORKDIR}/git"
>  PV = "0.1-git${SRCREV_runx}"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "vmsep"
>
>  inherit pkgconfig
> -
>  # for the kernel build
>  inherit kernel-arch
>
> --
> 2.17.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
