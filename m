Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1B9D10397
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 08:53:24 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9189.1764147203215486795
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 00:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 26 Nov 2025 17:53:20 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.151 with ESMTP; 26 Nov 2025 17:53:20 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [scarthgap][PATCH] kvmtool: Backport patch for musl compatibility
Date: Wed, 26 Nov 2025 17:52:52 +0900
Message-ID: <20251126085253.3883304-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Nov 2025 08:53:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9460

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

The fix is needed for SRCREV used in Styhead and older.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 ...e.h-inclusion-for-musl-compatibility.patch | 51 +++++++++++++++++++
 recipes-extended/kvmtool/kvmtool_git.bb       |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 recipes-extended/kvmtool/files/0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch

diff --git a/recipes-extended/kvmtool/files/0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch b/recipes-extended/kvmtool/files/0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch
new file mode 100644
index 00000000..1fdbca72
--- /dev/null
+++ b/recipes-extended/kvmtool/files/0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch
@@ -0,0 +1,51 @@
+From 0592f8f829c843ff5cb2d108c309e32f4f6f5379 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Thu, 1 Aug 2024 12:10:54 +0100
+Subject: [PATCH] remove wordsize.h inclusion (for musl compatibility)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The wordsize.h header file and the __WORDSIZE definition do not seem
+to be universal, the musl libc for instance has the definition in a
+different header file. This breaks compilation of kvmtool against musl.
+
+The two leading underscores suggest a compiler-internal symbol anyway, so
+let's just remove that particular macro usage entirely, and replace it
+with the number we really want: the size of a "long" type.
+
+Reported-by: J. Neuschäfer <j.neuschaefer@gmx.net>
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
+Link: https://lore.kernel.org/r/20240801111054.818765-1-andre.przywara@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/commit/?id=0592f8f829c843ff5cb2d108c309e32f4f6f5379]
+---
+ include/linux/bitops.h | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/include/linux/bitops.h b/include/linux/bitops.h
+index ae33922..ee8fd56 100644
+--- a/include/linux/bitops.h
++++ b/include/linux/bitops.h
+@@ -1,15 +1,13 @@
+ #ifndef _KVM_LINUX_BITOPS_H_
+ #define _KVM_LINUX_BITOPS_H_
+ 
+-#include <bits/wordsize.h>
+-
+ #include <linux/kernel.h>
+ #include <linux/compiler.h>
+ #include <asm/hweight.h>
+ 
+-#define BITS_PER_LONG __WORDSIZE
+ #define BITS_PER_BYTE           8
+-#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
++#define BITS_PER_LONG           (BITS_PER_BYTE * sizeof(long))
++#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_LONG)
+ 
+ #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
+ 
+-- 
+2.47.2
+
diff --git a/recipes-extended/kvmtool/kvmtool_git.bb b/recipes-extended/kvmtool/kvmtool_git.bb
index 141fb02d..a171129f 100644
--- a/recipes-extended/kvmtool/kvmtool_git.bb
+++ b/recipes-extended/kvmtool/kvmtool_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git;branch
            file://0001-kvmtool-9p-fixed-compilation-error.patch \
            file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
            file://0003-kvmtool-Werror-disabled.patch \
+           file://0004-remove-wordsize.h-inclusion-for-musl-compatibility.patch \
            "
 
 SRCREV = "4d2c017f41533b0e51e00f689050c26190a15318"
-- 
2.47.2


