Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.6458.1593482165692667117
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 18:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wmzcqf1i;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8AAB6E01DBE; Mon, 29 Jun 2020 18:56:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C220EE01D76
	for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:56:04 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id z63so17195199qkb.8
        for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ssdtMj3+bO0e3w3mH7+pPzWK609m8Itltaf3iCiSO/0=;
        b=Wmzcqf1imdIwJkB+kuo04ivPEg48TNOv+CnmtgqVlty3IjVKhRcqXDvb2UDyxYcNie
         Dxva9SWhaHtZ7r53erpRjKi00JWDJ7ridG/+TV/G5tnMC9MlYyPozNFQ4/fZom3SWnOM
         ZlSYcfvqJRePSCsStCT1Z5GFw20SC40qd36Q8po00OmN1/ly4oLSyEmbIniMu7MAXmIU
         ayZ71gXMdT/pcvEJuB4nVFyXsxX4M34twR1uiVHuTMuUGjca2i7vUQLBtFVyc++QBzRX
         kutmVhjbmCfjHOAUoDgVhuX5XNzuL1RWvyC4wUVsRGzC40mm5HeEGHSfZ8uKR4AR1YXV
         fiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ssdtMj3+bO0e3w3mH7+pPzWK609m8Itltaf3iCiSO/0=;
        b=UHVzZpaaRlM8Up7rFj8OUdM2beLcTcO0GOcYvUeE/YWzLmjUUCpC44w1T6wUlMe3EM
         OqxdgZbkTBBASpK4wdCXwS9MU5z2WjMpqShcXDW73kPk+L9SwUi0NXKFJxcKGngoDTAM
         hv+Ku7f7esShxeLGTUsDaAi3VC7jXb62Tzrwb4m+OqiRvZD8GUlURen8u7QiKiJ6iRGB
         ia+kIl/iMmsBGt11MDklTKC11ydS3px5hoUAzrN8/WuoR6wz+LpeHerw40bt9ptUXSPW
         J7hphDHteV8KRkLz9s7+wAsNzn8EBhZCPrKfrfoiDteQcCGw+KoXUIewr3jDacqInMa/
         XD2Q==
X-Gm-Message-State: AOAM531vwLINaAlVh2fl5Fd7FQX5M3BbqkfKHFp5p/pocCVYxo0K5n1Q
	BhgKj63uQ1J/KR3bvqCz/LtXhjQvkRY=
X-Google-Smtp-Source: ABdhPJyIGlktQYNrVetTVsGmWyVyiyoolBRBgFsybK3KwmjFrCYfVngG3kl9MqdQeWeOCDZPfftrRw==
X-Received: by 2002:a37:6758:: with SMTP id b85mr8029524qkc.238.1593482164122;
        Mon, 29 Jun 2020 18:56:04 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-186-179.mycingular.net. [166.176.186.179])
        by smtp.gmail.com with ESMTPSA id t48sm1841794qtb.50.2020.06.29.18.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 18:56:03 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH v2 11/11] xen: add patch to fix build on ARM64 with gcc 10.1.0
Date: Mon, 29 Jun 2020 18:54:54 -0700
Message-Id: <20200630015454.10151-12-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>

The newer gcc toolchain won't link due to a missing builtin:
__sync_fetch_and_add. Xen is built with -fno-builtin, so add a
patch to implement the one required function.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 ...xen-arm64-implement-atomic-fetch-add.patch | 50 +++++++++++++++++++
 recipes-extended/xen/xen_git.bb               |  5 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.patch

diff --git a/recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.patch b/recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.patch
new file mode 100644
index 0000000..6e957a5
--- /dev/null
+++ b/recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.patch
@@ -0,0 +1,50 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Christopher Clark <christopher.w.clark@gmail.com>
+Date: Fri, 26 June 2020 16:34:00 -0800
+Subject: [PATCH] xen: implement atomic op to fix arm64 compilation
+
+Xen's ARM implementation of arch_fetch_and_add since f9cc3cd9
+uses a builtin, despite the build being performed with -fno-builtin.
+With gcc 10.1.0, this now breaks prelinking spinlock.c, so
+implement the one atomic operation that is required with logic
+derived from Linux's atomic_ll_sc.h: ATOMIC_FETCH_OP and comparison with
+the binary produced with and without the patch with gcc 9.2.0.
+
+Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
+diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
+index e5d062667d..c46dd3ac71 100644
+--- a/xen/include/asm-arm/system.h
++++ b/xen/include/asm-arm/system.h
+@@ -55,7 +55,32 @@ static inline int local_abort_is_enabled(void)
+     return !(flags & PSR_ABT_MASK);
+ }
+ 
++#ifdef CONFIG_ARM_64
++
++/* see atomic_ll_sc.h:  ATOMIC_FETCH_OP(name, mb, acq, rel, cl, op, asm_op, constraint) */
++static inline int arch_fetch_and_add(unsigned int *ptr, unsigned long i)
++{
++    int register lptr asm("x0");
++    int register result asm("w1");
++    int register newval asm("w2");
++    int register status asm("w3");
++
++    asm volatile(
++    "   mov       %[lptr], %[ptr]\n"
++    "1: ldxr      %w[result], [%[lptr]]\n"
++    "   add       %w[newval], %w[result], %w[i]\n"
++    "   stlxr     %w[status], %w[newval], [%[lptr]]\n"
++    "   cbnz      %w[status], 1b\n"
++    "   dmb       ish\n"
++    : [result] "=&r" (result), [lptr] "=&r" (lptr), [newval] "=&r" (newval), [status] "=&r" (status), [i] "+r" (i), "+Q" (*ptr)
++    : [ptr] "r" (ptr), "r" (i)
++    : "memory");
++
++    return result;
++}
++#else
+ #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
++#endif
+ 
+ extern struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);
+ 
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 142bdcc..7765ed7 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -3,7 +3,10 @@ SRCREV ?= "9f7e8bac4ca279b3bfccb5f3730fb2e5398c95ab"
 XEN_REL ?= "4.13"
 XEN_BRANCH ?= "stable-${XEN_REL}"
 
-SRC_URI = "git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH}"
+SRC_URI = " \
+    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
+    file://xen-arm64-implement-atomic-fetch-add.patch \
+    "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=4295d895d4b5ce9d070263d52f030e49"
 
-- 
2.17.1

