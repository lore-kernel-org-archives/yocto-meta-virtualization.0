Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12538.1602246702634756723
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 05:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7868F11B3
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  9 Oct 2020 05:31:41 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24F333F70D
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  9 Oct 2020 05:31:41 -0700 (PDT)
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] xen: Fix x86_64 xen-tools installation
Date: Fri,  9 Oct 2020 13:31:13 +0100
Message-Id: <ad3335695fe738d0785576363d09c60165f6497d.1602246650.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ba7dacdcd5aaf6890b895f97fbe0007d75d73a75.1602246664.git.bertrand.marquis@arm.com>
References: <ba7dacdcd5aaf6890b895f97fbe0007d75d73a75.1602246664.git.bertrand.marquis@arm.com>

Python related things are installed in /usr/lib and not /usr/lib64 even
if xen-tools is built for x86_64 with multilib activated.
Use nonarch_libdir variable for all python related files.

Change-Id: I24e4336aaac4477efc5dc7426a6d9e909c98a6af
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 recipes-extended/xen/xen-tools.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index ace1a01..736a766 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -247,8 +247,8 @@ RPROVIDES_${PN}-xenstored = "virtual/xenstored"
 
 FILES_${PN}-dbg += "\
     ${libdir}/xen/bin/.debug \
-    ${libdir}/${PYTHON_DIR}/site-packages/.debug \
-    ${libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
+    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/.debug \
+    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
     ${libdir}/fs/xfs/.debug \
     ${libdir}/fs/ufs/.debug \
     ${libdir}/fs/ext2fs-lib/.debug \
@@ -261,8 +261,8 @@ FILES_${PN}-dbg += "\
     ${libdir}exec/.debug \
     ${libdir}/xen/libexec/.debug \
     ${bindir}/.debug \
-    ${libdir}/${PYTHON_DIR}/dist-packages/.debug \
-    ${libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
+    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/.debug \
+    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
     "
 
 FILES_${PN}-dev = "\
@@ -497,7 +497,7 @@ FILES_${PN}-pygrub = "\
     "
 
 FILES_${PN}-python = "\
-    ${libdir}/${PYTHON_DIR} \
+    ${nonarch_libdir}/${PYTHON_DIR} \
     "
 
 FILES_${PN}-remus = "\
-- 
2.17.1

