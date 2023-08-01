Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A45EC04A94
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 00:34:16 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.2207.1690850049740159735
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 17:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UcmJSVLD;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686bea20652so5250159b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Jul 2023 17:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690850049; x=1691454849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7LanM37N+C0kEjWkCijP/rj/T0InaZOU7E2LwPkpdI=;
        b=UcmJSVLDka6c8kG3HafVg/AzcN0qzyaoDyiD3ZN4Vh6aO1opLx/G4Z9SkTsPus/aP5
         491SKPNdiAUd5Ifpc+BXrrEFfTCcJbfyJTSr2FnBNogSq6y5+G/v5aNbT2AjbqFSq4ie
         6Ev8gLWSCo8lV3iioJ82cg1xJOWE+RxMT/QLEhV54IcQ8TUrWzFb4EgYEM71VOz4joKS
         44yBUjuruFPS9CLj3qnkPnWX+KAVat3dllTBLKi9EvcoKLeljWTYIgt5JlYEs3Fa1EDx
         +yfU/+Y8MZ1a2Y/LDb2g3S733l51LGba7l9sWl23HyPSo+DBWxpQ7w5X++XtjQSbGrLX
         STow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690850049; x=1691454849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7LanM37N+C0kEjWkCijP/rj/T0InaZOU7E2LwPkpdI=;
        b=QHrnR5b3NaMw1ZUTA8+dO6VC+ainTne0UtccE5+vd89MUNQ1zGM6W6/Z0uK/fEr1em
         qwSndfegwcMkG4HmlmeN5IDqxjDnOcLKYLhHpPyohhwnV3/Kof7snWzgMpf7XrLNNmTK
         eRDbogNglzW7/eExwrN4+R4J+SbDxH+bgbgIFTvfzQ3L3DCzZN+zz7U6sUt9ihnLENkU
         Wj24Fb3V6M7EPOn0RkPMQBatUDGdOHT+4I/aXjoNqzClweaiaPWi+sogzoBOZEzlLpzg
         VhwlZmWgT6jwul6iMZCU9QNMNg7N/qMFejtO+fnq/gtpnWwA+2mqaK+bQpACFiH3I67B
         TQ5A==
X-Gm-Message-State: ABy/qLam0ECBZbchGLw3Tt1x+3FwaK5Ct2l2ets4biQcXVJlgwAC96Xh
	UOlbHtOd6ZvXLziphADOu3WD1IG92gxJZA==
X-Google-Smtp-Source: APBJJlG/Jmew8B4hN6rVweXhdzaCs1/SpbJq5fFWu5Ml8B11aF3Snjmv6UBi4LWRawlOjDBLSKTOfw==
X-Received: by 2002:a05:6a00:1ac9:b0:668:6445:8931 with SMTP id f9-20020a056a001ac900b0066864458931mr14441880pfv.29.1690850048851;
        Mon, 31 Jul 2023 17:34:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id a21-20020aa780d5000000b0067459e92801sm2597113pfn.64.2023.07.31.17.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 17:34:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [meta-virtualization][PATCH] xen: Fix build with gas/2.41
Date: Mon, 31 Jul 2023 17:34:06 -0700
Message-ID: <20230801003406.605140-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 00:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8154

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 ...g-solaris-syntax-for-.section-direct.patch | 62 +++++++++++++++++++
 recipes-extended/xen/xen_4.17.bb              |  4 ++
 2 files changed, 66 insertions(+)
 create mode 100644 recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch

diff --git a/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch b/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
new file mode 100644
index 0000000..c73bb27
--- /dev/null
+++ b/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
@@ -0,0 +1,62 @@
+From 9add6f9aced42a76f6a2c124754bef6fde56fa05 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+To: xen-devel@lists.xenproject.org
+Cc: Stefano Stabellini <sstabellini@kernel.org>
+Cc: Julien Grall <julien@xen.org>
+Cc: Bertrand Marquis <bertrand.marquis@arm.com>
+Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
+Date: Mon, 31 Jul 2023 17:01:32 -0700
+Subject: [PATCH] arm32: Avoid using solaris syntax for .section directive
+
+Assembler from binutils 2.41 rejects this syntax
+
+.section "name"[, flags...]
+
+where flags could be #alloc, #write, #execstr
+Switch to using ELF syntax
+
+.section name[, "flags"[, @type]]
+
+[1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119
+
+Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.org and maintainers]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ xen/arch/arm/arm32/proc-v7.S | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
+index c90a31d80f..6d3d19b873 100644
+--- a/xen/arch/arm/arm32/proc-v7.S
++++ b/xen/arch/arm/arm32/proc-v7.S
+@@ -29,7 +29,7 @@ brahma15mp_init:
+         mcr   CP32(r0, ACTLR)
+         mov   pc, lr
+ 
+-        .section ".proc.info", #alloc
++        .section .proc.info, "a"
+         .type __v7_ca15mp_proc_info, #object
+ __v7_ca15mp_proc_info:
+         .long 0x410FC0F0             /* Cortex-A15 */
+@@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
+         .long caxx_processor
+         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
+ 
+-        .section ".proc.info", #alloc
++        .section .proc.info, "a"
+         .type __v7_ca7mp_proc_info, #object
+ __v7_ca7mp_proc_info:
+         .long 0x410FC070             /* Cortex-A7 */
+@@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
+         .long caxx_processor
+         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
+ 
+-        .section ".proc.info", #alloc
++        .section .proc.info, "a"
+         .type __v7_brahma15mp_proc_info, #object
+ __v7_brahma15mp_proc_info:
+         .long 0x420F00F0             /* Broadcom Brahma-B15 */
+-- 
+2.41.0
+
diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/xen_4.17.bb
index 9da1b19..bd8f55b 100644
--- a/recipes-extended/xen/xen_4.17.bb
+++ b/recipes-extended/xen/xen_4.17.bb
@@ -7,6 +7,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+    file://0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
@@ -17,3 +18,6 @@ S = "${WORKDIR}/git"
 
 require xen.inc
 require xen-hypervisor.inc
+
+TOOLCHAIN = "gcc"
+LDFLAGS:remove = "-fuse-ld=lld"
-- 
2.41.0


