Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.94466.1638376841604450251
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YSiAitpk;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id u1so53607214wru.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zW6pqYYblOmFaZQ9BKirB9mm1CIUPuOdQulVDH851sk=;
        b=YSiAitpkLMkJpgwheHGknr1/RFP5aAPbxGmCm5lVa8Ewt3Yx3YV/SxihpokwSpRgmH
         akEMlxu+PyttIuEnq4UDlKatdJOGCHjkiuyAqJoYa5GQggebN88rabOhHA6fMtFieZ/5
         kNXbAK/rBJ4kK0H983bxGI59CoWtkxDkcNN3hnrpFZSgvGp2EaRtW4oooQfDwTv9ktXg
         sExWbVTu2OcPbdJTn58rr+w3er1hJCoF4YMOopEnETOAxwXwKkppmUIK7sHrcYeMASEt
         Lkke3+wEil5bgDNzCsE22+9pf7VorLaMpDj7OkEkKuxCj3X5+BVpBUx86YYXX4n40Q40
         /B9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zW6pqYYblOmFaZQ9BKirB9mm1CIUPuOdQulVDH851sk=;
        b=iW9YMSAXfROEQtKX4lSiq2Qx2bQFrh6Nu5yrtOgbL0rH1fOg1Rp+wkTO92cBpMf1Rr
         mvLTdybdh+cPujPaAaa1wg7lugOmFcQT8GuLMyqIGgd6t6OAXDAwe9ZPb2JfX1eVgGhi
         4CALIlr8vB1Y7THJiw21u8ABMLd10wyUhwye6HdK1dwbsTQgdl69DKJ54hntlxjNo5NT
         lhddjkluYWdUQaZCyZZdpvB+x5LPwCsP45m81S/ockjbhiQyIoqfQbGN21jO7UGIz+iT
         rU9o8nKjtMVLrYWpclI7pkg1CtV7sFPNY1r7+F7R6l1gCwrtfLLa9IadWz+Wd12eyIZD
         jcxg==
X-Gm-Message-State: AOAM530fvikauWIORkhE+Bla3QJ69pIdd8gYyY0jSjR9HNM/oY+v//1Q
	h1gNTgpQMVd3Gek3lAuI+pNFnygUygk=
X-Google-Smtp-Source: ABdhPJwGI1byO5b9cGu7kZUxQRqK9/nl6laM4Sd+pOS0Uqv0iqGVch/AVeRVmszpATMeVoZ4XhQmYg==
X-Received: by 2002:adf:f207:: with SMTP id p7mr7962593wro.173.1638376840173;
        Wed, 01 Dec 2021 08:40:40 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j134sm303957wmj.3.2021.12.01.08.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:40:39 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][honister][PATCH 2/5] uxen-guest-tools: fix build against kernels 5.15+
Date: Wed,  1 Dec 2021 17:40:31 +0100
Message-Id: <20211201164034.33610-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164034.33610-1-Martin.Jansa@gmail.com>
References: <20211201164034.33610-1-Martin.Jansa@gmail.com>
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

