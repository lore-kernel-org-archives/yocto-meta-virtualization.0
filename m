Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.94174.1638376907789943869
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TYxm5C6L;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id o20so103602606eds.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3N/Kf9VcjJlEk+wHY4ve2mLDFV+XqpyG33N2JKpixqo=;
        b=TYxm5C6Lwo45y0QYhnbFdpTqUlifKqznQqvZ11La2n+kaM0HLQdCdciQ8EwDRvIlTj
         nH3in2Lnr03a7l+q8g8jcn+oP9ar5Kh+jAkWGCDUlG63s/Z1Kfa8cq2g1CMBGDT98OVE
         auKR+D2eekOjzdcBRUfz4byyg+qjzldMjQUcRX8dU3Yx6tE4NLqozEF1OLP3sreobskl
         ZkhQT9jwuA6MqV5yfrXMFw+bEkg+XQ4zH4NdsntXdLfesmc81hRAE3yoCGpd0PQy0Dxi
         ZCOxZmMMUxQOyJKPXKB2RCuy3xuJxi64xP4GbfWelVH6YforwWGG3a6y/W3VHeqI6Aoh
         +nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3N/Kf9VcjJlEk+wHY4ve2mLDFV+XqpyG33N2JKpixqo=;
        b=WDGb0qUCB05huTJFdCbTaaaLX7D9OXTsOompdnFzcTz0yv9mUoGNDyEBPv3sShs3pV
         HOVIQ5Sk18YCWKVkdA3bsL6w9HXqqI7NplAogYfkdfvYgdRP8hy48JP1LKv0uq6ZSXB+
         FzbNG6CHQ6su5ZU+ALTBbWjJn3RJ9SG0If2JNYwSeyuHBX9dmVnqnDBKA12Y3ZR4tBZ2
         KoQbhoA4dlAr4pi2f4cmw9tUZkspsnjtRa8VFIS913LIom+7C51LVHmeGw05qz5hw66k
         QMh7MC86IsNTyKeSnIIi0VPTAokkfDFpXDq+h+OPipN1sQrB6ykoXgc4TTG3zGOIsAlU
         zLLg==
X-Gm-Message-State: AOAM531svVNcDaSURBNmjNT+X5gOyOy5TICOguM9zMB71hBerZqrd1Fu
	TfM+Nw713lhnZMmldnibtxPzN3nrlLI=
X-Google-Smtp-Source: ABdhPJwuDHjUlS6OcnxOedJYPcm2ryjorHF3lHIQEgv06UM9SEMeO6czEDAfeQG1RG10tQes6K1mNA==
X-Received: by 2002:a05:6402:34c1:: with SMTP id w1mr9860652edc.179.1638376906386;
        Wed, 01 Dec 2021 08:41:46 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id kx3sm133147ejc.112.2021.12.01.08.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:45 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 05/13] xvisor: uprev to latest master and fix python reference
Date: Wed,  1 Dec 2021 17:41:28 +0100
Message-Id: <20211201164136.33802-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping to the latest xvisor tip.

We drop one patch that is now part of the upstream, and we
add another to remove /usr/bin/python from scripts called
during build, since it breaks the build on hosts without
/usr/bin/python.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...-Allow-Xvisor-to-compile-with-gcc-10.patch | 55 -------------------
 ...d-use-usr-bin-env-for-python-scripts.patch | 36 ++++++++++++
 recipes-extended/xvisor/xvisor_git.bb         |  6 +-
 3 files changed, 39 insertions(+), 58 deletions(-)
 delete mode 100644 recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch
 create mode 100644 recipes-extended/xvisor/files/0001-build-use-usr-bin-env-for-python-scripts.patch

