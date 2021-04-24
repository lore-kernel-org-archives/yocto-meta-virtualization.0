Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.4202.1619253083767390879
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Apr 2021 01:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UZtqtHtw;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id c6so38147151qtc.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Apr 2021 01:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3mn4A7Df4WEMvG+kHJFiAr8mXsqSBuJoKCJahPfA1D4=;
        b=UZtqtHtwYYSO6x9+OkdAFm6eUDnT8sJcWnMLTugmUjANwgH4LJSSnVHpnVK2pVLWi6
         unA9cLREroVjY7t2FYY5e/S207Rz+9Asw5880WE4453alOwiOgRRjWZ8sDQ0tvWIYGDT
         eN0ZB8QF9fOmcuTz7BEbcgYK/5oVk05ZQSL25PW3G6uq8IxGB+TG4OL9dt1F4HJCkLjK
         9fRrieFDSegFkNr7m6Sgd6IgFIdRHOPhbV7A1ZNEz/taRSErCIu6ygcod45hZA98hQGG
         IS5JexMqaUPo1WA8ooTeZzHd9Tjs6us2ocLHYYURSFEfTR+Gz0k27nqnlIk0CuSRg0nn
         cMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mn4A7Df4WEMvG+kHJFiAr8mXsqSBuJoKCJahPfA1D4=;
        b=eqZFIvplXn5tLHAN1vRvGO5nydQ1J7d3PunmQj8dFGrFpdJGnifhbwIvua/KLWXfuM
         BmSV1pGXWO3stS9ZtbNgnzBbij0rk8JvQ/1u3Evl/lpa+gRT1HF+s0fz99crZRE4vuzP
         ajkBG6n3jE0oFdYGS48DkQA+X+GGFVfBQdNMmMQwZIw6nQoeeQ9nQ8vLKBzcvi0j4pBD
         00R8pFqzmAY7IpPUi/p9UhuFgEp5Iby/B2bJI2jWD7c/7p4fIk0PPn3Mq8WJ36DdkEg+
         C/RzO5z9PNlQQxoJPQhcph9ciRGC94Ga1T53LComDm7MfhLDOPhMgazhSd6hOdDi0bID
         73PQ==
X-Gm-Message-State: AOAM531Pyd7ax9GbQL5XIA2DzsfygwPEcFrBR5Mbp3oQHb317esBLE/6
	V8RW0reGRHjDbz/fzTuO/Uc4NcDAD28=
X-Google-Smtp-Source: ABdhPJzJM0DzOus/nFXy56Hy2ShneMhTg7I/MZmtHCW6pDwiVXMQmuCGcHBFfTxTwy/UmqFc0Wa1xA==
X-Received: by 2002:a05:622a:651:: with SMTP id a17mr7266345qtb.366.1619253082858;
        Sat, 24 Apr 2021 01:31:22 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-81.mycingular.net. [166.176.184.81])
        by smtp.gmail.com with ESMTPSA id x24sm5984951qtm.95.2021.04.24.01.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:31:22 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 1/8] xen, rpi4: use the preferred generic multiboot,module compatible string
Date: Sat, 24 Apr 2021 01:30:56 -0700
Message-Id: <20210424083103.202107-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424083103.202107-1-christopher.w.clark@gmail.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This string has been preferred since 2014 -- ref: Xen commit a860dfeec
and also current documentation: docs/misc/arm/device-tree/booting.txt

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
index 84d533a..9cba41f 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
+++ b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
@@ -21,7 +21,7 @@ echo Add a dom0 node to chosen to put Linux boot information in
 fdt mknode /chosen dom0
 
 echo Set this for the Linux boot command
-fdt set /chosen/dom0 compatible "xen,linux-zimage", "xen,multiboot-module"
+fdt set /chosen/dom0 compatible "multiboot,module"
 
 # Tell Xen where PCI is
 fdt set /scb/pcie@7d500000 device_type "pci"
-- 
2.25.1

