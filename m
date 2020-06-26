Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2246.1593139565887812079
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Jun 2020 19:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cv96y23h;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 624F7E01D87; Thu, 25 Jun 2020 19:46:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.218.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14F55E01D85
	for <meta-virtualization@yoctoproject.org>; Thu, 25 Jun 2020 19:46:03 -0700 (PDT)
Received: by mail-ej1-f65.google.com with SMTP id p20so7867978ejd.13
        for <meta-virtualization@yoctoproject.org>; Thu, 25 Jun 2020 19:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pM/kEWLXpzIgk+DbkMElLvmQk6lOAnWgemk0tcCpHIs=;
        b=Cv96y23hOZmGuPNUGepxu9l9DJz51BlPvI8jPlV9STDVqeGltiU5bNZEtOHuluGCXW
         VtVgt9AcVvsv8fVxFpkLnpoy7LyeQ1wzSPOPGBwE5RdGPBPRk0QCq5qvY9IZSoPY/pt7
         3cgtIIFFil1cKHkYlWnf+w2SBJLkFhF7cldsNnfMLKQmyx3YxFOqwuqP/oG8cW4GZ83w
         Qx0W3xb728PDeU89V2UIrYZ6hq/0dvSEZZHZe/Kfw6Vd9urDIWzKlQyK6efS8mqs9OTx
         3cLi40rYQwAYX2Ykx2ROz7zAAQG2Vrk1wvVqfsveA9ZGmeRt8ziqKT9vgzdPj0FZUNkb
         rHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pM/kEWLXpzIgk+DbkMElLvmQk6lOAnWgemk0tcCpHIs=;
        b=cETevMRIxd/oMaYO64MOJGyEfUdWjOB9Tb7mgHM9uOh0d5WjvRslyIIGubJXJFt2D/
         MD05tG4eKcw6yz7HEQD92rpUylEEx9wdK0bhPXYELXgnDO0oh788sTw7xPsYCyDxfKV6
         CCgMYOHU5TayYc6O3R5Zt+0anGQOjsGsCCywBLhL3OlRXf1hrk0g4Fp1pxTyRI6eowZY
         MG0HZwu+tlpbS2ed7ddjO6UlO8ykIMIdoyXeVr+hY+2GSBHAifFYASYYm2yF0psXzhXf
         hq2HrLwEvVYiCRg0CrDG8rO6QkmAMIxBNoa27GNBIHGyyZR+cTWXcimoAVjq+JyM5cVs
         HHow==
X-Gm-Message-State: AOAM531vZTYDAZQ5A9YbIwMvFJyaYCFYoUUAlSUbPHGacmQLXLLWch8K
	cxn6sJlLpFi2gmw0KMv6sZUUVSZQZcY/aWUqgvw=
X-Google-Smtp-Source: ABdhPJzznG+5KsyQg4Gd/tserq2KKPMu+0D+nwywwrv3wwVMEMJ7bkHnBM30q7kQfW2qVUSLUa8O0uip9ce6tYEoxn0=
X-Received: by 2002:a17:906:4145:: with SMTP id l5mr691564ejk.334.1593139562621;
 Thu, 25 Jun 2020 19:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200625060431.31826-1-christopher.w.clark@gmail.com>
In-Reply-To: <20200625060431.31826-1-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 25 Jun 2020 22:45:51 -0400
Message-ID: <CADkTA4Mt2z0czzJXuk7-S3XnGpCSwmMwG78fO3xV0KxrJWd_jQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 00/10] Xen on Raspberry Pi 4
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Corey Minyard <cminyard@mvista.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, sstabellini@kernel.org, 
	roman@zededa.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 25, 2020 at 2:04 AM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> This series introduces support for running Xen on the Raspberry Pi 4
> board, with meta-virtualization and meta-raspberrypi, using the
> linux-raspberrypi kernel at version 5.4 which is the current
> linux-yocto kernel version supported in this layer.
>
> It introduces use of dynamic layers to handle configuration that is
> both Xen and Raspberry Pi specific, and inclusion of Xen-specific
> configuration when the 'xen' DISTRO_FEATURE is enabled to simplify
> Xen image builds.
>
> It applies a backported set of Xen-specific Linux kernel patches,
> developed by upstream Xen developers working with the Linux Foundation
> Eve Project, that are currently being iterated on for inclusion in the
> Linux kernel.
>
> Xen is uprev'd to version 4.13; this is currently compile-and-boot-tested
> only on this RPi4 board.

On my first pass through the series, I didn't see any issues.
Everything is well organized and makes sense to me.

