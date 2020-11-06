Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.12083.1604671525048504746
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 06:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U+Rx4IWr;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id s13so1447027wmh.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Nov 2020 06:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SOcyLLlUyWSFHvSwQjYlGeXJybantqZWHtBKcrganPo=;
        b=U+Rx4IWraxVG64HtRVrnQXAMpYt4bwaEaBcxM/bDA/0tgMokg9b677DN6VJjBFVChf
         xPVtU707DnCgLbra7r09w+IaB8YxyiJ3JCmabnoQcK8ea+9K4ir6x4p3NlpwVJssq3Sc
         6I/ccg0kwIlK9cYaFJSqpY5QZwCwPVVv7qJ9QUc0DGVEnWXelvXHVd+OaeW1Z6IV0YZX
         U62scJtQ6V/2BrH6+hD4dQowfgnIUNh0idOcDOI/oyHYHgJruTqZn6w0mVMpYObct3hD
         bZKg638hvGlxo28u9v6iJt1n06X6V/kwjN8sexc/s8N2dpY19RniJ8JfVysEIP/aVOD8
         RNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SOcyLLlUyWSFHvSwQjYlGeXJybantqZWHtBKcrganPo=;
        b=HQkE7qyatB2gRHJM8tPpi+Vm9lV3FEyiGWzNCWUoyL+z2try6Bap8ACOA+cBKsnmt1
         PZBfxa9lTnYTKkyDckQ5jCCKTRqYPeGuTmns0ltxr5gwmNln9Rwuh9heGaSSJRX1BWCJ
         WK2XxV91ZBD0nqQYBt9ucpUL9sTWP6r0URLL3VTkS068ieg3TvoTBKP00TbgR19narKv
         7l5V0ANqai4z9s+9H/lyKNVthTcxU4fsKGi9tN82HccSW6SCaHm6cj15oYfSNuLrdP6V
         AtVazJASnp1O49UMXTtt7FLd1flJexm4tv4Kvnr2jBN7dmjEgXDzeGduNp1XpKvX9yI+
         vJ5A==
X-Gm-Message-State: AOAM530q64XVRT9Yi90btBoXDaJVb57uepOIBdCYRwtc54RUVkdKVFOb
	qsPDBtkWcn+RRFZDV7/b4wlqO5uZCgQ=
X-Google-Smtp-Source: ABdhPJyyI//XIfkP6kcYYYDmaB+MOBcuwk4S1/2Q1s4vGDA8hV2HM9i71+dlmTzeIHvwIWIU9KEfig==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr2617777wmc.36.1604671523021;
        Fri, 06 Nov 2020 06:05:23 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v16sm2773951wml.33.2020.11.06.06.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:05:22 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] xvisor: fix build with gcc-10
Date: Fri,  6 Nov 2020 15:05:19 +0100
Message-Id: <20201106140519.765558-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* with gcc-10 (which doesn't include -fcommon by default) it fails like this:
  aarch64-oe-linux-ld: error: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/mmc.o: multiple definition of 'sdio_func_type'
  aarch64-oe-linux-ld: error: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/sdio_bus.o: multiple definition of 'sdio_func_type'
  aarch64-oe-linux-ld: error: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/sdio_io.o: multiple definition of 'sdio_func_type'
  aarch64-oe-linux-ld: error: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/sdio.o: multiple definition of 'sdio_func_type'
  aarch64-oe-linux-ld: TOPDIR/BUILD/work/raspberrypi3_64-oe-linux/xvisor/git-r0/git/build/drivers/mmc/core/core.o: previous definition here

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-Allow-Xvisor-to-compile-with-gcc-10.patch | 55 +++++++++++++++++++
 recipes-extended/xvisor/xvisor_git.bb         |  5 +-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch

diff --git a/recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch b/recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch
new file mode 100644
index 0000000..221a314
--- /dev/null
+++ b/recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch
@@ -0,0 +1,55 @@
+From 417184cc41cfd33ae7b4c11c8396e0f47f43e2ba Mon Sep 17 00:00:00 2001
+From: Jean-Christophe Dubois <jcd@tribudubois.net>
+Date: Fri, 8 May 2020 15:17:36 +0200
+Subject: [PATCH] EMULATORS: Allow Xvisor to compile with gcc 10.
+
+With gcc 10 because some header files do not declare some variable
+definition as extern, the variable get duplicated in all files
+using it.
+
+This patch allow xvisor to compile with the latest gcc.
+
+Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
+Reviewed-by: Anup Patel <anup@brainfault.org>
+---
+ drivers/mmc/core/core.h    |  2 +-
+ emulators/display/drawfn.h | 10 +++++-----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
+index d75d135a..e2ca3141 100644
+--- a/drivers/mmc/core/core.h
++++ b/drivers/mmc/core/core.h
+@@ -64,7 +64,7 @@ int mmc_go_idle(struct mmc_host *host);
+  * Note: Must be called with host->lock held.
+  */
+ extern struct vmm_bus sdio_bus_type;
+-struct vmm_device_type sdio_func_type;
++extern struct vmm_device_type sdio_func_type;
+ 
+ int __sdio_attach(struct mmc_host *host);
+ 
+diff --git a/emulators/display/drawfn.h b/emulators/display/drawfn.h
+index f9163cff..385deaf6 100644
+--- a/emulators/display/drawfn.h
++++ b/emulators/display/drawfn.h
+@@ -69,14 +69,14 @@ typedef void (*drawfn)(struct vmm_surface *,
+ 				 DRAWFN_ORDER_MAX * \
+ 				 DRAWFN_FORMAT_MAX)
+ 
+-drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
+ 
+-drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
+ 
+-drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
+ 
+-drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
+ 
+-drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
+ 
+ #endif
diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
index 64b0f22..50323d7 100644
--- a/recipes-extended/xvisor/xvisor_git.bb
+++ b/recipes-extended/xvisor/xvisor_git.bb
@@ -11,8 +11,9 @@ inherit autotools-brokensep
 # This version support the RISC-V v0.5.0 Hypervisor extensions
 SRCREV = "b3dac5b1f61f23f21dc59b3880897cff78f3b618"
 SRC_URI = "git://github.com/avpatel/xvisor-next.git \
-           file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
-          "
+    file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
+    file://0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0

