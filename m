Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1884.1594067224613389594
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 13:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wms/UQxG;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BA71E01E16; Mon,  6 Jul 2020 13:27:04 -0700 (PDT)
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
	*      [209.85.222.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC830E01E14
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 13:27:02 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id c139so36083739qkg.12
        for <meta-virtualization@yoctoproject.org>; Mon, 06 Jul 2020 13:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Obw00M0EZf4mU1UEW1koJdYhgKZ89lOi+wZCLWnCs/c=;
        b=Wms/UQxGrwAhsQMNlgHagiccx54bX1weHvS1ZVdVsrJKGD0+LH/d3dUFD9W9rc+AVE
         pmmaoeQVRe2/vJckROLsp9EMXpxmNqA0mQjhcZRYut1AEnYfMSzfNE2l1FwLvqySEG7B
         ish4PbTquSf8oi8ZjvEyyhjVStqGUmNgiJD97H+WqlgMtCIIrOG7a1O6ykv2NbNQ7hdL
         UU9fKWeYDWIWYjGadjTkJL8EbSbYH3jlqg+VXG7vMsoRvosWoyp89hTF5yeD/vPDEwLF
         LqUHgFj3ar3HNP8upekQKvr8LUA9eghfS27lfJZIFTxJgTeHrXMclJZE9xABToIYmMbi
         UmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Obw00M0EZf4mU1UEW1koJdYhgKZ89lOi+wZCLWnCs/c=;
        b=Qk8TCSKzZU2CmPP3+DtCvQzsQ+E/Huu+FMkD1W8V0b1MzQcP8SgffZ208CHDtmjKuw
         QkpaLR2bJCUOah0aaGtfkaVQg7hHubVZcPoxxJ/bP89hAw5Z+dFIhPr1Dg54MeVxTRJH
         oeTdDMKkRPljzPOEo/LwBVq5S1QE1MYGmtlmsef+O8yUfpu30/ecYCy3xzg/ssBPkumv
         Onv/jZ0xocCSsHFpdVJQtSzvt0336w60dGtnH8lsU9PhoAIhc9kGZdQzN2a0k8zk+AXz
         gg08IS+aG5u6JwK0V7H148R6TjmieUT41ML9hXNoxAKLKQVC6BEgJT5fNDqAzY6qkbHr
         KOrw==
X-Gm-Message-State: AOAM530QsXgngua2bNEaKJd1mnKP536DTgMwyFVT9ECpPenYGJzSwRvU
	tDNLLAmfou3N3LvT9/QNY80=
X-Google-Smtp-Source: ABdhPJzuUHdyMCccQjDyto9ATj4EAOnFGMZboyW7woOLm1MBFiqw1+KnAmrVGR5SUphUce4cYTiCAw==
X-Received: by 2002:a37:de19:: with SMTP id h25mr45255108qkj.354.1594067221286;
        Mon, 06 Jul 2020 13:27:01 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id h16sm14211857qkg.8.2020.07.06.13.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 13:27:00 -0700 (PDT)
Date: Mon, 6 Jul 2020 16:26:58 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, cardoe@gentoo.org,
	Bertrand.Marquis@arm.com, cminyard@mvista.com,
	"Stewart.Hildebrand@dornerworks.comhange-folder>?" <toggle-mailboxes@gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 00/11] Xen on Raspberry Pi 4
Message-ID: <20200706202655.GA49654@gmail.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH v2 00/11] Xen on Raspberry Pi 4
on 29/06/2020 Christopher Clark wrote:

> Changes since v1:
> - rebased on to current meta-virtualization, meta-openembedded, poky
> - updated Xen revision to the tip of stable 4.13
> - fixed Xen build on ARM64 with gcc 10.1.0
> - added upstream debugger patch to fix compiler warning
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

These have soaked on the list long enough, things build here as well, so I've
pulled these into master.

Bruce
> 
> Christopher
> 
> Christopher Clark (11):
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
>   xen: add patch to fix build on ARM64 with gcc 10.1.0
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
>  ...xen-build-temporarily-inhibit-Werror.patch |  18 +-
>  ...xen-arm64-implement-atomic-fetch-add.patch |  50 ++
>  ...g-0-arrays-to-access-packet-contents.patch |  60 ++
>  .../files/xen-tools-libxl-gentypes-py3.patch  | 140 -----
>  ...tools-pygrub-change-tabs-into-spaces.patch |  40 --
>  ...-python-scripts-work-with-2.6-and-up.patch | 529 ------------------
>  .../xen/files/xen-tools-pygrub-py3.patch      | 233 --------
>  ...ls-python-fix-Wsign-compare-warnings.patch | 136 -----
>  ...n-tools-update-python-scripts-to-py3.patch | 140 -----
>  recipes-extended/xen/xen-tools.inc            |  16 +
>  recipes-extended/xen/xen-tools_git.bb         |  13 +-
>  recipes-extended/xen/xen_git.bb               |  11 +-
>  32 files changed, 1102 insertions(+), 1234 deletions(-)
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
>  create mode 100644 recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.patch
>  create mode 100644 recipes-extended/xen/files/xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch
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
