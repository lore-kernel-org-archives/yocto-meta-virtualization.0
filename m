Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.94823.1638376905896475490
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=isE+af64;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id z5so39238524edd.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zW6pqYYblOmFaZQ9BKirB9mm1CIUPuOdQulVDH851sk=;
        b=isE+af64wA2xbLhyDzzBDzxDvKqJDC9MPt8uglIZQLwhhdnNOtmThuXZHVy8BoNh59
         2jNDn9U4ilQgDXB3Ecffixn/PSrDNg2bSLXKBa1cMe7+jDoFVImSsi/50yPAwewFuHKj
         zriyoVSKu+LlHiQuKlFtcEdWmi4xk57jrRs5dFFtuxI/yfrVBigSnUDkps7R3GeU3DAp
         PB96wsmISJ1oizoSX5qbtxQgigRFTTiE9ughnbMiPFU/AN52h/4MzEcg3TBcIQv0PIRy
         FJf9pRwSl8vN+XQbq+uYAu/5NEz6aGVCylMy6pzmB8hCFX/r9qlCUUwE8Qh+wQQAPage
         UGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zW6pqYYblOmFaZQ9BKirB9mm1CIUPuOdQulVDH851sk=;
        b=V1u5/mY4iDkuVWmpDunjWIr7qdwPuEKd4dRmrtmFn9i3G2bf/djPgxrOny5KATuUTN
         UzBGCsIzaYWbpZXz+mh+/DbbZ0HxFkUNFK8IyZ3+5aLQWVn1v66byGWScLtCi8IOb4x2
         dnN52BymArL7y8M4YtvwNNZgld/ps0Rzr/8K9mLYhY7X5c7stno4NHX2Q4Rjk3uJqDp1
         uemskadUnsu7X+g/eNqg7AM8ob4Ltj6ceT8EFsckpapY8CeoI4l9ZG0yYv1WK4EpgyDZ
         t66CgcYLm9eeCHbAroEPNc4NCGbtLvEeSe7ch57DCwnM9yTM5hMtJ1h2Y3q3/Tek1E2J
         HXEA==
X-Gm-Message-State: AOAM532af2GYPsYo0YiOkw0J6IjILCvMgjiQOKIdDG/SKNY1c4NguXPq
	uL6HwpiWSaGR5FHX96Y2H5Rf0n3RaKU=
X-Google-Smtp-Source: ABdhPJzkWf31V7zi4aXpn+6mQnRWw3D5VuPftf20wXLWvodv7zCwa9gkCf/dgG5YA8LiDJKOgOVD/Q==
X-Received: by 2002:a17:907:97d4:: with SMTP id js20mr8582596ejc.416.1638376903073;
        Wed, 01 Dec 2021 08:41:43 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f17sm161793edq.39.2021.12.01.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:42 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 03/13] uxen-guest-tools: fix build against kernels 5.15+
Date: Wed,  1 Dec 2021 17:41:26 +0100
Message-Id: <20211201164136.33802-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a compile only fix to update the uxen kernel modules to
work against newer kernels.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...-support-fix-build-for-kernel-s-5.15.patch | 46 +++++++++++++++++++
 ...-support-fix-build-for-kernel-s-5.14.patch | 32 +++++++++++++
 .../uxen/uxen-guest-tools_4.1.8.bb            |  4 +-
 3 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/uxen/uxen-guest-tools/0002-vm-support-fix-build-for-kernel-s-5.15.patch
 create mode 100644 recipes-extended/uxen/uxen-guest-tools/0003-vm-support-fix-build-for-kernel-s-5.14.patch

