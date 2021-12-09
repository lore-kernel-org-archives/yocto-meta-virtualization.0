Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.5661.1639014113541129547
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 17:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gn8OZwz9;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id o14so2774637plg.5
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Dec 2021 17:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AtXcq1kAbwLWuQs90QELvSSXnItd3JdjMzCDZAyGrjw=;
        b=gn8OZwz93naYo5jZ66EpHsJqkgDZtcHtBdcHCKLf3GamSB8cIKRk2esvDGuGCBDTrr
         t7hFOMfTRhq6egg4JV3p9BmGFG+XvIoEd66hpg/qLrv7BSwfy/6abhGoSI5C2yOtVSV2
         EArRjqC0S8qkpY9/i+erIFDRx9WRuqIpctPJVOBx5FtPiticMFtRr6PC/XrXZzuEWUb7
         s+ppZpfXOMNQW87xw3KBcAXDyO/pXRemQ+YyWfDAEKQb+EWLCUNjv48gs5ujjhvGF/+6
         fBuDRw+jDySSwA6Y7fzaLSka0mJelKoXsUDPvaUKjik3CjUi70hhTC3PyzjH0MNUWzC2
         9XtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AtXcq1kAbwLWuQs90QELvSSXnItd3JdjMzCDZAyGrjw=;
        b=7AB1ysom/WV4a6uZhu/Q3KUPAUvxn95KzOKRXPdmzYTomd3vueERXWZxyhKYWaBzcd
         a5lwljFrOJ8eU3ev4Zyaxczd7czdsWFXE7gDREs4Dha4+mei1tjjPs7yokGAcrOVtIOb
         qZwepJ2WDaFKyN13k3TTMoeMfq3qC/NUcGB9P5U1U0bZvRH+QWVQacWoNpcAiQsb512H
         Ue4dMmqICuD12Ivg4jDCWH4jzxquwGSihaeXDnnPyx5Qcg7lJbdZ/cm7lek1p8VwL0N9
         6FyA6rfcwkikCglyFqs4eyqCX5pND7oqwiCo+VoJHOVFyA7aqNCtPMmweeN0h2mp6P38
         2nwA==
X-Gm-Message-State: AOAM531TKmq3ffeXgWlFL8ns5YkExnT1bHK42+E6/EGq/DTJHZBNAB8D
	hLgTQ1kAF07rTSGLykmA5FAmrZUkmfk=
X-Google-Smtp-Source: ABdhPJziD2zX5uxCH7JrdVUdUW7zrusSKc9Tg9+LZJWx5OK/agGWDFFjHyMOauQkVySHNJkx28sbWQ==
X-Received: by 2002:a17:90b:4a4d:: with SMTP id lb13mr11691174pjb.97.1639014112697;
        Wed, 08 Dec 2021 17:41:52 -0800 (PST)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id x33sm4925759pfh.133.2021.12.08.17.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 17:41:50 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH 1/3] xen: drop patch to workaround prelink on aarch64
Date: Wed,  8 Dec 2021 17:41:33 -0800
Message-Id: <20211209014135.9976-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prelink is no longer default enabled and has been recommended to be
disabled since OE-core f9719cc1.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 ...xen-arm64-implement-atomic-fetch-add.patch | 50 -------------------
 recipes-extended/xen/xen_4.14.bb              |  1 -
 recipes-extended/xen/xen_4.15.bb              |  1 -
 recipes-extended/xen/xen_git.bb               |  1 -
 4 files changed, 53 deletions(-)
 delete mode 100644 recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.patch

diff --git a/recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.patch b/recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.patch
deleted file mode 100644
index 6e957a5..0000000
--- a/recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Christopher Clark <christopher.w.clark@gmail.com>
-Date: Fri, 26 June 2020 16:34:00 -0800
-Subject: [PATCH] xen: implement atomic op to fix arm64 compilation
-
-Xen's ARM implementation of arch_fetch_and_add since f9cc3cd9
-uses a builtin, despite the build being performed with -fno-builtin.
-With gcc 10.1.0, this now breaks prelinking spinlock.c, so
-implement the one atomic operation that is required with logic
-derived from Linux's atomic_ll_sc.h: ATOMIC_FETCH_OP and comparison with
-the binary produced with and without the patch with gcc 9.2.0.
-
-Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
-diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
-index e5d062667d..c46dd3ac71 100644
---- a/xen/include/asm-arm/system.h
-+++ b/xen/include/asm-arm/system.h
-@@ -55,7 +55,32 @@ static inline int local_abort_is_enabled(void)
-     return !(flags & PSR_ABT_MASK);
- }
- 
-+#ifdef CONFIG_ARM_64
-+
-+/* see atomic_ll_sc.h:  ATOMIC_FETCH_OP(name, mb, acq, rel, cl, op, asm_op, constraint) */
-+static inline int arch_fetch_and_add(unsigned int *ptr, unsigned long i)
-+{
-+    int register lptr asm("x0");
-+    int register result asm("w1");
-+    int register newval asm("w2");
-+    int register status asm("w3");
-+
-+    asm volatile(
-+    "   mov       %[lptr], %[ptr]\n"
-+    "1: ldxr      %w[result], [%[lptr]]\n"
-+    "   add       %w[newval], %w[result], %w[i]\n"
-+    "   stlxr     %w[status], %w[newval], [%[lptr]]\n"
-+    "   cbnz      %w[status], 1b\n"
-+    "   dmb       ish\n"
-+    : [result] "=&r" (result), [lptr] "=&r" (lptr), [newval] "=&r" (newval), [status] "=&r" (status), [i] "+r" (i), "+Q" (*ptr)
-+    : [ptr] "r" (ptr), "r" (i)
-+    : "memory");
-+
-+    return result;
-+}
-+#else
- #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
-+#endif
- 
- extern struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);
- 
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
index 0d7d20b..267db16 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -6,7 +6,6 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     "
 
diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
index 0cfaf0c..1b87ae8 100644
--- a/recipes-extended/xen/xen_4.15.bb
+++ b/recipes-extended/xen/xen_4.15.bb
@@ -6,7 +6,6 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     "
 
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 20227e0..e014733 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -6,7 +6,6 @@ XEN_BRANCH ?= "master"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     "
 
-- 
2.25.1

