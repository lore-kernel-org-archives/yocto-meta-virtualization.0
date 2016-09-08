Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1FE9E01211; Wed,  7 Sep 2016 22:36:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F2E9E00C6E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 22:36:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u885a6u7028839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 7 Sep 2016 22:36:06 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 22:36:05 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 8 Sep 2016 01:36:00 -0400
Message-ID: <1473312960-115788-3-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1473312960-115788-1-git-send-email-jianchuan.wang@windriver.com>
References: <1473312960-115788-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] criu: uprev to 2.5
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
X-List-Received-Date: Thu, 08 Sep 2016 05:36:09 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 recipes-containers/criu/criu_git.bb                |  22 +++--
 ...1-criu-Change-libraries-install-directory.patch |  63 ++++++------
 .../files/0001-criu-Fix-toolchain-hardcode.patch   | 108 +++++++++++++++++----
 .../0002-criu-Skip-documentation-install.patch     |  29 +++---
 4 files changed, 140 insertions(+), 82 deletions(-)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index c8be78f..dc0bdbe 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -11,11 +11,11 @@ LICENSE = "GPLv2"
 
 EXCLUDE_FROM_WORLD = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=5cc804625b8b491b6b4312f0c9cb5efa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
 
-SRCREV = "4c5b23e52c1dc4e3fbbc7472b92e7b1ce9d22f02"
+SRCREV = "c031417255f6a5c4409d15ff0b36af5f6e90c559"
 PR = "r0"
-PV = "1.6+git${SRCPV}"
+PV = "2.5+git${SRCPV}"
 
 SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0001-criu-Fix-toolchain-hardcode.patch \
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
-DEPENDS += "protobuf-c-native protobuf-c libbsd"
+DEPENDS += "libnl libcap protobuf-c-native protobuf-c"
 
 S = "${WORKDIR}/git"
 
@@ -35,14 +35,16 @@ S = "${WORKDIR}/git"
 # if the ARCH is ARMv7 or ARMv6.
 # ARM BSPs need set CRIU_BUILD_ARCH variable for building CRIU.
 #
-EXTRA_OEMAKE_arm += "ARCH=${CRIU_BUILD_ARCH} WERROR=0"
-EXTRA_OEMAKE_x86-64 += "ARCH=${TARGET_ARCH} WERROR=0"
-EXTRA_OEMAKE_aarch64 += "ARCH=${TARGET_ARCH} WERROR=0"
+EXTRA_OEMAKE_arm += "ARCH=arm UNAME-M=${CRIU_BUILD_ARCH} WERROR=0"
+EXTRA_OEMAKE_x86-64 += "ARCH=x86 WERROR=0"
+EXTRA_OEMAKE_aarch64 += "ARCH=arm64 WERROR=0"
 
 EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir} INCLUDEDIR=${includedir} PIEGEN=no"
 EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unitdir}"
 
-CFLAGS += "-D__USE_GNU -D_GNU_SOURCE"
+CFLAGS += "-D__USE_GNU -D_GNU_SOURCE " 
+
+CFLAGS += " -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3"
 
 # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
 export LDFLAGS=""
@@ -56,8 +58,8 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[selinux] = ",,libselinux"
 
 do_compile_prepend() {
-    rm -rf ${S}/protobuf/google/protobuf/descriptor.proto
-    ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/protobuf/google/protobuf/descriptor.proto
+    rm -rf ${S}/images/google/protobuf/descriptor.proto
+    ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/images/google/protobuf/descriptor.proto
 }
 
 do_compile () {
diff --git a/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch b/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
index 28d638b..a721405 100644
--- a/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
+++ b/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
@@ -1,48 +1,39 @@
-From cb9933dc34af0b4d52c4584332600114ac65c402 Mon Sep 17 00:00:00 2001
+From 7ebde06e00b591a88397dad74a1aa47fd562eb50 Mon Sep 17 00:00:00 2001
 From: Jianchuan Wang <jianchuan.wang@windriver.com>
-Date: Tue, 4 Aug 2015 17:45:51 +0800
-Subject: [PATCH] criu: Change libraries install directory
+Date: Tue, 16 Aug 2016 09:48:08 +0800
+Subject: [PATCH 1/2] criu: Change libraries install directory
 
-Install the libraries into /usr/lib(/usr/lib64)
+Install the libraries into /usr/lib(or /usr/lib64)
 
 Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
 ---
- Makefile     | 2 +-
- Makefile.inc | 9 ---------
- 2 files changed, 1 insertion(+), 10 deletions(-)
+ Makefile.install | 13 -------------
+ 1 file changed, 13 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 7f5c890..6dbc436 100644
---- a/Makefile
-+++ b/Makefile
-@@ -351,7 +351,7 @@ install-man:
+diff --git a/Makefile.install b/Makefile.install
+index dbc22e1..a30dc96 100644
+--- a/Makefile.install
++++ b/Makefile.install
+@@ -11,19 +11,6 @@ LIBDIR		?= $(PREFIX)/lib
+ INCLUDEDIR	?= $(PREFIX)/include/criu
+ LIBEXECDIR	?= $(PREFIX)/libexec
  
- install-crit: crit
- 	$(E) "  INSTALL crit"
--	$(Q) python scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX)
-+	$(Q) python scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX) --install-lib=$(LIBDIR)
- 
- .PHONY: install install-man install-crit install-criu
- 
-diff --git a/Makefile.inc b/Makefile.inc
-index 5496f41..ba70aea 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -17,14 +17,5 @@ MANDIR		:= $(PREFIX)/share/man
- SYSTEMDUNITDIR	:= $(PREFIX)/lib/systemd/system/
- LOGROTATEDIR	:= $(PREFIX)/etc/logrotate.d/
- LIBDIR		:= $(PREFIX)/lib
--# For recent Debian/Ubuntu with multiarch support
--DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture \
--			-qDEB_HOST_MULTIARCH 2>/dev/null)
+-#
+-# For recent Debian/Ubuntu with multiarch support.
+-DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture -qDEB_HOST_MULTIARCH 2>/dev/null)
 -ifneq "$(DEB_HOST_MULTIARCH)" ""
