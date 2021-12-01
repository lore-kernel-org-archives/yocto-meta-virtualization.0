Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.94310.1638376845713622888
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=on9U6MBt;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id p18so20910452wmq.5
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XJnnhToQpE3luttb+1ej8199uZlAruSVujINnlLh9iU=;
        b=on9U6MBtCkgjlmqzUOALaYvJPp8S0Dyk8+2uerlwqaD3s6uxFbtPNvGyPAFsQgrFFt
         qx0nkf51YGCWR91uYMcUoPe4XSigWn7sl3vwA852IzPmrQENOl1sc09QFD/WLoEzsc4K
         SAcrpjlaIrwzfwfIDcpDzXLI02UoX+yD7iK8KF7IR/lJA+N81Wq0XSROMPB7V/cKzmYN
         xH15pWn/tYDpM0143a9VKKMVLGO2BacD2WWMp/Z4oc80+Fii6/o13b3bBpkgKrO4GBEN
         2HpYvpBrtX0esteVSTCmv0rauOooUbEj6SLIwB3rUEGB89RReG+DyNeIQFYnzBJ9k/7y
         0ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XJnnhToQpE3luttb+1ej8199uZlAruSVujINnlLh9iU=;
        b=8QAuxXfdWa099uFSUlspT3pJhzVc4c89TucNRGENm92ANam55VKkhr3kACKZ4OpnDt
         9khHKzFc16qZjZddGCH/AmEk4n20P5dZvHQeq8vkBltnPzt79Q/V+Md7xDWNBa7hayty
         1AGmpS9hzIj+Bfbhh+RNFzoVJwBpv7Eu8+UfODOsm9bWaNhi4T83LLEi9UjCs+yuDNB6
         xm0NNhPdyRMTEz60OBxUU0RAIlPc1h3nUqRGDUIqEZ6q86doRRgG0XbaS+uXMhqfRXuN
         BZsyeXeu9aHTKzVUMtiLsPhDF6xgzwRnLh848JvK+kkEiSINXPLgVWuDL5nq1x8ciKeh
         cwCg==
X-Gm-Message-State: AOAM5321vQwcJK3xzjnGI3qZrSWxNg0sOL79eDrtptgw1he7WXjBS8YZ
	I8wtyY/p55zLKvr/akamOcD7XcNBTkc=
X-Google-Smtp-Source: ABdhPJzjco04KRpnKEL/8O7IkIwNFvPXYvLRGbO8mupacxnbgD4ru7fdgZbfpD5riozHTueLFLC1JQ==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr8386277wmh.164.1638376843882;
        Wed, 01 Dec 2021 08:40:43 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s63sm352651wme.22.2021.12.01.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:40:42 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][honister][PATCH 4/5] xvisor: uprev to latest master and fix python reference
Date: Wed,  1 Dec 2021 17:40:33 +0100
Message-Id: <20211201164034.33610-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164034.33610-1-Martin.Jansa@gmail.com>
References: <20211201164034.33610-1-Martin.Jansa@gmail.com>
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
 recipes-extended/xvisor/xvisor_git.bb         |  4 +-
 3 files changed, 38 insertions(+), 57 deletions(-)
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
index 749fec3..4d2a719 100644
--- a/recipes-extended/xvisor/xvisor_git.bb
+++ b/recipes-extended/xvisor/xvisor_git.bb
@@ -9,10 +9,10 @@ require xvisor-configs.inc
 inherit autotools-brokensep
 
 # This version support the RISC-V v0.5.0 Hypervisor extensions
-SRCREV = "b3dac5b1f61f23f21dc59b3880897cff78f3b618"
+SRCREV = "6b23764a1439f9d08b2ed2f363da522460d8a22b"
 SRC_URI = "git://github.com/avpatel/xvisor-next.git;branch=master;protocol=https \
     file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
-    file://0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch \
+    file://0001-build-use-usr-bin-env-for-python-scripts.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.32.0

