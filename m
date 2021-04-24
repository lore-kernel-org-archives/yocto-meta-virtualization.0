Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.4133.1619253094677401244
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Apr 2021 01:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Px1+a8L6;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 66so12384904qkf.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Apr 2021 01:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k59sU5e+CftALiZ7590geP5LO+39UhnJYuK4OHS8O4s=;
        b=Px1+a8L67xO09x84orVxpCsjQzYUCKkzbw81HJy4Y949cVLGKwZ4zezvzncreRE/so
         fijKrR7/8178AGOaPqqUPD96OFdEQwqSyPJTcJ5W1M0IzETNVUiz941jL6yD6kpxV7yJ
         1IMVLY2NtiJ5GVhyuik+nRZeB7Tt5TT4Nk6eNr5EPb5bprMwULUdQ8aZr+CjuuKoDwih
         mSds1VusFMlUaVmApRfyCNeGB+hZrzqeMaljcg9HvutprhjgwNh6ZSWFup6pgjb4tTHz
         vxVH0sVD2p42c8tvQQQXHhJeWiqT2AXtAAxEjyVzePMZpGHfuarIze2m7eymL216YPsy
         6epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k59sU5e+CftALiZ7590geP5LO+39UhnJYuK4OHS8O4s=;
        b=OvsC61z8tM9Hz5gamSNo5bVKuPgVyubzFmQQOGNwBtqWY3o/XwOOsu0GBCMJEtWar8
         iPVck+W2dMv6SzugwqgKK1gH+I+Q99St+OpGekVKQbcn9ANk1xlWNQ1/TptCHodpzp2E
         8SoLXBcU2frRYAsKm8RPRy+4iGxyPQ41vTlsswaz+/uEPTSJjv5mbRGWEwZJXK58zM1K
         3x4/npC5Dzc+U/Vn0RB/bNidfHeto6mrlKg38nVg4YUkIioIrpj5+Aol82FmIdI1ZiwH
         3UIfEM/HwS0/mscko1EmIzuaJnQRwItRe1VM4gIJvgJEaHM4ghIAltt1fggKNOBoo1z+
         DIQA==
X-Gm-Message-State: AOAM532Cq591DORA7m2xQO8IX1BjM5n0bACgq5ykdZqd1IiC1gjheBzn
	9QPjpGp2XDl0v6qbdNbwmbXDRlTdZsk=
X-Google-Smtp-Source: ABdhPJxU39ziB+TNScmFOMYO+VXhqWGuT2dKCUQY/4mq1D0O0XAGlY2FVJtLaY7IbDuNN+JxAga79g==
X-Received: by 2002:a05:620a:12b1:: with SMTP id x17mr7805679qki.362.1619253093586;
        Sat, 24 Apr 2021 01:31:33 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-81.mycingular.net. [166.176.184.81])
        by smtp.gmail.com with ESMTPSA id x24sm5984951qtm.95.2021.04.24.01.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:31:33 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 6/8] xen, rpi4: apply workaround to fix crash on boot with Xen 4.14
Date: Sat, 24 Apr 2021 01:31:01 -0700
Message-Id: <20210424083103.202107-7-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424083103.202107-1-christopher.w.clark@gmail.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply update to the device tree to allow Xen 4.14 to boot.

Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
index dfcff2d..0367e36 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
+++ b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
@@ -25,6 +25,9 @@ fdt set /chosen/dom0 compatible "multiboot,module"
 
 # Tell Xen where PCI is
 fdt set /scb/pcie@7d500000 device_type "pci"
+# Workaround to fix:
+# "Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0"
+fdt rm /scb/pcie@7d500000/pci@1,0/usb@1,0
 
 echo Delay to allow the MMC card to be ready
 sleep 1
-- 
2.25.1

