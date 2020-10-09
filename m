Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12497.1602246702359479464
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 05:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6C861063
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  9 Oct 2020 05:31:40 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92D763F70D
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  9 Oct 2020 05:31:40 -0700 (PDT)
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] ipxe: Fix gcc10 compilation
Date: Fri,  9 Oct 2020 13:31:12 +0100
Message-Id: <ba7dacdcd5aaf6890b895f97fbe0007d75d73a75.1602246664.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

Add ipxe patch to pass -fcommon flag to gcc during compilation.
This patch is required to have ipxe compiling properly with gcc10.

Without it the following error occur (and multiple others of the same
kind:
bin/blib.a(epic100.o):(.bss+0x0): multiple definition of `_shared_bss';
  bin/blib.a(davicom.o):(.bss+0x0): first defined here

Change-Id: Id9aed4cfe6bec9c0cbdb0b99271ddff472f1f0c3
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 ...cit-about-fcommon-compiler-directive.patch | 33 +++++++++++++++++++
 recipes-extended/ipxe/ipxe_git.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compiler-directive.patch

diff --git a/recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compiler-directive.patch b/recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compiler-directive.patch
new file mode 100644
index 0000000..6fa5858
--- /dev/null
+++ b/recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compiler-directive.patch
@@ -0,0 +1,33 @@
+From f982a712979619dbae2c6e0d741757e2ce94be11 Mon Sep 17 00:00:00 2001
+Message-Id: <f982a712979619dbae2c6e0d741757e2ce94be11.1602165412.git.bertrand.marquis@arm.com>
+From: Bruce Rogers <brogers@suse.com>
+Date: Wed, 6 May 2020 15:03:02 -0600
+Subject: [PATCH] [build] Be explicit about -fcommon compiler directive
+
+gcc10 switched default behavior from -fcommon to -fno-common.  Since
+"__shared" relies on the legacy behavior, explicitly specify it.
+
+Upstream-Status: backport
+
+Signed-off-by: Bruce Rogers <brogers@suse.com>
+Modified-by: Michael Brown <mcb30@ipxe.org>
+Signed-off-by: Michael Brown <mcb30@ipxe.org>
+---
+ src/Makefile.housekeeping | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Makefile.housekeeping b/src/Makefile.housekeeping
+index 66d6dd44..b6c61c11 100644
+--- a/Makefile.housekeeping
++++ b/Makefile.housekeeping
+@@ -418,6 +418,7 @@ CFLAGS		+= -Os
+ CFLAGS		+= -g
+ ifeq ($(CCTYPE),gcc)
+ CFLAGS		+= -ffreestanding
++CFLAGS		+= -fcommon
+ CFLAGS		+= -Wall -W -Wformat-nonliteral
+ HOST_CFLAGS	+= -Wall -W -Wformat-nonliteral
+ endif
+-- 
+2.17.1
+
diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index fbaad30..d7c60ab 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://ipxe-fix-hostcc-nopie-cflags.patch \
     file://ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch \
     file://ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch \
+    file://build-be-explicit-about-fcommon-compiler-directive.patch \
     "
 
 FILES_${PN} = "/usr/share/firmware/*.rom"
-- 
2.17.1

