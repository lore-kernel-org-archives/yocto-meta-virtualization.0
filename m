Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.90776.1638362048589791577
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 04:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QgJJ/R/A;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1638362049;
  x=1669898049;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iym6wei3Ofub9PU3lBjlWqygtNgrDAhuNR7D7eQBFVM=;
  b=QgJJ/R/Ask2tfsdb0d0tr+x/uxHsGvxOq/byWQQ+XwUrRqSmYgz/j5uZ
   /tb6MzgnoEzXPAU3aM3ndXzR7Fgw0obU4JazoAr7TQU/NROz49A2rTFVg
   i2JgwjeA0MdmUII7QkPWcFG8GvgMUlI/onKVWXUBDiLTOkOGjTewTH+IU
   AYTYPxgpGDsJTwKcS6+vvblTG1wC7sMvzb2WTu/BNEj7NaSBF8L1knDKc
   n087xOaZIXdId02O+DsMkJmFN2SakAKpzwuIjkYosYzRqgonMvFoC3huW
   LPo3xfF2z01VFsDOpwffSe52ALlr6AxgGzF9Ne0569vQ1TCWUgFKrN+Ay
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] qemu-package-split.inc: Correct a typo
Date: Wed, 1 Dec 2021 13:33:57 +0100
Message-ID: <20211201123357.11531-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 recipes-devtools/qemu/qemu-package-split.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/qemu/qemu-package-split.inc b/recipes-devtools/qemu/qemu-package-split.inc
index f9db331..f1d8932 100644
--- a/recipes-devtools/qemu/qemu-package-split.inc
+++ b/recipes-devtools/qemu/qemu-package-split.inc
@@ -10,7 +10,7 @@ PACKAGES:prepend:class-target = "${PN}-x86_64 \
                     "
 
 FILES:${PN}-x86_64:class-target = "${bindir}/qemu-system-x86_64 ${bindir}/qemu-x86_64"
-RDEPENDS:${PN}-x86_64:append:class_target = "${PN}"
+RDEPENDS:${PN}-x86_64:append:class-target = "${PN}"
 INSANE_SKIP:${PN}-x86_64:class-target = "file-rdeps"
 
 FILES:${PN}-i386:class-target = "${bindir}/qemu-i386"