--LIBDIR		:= $(PREFIX)/lib/$(DEB_HOST_MULTIARCH)
--# For most other systems
--else ifeq "$(shell uname -m)" "x86_64"
--LIBDIR		:= $(PREFIX)/lib64
+-        LIBDIR			?= $(PREFIX)/lib/$(DEB_HOST_MULTIARCH)
+-else
+-        #
+-        # For most other systems
+-        ifeq "$(shell uname -m)" "x86_64"
+-                LIBDIR		?= $(PREFIX)/lib64
+-        endif
 -endif
+-
+ export BINDIR SBINDIR MANDIR SYSTEMDUNITDIR LOGROTATEDIR
+ export INCLUDEDIR LIBDIR DESTDIR PREFIX LIBEXECDIR
  
- INCLUDEDIR	:= $(PREFIX)/include/criu
 -- 
-1.9.1
+2.7.4
 
diff --git a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
index 2fabe0a..d30f2ac 100644
--- a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
+++ b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
@@ -1,46 +1,112 @@
-From 3d4f112fdb434712eba09239a468842323f1af4c Mon Sep 17 00:00:00 2001
-From: Yang Shi <yang.shi@windriver.com>
-Date: Tue, 26 Aug 2014 14:42:42 -0700
-Subject: [PATCH 1/2] criu: Fix toolchain hardcode
+From 057d30f15e81dcc4162d6fbee06f126564596397 Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Wed, 7 Sep 2016 23:55:15 -0400
+Subject: [PATCH] criu: Fix toolchain hardcode
 
 Replace ":=" to "?=" so that the toolchain used by bitbake build system will
 be taken.
 
 Signed-off-by: Yang Shi <yang.shi@windriver.com>
-Signed-off-by: Nam Ninh <nam.ninh@windriver.com>
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
 ---
- Makefile | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
+ Makefile                       |  2 +-
+ criu/pie/Makefile              |  2 +-
+ scripts/nmk/scripts/include.mk |  2 +-
+ scripts/nmk/scripts/tools.mk   | 40 ++++++++++++++++++++--------------------
+ 4 files changed, 23 insertions(+), 23 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index f1c8784..43252ec 100644
+index 52cbd6a..f66279b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -23,15 +23,15 @@ export VERSION_SO_MAJOR VERSION_SO_MINOR
- # Common definitions
+@@ -60,7 +60,7 @@ LDARCH			?= $(SRCARCH)
+ 
+ export SRCARCH LDARCH VDSO
+ 
+-UNAME-M := $(shell uname -m)
++UNAME-M ?= $(shell uname -m)
+ export UNAME-M
+ 
+ ifeq ($(ARCH),arm)
+diff --git a/criu/pie/Makefile b/criu/pie/Makefile
+index 125b02f..9975871 100644
+--- a/criu/pie/Makefile
++++ b/criu/pie/Makefile
+@@ -17,7 +17,7 @@ restorer-obj-e		+= ./$(ARCH_DIR)/syscalls.built-in.o
  #
+ CFLAGS			:= $(filter-out -pg $(CFLAGS-GCOV),$(CFLAGS))
+ CFLAGS			+= -iquote $(SRC_DIR)/criu/pie/piegen
+-CFLAGS			+= -iquote $(SRC_DIR)/criu/arch/$(ARCH)/include
++CFLAGS			+= -iquote $(SRC_DIR)/criu/arch/$(SRCARCH)/include
+ CFLAGS			+= -iquote $(SRC_DIR)/criu/include
+ CFLAGS			+= -iquote $(SRC_DIR)
  
