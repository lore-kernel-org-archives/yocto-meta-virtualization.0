Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.3688.1633311769782200975
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 03 Oct 2021 18:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q4goc7F2;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id g7so57658159edv.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 03 Oct 2021 18:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=us0bEzfa6kGR1PJKn91mN8iIfMTUBVXTdZanGUB9jy8=;
        b=q4goc7F2bkbH2j2+XBZ7mVXJc7mCjZD0aPEsjsE0nWyDXhwFzfUNwit4TKCSDnVv0B
         0ezYBdmMH3eFdOKOTNd2NOVtZYsRFYBFaKyRz7NJGP2x8E35afFWNBC4WgJBuRMoMllw
         xV0wDP38dnGG0NK6r4Oa3DicVLhcKJJSHg9CJYzJxJ964FfK4G0CIkmXVhF2tDCBb4ob
         +VOApiJYqB5H58E0EWdHFVsu586LcB4bY8VHWTeAmBDe5P+xGDJ0fwk7ReUWpyqGaKfP
         nfPblOAdIelh7aGenvD5GY3X/MHAj2lM3hvCtZOmMHa6dwhM4B1Lw2JfZK7wKPV0o5CR
         NDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=us0bEzfa6kGR1PJKn91mN8iIfMTUBVXTdZanGUB9jy8=;
        b=uthUes67jlLkprN5QcWhvprIjBcG83KmkKqVhDiLmAc6Yk4iPdf50TWvz53HUwtlB4
         taHO9XDIMpts40pl7DliTiMqfEv7/ztG8rg3Ze7o8xmZ3gKt+aSQzPXVsU4Fs0Izx0Mf
         4WHSD1OMKu/xgQlBKfpuyPU4aHCKAuEbu4VO8S9Lp88UrYBRs++7WMvmbfFetJr2K9f+
         EMaT70iWUG0AXoAgqxjlYcZDO/oQbqq+DKLVPeC/AeQ2fHk/vzoR8lAeUHERH8n53XCW
         uvU21Mszro375T7K4wpsyqVFowSABDCLA95G2nOzCWy6tDY2NZLERjkhu+XoeZKxH6Hx
         tksg==
X-Gm-Message-State: AOAM533SNS/hiH0tVSzlSziLLbZNAnpUw28RdsKksaPm1OgP+kP7pO+v
	wC7dMunHvpjnTwdRkWWW+4b+BVO+euoFhc6NwK8=
X-Google-Smtp-Source: ABdhPJx6QG3fFEBNqSj6touQP+RXa2QvQ3AhtayvBeFAcGC1DmMS28D3qS1VgRlib0v5GlyEtlw3T5ScrOEp5HEmBvo=
X-Received: by 2002:a17:906:d541:: with SMTP id cr1mr14846697ejc.81.1633311768131;
 Sun, 03 Oct 2021 18:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210930145423.17162-1-luca.fancellu@arm.com>
In-Reply-To: <20210930145423.17162-1-luca.fancellu@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 3 Oct 2021 21:42:37 -0400
Message-ID: <CADkTA4PhabexMor7o-61LzcM08NnB2Dnm8Fbt-SQa9i9CAqUOQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] xen, rpi4: Fix syntax in linux-yocto bbappend
To: luca fancellu <luca.fancellu@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

FYI:  Christopher is having a look at these updates.

I just wanted to let everyone know that they haven't been missed.

Bruce

On Thu, Sep 30, 2021 at 10:54 AM luca fancellu <luca.fancellu@arm.com> wrote:
>
> Syntax conversion for bbappend linux-yocto_5.10
> and linux-yocto-dev inside the raspberrypi
> dynamic layer.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  .../recipes-kernel/linux/linux-yocto-dev.bbappend           | 6 +++---
>  .../recipes-kernel/linux/linux-yocto_5.10.bbappend          | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> index 8381e44..5f43052 100644
> --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> +++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
> @@ -1,8 +1,8 @@
>  # For a Xen-enabled distro on the Raspberry Pi, override the contents of cmdline.txt
>  # with Xen-on-ARM-specific command line options
>
> -KBRANCH_raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
> -KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> -COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
> +KBRANCH:raspberrypi4-64 ?= "standard/bcm-2xxx-rpi"
> +KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> +COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
>
>  require linux-yocto_xen-rpi.inc
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> index af92493..f279ef7 100644
> --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> +++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
> @@ -1,6 +1,6 @@
>  # Enable use of the linux-yocto 5.10 kernel for the Raspberry Pi 4
> -KBRANCH_raspberrypi4-64 ?= "v5.10/standard/bcm-2xxx-rpi"
> -KMACHINE_raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> -COMPATIBLE_MACHINE_raspberrypi4-64 = "(raspberrypi4-64)"
> +KBRANCH:raspberrypi4-64 ?= "v5.10/standard/bcm-2xxx-rpi"
> +KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
> +COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
>
>  require linux-yocto_xen-rpi.inc
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