diff --git a/recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch b/recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch
deleted file mode 100644
index 221a314..0000000
--- a/recipes-extended/xvisor/files/0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 417184cc41cfd33ae7b4c11c8396e0f47f43e2ba Mon Sep 17 00:00:00 2001
-From: Jean-Christophe Dubois <jcd@tribudubois.net>
-Date: Fri, 8 May 2020 15:17:36 +0200
-Subject: [PATCH] EMULATORS: Allow Xvisor to compile with gcc 10.
-
-With gcc 10 because some header files do not declare some variable
-definition as extern, the variable get duplicated in all files
-using it.
-
-This patch allow xvisor to compile with the latest gcc.
-
-Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
-Reviewed-by: Anup Patel <anup@brainfault.org>
----
- drivers/mmc/core/core.h    |  2 +-
- emulators/display/drawfn.h | 10 +++++-----
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
-index d75d135a..e2ca3141 100644
---- a/drivers/mmc/core/core.h
-+++ b/drivers/mmc/core/core.h
-@@ -64,7 +64,7 @@ int mmc_go_idle(struct mmc_host *host);
-  * Note: Must be called with host->lock held.
-  */
- extern struct vmm_bus sdio_bus_type;
--struct vmm_device_type sdio_func_type;
-+extern struct vmm_device_type sdio_func_type;
- 
- int __sdio_attach(struct mmc_host *host);
- 
-diff --git a/emulators/display/drawfn.h b/emulators/display/drawfn.h
-index f9163cff..385deaf6 100644
---- a/emulators/display/drawfn.h
-+++ b/emulators/display/drawfn.h
-@@ -69,14 +69,14 @@ typedef void (*drawfn)(struct vmm_surface *,
- 				 DRAWFN_ORDER_MAX * \
- 				 DRAWFN_FORMAT_MAX)
- 
--drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
- 
--drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
-+extern drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
- 
- #endif
diff --git a/recipes-extended/xvisor/files/0001-build-use-usr-bin-env-for-python-scripts.patch b/recipes-extended/xvisor/files/0001-build-use-usr-bin-env-for-python-scripts.patch
new file mode 100644
index 0000000..dfbb00b
--- /dev/null
+++ b/recipes-extended/xvisor/files/0001-build-use-usr-bin-env-for-python-scripts.patch
@@ -0,0 +1,36 @@
+From eb351ca63a86f53cfb18987284a1445d543dfe56 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Mon, 29 Nov 2021 17:20:00 -0500
+Subject: [PATCH] build: use /usr/bin/env for python scripts
+
+Without this, we break on hosts without /usr/bin/python
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ tools/scripts/d2c.py    | 2 +-
+ tools/scripts/memimg.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/scripts/d2c.py b/tools/scripts/d2c.py
+index b46a7bc4..0a6bce08 100755
+--- a/tools/scripts/d2c.py
++++ b/tools/scripts/d2c.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python3
+ #/**
+ # Copyright (c) 2013 Anup Patel.
+ # All rights reserved.
+diff --git a/tools/scripts/memimg.py b/tools/scripts/memimg.py
+index 423c9c33..ba2f06cb 100755
+--- a/tools/scripts/memimg.py
++++ b/tools/scripts/memimg.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python3
+ #/**
+ # Copyright (c) 2011 Anup Patel.
+ # All rights reserved.
+-- 
+2.19.1
+
diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
index 831c943..85ac163 100644
--- a/recipes-extended/xvisor/xvisor_git.bb
+++ b/recipes-extended/xvisor/xvisor_git.bb
@@ -9,10 +9,10 @@ require xvisor-configs.inc
 inherit autotools-brokensep
 
 # This version support the RISC-V v0.5.0 Hypervisor extensions
-SRCREV = "b3dac5b1f61f23f21dc59b3880897cff78f3b618"
-SRC_URI = "git://github.com/avpatel/xvisor-next.git \
+SRCREV = "6b23764a1439f9d08b2ed2f363da522460d8a22b"
+SRC_URI = "git://github.com/avpatel/xvisor-next.git;branch=master;protocol=https \
     file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
-    file://0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch \
+    file://0001-build-use-usr-bin-env-for-python-scripts.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.32.0

