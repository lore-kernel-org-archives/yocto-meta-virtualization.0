Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.94792.1638376907995558176
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dxXHrm77;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id r25so38773429edq.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F9M4ibrz15yIAwamSjkAdnWAxBlbx8UVQt9tYuv25IU=;
        b=dxXHrm77y0lsrE/Yy7PhckAia0S3MCHrlNVSzq+xIDa/b5y0uCEMgvz345WPSeaJo9
         nN0MofVECcgW30zgZreJ6v/lijLsBWc+6UiigDLDqOHxmL9rQ9Q33Q2LMWfiEa1p/WNU
         wYsfsZNhMfcTLLlVq1EbdqtFpAvR0huXJFtH5ys98eJgEBa8XmV1IcceWQv9IFSXs1zk
         heYbzLGwao7riFoDt/w8M90blb3W84lLmCz0O2XZwzvrVVrzsNSXXUmfpxGDPQkm2qCY
         eiKOaK0zOV+j4JqJ72gcroMhgbIDygoRrVahtl79Pkkw3KcPimH19VLrr0Yvjz4VxV7Q
         6CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F9M4ibrz15yIAwamSjkAdnWAxBlbx8UVQt9tYuv25IU=;
        b=CnDGyigCmOXeCPWYHMELPyNmYAdAKcUyxlrCFsmWHCmasjibYSRqF8LZwSBa0nExt6
         0h0SpfgNg6KPN7N6rMu1bxZSbwSQYAFV9JJnSGhwQ38DmlIwXeKIUZwE5YfuDdm55yjL
         UeqfTQmTaNYG7u69Xs4tRdnVQ91e9gAZnqUiVFCvCPH2y769H0wopH3lbtQ2JZK1Cm7M
         od1gnNNIQi8aHsJTpMYsCieO+mpZ/W1f2Ltso0E9yQuFlD38F9PEny0yTfZ3OdJVZzRr
         kb79QkpJQNcnRTLimf3bvMWlgj8S+9pUMmOvkEGfYP8HAx5qACGMfRFH8SEA/gGGfOJg
         kM0g==
X-Gm-Message-State: AOAM533XtR2NE1+fhM/rOYUftA5VY3BqulA4Zxb8HJ9KGbixcwv0Qv9/
	H0B6bVJk26CYbClGDGpGDkLQFg+Rwhk=
X-Google-Smtp-Source: ABdhPJzYWKQDdktZ4L8Ps9IBu2kCrHJ0eCv99ULkLdV3MrliGhR9Ih0/nG85h1rsijsaTR1u3IFLZw==
X-Received: by 2002:a17:907:3d9e:: with SMTP id he30mr8510260ejc.177.1638376901824;
        Wed, 01 Dec 2021 08:41:41 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e4sm188812ejs.13.2021.12.01.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:41:40 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][hardknott][PATCH 02/13] uxen-guest-tools: fix build against kernels 5.4+
Date: Wed,  1 Dec 2021 17:41:25 +0100
Message-Id: <20211201164136.33802-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164136.33802-1-Martin.Jansa@gmail.com>
References: <20211201164136.33802-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This is a compile only fix to update the uxen kernel modules to
work against newer kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...m-support-fix-build-for-kernel-s-5.4.patch | 97 +++++++++++++++++++
 .../uxen/uxen-guest-tools_4.1.8.bb            |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch

