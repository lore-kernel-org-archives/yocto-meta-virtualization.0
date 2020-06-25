Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4673.1593065096216502856
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 23:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ObI3vSpU;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD558E01D78; Wed, 24 Jun 2020 23:04:55 -0700 (PDT)
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
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FB6DE01D75
	for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:04:53 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id u17so3804610qtq.1
        for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4epM+g3GUspV6Q8Z6h1xEi0y02L1hKxW4VDTPuvHWiw=;
        b=ObI3vSpUD/E33PRl+oGH4YeGYnEVltpuE/LuK2VBxlaGh8E3L59Mo2jOGExpMrQBTM
         Q1Jid02Z/wAcaWjq8BFM4iyS0gjvNuIaEeYX5r+7ujbo1G4sxbumhXb87/pHrKi5NXqy
         btSOWzmX27HUQTFfBWT94ikyj1Ge5qiNhl33DyrjINB5lDifg3xoNseM5GZjeOGlR25M
         qhyCdclh0q23+lHYfHhEBuCggpOhkExBXdeA23yV+3PbH61IOWtQMkdENLwcPAsiT3b7
         TTKAK+9O0Rxbo4nRh5WmQuTlowXXMur3FoHT9O4TYTkBmFbWNWF+Qe48r0Yc4+OoBDG/
         3Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4epM+g3GUspV6Q8Z6h1xEi0y02L1hKxW4VDTPuvHWiw=;
        b=U3hfOjbj+/sD9pJjH62KDmXTf+nr7gjsOI1ubOsXIJmoqoF+jtY+srcM6TV1+ezat8
         KViZs3IqzcejMr7oorwb4iZtLk/bkYsdvlrvKm3B8yrngs42gZ3+gne1TnUJg9GGVdHy
         3mxV2L+2aALS1wiJYUsMomMPB7MhHpX2GU41NRcZTfvoLSoHKPN0g6VmzxOYf7GFIDM1
         tWTMS0gJfVVPyVP/P1lrJ1GOSnmtllgc9iIxcEDJDO/C/B0IBHwpG3eSYb2Z8lkZijz1
         8DPKsaBIMsmPxS+M+ktyY0n+wmz6JqgxpLdryus+v1WWj7U5fHOUkpcRaTw3qsfpi40M
         wDmA==
X-Gm-Message-State: AOAM531eJdcrib8Zop7UnRD0k3jGXhJO7d+wmMgVSjDNTAVAWuz10WtQ
	+NKVBErWs2JfpvunONE5I92CBDFh7Uk=
X-Google-Smtp-Source: ABdhPJxAUl1jNaH9cpSUmbYeDtNyN4Mybc7A5w5/bho0JOefwk7bbvuCrjuPRb35fxJjENFNGbwn5Q==
X-Received: by 2002:ac8:4e03:: with SMTP id c3mr25425340qtw.82.1593065092966;
        Wed, 24 Jun 2020 23:04:52 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-6.mycingular.net. [166.176.184.6])
        by smtp.gmail.com with ESMTPSA id g5sm6059161qta.46.2020.06.24.23.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:04:52 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com,
	sstabellini@kernel.org,
	roman@zededa.com
Subject: [meta-virtualization][PATCH 00/10] Xen on Raspberry Pi 4
Date: Wed, 24 Jun 2020 23:04:21 -0700
Message-Id: <20200625060431.31826-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

This series introduces support for running Xen on the Raspberry Pi 4
board, with meta-virtualization and meta-raspberrypi, using the
linux-raspberrypi kernel at version 5.4 which is the current 
linux-yocto kernel version supported in this layer.

It introduces use of dynamic layers to handle configuration that is
both Xen and Raspberry Pi specific, and inclusion of Xen-specific
configuration when the 'xen' DISTRO_FEATURE is enabled to simplify
Xen image builds.

It applies a backported set of Xen-specific Linux kernel patches,
developed by upstream Xen developers working with the Linux Foundation
Eve Project, that are currently being iterated on for inclusion in the
Linux kernel.

Xen is uprev'd to version 4.13; this is currently compile-and-boot-tested
only on this RPi4 board.

Christopher

