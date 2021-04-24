Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web08.4167.1619253092594201348
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 24 Apr 2021 01:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IMDY1pKN;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id z25so15393973qtn.8
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 24 Apr 2021 01:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mCYfBixfHvm9xCW9BOkqTVae/Le935d4i8IR/e8UWw4=;
        b=IMDY1pKNO5QxaNdXf1a3TV6CaX7Yqjch5f6NdcricWU7Fk5KRkxnJHWTUkb0McH+Gm
         iNeW8xE99/lddwDFl2LF8/crwT2GUfHawp7k0Bj8dctDu4VbRCO0NVIlLO1mTh4Vy7cU
         4MY4KGkYFoPdTCvJdcKNXnZo4Qpwfn8gXkAyJyuJt8acKSjmpbNywqJU9I8DwHONZPjM
         E/qRUnhkiQwVgMG8msoolEOkdthRXxvyU/ggamu5SyZW1aqMRIiF9Sy0eqLnHBKeLKH2
         /2i4GnAxwcVm/WDeeiE9nN6lqtnfZC6Oi37oS/TI6dOyVugIJxm+VP5yTcLL+a0bJFCb
         2Jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mCYfBixfHvm9xCW9BOkqTVae/Le935d4i8IR/e8UWw4=;
        b=PG2no0Jz7yWal5UE2LLCrv43a8hfnp/gvks9I7hu4Bl6FFOIoUwxk02vb2wUqoI2GE
         V3sxnq4T0tiLmRXaUJAGonwslcG73v/AXAISxgaPQGLMDEoIR7ZwR/7KVA3hFMWho5sy
         UfrC3h40c8CfwGcmAAA7rp3swBzdTqkkM4LBv41SDSoFXLxVnP2/w2lAXKA37PtDfjtI
         3+si8UZP0Jyj96qPZpVHeA/XCU9tNd5y0GvGS85l0c5a7vX/Wq+HFStJAj1NXQilIu2Z
         wNh9/etHL6e3pITLu8UFK5QRxUQTWabwe5JjIWUniakQ7tppciFW01UKyECS27W0A2IK
         PSbw==
X-Gm-Message-State: AOAM532CSBex6kat04ECodL56/QgU1LtEzqJGVJJliOxNieMYS0gJl+U
	GHlmR/XhLHZrJ70CQDar8DYdJIZ/4Mc=
X-Google-Smtp-Source: ABdhPJyL5f6U7Q/FcPlJfWBOzbQL6DblxBwKJxgsmRdtk0DY7WZ0Z/IXaPSe0mwt1LojsGV1TYMUVw==
X-Received: by 2002:ac8:7593:: with SMTP id s19mr7469396qtq.212.1619253091662;
        Sat, 24 Apr 2021 01:31:31 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-81.mycingular.net. [166.176.184.81])
        by smtp.gmail.com with ESMTPSA id x24sm5984951qtm.95.2021.04.24.01.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:31:31 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH 5/8] xen, rpi4: fix u-boot script to load binaries from boot partition
Date: Sat, 24 Apr 2021 01:31:00 -0700
Message-Id: <20210424083103.202107-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424083103.202107-1-christopher.w.clark@gmail.com>
References: <20210424083103.202107-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fatload needs to read from mmc 1:1 to find the Xen hypervisor and Linux
kernel binaries with the current Yocto Linux 5.10 kernel.

Add boot messages to to the u-boot script to indicate the size of files
loaded for easier confirmation of load success.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
index 9cba41f..dfcff2d 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
+++ b/dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot-scr/files/boot.cmd.xen.in
@@ -30,10 +30,13 @@ echo Delay to allow the MMC card to be ready
 sleep 1
 
 echo Load Xen into memory
-fatload mmc 0:1 ${xen_loadaddr} xen
+fatload mmc 1:1 ${xen_loadaddr} xen
+echo Xen loaded, size: 0x$filesize
+
 echo Load Linux kernel into memory
-fatload mmc 0:1 ${kernel_loadaddr} Image
+fatload mmc 1:1 ${kernel_loadaddr} Image
 setenv kernel_size 0x$filesize
+echo Linux loaded, size: 0x$filesize
 
 echo Set the address and size for the Linux kernel so Xen can pick it up
 fdt set /chosen/dom0 reg <${kernel_loadaddr} ${kernel_size}>
-- 
2.25.1