diff --git a/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch b/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch
new file mode 100644
index 0000000..a3325ce
--- /dev/null
+++ b/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch
@@ -0,0 +1,97 @@
+From 21bb6953a64390dd1c5a8b7520eb5e2c18ea3ff1 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Mon, 29 Nov 2021 21:01:03 -0500
+Subject: [PATCH] vm-support: fix build for kernel's > 5.4
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ a/uxenhc/hypercall.c             | 10 +++++++++-
+ a/v4vvsock/v4v_vsock.c           |  2 ++
+ a/vmdiagnostics/vm_diagnostics.c |  9 ++++++++-
+ 3 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/uxenhc/hypercall.c b/uxenhc/hypercall.c
+index 0b9ef3f..04957a8 100644
+--- a/uxenhc/hypercall.c
++++ b/uxenhc/hypercall.c
+@@ -10,6 +10,7 @@
+ #include <linux/mm.h>
+ #include <linux/spinlock.h>
+ #include <linux/compiler.h>
++#include <linux/version.h>
+ 
+ #include <xen/xen.h>
+ #include <xen/version.h>
+@@ -124,7 +125,11 @@ static int __init uxen_hypercall_init(void)
+     printk(KERN_INFO "using uxen hypervisor\n");
+ 
+     if (!uxen_hcbase) {
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,8,0))
+         uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL, PAGE_KERNEL_EXEC);
++#else
++	uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL);
++#endif
+         if (!uxen_hcbase) {
+             ret = -ENOMEM;
+             goto out;
+@@ -149,8 +154,11 @@ static void __exit uxen_hypercall_exit(void)
+ {
+ }
+ 
++
++#define KBUILD_MODFILE "uxenhc"
++
+ module_init(uxen_hypercall_init);
+ module_exit(uxen_hypercall_exit);
++MODULE_LICENSE("GPL");
+ MODULE_AUTHOR("paulian.marinca@bromium.com");
+ MODULE_DESCRIPTION("uXen hypercall support");
+-MODULE_LICENSE("GPL");
+diff --git a/v4vvsock/v4v_vsock.c b/v4vvsock/v4v_vsock.c
+index 8d80d7d..cd7e8ce 100644
+--- a/v4vvsock/v4v_vsock.c
++++ b/v4vvsock/v4v_vsock.c
+@@ -578,8 +578,10 @@ static const struct proto_ops vsock_dgram_ops = {
+     .ioctl = sock_no_ioctl,
+     .listen = sock_no_listen,
+     .shutdown = sock_no_shutdown,
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,10,0))
+     .setsockopt = sock_no_setsockopt,
+     .getsockopt = sock_no_getsockopt,
++#endif
+     .sendmsg = vsock_sendmsg,
+     .recvmsg = vsock_recvmsg,
+     .mmap = sock_no_mmap,
+diff --git a/vmdiagnostics/vm_diagnostics.c b/vmdiagnostics/vm_diagnostics.c
+index 9ff94fb..db14e57 100644
+--- a/vmdiagnostics/vm_diagnostics.c
++++ b/vmdiagnostics/vm_diagnostics.c
+@@ -22,6 +22,7 @@
+ #include <linux/timekeeping.h>
+ #include <linux/types.h>
+ #include <linux/vmstat.h>
++#include <linux/version.h>
+ 
+ #include <uxen-v4vlib.h>
+ 
+@@ -403,10 +404,16 @@ static void vm_handle_request_stat_task(struct vm_diagnostics_context *context,
+  
+             task_payload.state = task_state_to_char(task);
+             task_payload.num_threads = get_nr_threads(task);
++
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,5,0))
+             task_payload.start_time_nsec = task->real_start_time;
++#else
++            task_payload.start_time_nsec = task->start_boottime;
++#endif
++
+             task_payload.last_run_cpu_id = task_cpu(task);
+ 
+-            thread_group_cputime_adjusted(task, &user_nsec, &system_nsec);
++            //thread_group_cputime_adjusted(task, &user_nsec, &system_nsec);
+             task_payload.user_nsec = user_nsec;
+             task_payload.system_nsec = system_nsec;
+ 
+-- 
+2.19.1
+
diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
index 2ca0cb1..06dc376 100644
--- a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
+++ b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     https://www.bromium.com/wp-content/uploads/2019/11/uxen-${PV}.zip;name=uxen \
     https://www.bromium.com/wp-content/uploads/2019/11/Bromium-4.1.8-Open-Source-Software.pdf;name=license \
     file://fix-Makefile-for-OE-kernel-build.patch \
+    file://0001-vm-support-fix-build-for-kernel-s-5.4.patch \
     "
 
 SRC_URI[uxen.sha384sum] = "be2233bc6506a23350d76c03ac28ea7ea381e1dc6ed5ce996e8ac71e6a3316fcaa2ed070c622618bd226f43a4d6db5d4"
-- 
2.32.0

