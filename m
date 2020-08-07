Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1415.1596783923935891549
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 00:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BRTWMUJA;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 843CEE01FA7; Fri,  7 Aug 2020 00:05:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URIBL_RED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.219.68 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0774CE01FA4
	for <meta-virtualization@yoctoproject.org>; Fri,  7 Aug 2020 00:05:21 -0700 (PDT)
Received: by mail-qv1-f68.google.com with SMTP id a19so323551qvy.3
        for <meta-virtualization@yoctoproject.org>; Fri, 07 Aug 2020 00:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BuGRv8L+jXPDT9ePHzkGyyd6SHnRTG/YVZnLDfrPxWw=;
        b=BRTWMUJA9FwV1rRmjzd/R6c+DhTHWAANWxOFll06UffbdWp8YePVInCtOGkrmRrL29
         HiBKdYvpW3X00blmr5WgstVB5YiWT3UXzxcJ14hNobWURqrzugoYJAlbHb6TY/tsvrxx
         dD6++MkjM1KM+Eq+Lzk6dH5P1pkzVcqQAsfd9CNLw8gVaVkMVG9d7kVYh5VZmo1HHrn9
         xOmi0Y+wXvUobbuEifeeN0C0Ko8w4RnDO1+Lyy6Muu101UiCyXtEwAQ+X01FYmY0FUw8
         Gz46/07RgmumFqR9+soN9e5+H5yC3dtvWS6+k60txqjYNVcCU2WGEkSfjtrZ5h4IOEnb
         2/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BuGRv8L+jXPDT9ePHzkGyyd6SHnRTG/YVZnLDfrPxWw=;
        b=SVcyATlrMNFQyBHtoXj6O0v6zRSFxXhLyyT0hGxduGetC7ubFVklKKHlBuyxmq4QKE
         YufQjwXTal7mOdj7GQYa0Ghv5Xp8c6LgKuCmuXr6OqdsEgR+9VxXYsuN/XhApXFSpq8i
         VS+o3z5xPnnknhKXQfva6U+kHUaPHSQT+XkrIql4CrG5K39/GTD2xSB0Odi0WBnQELcU
         P6cAoI0BJpGqRuMIfk24ufYUpTRxsnxQszO/FZrUX2WkPJCOzhfSEfbZI/AuugiEsoZz
         kcxbHtFkpwvvguYcaaZ+kFAEgZq8kKe1pySilFiQd77MMN136K/1ZYf2H+V+6EqNFJ7X
         3o8A==
X-Gm-Message-State: AOAM533l5WNsca7OnkMPfii/cP3XPMBT8vuwYjz6nf34QHQ2qC4m5pkH
	BMWI642MjlJwm3ZihRfmfjlrWEwWn04=
X-Google-Smtp-Source: ABdhPJwnOILn0bVw5yu5JwaGAvlENnJT2cdC1Ah1Jl0kW/y9qIPr1f4aRDXP6W6trIWXMFqjdUSf8w==
X-Received: by 2002:a0c:9b85:: with SMTP id o5mr13414633qve.11.1596783919937;
        Fri, 07 Aug 2020 00:05:19 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-185-85.mycingular.net. [166.176.185.85])
        by smtp.gmail.com with ESMTPSA id v45sm6992275qtc.42.2020.08.07.00.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 00:05:19 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH 0/5] Xen on Raspberry Pi 4 improvements
Date: Fri,  7 Aug 2020 00:04:58 -0700
Message-Id: <20200807070503.30777-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

Several improvements, the most significant being the kernel change:

* Switch the Linux kernel for Xen on the Raspberry Pi 4 to
  linux-yocto-dev from the linux-raspberrypi downstream kernel.

This will enable testing and preparation for switching over to the new
linux-yocto kernel when it is upgraded, and also avoid build breakages
and other difficulties experienced with the unstable linux-raspberrypi
kernel.

Testing with linux-yocto-dev has been with the raspberrypi4-64 MACHINE
from the meta-raspberrypi layer.

This change removes the patch series that was carried in this layer for
the linux-raspberrypi kernel for Xen support.

Please note: There are currently in-flight dependencies for this series
awaiting review: linux-yocto series, needed for Xen support:
https://lists.yoctoproject.org/g/linux-yocto/topic/linux_yocto_dev_kernel/76044154
and a kernel bugfix:
https://lists.yoctoproject.org/g/linux-yocto/message/8922

* Retire the sdcard image recipe now that the meta-raspberrypi recipe
  is extensible.

* Recipe bug fixes and improvements.

Christopher


Christopher Clark (5):
  xen: retire the Raspberry Pi sdcard class
  xen, raspberrypi: bugfix early boot messages: use earlycon=xenboot
  xen, rpi4: use RPI_EXTRA_CONFIG and drop the rpi-config_git.bbappend
  xen, linux-raspberrypi4: remove linux-raspberrypi bbappends and
    patches
  xen, raspi4, linux-yocto-dev: Enable Xen on Raspberry Pi 4

 classes/sdcard_image-rpi-xen.bbclass          | 120 ------------------
 conf/distro/include/meta-virt-xen.inc         |  21 ++-
 .../bootfiles/rpi-config_git.bbappend         |   6 -
 .../rpi-u-boot-scr/files/boot.cmd.xen.in      |   2 +-
 ...vmalloc_to_page-on-vmalloc-virt-addr.patch |  44 -------
 ...02-swiotlb-xen-remove-start_dma_addr.patch |  47 -------
 ...struct-device-parameter-to-xen_phys_.patch |  78 ------------
 ...struct-device-parameter-to-xen_bus_t.patch |  66 ----------
 ...struct-device-parameter-to-is_xen_sw.patch |  57 ---------
 ...oduce-phys_to_dma-dma_to_phys-transl.patch |  88 -------------
 ...translations-in-xen_dma_s_kernel_5.4.patch |  68 ----------
 ..._to_phys-on-the-dma_addr_t-parameter.patch |  75 -----------
 .../0011-adding-page-coherent-patch.patch     |  39 ------
 .../linux/linux-raspberrypi_%.bbappend        |   5 -
 .../linux/linux-raspberrypi_5.4.bbappend      |  19 ---
 .../linux/linux-yocto-dev.bbappend            |  10 ++
 16 files changed, 25 insertions(+), 720 deletions(-)
 delete mode 100644 classes/sdcard_image-rpi-xen.bbclass
 delete mode 100644 dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0002-swiotlb-xen-remove-start_dma_addr.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/files/0011-adding-page-coherent-patch.patch
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
 delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bbappend
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend

-- 
2.17.1