diff --git a/recipes-extended/uxen/uxen-guest-tools/0002-vm-support-fix-build-for-kernel-s-5.15.patch b/recipes-extended/uxen/uxen-guest-tools/0002-vm-support-fix-build-for-kernel-s-5.15.patch
new file mode 100644
index 0000000..6b7f1f8
--- /dev/null
+++ b/recipes-extended/uxen/uxen-guest-tools/0002-vm-support-fix-build-for-kernel-s-5.15.patch
@@ -0,0 +1,46 @@
+From f8a33a209498b32b0fc06d80baa071f0902b9a85 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 30 Nov 2021 06:45:34 -0800
+Subject: [PATCH] vm-support: fix build for kernel's > 5.15
+
+* remove callback was changed to return void instead of int in:
+  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc7a6209d5710618eb4f72a77cd81b8d694ecf89
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ uxenplatform/platform.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/uxenplatform/platform.c b/uxenplatform/platform.c
+index 99fc76a..5225a00 100644
+--- a/uxenplatform/platform.c
++++ b/uxenplatform/platform.c
+@@ -4,6 +4,7 @@
+ #include <linux/random.h>
+ #include <linux/kthread.h>
+ #include <linux/delay.h>
++#include <linux/version.h>
+ 
+ #include <uxen-hypercall.h>
+ #include <uxen-platform.h>
+@@ -32,14 +33,20 @@ static int bus_probe(struct device *_dev)
+     return drv && drv->probe ? drv->probe(dev) : -ENODEV;
+ }
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,15,0))
+ static int bus_remove(struct device *_dev)
++#else
++static void bus_remove(struct device *_dev)
++#endif
+ {
+     struct uxen_device *dev = dev_to_uxen(_dev);
+     struct uxen_driver *drv = drv_to_uxen(_dev->driver);
+ 
+     if (dev && drv && drv->remove)
+        drv->remove(dev);
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,15,0))
+     return 0;
++#endif
+ }
+ 
+ static int bus_suspend(struct device *_dev, pm_message_t state)
diff --git a/recipes-extended/uxen/uxen-guest-tools/0003-vm-support-fix-build-for-kernel-s-5.14.patch b/recipes-extended/uxen/uxen-guest-tools/0003-vm-support-fix-build-for-kernel-s-5.14.patch
new file mode 100644
index 0000000..ec31eea
--- /dev/null
+++ b/recipes-extended/uxen/uxen-guest-tools/0003-vm-support-fix-build-for-kernel-s-5.14.patch
@@ -0,0 +1,32 @@
+From 59986e91d807591f05dfbd57b459ba71670874f9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 30 Nov 2021 15:04:31 +0000
+Subject: [PATCH] vm-support: fix build for kernel's > 5.14
+
+* remove set_driver_byte call
+* not sure if it's still necessary here, but set_driver_byte as well as DRIVER_SENSE was killed in 5.14 with:
+  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=464a00c9e0ad45e3f42ff6ea705491a356df818e
+
+  in some cases it was replaced with set_status_byte(sc, SAM_STAT_CHECK_CONDITION), but I didn't
+  read the implementation carefully enough to decide if this is still needed, I was only interested
+  in fixing the build failure (and I don't use this at all to test it in runtime)
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ uxenstor/stor.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/uxenstor/stor.c b/uxenstor/stor.c
+index e07b08e..6bf2184 100644
+--- a/uxenstor/stor.c
++++ b/uxenstor/stor.c
+@@ -109,7 +109,9 @@ static void uxenstor_softirq(unsigned long opaque)
+                                          sc->sense_buffer,
+                                          sizeof(hdr) + hdr.sense_size,
+                                          0, sizeof(hdr));
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,14,0))
+                 set_driver_byte(sc, DRIVER_SENSE);
++#endif
+             }
+ 
+             set_host_byte(sc, DID_ERROR);
diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
index 06dc376..841c71a 100644
--- a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
+++ b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
@@ -10,7 +10,9 @@ SRC_URI = " \
     https://www.bromium.com/wp-content/uploads/2019/11/Bromium-4.1.8-Open-Source-Software.pdf;name=license \
     file://fix-Makefile-for-OE-kernel-build.patch \
     file://0001-vm-support-fix-build-for-kernel-s-5.4.patch \
-    "
+    file://0002-vm-support-fix-build-for-kernel-s-5.15.patch \
+    file://0003-vm-support-fix-build-for-kernel-s-5.14.patch \
+"
 
 SRC_URI[uxen.sha384sum] = "be2233bc6506a23350d76c03ac28ea7ea381e1dc6ed5ce996e8ac71e6a3316fcaa2ed070c622618bd226f43a4d6db5d4"
 SRC_URI[license.sha384sum] = "92e48c614df3094cb52321d4c4e01f6df5526d46aee5c6fa36c43ee23d4c33f03baa1fc5f6f29efafff636b6d13bc92c"
-- 
2.32.0