Christopher Clark (10):
  xen: apply layer settings when xen DISTRO_FEATURE is enabled
  xen-tools: add RRECOMENDS qemu on ARM and x86 when HVM is enabled
  xen-tools: use non-busybox ifupdown tool if available
  xen, xen-tools: update revision to Xen 4.13
  meta-virt-xen.inc: add Raspberry Pi settings
  xen, raspberry pi: add dynamic-layer for Xen configuration for Rpi4
  xen, raspberry pi 4: provide a default defconfig for raspberrypi4
  xen, linux-raspberrypi: add Linux kernel 5.4 patches for Xen support
  xen, raspberry pi: add Xen-specific SD card class
  linux-raspberrypi: prefer kernel version 5.4

 classes/meta-virt-xen-cfg.bbclass             |   6 +
 classes/sdcard_image-rpi-xen.bbclass          | 120 ++++
 conf/distro/include/meta-virt-xen.inc         |  19 +
 conf/layer.conf                               |  19 +-
 .../bootfiles/rpi-config_git.bbappend         |   6 +
 .../rpi-u-boot-scr/files/boot.cmd.xen.in      |  49 ++
 .../rpi-u-boot-scr/rpi-u-boot-scr.bbappend    |  17 +
 .../xen/files/defconfig_raspberrypi4-64       | 117 ++++
 .../recipes-extended/xen/xen_git.bbappend     |  11 +
 ...vmalloc_to_page-on-vmalloc-virt-addr.patch |  44 ++
 ...02-swiotlb-xen-remove-start_dma_addr.patch |  47 ++
 ...struct-device-parameter-to-xen_phys_.patch |  78 +++
 ...struct-device-parameter-to-xen_bus_t.patch |  66 +++
 ...struct-device-parameter-to-is_xen_sw.patch |  57 ++
 ...oduce-phys_to_dma-dma_to_phys-transl.patch |  88 +++
 ...translations-in-xen_dma_s_kernel_5.4.patch |  68 +++
 ..._to_phys-on-the-dma_addr_t-parameter.patch |  75 +++
 .../0011-adding-page-coherent-patch.patch     |  39 ++
 .../linux/linux-raspberrypi_%.bbappend        |   5 +
 .../linux/linux-raspberrypi_5.4.bbappend      |  19 +
 .../files/xen-tools-libxl-gentypes-py3.patch  | 140 -----
 ...tools-pygrub-change-tabs-into-spaces.patch |  40 --
 ...-python-scripts-work-with-2.6-and-up.patch | 529 ------------------
 .../xen/files/xen-tools-pygrub-py3.patch      | 233 --------
 ...ls-python-fix-Wsign-compare-warnings.patch | 136 -----
 ...n-tools-update-python-scripts-to-py3.patch | 140 -----
 recipes-extended/xen/xen-tools.inc            |  16 +
 recipes-extended/xen/xen-tools_git.bb         |  12 +-
 recipes-extended/xen/xen_git.bb               |   6 +-
 29 files changed, 971 insertions(+), 1231 deletions(-)
 create mode 100644 classes/meta-virt-xen-cfg.bbclass
 create mode 100644 classes/sdcard_image-rpi-xen.bbclass
 create mode 100644 conf/distro/include/meta-virt-xen.inc
 create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
 create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/rpi-u-boot-scr.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/files/defconfig_raspberrypi4-64
 create mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/xen_git.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0002-swiotlb-xen-remove-start_dma_addr.patch
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.patch
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0011-adding-page-coherent-patch.patch
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bbappend
 delete mode 100644 recipes-extended/xen/files/xen-tools-libxl-gentypes-py3.patch
 delete mode 100644 recipes-extended/xen/files/xen-tools-pygrub-change-tabs-into-spaces.patch
 delete mode 100644 recipes-extended/xen/files/xen-tools-pygrub-make-python-scripts-work-with-2.6-and-up.patch
 delete mode 100644 recipes-extended/xen/files/xen-tools-pygrub-py3.patch
 delete mode 100644 recipes-extended/xen/files/xen-tools-python-fix-Wsign-compare-warnings.patch
 delete mode 100644 recipes-extended/xen/files/xen-tools-update-python-scripts-to-py3.patch

-- 
2.17.1

