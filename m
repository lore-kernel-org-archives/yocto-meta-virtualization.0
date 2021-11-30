Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.78337.1638285993795012567
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 07:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TIZ+nmGN;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id t9so28284978wrx.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Nov 2021 07:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sFkLVrojpIXYFUc13LiKpv1QWx5+jFUWwcFWpkU+cLQ=;
        b=TIZ+nmGN+pRO/KQovX8CELazhVgKJo5Kf1P9W0voBy7uanlT7vx8wrLEPofifuu82d
         i9aHLFHZJC3bEDP/qxiTPjhDGV/TnFSZ/KQRedae+sYfpJPnfUWMtBnZqP/sbNA3JCAr
         VtQiL/pqxFw/RuBYTJ23kehm2xR2IJfaZ4FosIIMAX0FznAnl2KgMpiCEVetPDvz620H
         33Tb8JjvQHsh6et3vXeciGvSUc89jGGQgpSoOzXipwdNzc7hkreC8BDUxSkesgq2k/Fi
         PSYIyavKeGqyBc3bfluO934UmUS46SYAxyn9+hlyoujBaiGhUGfZeVHe97Q9GIXO1aa1
         0eLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sFkLVrojpIXYFUc13LiKpv1QWx5+jFUWwcFWpkU+cLQ=;
        b=Fpkznws0BDv+OKA0m4FwZYDy0YRQn+i4qcWgVK669K9xjoLCBFwc8XSrqja57xQyPt
         SGjrxn8Z84286q5rs6K9rIj27K5T5fMNuhiZxByz6mu2rJ0rRQLsfxc8c7WFanhjxElk
         J5gEo8e2lzoG353e9s/0iOK/T1hfItK/iVCZ0MYek39gp7i7amdVo5ipVxY5oYpCMoOc
         k4qRScxYL+gspiKYEJ0j7ACy5m2+92s0EGXT2pxE4lnKZQnnqOyD9dB0DTiFyIJZrT1t
         m8fZGBTj5AVZP9FrOszVKWjJivcEvNHdnwUXv1MjbERHYsyttxHZcmtvmNa4mXefpt4s
         N/6g==
X-Gm-Message-State: AOAM530hO5Ru/QFlwHwDDQ22KAiEnP8gVzruKYv9+uUC0DgfoY6cwbTx
	mP3pyTzA8vED/t3ctboC3iD8pvK2Gfg=
X-Google-Smtp-Source: ABdhPJyVzCo8mRfMWF2ajJ76nzCwt75Y0Xv0CPKO05bXKArYZE4gHbk1IAcdBeWfNS3r/JhRZg1XTQ==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr40475088wrw.624.1638285992264;
        Tue, 30 Nov 2021 07:26:32 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t11sm17025115wrz.97.2021.11.30.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 07:26:31 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] uxen-guest-tools: fix build against kernels 5.15+
Date: Tue, 30 Nov 2021 16:26:30 +0100
Message-Id: <20211130152630.38146-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a compile only fix to update the uxen kernel modules to
work against newer kernels.

There is one more issue with 5.15 and this applied:
ERROR: modpost: missing MODULE_LICENSE() in uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/uxenhc.o

Bruce already tried to fix it in 0001-vm-support-fix-build-for-kernel-s-5.4.patch
but it isn't enough for 5.15 and if I remove his MODULE_LICENSE() and KBUILD_MODFILE
changes, then I get probably the same error he was originally trying to fix for 5.4:

| make -C work-shared/qemux86-64/kernel-source LX_TARGET_ATTOVM=n LX_TARGET_STANDARDVM=y M=uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux EXTRA_CFLAGS="-DLX_TARGET_STANDARDVM -g -Wall" NOSTDINC_FLAGS="-Iuxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/include/ -Iuxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/include/uxen -Iuxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/include/uxen/xen"
| make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
| make[1]: Entering directory 'work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory 'work-shared/qemux86-64/kernel-build-artifacts'
|   CC [M]  uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/hypercall.o
| In file included from work-shared/qemux86-64/kernel-source/include/linux/module.h:22,
|                  from uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/hypercall.c:3:
| work-shared/qemux86-64/kernel-source/include/linux/module.h:183:43: error: expected ',' or ';' before 'KBUILD_MODFILE'
|   183 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
|       |                                           ^~~~~~~~~~~~~~
| work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
|    26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
|       |                                                             ^~~~
| work-shared/qemux86-64/kernel-source/include/linux/module.h:183:25: note: in expansion of macro 'MODULE_INFO'
|   183 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
|       |                         ^~~~~~~~~~~
| work-shared/qemux86-64/kernel-source/include/linux/module.h:230:34: note: in expansion of macro 'MODULE_FILE'
|   230 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license, _license)
|       |                                  ^~~~~~~~~~~
| uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/hypercall.c:161:1: note: in expansion of macro 'MODULE_LICENSE'
|   161 | MODULE_LICENSE("GPL");
|       | ^~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-support-fix-build-for-kernel-s-5.15.patch | 47 +++++++++++++++++++
 ...-support-fix-build-for-kernel-s-5.14.patch | 32 +++++++++++++
 .../uxen/uxen-guest-tools_4.1.8.bb            |  4 +-
 3 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/uxen/uxen-guest-tools/0002-vm-support-fix-build-for-kernel-s-5.15.patch
 create mode 100644 recipes-extended/uxen/uxen-guest-tools/0003-vm-support-fix-build-for-kernel-s-5.14.patch

diff --git a/recipes-extended/uxen/uxen-guest-tools/0002-vm-support-fix-build-for-kernel-s-5.15.patch b/recipes-extended/uxen/uxen-guest-tools/0002-vm-support-fix-build-for-kernel-s-5.15.patch
new file mode 100644
index 0000000..a8089f6
--- /dev/null
+++ b/recipes-extended/uxen/uxen-guest-tools/0002-vm-support-fix-build-for-kernel-s-5.15.patch
@@ -0,0 +1,47 @@
+From cc31e9648b76bfaa2f04825b5ef8c09fe79782f7 Mon Sep 17 00:00:00 2001
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
+index 99fc76a..579be7a 100644
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
+@@ -64,7 +65,11 @@ static int bus_resume(struct device *_dev)
+     return 0;
+ }
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,15,0))
+ static int device_remove(struct device *_dev, void *data)
++#else
++static void device_remove(struct device *_dev, void *data)
++#endif
+ {
+     struct uxen_device *dev = dev_to_uxen(_dev);
+     struct uxen_driver *drv = drv_to_uxen(_dev->driver);
+@@ -72,7 +77,9 @@ static int device_remove(struct device *_dev, void *data)
+     if (dev && drv && drv->remove)
+         drv->remove(dev);
+     device_unregister(_dev);
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,15,0))
+     return 0;
++#endif
+ }
+ 
+ int protvm_use_secure_keyboard = 0;
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

