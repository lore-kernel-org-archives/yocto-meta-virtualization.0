Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.79591.1638290861757443492
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 08:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=khZBsU41;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id x6so89046218edr.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Nov 2021 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2+piBimMdX0lpt1PzDPoqtG8TWJ1o3P1qrM7htKD7c=;
        b=khZBsU41wMn8mH7ESi68Y7cvBlRCtxt69LqGHzKWzZXDcJ3PoaPepNfjjmAJXiPMDb
         QWgQJXtPzt7yqb1CwhZEwzwAFbVngkvhyVdVaMeL0uFGv6+DuQO1kUujLN5V96puXaSQ
         FrZYGoJ1zFX3hlRUuW6bTEHq293zo5NjrvXL4bdjIIentDjnryIQc1fuXcTvvQk3CbqT
         Q423v5O9egMGw70Nm/uUU+cIsd4VHDcHrqPDaunhKZ3JMFl1Q7oCzrW2HcRzQAD5jTPl
         mce0WXH0Gxp/gwvdJM0iVm3l8qTxXlk0WixTUov9yjs+pC4QM9/jpXa5YztVAj7xmkTk
         +YjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2+piBimMdX0lpt1PzDPoqtG8TWJ1o3P1qrM7htKD7c=;
        b=t2gn56GdlfObUaPmwzJmv7vNkSYxeldj7jYFVbWetBX9Yi2j56dgdJhF/KSN2REIts
         FTEEC2zt7XRm2IbNDX10rN1mxD0N8qBjX3BbgQqk45yb8xE4sKPJ2v7SfFOIkIIPb9qx
         pwnTEybDxemKJgEVStl05qzaieWBOL50HfvrBf/BvtPkaC8c2a31tlQywcIvo1drSBIj
         L2zrRd98tthzO4ikThUkLhMziMfMtRu6KyUa0oojDWZWCLacBiyXIMEAgcYauKoj4OAm
         c0dWb3hHRSyB42X4Ox1KEbF8yiSUtG+ybmjDH658zRFBEgY462Wqyyh0LLoec4AUf520
         RAzg==
X-Gm-Message-State: AOAM531FgJpRCvnkV1QnU7avOL7zMfoETyjZA5fykdumrhLb6WjCy2s+
	AmWZBTmIuaAgRe9Em6SpjvQTQrUd7OU=
X-Google-Smtp-Source: ABdhPJy+Nbf94oSioh6x/DBZRtuBaah5MFwJLimylXztdANRGY2f3oSo+cr5GFyW33SrhxZBkkzNgA==
X-Received: by 2002:a50:da48:: with SMTP id a8mr183829edk.146.1638290860115;
        Tue, 30 Nov 2021 08:47:40 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d23sm3914317edq.51.2021.11.30.08.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 08:47:39 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCHv2 1/2] uxen-guest-tools: fix build against kernels 5.15+
Date: Tue, 30 Nov 2021 17:47:35 +0100
Message-Id: <20211130164736.43609-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a compile only fix to update the uxen kernel modules to
work against newer kernels.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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

