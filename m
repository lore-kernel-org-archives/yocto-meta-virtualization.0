Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.6400.1619578502417782556
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 19:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LOVbKHZF;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id k127so6624087qkc.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Apr 2021 19:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JnjGtk3zXjAi1gUO2BLizGn/3HIu2je7sJeg5JCoCqs=;
        b=LOVbKHZFzXSBcAug4ncOMW0jADgb/5G933qMY3THbLPmoUTB03E7dOLtD1Wikwa1w0
         03XmiDj7Pk+AR+h1YgaJVKIBlkg2SKR7Pxv/34KCKlQ4wXlUnGmfsU15Z//Q0TvOwuTC
         4z1px383yXssfUawr0dRq9pXvPmuAevML2IlRqwQITMOS3/Y9JCDNUOG0C7nmqs/fe+j
         mOD4f1F5HKSMRmOkpvGUtFSrAeXGAu4xcjvliKiDdNdws5iYqWvaUXRFzpgCALDh/CAN
         toYIR0tQBe+pM1+V/9reYSu+GS4EJKqI3uNkWeXfHAAI4OzCZ7jnHe6UxoqVw6iIxSvd
         JV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JnjGtk3zXjAi1gUO2BLizGn/3HIu2je7sJeg5JCoCqs=;
        b=ZFQxe50D5VB4Mj/Zsbjq0HfW4zEjLKFHcnTXiPUMfAil1Qyx2cWitFxBDqeLqbDOH/
         2WAnFI4r9IXF6G7jr5AuDredvnsIkP96sioHbNiiQJlE12NooRkrres358/a+VlO2PyR
         xDoGRvShAoD7z3s7YNaGuz6iOaOvkMxHnTyjz93LFy+dlK07xzH6XSQqIUnXUhTLxMv9
         ymj+SQthIwEuGXryhHnF8yIgGNva9mXjtIp9G2wTOmFxNp5c4rGhjHAPBjP1CDHGWJ1e
         aj7llTfaE/NJ+khKi+SYtIkMJSWYw3WWh0h5bD3kdERQLsXu0Rjsa/tvugGO0W/wUuUo
         HPpg==
X-Gm-Message-State: AOAM532ySm8Yp2f8KnL4aRI7LNH5SOvbuUXJUNR06GnbFKrHGL8E6N/K
	zCRgcy0ojYm2qTHlpYIh/84=
X-Google-Smtp-Source: ABdhPJxwdNk4D71cIHkIw4AdH7OlULd8ncxlh5Zx0akzndOR8Hfoyu33a4cE0EKab2QzfeqvBk3X7Q==
X-Received: by 2002:a37:9903:: with SMTP id b3mr26817371qke.17.1619578501417;
        Tue, 27 Apr 2021 19:55:01 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id l4sm1317295qtn.96.2021.04.27.19.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 19:55:01 -0700 (PDT)
Date: Tue, 27 Apr 2021 22:54:59 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
	bertrand.marquis@arm.com, ticotimo@gmail.com
Subject: Re: [meta-virtualization][PATCH 0/8] Xen and Yocto Linux on Raspberry Pi 4
Message-ID: <20210428025458.GB50215@gmail.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210424083103.202107-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH 0/8] Xen and Yocto Linux on Raspberry Pi 4
on 24/04/2021 Christopher Clark wrote:

> This series enables running Xen 4.14 and 4.15, with Yocto Linux 5.10,
> on the Raspberry Pi 4 board.
> 
> Sets a new default kernel preference for linux-yocto for Xen on RPi4.
> Applies some clean up to the config settings and dynamic layer.

Everything looks good to me. I'll have to do some similar cleanups
to the xilinx layers as well .. we have a RunX talk accepted for
the upcoming Xen conf, so that's a good reason for me to do that
part.

I'll merge these on Wednesday if I don't hear any objections.

Bruce

> 
> Tested with kernel v5.10.25:
>  SRCREV_machine = "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
>  SRCREV_meta="031f6c76e488a3563f35258c72ff1de3e25a512e"
> 
> Christopher Clark (8):
>   xen, rpi4: use the preferred generic multiboot,module compatible
>     string
>   xen, rpi4: drop the raspberrypi4-64 defconfig, xen_git.bbappend
>   xen, rpi4, linux-yocto: enable linux-yocto 5.10 for RPi4
>   xen, rpi4: switch Xen-on-Rpi4 kernel preference to linux-yocto
>   xen, rpi4: fix u-boot script to load binaries from boot partition
>   xen, rpi4: apply workaround to fix crash on boot with Xen 4.14
>   xen, rpi4: move rpi4-machine+xen-distro cfg into dynamic layer
>   xen, rpi4: add xen-rpi-u-boot-scr recipe for default u-boot script
> 
>  conf/distro/include/meta-virt-xen.inc         |  21 +---
>  .../distro/include/xen-raspberrypi4-64.inc    |  25 ++++
>  .../rpi-u-boot-scr/rpi-u-boot-scr.bbappend    |  17 ---
>  .../files/boot.cmd.xen.in                     |  12 +-
>  .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  |  34 +++++
>  .../xen/files/defconfig_raspberrypi4-64       | 117 ------------------
>  .../recipes-extended/xen/xen_git.bbappend     |  11 --
>  .../linux/linux-yocto-dev.bbappend            |   6 +-
>  .../linux/linux-yocto_5.10.bbappend           |   6 +
>  .../linux/linux-yocto_xen-rpi.inc             |   6 +
>  10 files changed, 87 insertions(+), 168 deletions(-)
>  create mode 100644 dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc
>  delete mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend
>  rename dynamic-layers/raspberrypi/recipes-bsp/{rpi-u-boot-scr => xen-rpi-u-boot-scr}/files/boot.cmd.xen.in (80%)
>  create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
>  delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
>  delete mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.bbappend
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_xen-rpi.inc
> 
> -- 
> 2.25.1
> 
