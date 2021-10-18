Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.39046.1634573795605358551
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 09:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=He4wzE22;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id g10so1177353edj.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Oct 2021 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/bX2O/a9rNG8GYRqcArba9qEs/iTH34l9iOYS2P+hZM=;
        b=He4wzE22V0ClXvoEjMPj3byyLEVxiE9Dr5dzdgbms0GTD2Nc3x2st/G8yj3crzzpL8
         8ok4YXvVznkptyH8IHE1K045CtgN0ZEdgsEncvCTEUvGcHGnWaHa4GR/h77vXhrSW+25
         IpyH899gZ9WbIP/mbkB+B/AXKal9gSnKR0qkYhz9MZ+yVzF57ihWDBbUtgvnNFJQcCMG
         KSK2c0pEI9J5AGINH9VS9tIVb3YfxNhKG5FTZ1j/TYt7bMMmlhzQDU/CrTWs7EROGxHv
         maxzEPtp7bU/pH/CgCIbQJIvuWpe7CzW7QHeTFi9oT9dSs5E4ad3VqV+i24mnlAYpUdC
         jFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/bX2O/a9rNG8GYRqcArba9qEs/iTH34l9iOYS2P+hZM=;
        b=E4MY+2YWvbyZL0PWgUVKEoYov5fyr7zLsqe7s0Us00RtCPsMzMc55sH42SF93z/gn5
         ZEUva4GgZ2ZUo6EsVnZ/+BryW9s8hkGbHGeobOhkSql+WsrBb7KtF+Dif0EpDenH0Oqv
         xSYR1G9ZjvfeLCu3Z5qwH0PUt4BZQY8iLg4YagGclgPurHXIU7grg4VqgbhDP2Z4Z2oY
         ro0mKRxQTXBc2wiziu4LABo0VlPJZMwzQCLXePXS52EOSAm0MOyhAJn41XorpXiLE8IB
         /5z97H5dFe9xNS7IHIztRRl0ySCJd9PGSPCmotx0FtDrvj4xfL8i9aNdP5QHsdtIBAZJ
         5UQw==
X-Gm-Message-State: AOAM530WI7ti9sSZe1RJwsrIxvweS4WPa9Ks2vNjQy22uLQd2o+9IPuC
	vleJdzkd/lxq48LP4JYF1pmAjVStPi2r6QU9yU8=
X-Google-Smtp-Source: ABdhPJyD7eIPLUKNTWQucTFGmotU/wrUBUofnWqTCN77LmVskh2l3GMpdataX/S2uV2SFGcAPIhLaqUgTHkaYpVwJ7M=
X-Received: by 2002:a17:906:d541:: with SMTP id cr1mr32320329ejc.81.1634573789433;
 Mon, 18 Oct 2021 09:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4Pr9YDVXSENU2ioddHDSiUoHSRptatUNpHUe8B-tAT6jA@mail.gmail.com>
 <11139.1634561947898698535@lists.yoctoproject.org>
In-Reply-To: <11139.1634561947898698535@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 18 Oct 2021 12:16:18 -0400
Message-ID: <CADkTA4MpGWkXjo7fTf=F1=tyzTb6yWv+X6_JVeZorKwWG1kdog@mail.gmail.com>
Subject: Re: [meta-virtualization] Building crun does not feth everything in do_fetch #meta-virtualization
To: kovac167@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 8:59 AM <kovac167@gmail.com> wrote:
>
> Bruce,
>
> Thank you for the response. I believe I am running into the same issue attempting to build podman with crun as the container runtime. These are the steps I have taken to reproduce the error:
>
> - execute a build with podman & crun with networking enabled on the VM
> - delete the tmp, cache, & sstate-cache directories from the build
> - save the downloads directory (for offline builds)
> - set the bb_no_network to 1
> - disable networking on the VM
> - execute the build again offline
>
> It looks like the build is attempting to reach & out download yajl, even when the bb_no_network flag is set. When I remove the crun setting from podman, the build completes successfully.

Ah yes, they've committed crimes in autogen.sh, that I hadn't noticed
creeping in.

I've bumped crun to the latest, and will confirm no network access
before pushing.

Bruce

>
>
> Logs:
>
> DEBUG: crun-0.18+gitf302dd8c02c6fddd2c50d1685d82b7a19aae8afe-r0 do_configure: Executing shell function do_configure
>
> Submodule 'libocispec' (https://github.com/containers/libocispec.git) registered for path 'libocispec'
> Submodule path 'libocispec': checked out 'fa3e8338c62ae482e509884ee2edaefc8e00499e'
> Submodule 'image-spec' (https://github.com/opencontainers/image-spec) registered for path 'libocispec/image-spec'
> Submodule 'runtime-spec' (https://github.com/opencontainers/runtime-spec) registered for path 'libocispec/runtime-spec'
> Submodule 'yajl' (https://github.com/containers/yajl.git) registered for path 'libocispec/yajl'
>
> Cloning into '/opt/roast/bitbake/build/tmp/work/corei7-64-gmit-linux/crun/0.18+gitf302dd8c02c6fddd2c50d1685d82b7a19aae8afe-r0/git/libocispec/yajl'...
> fatal: unable to access 'https://github.com/containers/yajl.git/': Failed to connect to github.com port 443: Connection refused
> fatal: clone of 'https://github.com/containers/yajl.git' into submodule path '/opt/roast/bitbake/build/tmp/work/corei7-64-gmit-linux/crun/0.18+gitf302dd8c02c6fddd2c50d1685d82b7a19aae8afe-r0/git/libocispec/yajl' failed
>
> Failed to clone 'yajl' a second time, aborting
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