--FIND		:= find
--CSCOPE		:= cscope
+diff --git a/scripts/nmk/scripts/include.mk b/scripts/nmk/scripts/include.mk
+index 4c496f7..a7250cd 100644
+--- a/scripts/nmk/scripts/include.mk
++++ b/scripts/nmk/scripts/include.mk
+@@ -20,7 +20,7 @@ SUBARCH := $(shell uname -m | sed       \
+                 -e s/aarch64.*/arm64/)
+ 
+ ARCH		?= $(SUBARCH)
+-SRCARCH 	:= $(ARCH)
++SRCARCH 	?= $(ARCH)
+ 
+ export SUBARCH ARCH SRCARCH
+ 
+diff --git a/scripts/nmk/scripts/tools.mk b/scripts/nmk/scripts/tools.mk
+index 0538dde..e4af068 100644
+--- a/scripts/nmk/scripts/tools.mk
++++ b/scripts/nmk/scripts/tools.mk
+@@ -2,28 +2,28 @@ ifndef ____nmk_defined__tools
+ 
+ #
+ # System tools shorthands
 -RM		:= rm -f
 -LD		:= $(CROSS_COMPILE)ld
 -CC		:= $(CROSS_COMPILE)gcc
+-CPP		:= $(CC) -E
+-AS		:= $(CROSS_COMPILE)as
+-AR		:= $(CROSS_COMPILE)ar
+-STRIP		:= $(CROSS_COMPILE)strip
+-OBJCOPY		:= $(CROSS_COMPILE)objcopy
+-OBJDUMP		:= $(CROSS_COMPILE)objdump
 -NM		:= $(CROSS_COMPILE)nm
--SH		:= bash
 -MAKE		:= make
--OBJCOPY		:= $(CROSS_COMPILE)objcopy
-+FIND		?= find
-+CSCOPE		?= cscope
+-MKDIR		:= mkdir -p
+-AWK		:= awk
+-PERL		:= perl
+-PYTHON		:= python
+-FIND		:= find
+-SH		:= $(shell if [ -x "$$BASH" ]; then echo $$BASH;        \
 +RM		?= rm -f
 +LD		?= $(CROSS_COMPILE)ld
 +CC		?= $(CROSS_COMPILE)gcc
++CPP		?= $(CC) -E
++AS		?= $(CROSS_COMPILE)as
++AR		?= $(CROSS_COMPILE)ar
++STRIP		?= $(CROSS_COMPILE)strip
++OBJCOPY		?= $(CROSS_COMPILE)objcopy
++OBJDUMP		?= $(CROSS_COMPILE)objdump
 +NM		?= $(CROSS_COMPILE)nm
-+SH		?= bash
 +MAKE		?= make
-+OBJCOPY		?= $(CROSS_COMPILE)objcopy
- 
- CFLAGS		+= $(USERCFLAGS)
++MKDIR		?= mkdir -p
++AWK		?= awk
++PERL		?= perl
++PYTHON		?= python
++FIND		?= find
++SH		?= $(shell if [ -x "$$BASH" ]; then echo $$BASH;        \
+                         else if [ -x /bin/bash ]; then echo /bin/bash;  \
+                         else echo sh; fi ; fi)
+-CSCOPE		:= cscope
+-ETAGS		:= etags
+-CTAGS		:= ctags
++CSCOPE		?= cscope
++ETAGS		?= etags
++CTAGS		?= ctags
  
+ export RM LD CC CPP AS AR STRIP OBJCOPY OBJDUMP
+ export NM SH MAKE MKDIR AWK PERL PYTHON SH CSCOPE
 -- 
-2.0.2
+2.8.1
 
diff --git a/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch b/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
index eaf8160..ba414d9 100644
--- a/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
+++ b/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
@@ -1,29 +1,28 @@
-From e9c2a94b9eb37ad24672b10caa398bd18282b962 Mon Sep 17 00:00:00 2001
-From: Yang Shi <yang.shi@windriver.com>
-Date: Tue, 26 Aug 2014 14:44:51 -0700
+From 07d9b3d0c372e45127dd51781d9564e8bee90dbe Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Tue, 16 Aug 2016 09:42:24 +0800
 Subject: [PATCH 2/2] criu: Skip documentation install
 
 asciidoc is needed to generate CRIU documentation, so skip it in install.
 
-Signed-off-by: Yang Shi <yang.shi@windriver.com>
-Signed-off-by: Nam Ninh <nam.ninh@windriver.com>
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
 ---
- Makefile | 2 +-
+ Makefile.install | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile b/Makefile
-index 43252ec..e25edcc 100644
---- a/Makefile
-+++ b/Makefile
-@@ -265,7 +265,7 @@ install: $(PROGRAM) install-man
- 	$(Q) install -m 644 scripts/logrotate.d/criu-service $(DESTDIR)$(LOGROTATEDIR)
+diff --git a/Makefile.install b/Makefile.install
+index a30dc96..33143fb 100644
+--- a/Makefile.install
++++ b/Makefile.install
+@@ -22,7 +22,7 @@ install-tree:
+ .PHONY: install-tree
  
  install-man:
 -	$(Q) $(MAKE) -C Documentation install
 +#	$(Q) $(MAKE) -C Documentation install
+ .PHONY: install-man
  
- .PHONY: install install-man
- 
+ install-lib: lib
 -- 
-2.0.2
+2.7.4
 
-- 
2.8.1


