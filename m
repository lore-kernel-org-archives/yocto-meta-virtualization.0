Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862A4C4321E
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 19:05:02 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.8876.1653159898304574671
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=frAPycEn;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id j21so10165914pga.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 May 2022 12:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qhMP1WiRPTBa/Jyr67/ojgmy5ceMq4rSMV+nVTgDugI=;
        b=frAPycEnjlpiIhO4Zj1OcNN82eJ9VaF3Ngt6LoAcDzsTOJq/B6mHoCMl88pFqnLkb7
         W/wixzKpLIZyflktanOMAzTX84oQOVPo0HZnzO1LqP+uhR7ZOUlAYmVPUH6HCsAHVC1f
         UpAkk3D6QJMrtf4Th86w2JNImTPaYEDbNp+M9W6MhKAChRGEWIwRbM8nHV8XLrP1Rd6S
         gHSI8/f9vbHNR2pPsf4YBo7H/7JFavsnK94W1csah8MSjoyMqV8VZCCu0EtDGwD8MbUl
         g/S/aEX/nmT1FQSmTt4wISIlOtgHTjaQ5wbvdH/8UFkL6HiiSYlTp+gwD6Lzo9jnXeoB
         jgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qhMP1WiRPTBa/Jyr67/ojgmy5ceMq4rSMV+nVTgDugI=;
        b=OUMUG9wkeyM8QtJcmSfrxf5yaKZ6Jhr9FFtXbXAtKKP+9QoQyCZV4347p2/6fDaBE8
         GRTEeFSTgNNIOXoNei4ZP+jhfxOaNx1ksFlFyRs4UZRIezLj7iHxKM3RU5Hu20ybzwJu
         cUhgZJjDzVoUBN43xTY/tY2xfgb4iR+XvOlJuHk0qx2IOloO4uw50alRz2CEoueojX1T
         R184ABthF+YpEm/wOMQEF/Woj/zXqaC8oo6pr+Sx6lJDEOhBBMcWuQtR5wIsKAEqEPon
         CvISJ1qT3ekKi2vv6Pu9g4V5KF4mNrXdwF3Lh71GswmV2j8j74PCoxswZZv//mNEpxDe
         isTg==
X-Gm-Message-State: AOAM532T0XY8YkzvXMuyPokr6+cZQiuqEmpvYZL+2vaBNzwvAjdGO7Ov
	mpH1aDEQaPp66mZAGBtAJwRkx5Zol8I=
X-Google-Smtp-Source: 
 ABdhPJx15Sa1bKtqjTWWZJ/khuAlQcMvUHwdS1AGTsU/bHd8ju9BtFh1DcuX/PEuhzivXMVxip2HIQ==
X-Received: by 2002:aa7:9110:0:b0:4fa:e388:af57 with SMTP id
 16-20020aa79110000000b004fae388af57mr15807698pfh.1.1653159897734;
        Sat, 21 May 2022 12:04:57 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b001620a2737b6sm1592856plg.74.2022.05.21.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 12:04:57 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][hardknott][PATCH 2/3] xen: drop patch to
 workaround prelink on aarch64
Date: Sat, 21 May 2022 12:04:41 -0700
Message-Id: <20220521190447.135705-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220521190447.135705-1-christopher.w.clark@gmail.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 21 May 2022 19:05:02 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7303

Patch is not needed for image prelinking since the gcc toolchain
in this branch successfully links Xen without it.

Remove the patch from the stable branch since the BSD license of the
modified header file differs vs the GPLv2 source code referenced.
Removal preferred to replacement with a new patch that moves the function
into GPLv2 .c source files since the build now succeeds without it.

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
index 653e3b6..6ac3236 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -5,7 +5,6 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     "
 
diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
index 2842c0a..138773d 100644
--- a/recipes-extended/xen/xen_4.15.bb
+++ b/recipes-extended/xen/xen_4.15.bb
@@ -5,7 +5,6 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     "
 
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index eaf3956..04874d4 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -5,7 +5,6 @@ XEN_BRANCH ?= "master"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
-    file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
     "
 
-- 
2.25.1


