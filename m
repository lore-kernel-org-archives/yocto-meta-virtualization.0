Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738A0C04A6A
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:26:01 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.67919.1691515557422296888
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 10:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EZSFkgtv;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-686f1240a22so5721270b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Aug 2023 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691515557; x=1692120357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jJMfPt+JurANpyYMENTh4IvvfD+nc7N2CR+k1VJJ/c=;
        b=EZSFkgtv/9j14OyOBLT5w+vz7K6hPOQ/zk1Kk39uTsxXV2Omdh0SqX8sG8x0QKlAF6
         z7DR5gcPxxHGstd81jd3DxOZAUYAhjlVdqJoh7EGTtNojQDUlY+ehNlmwwlRrNZwqtuI
         fStSg4EAGxsKSTqEZuO61xdSWtWSd5Dq9W6dUxCe+TR0HzCOzZfaTcSQ4WTI+LYrdcbE
         aeS5witP5SLsrVgtqGRzJJVIhISS/x0+WDDPqeom5Do2WjXTXpjoLyJXCv1Hvbyuse2q
         xRroTSlYZlUgU6baVl29spIQDmJvTbmkERU7St/LTr2iDc/4nGejQ0tmpl7VxmoQMur5
         J8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515557; x=1692120357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jJMfPt+JurANpyYMENTh4IvvfD+nc7N2CR+k1VJJ/c=;
        b=Scw1rgI3+7C9ztd8gNdMPyt0WFe5UK/4pt9sHasKpFslDulaDLn/PaDnuh/j0eduIQ
         ISRXiQSZWUhCOjyNImSp99RKZ7zI58L4WVexMmSpWdsI3EOy1ojw1m+C6HpcsFfyIg+l
         ikE2GtMDfkMyXF94OlYUgrzimMDmlrgCW8b0c6BIuibsPqlDyDjF/nw1ub8bbUJkFnZA
         B0etQiFPsQQ9rx0yW6SP1rZNYyDLMmUNXZaWXmlAytnycw5uZtghnik3oyztPumv0+H5
         FgWrTY8qovu0a3JZ/4ns720oP15euWam3EaEDnE6+HY6fJ031MG2MdRHrpvgatc45JAj
         6FFA==
X-Gm-Message-State: AOJu0Yydy+jqy/9kk9uv+JhfD7JqglwDTiL22hU9Bx+yQNWqM6i8H5r/
	XUNcHjgvBZn6b9ll6OfhpEnWVwt88azcLQ==
X-Google-Smtp-Source: AGHT+IGbO/TlrKeQvz/Rzkypeto6DlKOjFg52Rg1DAMqUr6aPUqZcJueDqRqyWYdWcFLTZJY8XVRtA==
X-Received: by 2002:a05:6a21:47ca:b0:13d:3b4d:e4b4 with SMTP id as10-20020a056a2147ca00b0013d3b4de4b4mr147775pzc.9.1691515556560;
        Tue, 08 Aug 2023 10:25:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id k18-20020aa78212000000b00682a839d0aesm8397967pfi.112.2023.08.08.10.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 10:25:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] xen: Update arm assembly patch to upstream accepted one
Date: Tue,  8 Aug 2023 10:25:53 -0700
Message-ID: <20230808172553.3632648-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Aug 2023 17:26:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8169

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g-solaris-syntax-for-.section-direct.patch | 48 +++++++++++--------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch b/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
index c73bb27..a4038dd 100644
--- a/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
+++ b/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch
@@ -1,33 +1,35 @@
-From 9add6f9aced42a76f6a2c124754bef6fde56fa05 Mon Sep 17 00:00:00 2001
+From dfc490a3740bb7d6889939934afadcb58891fbce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-To: xen-devel@lists.xenproject.org
-Cc: Stefano Stabellini <sstabellini@kernel.org>
-Cc: Julien Grall <julien@xen.org>
-Cc: Bertrand Marquis <bertrand.marquis@arm.com>
-Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
-Date: Mon, 31 Jul 2023 17:01:32 -0700
-Subject: [PATCH] arm32: Avoid using solaris syntax for .section directive
+Date: Tue, 1 Aug 2023 10:49:30 -0700
+Subject: [PATCH] arm: Avoid using solaris syntax for .section directive
 
-Assembler from binutils 2.41 rejects this syntax
+Assembler from binutils 2.41 will rejects ([1], [2]) the following
+syntax
 
-.section "name"[, flags...]
+.section "name", #alloc
 
-where flags could be #alloc, #write, #execstr
-Switch to using ELF syntax
+for any other any target other than ELF SPARC. This means we can't use
+it in the Arm code.
 
-.section name[, "flags"[, @type]]
+So switch to the GNU syntax
 
-[1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119
+.section name [, "flags"[, @type]]
 
-Upstream-Status: Submitted [by email to xen-devel@lists.xenproject.org and maintainers]
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=11601
+[2] https://sourceware.org/binutils/docs-2.41/as.html#Section
 
+Upstream-Status: Backport [https://github.com/xen-project/xen/commit/dfc490a3740bb7d6889939934afadcb58891fbce]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-by: Michal Orzel <michal.orzel@amd.com>
+[jgrall: Reword commit message]
+Acked-by: Julien Grall <jgrall@amazon.com>
 ---
  xen/arch/arm/arm32/proc-v7.S | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ xen/arch/arm/dtb.S           | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
-index c90a31d80f..6d3d19b873 100644
+index c90a31d80fc5..6d3d19b87354 100644
 --- a/xen/arch/arm/arm32/proc-v7.S
 +++ b/xen/arch/arm/arm32/proc-v7.S
 @@ -29,7 +29,7 @@ brahma15mp_init:
@@ -57,6 +59,12 @@ index c90a31d80f..6d3d19b873 100644
          .type __v7_brahma15mp_proc_info, #object
  __v7_brahma15mp_proc_info:
          .long 0x420F00F0             /* Broadcom Brahma-B15 */
--- 
-2.41.0
-
+diff --git a/xen/arch/arm/dtb.S b/xen/arch/arm/dtb.S
+index c39f3a095c58..386f83ba649e 100644
+--- a/xen/arch/arm/dtb.S
++++ b/xen/arch/arm/dtb.S
+@@ -1,3 +1,3 @@
+-        .section .dtb,#alloc
++        .section .dtb, "a"
+         GLOBAL(_sdtb)
+         .incbin CONFIG_DTB_FILE
-- 
2.41.0


