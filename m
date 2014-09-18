Return-Path: <Alexey_Firago@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6ECF7E0085A; Thu, 18 Sep 2014 06:01:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA619E00857
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Sep 2014 06:00:57 -0700 (PDT)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XUbKS-0006Ic-Dq from Alexey_Firago@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Thu, 18 Sep 2014 06:00:56 -0700
Received: from grobik.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.181.6; Thu, 18 Sep 2014 14:00:55 +0100
From: Alexey Firago <alexey_firago@mentor.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 18 Sep 2014 17:00:29 +0400
Message-ID: <1411045229-3823-1-git-send-email-alexey_firago@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] criu: add recipe for v1.2 release
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Sep 2014 13:01:00 -0000
Content-Type: text/plain

Building and basic functionality verified on Wandboard-dual
with linux-wandboard_3.10.17.

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
 .../criu-1.2/0001-Makefile-Fix-hardcoding.patch    | 42 ++++++++++++++++++++++
 recipes-containers/criu/criu_1.2.bb                | 39 ++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.patch
 create mode 100644 recipes-containers/criu/criu_1.2.bb

diff --git a/recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.patch b/recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.patch
new file mode 100644
index 0000000..fd9ab5b
--- /dev/null
+++ b/recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.patch
@@ -0,0 +1,42 @@
+From fa785bb1eb9cb0039d77836f4658c7bcccae5999 Mon Sep 17 00:00:00 2001
+From: Alexey Firago <alexey_firago@mentor.com>
+Date: Wed, 9 Jul 2014 02:01:11 +0400
+Subject: [PATCH] Makefile: Fix hardcoding
+
+Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
+---
+ Makefile | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index bda808d..4614ae2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -23,15 +23,15 @@ export VERSION_SO_MAJOR VERSION_SO_MINOR
+ # Common definitions
+ #
+ 
+-FIND		:= find
+-CSCOPE		:= cscope
+-RM		:= rm -f
+-LD		:= $(CROSS_COMPILE)ld
+-CC		:= $(CROSS_COMPILE)gcc
+-NM		:= $(CROSS_COMPILE)nm
+-SH		:= bash
+-MAKE		:= make
+-OBJCOPY		:= $(CROSS_COMPILE)objcopy
++FIND		?= find
++CSCOPE		?= cscope
++RM		?= rm -f
++LD		?= $(CROSS_COMPILE)ld
++CC		?= $(CROSS_COMPILE)gcc
++NM		?= $(CROSS_COMPILE)nm
++SH		?= bash
++MAKE		?= make
++OBJCOPY		?= $(CROSS_COMPILE)objcopy
+ 
+ CFLAGS		+= $(USERCFLAGS)
+ 
+-- 
+1.9.1
+
diff --git a/recipes-containers/criu/criu_1.2.bb b/recipes-containers/criu/criu_1.2.bb
new file mode 100644
index 0000000..de07842
--- /dev/null
+++ b/recipes-containers/criu/criu_1.2.bb
@@ -0,0 +1,39 @@
+SUMMARY = "CRIU"
+DESCRIPTION = "Checkpoint/Restore In Userspace, or CRIU, is a software \
+tool for Linux operating system. Using this tool, you can freeze a running \
+application (or part of it) and checkpoint it to a hard drive \
+as a collection of files. You can then use the files to restore and run \
+the application from the point it was frozen at. The distinctive feature \
+of the CRIU project is that it is mainly implemented in user space"
+HOMEPAGE = "http://criu.org"
+SECTION = "console/tools"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=5cc804625b8b491b6b4312f0c9cb5efa"
+
+SRCREV = "v1.2"
+PR = "r0"
+PV = "1.2"
+
+SRC_URI = "git://git.criu.org/crtools.git;protocol=git \
+	file://0001-Makefile-Fix-hardcoding.patch"
+
+DEPENDS += "protobuf-c-native protobuf-c"
+
+S = "${WORKDIR}/git"
+
+ARMV_armv7a = "ARMV=7"
+ARMV_armv6 = "ARMV=6"
+ARMV ?= ""
+EXTRA_OEMAKE += "ARCH=${TARGET_ARCH} WERROR=0 ${ARMV}"
+
+do_compile () {
+	unset CFLAGS
+	unset LDFLAGS
+	oe_runmake
+}
+
+do_install () {
+	mkdir -p ${D}/${bindir}
+	install -m 755 ${S}/criu ${D}/${bindir}/criu
+}
-- 
1.9.1


