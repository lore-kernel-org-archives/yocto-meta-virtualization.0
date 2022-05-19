Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A750C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 19:39:47 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.104.1652989178897886645
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 12:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24JJdbQu029434
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 12:39:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24JJdbrD002870
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 12:39:37 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 19 May 2022 12:39:37 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 19 May 2022 12:39:37 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] podman: do not build or install docs
Date: Thu, 19 May 2022 15:39:36 -0400
Message-ID: <20220519193936.39214-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 May 2022 19:39:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7290

When using oe-core, podman do_compile fails with the error:
   .../podman/4.0.1+gitAUTOINC+717edd7b84-r0/recipe-sysroot-native/usr/bin/go-md2man:
   No such file or directory
   make: *** [Makefile:482: docs/source/markdown/podman-attach.1] Error 127
Whereas when using poky, the build passes without issues.

Investigating the native go-md2man binaries from both oe-core and poky
builds using ldd, it appears that the issue lies with how go-md2man is linked.
On oe-core it is linked to the loader in recipe sysroot:
   tmp-glibc/work/x86_64-linux/go-md2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/lib/ld-linux-x86-64.so.2
   => /lib64/ld-linux-x86-64.so.2 (0x00007f4da90f0000)

whereas on poky its linked to sysroot-uninative:
   tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
   => /lib64/ld-linux-x86-64.so.2 (0x00007f9c82c71000)

I have confirmed that this issue exists on both Ubuntu 18.04 and
Fedora 35.

Rather have this fail for people using only oe-core, skip generating the
documentation for podman until the problem can be resolved.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...efile-do-not-compile-or-install-docs.patch | 35 +++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch

diff --git a/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
new file mode 100644
index 0000000..1363ee8
--- /dev/null
+++ b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
@@ -0,0 +1,35 @@
+From 7913cac21842f56ae9752fb0c253f838bab04ae8 Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Fri, 13 May 2022 13:06:29 -0400
+Subject: [PATCH] Makefile: do not compile or install docs
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/import/Makefile b/src/import/Makefile
+index cb230d8e9..7e07ab61a 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -202,7 +202,7 @@ GV_SHA=e943b1806d94d387c4c38d96719432d50a84bbd0
+ default: all
+ 
+ .PHONY: all
+-all: binaries docs
++all: binaries
+ 
+ .PHONY: binaries
+ binaries: podman podman-remote rootlessport ## Build podman, podman-remote and rootlessport binaries
+@@ -754,7 +754,7 @@ package-install: package  ## Install rpm packages
+ 	/usr/bin/podman info  # will catch a broken conmon
+ 
+ .PHONY: install
+-install: .gopathok install.bin install.remote install.man install.systemd  ## Install binaries to system locations
++install: .gopathok install.bin install.remote install.systemd  ## Install binaries to system locations
+ 
+ .PHONY: install.catatonit
+ install.catatonit:
+-- 
+2.33.0
+
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index f805cb6..8339a16 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -20,6 +20,7 @@ DEPENDS = " \
 SRCREV = "717edd7b844dcd66468f5d991991d87e9fc14c12"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
+    file://0001-Makefile-do-not-compile-or-install-docs.patch \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.33.0