I'll do a really quick smoke test here, but I don't expect any issues.

Thanks for keeping this consolidated, the mechanisms you've added will
be useful for a few things that I'm working on as well.

Cheers,

Bruce

>
> Christopher
>
> Christopher Clark (10):
>   xen: apply layer settings when xen DISTRO_FEATURE is enabled
>   xen-tools: add RRECOMENDS qemu on ARM and x86 when HVM is enabled
>   xen-tools: use non-busybox ifupdown tool if available
>   xen, xen-tools: update revision to Xen 4.13
>   meta-virt-xen.inc: add Raspberry Pi settings
>   xen, raspberry pi: add dynamic-layer for Xen configuration for Rpi4
>   xen, raspberry pi 4: provide a default defconfig for raspberrypi4
>   xen, linux-raspberrypi: add Linux kernel 5.4 patches for Xen support
>   xen, raspberry pi: add Xen-specific SD card class
>   linux-raspberrypi: prefer kernel version 5.4
>
>  classes/meta-virt-xen-cfg.bbclass             |   6 +
>  classes/sdcard_image-rpi-xen.bbclass          | 120 ++++
>  conf/distro/include/meta-virt-xen.inc         |  19 +
>  conf/layer.conf                               |  19 +-
>  .../bootfiles/rpi-config_git.bbappend         |   6 +
>  .../rpi-u-boot-scr/files/boot.cmd.xen.in      |  49 ++
>  .../rpi-u-boot-scr/rpi-u-boot-scr.bbappend    |  17 +
>  .../xen/files/defconfig_raspberrypi4-64       | 117 ++++
>  .../recipes-extended/xen/xen_git.bbappend     |  11 +
>  ...vmalloc_to_page-on-vmalloc-virt-addr.patch |  44 ++
>  ...02-swiotlb-xen-remove-start_dma_addr.patch |  47 ++
>  ...struct-device-parameter-to-xen_phys_.patch |  78 +++
>  ...struct-device-parameter-to-xen_bus_t.patch |  66 +++
>  ...struct-device-parameter-to-is_xen_sw.patch |  57 ++
>  ...oduce-phys_to_dma-dma_to_phys-transl.patch |  88 +++
>  ...translations-in-xen_dma_s_kernel_5.4.patch |  68 +++
>  ..._to_phys-on-the-dma_addr_t-parameter.patch |  75 +++
>  .../0011-adding-page-coherent-patch.patch     |  39 ++
>  .../linux/linux-raspberrypi_%.bbappend        |   5 +
>  .../linux/linux-raspberrypi_5.4.bbappend      |  19 +
>  .../files/xen-tools-libxl-gentypes-py3.patch  | 140 -----
>  ...tools-pygrub-change-tabs-into-spaces.patch |  40 --
>  ...-python-scripts-work-with-2.6-and-up.patch | 529 ------------------
>  .../xen/files/xen-tools-pygrub-py3.patch      | 233 --------
>  ...ls-python-fix-Wsign-compare-warnings.patch | 136 -----
>  ...n-tools-update-python-scripts-to-py3.patch | 140 -----
>  recipes-extended/xen/xen-tools.inc            |  16 +
>  recipes-extended/xen/xen-tools_git.bb         |  12 +-
>  recipes-extended/xen/xen_git.bb               |   6 +-
>  29 files changed, 971 insertions(+), 1231 deletions(-)
>  create mode 100644 classes/meta-virt-xen-cfg.bbclass
>  create mode 100644 classes/sdcard_image-rpi-xen.bbclass
>  create mode 100644 conf/distro/include/meta-virt-xen.inc
>  create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend
>  create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
>  create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend
>  create mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
>  create mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0002-swiotlb-xen-remove-start_dma_addr.patch
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.patch
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0011-adding-page-coherent-patch.patch
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
>  create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bbappend
>  delete mode 100644 recipes-extended/xen/files/xen-tools-libxl-gentypes-py3.patch
>  delete mode 100644 recipes-extended/xen/files/xen-tools-pygrub-change-tabs-into-spaces.patch
>  delete mode 100644 recipes-extended/xen/files/xen-tools-pygrub-make-python-scripts-work-with-2.6-and-up.patch
>  delete mode 100644 recipes-extended/xen/files/xen-tools-pygrub-py3.patch
>  delete mode 100644 recipes-extended/xen/files/xen-tools-python-fix-Wsign-compare-warnings.patch
>  delete mode 100644 recipes-extended/xen/files/xen-tools-update-python-scripts-to-py3.patch
>
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
