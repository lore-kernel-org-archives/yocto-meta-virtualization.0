Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D190FE01084; Wed,  7 Sep 2016 01:10:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16E85E00E39
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 01:10:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u878A4Ok030086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 7 Sep 2016 01:10:05 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 01:10:03 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 7 Sep 2016 04:09:58 -0400
Message-ID: <1473235798-3525-3-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
References: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
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
X-List-Received-Date: Wed, 07 Sep 2016 08:10:09 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 .../recipes-containers/criu/criu_git.bb            |  40 ++---
 ...1-criu-Change-libraries-install-directory.patch |  63 +++----
 .../files/0001-criu-Fix-toolchain-hardcode.patch   |  81 ++++++---
 .../0001-criu-add-alias-aarch64-for-arm64.patch    |  36 ++++
 ...0001-kerndat-Introduce-task_size-variable.patch | 140 ----------------
 .../0002-criu-Skip-documentation-install.patch     |  28 ++--
 ...rer-Replace-most-hard-coded-TASK_SIZE-use.patch | 113 -------------
 ...003-Pass-task_size-to-vma_area_is_private.patch | 181 ---------------------
 ...eplace-remaining-hard-coded-TASK_SIZE-use.patch | 132 ---------------
 9 files changed, 157 insertions(+), 657 deletions(-)
 create mode 100644 meta-virtualization/recipes-containers/criu/files/0001-criu-add-alias-aarch64-for-arm64.patch
 delete mode 100644 meta-virtualization/recipes-containers/criu/files/0001-kerndat-Introduce-task_size-variable.patch
 delete mode 100644 meta-virtualization/recipes-containers/criu/files/0002-restorer-Replace-most-hard-coded-TASK_SIZE-use.patch
 delete mode 100644 meta-virtualization/recipes-containers/criu/files/0003-Pass-task_size-to-vma_area_is_private.patch
 delete mode 100644 meta-virtualization/recipes-containers/criu/files/0004-Replace-remaining-hard-coded-TASK_SIZE-use.patch

diff --git a/meta-virtualization/recipes-containers/criu/criu_git.bb b/meta-virtualization/recipes-containers/criu/criu_git.bb
index 10cb52c..683b176 100644
--- a/meta-virtualization/recipes-containers/criu/criu_git.bb
+++ b/meta-virtualization/recipes-containers/criu/criu_git.bb
@@ -11,25 +11,22 @@ LICENSE = "GPLv2"
 
 EXCLUDE_FROM_WORLD = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=5cc804625b8b491b6b4312f0c9cb5efa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
 
-SRCREV = "4c5b23e52c1dc4e3fbbc7472b92e7b1ce9d22f02"
+SRCREV = "c031417255f6a5c4409d15ff0b36af5f6e90c559"
 PR = "r0"
-PV = "1.6+git${SRCPV}"
+PV = "2.5+git${SRCPV}"
 
 SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
-       file://0001-criu-Fix-toolchain-hardcode.patch \
-	   file://0002-criu-Skip-documentation-install.patch \
-       file://0001-criu-Change-libraries-install-directory.patch \
-       file://0001-kerndat-Introduce-task_size-variable.patch \
-       file://0002-restorer-Replace-most-hard-coded-TASK_SIZE-use.patch \
-       file://0003-Pass-task_size-to-vma_area_is_private.patch \
-       file://0004-Replace-remaining-hard-coded-TASK_SIZE-use.patch \
-       "
+        file://0001-criu-Fix-toolchain-hardcode.patch \
+        file://0002-criu-Skip-documentation-install.patch \
+        file://0001-criu-Change-libraries-install-directory.patch \
+        file://0001-criu-add-alias-aarch64-for-arm64.patch \
+        "
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
-DEPENDS += "protobuf-c-native protobuf-c"
+DEPENDS += "libnl libcap protobuf-c-native protobuf-c"
 
 S = "${WORKDIR}/git"
 
@@ -38,14 +35,17 @@ S = "${WORKDIR}/git"
 # if the ARCH is ARMv7 or ARMv6.
 # ARM BSPs need set CRIU_BUILD_ARCH variable for building CRIU.
 #
-EXTRA_OEMAKE_arm += "ARCH=${CRIU_BUILD_ARCH} WERROR=0"
-EXTRA_OEMAKE_x86-64 += "ARCH=${TARGET_ARCH} WERROR=0"
+EXTRA_OEMAKE_arm += "ARCH=arm UNAME-M=${CRIU_BUILD_ARCH} WERROR=0"
+EXTRA_OEMAKE_x86-64 += "ARCH=x86 WERROR=0"
 EXTRA_OEMAKE_aarch64 += "ARCH=${TARGET_ARCH} WERROR=0"
 
 EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unitdir}"
 
-CFLAGS += "-D__USE_GNU -D_GNU_SOURCE"
+CFLAGS += "-D__USE_GNU -D_GNU_SOURCE " 
+
+CFLAGS += " -I${STAGING_INCDIR}/libnl3 "
+CFLAGS += " -I${STAGING_INCDIR} "
 
 # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
 export LDFLAGS=""
@@ -56,8 +56,8 @@ export HOST_SYS
 inherit setuptools
 
 do_compile_prepend() {
-    rm -rf ${S}/protobuf/google/protobuf/descriptor.proto
-    ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/protobuf/google/protobuf/descriptor.proto
+    rm -rf ${S}/images/google/protobuf/descriptor.proto
+    ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/images/google/protobuf/descriptor.proto
 }
 
 do_compile () {
@@ -69,7 +69,7 @@ do_install () {
 }
 
 FILES_${PN} += "${systemd_unitdir}/ \
-            ${libdir}/python2.7/site-packages/ \
-            ${libdir}/pycriu/ \
-            ${libdir}/crit-0.0.1-py2.7.egg-info \
+            ${base_libdir}/python2.7/site-packages/ \
+            ${base_libdir}/pycriu/ \
+            ${base_libdir}/crit-0.0.1-py2.7.egg-info \
             "
diff --git a/meta-virtualization/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch b/meta-virtualization/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
index 28d638b..a721405 100644
--- a/meta-virtualization/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
+++ b/meta-virtualization/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
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
 
diff --git a/meta-virtualization/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch b/meta-virtualization/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
index a91b589..f54df4f 100644
--- a/meta-virtualization/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
+++ b/meta-virtualization/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
@@ -1,45 +1,84 @@
-From 3d4f112fdb434712eba09239a468842323f1af4c Mon Sep 17 00:00:00 2001
-From: Yang Shi <yang.shi@windriver.com>
-Date: Tue, 26 Aug 2014 14:42:42 -0700
-Subject: [PATCH 1/2] criu: Fix toolchain hardcode
+From a058ec2dc7ae79d7fda358cc496e1341033a84f1 Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Wed, 7 Sep 2016 02:22:31 -0400
+Subject: [PATCH] criu: Fix toolchain hardcode
 
 Replace ":=" to "?=" so that the toolchain used by bitbake build system will
 be taken.
 
 Signed-off-by: Yang Shi <yang.shi@windriver.com>
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
 ---
- Makefile | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
+ Makefile                     |  2 +-
+ scripts/nmk/scripts/tools.mk | 40 ++++++++++++++++++++--------------------
+ 2 files changed, 21 insertions(+), 21 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index f1c8784..43252ec 100644
+index 52cbd6a..f66279b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -23,15 +23,15 @@ export VERSION_SO_MAJOR VERSION_SO_MINOR
- # Common definitions
- #
+@@ -60,7 +60,7 @@ LDARCH			?= $(SRCARCH)
+
+ export SRCARCH LDARCH VDSO
+
+-UNAME-M := $(shell uname -m)
++UNAME-M ?= $(shell uname -m)
+ export UNAME-M
+
+ ifeq ($(ARCH),arm)
+diff --git a/scripts/nmk/scripts/tools.mk b/scripts/nmk/scripts/tools.mk
+index 0538dde..e4af068 100644
+--- a/scripts/nmk/scripts/tools.mk
++++ b/scripts/nmk/scripts/tools.mk
+@@ -2,28 +2,28 @@ ifndef ____nmk_defined__tools
  
--FIND		:= find
--CSCOPE		:= cscope
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
 
diff --git a/meta-virtualization/recipes-containers/criu/files/0001-criu-add-alias-aarch64-for-arm64.patch b/meta-virtualization/recipes-containers/criu/files/0001-criu-add-alias-aarch64-for-arm64.patch
new file mode 100644
index 0000000..6288e8e
--- /dev/null
+++ b/meta-virtualization/recipes-containers/criu/files/0001-criu-add-alias-aarch64-for-arm64.patch
@@ -0,0 +1,36 @@
+From 810265372c1085f8761e1e2adcc6f09db2af7cc1 Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Thu, 18 Aug 2016 05:33:38 -0400
+Subject: [PATCH] criu: add alias aarch64 for arm64
+
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ Makefile | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -25,7 +25,7 @@ export SRC_DIR
+ 
+ #
+ # Architecture specific options.
+-ifneq ($(filter-out x86 arm arm64 ppc64,$(ARCH)),)
++ifneq ($(filter-out x86 arm aarch64 arm64 ppc64,$(ARCH)),)
+         $(error "The architecture $(ARCH) isn't supported")
+ endif
+ 
+@@ -43,6 +43,12 @@ ifeq ($(ARCH),arm64)
+         ARCH		:= aarch64
+         SRCARCH		:= aarch64
+         VDSO		:= y
++endif
++
++ifeq ($(ARCH),aarch64)
++        ARCH		:= aarch64
++        SRCARCH		:= aarch64
++        VDSO		:= y
+ endif
+
+ ifeq ($(ARCH),ppc64)
diff --git a/meta-virtualization/recipes-containers/criu/files/0001-kerndat-Introduce-task_size-variable.patch b/meta-virtualization/recipes-containers/criu/files/0001-kerndat-Introduce-task_size-variable.patch
deleted file mode 100644
index 1bf8d92..0000000
--- a/meta-virtualization/recipes-containers/criu/files/0001-kerndat-Introduce-task_size-variable.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From c0c0546c31e6df4932669f4740197bb830a24c8d Mon Sep 17 00:00:00 2001
-From: Christopher Covington <cov@codeaurora.org>
-Date: Fri, 31 Jul 2015 10:36:24 -0400
-Subject: [PATCH 1/4] kerndat: Introduce task_size variable
-
-If we want one CRIU binary to work across all AArch64 kernel
-configurations, a single task size value cannot be hard coded.
-
-Signed-off-by: Christopher Covington <cov@codeaurora.org>
-Signed-off-by: Pavel Emelyanov <xemul@parallels.com>
----
- arch/aarch64/include/asm/types.h | 20 ++++++++++++++++++++
- arch/arm/include/asm/types.h     |  2 ++
- arch/ppc64/include/asm/types.h   |  2 ++
- arch/x86/include/asm/types.h     |  2 ++
- include/kerndat.h                |  1 +
- kerndat.c                        | 11 +++++++++++
- 6 files changed, 38 insertions(+)
-
-diff --git a/arch/aarch64/include/asm/types.h b/arch/aarch64/include/asm/types.h
-index 6512f67..0846dd9 100644
---- a/arch/aarch64/include/asm/types.h
-+++ b/arch/aarch64/include/asm/types.h
-@@ -66,6 +66,26 @@ typedef struct user_pt_regs user_regs_struct_t;
- 
- #define TASK_SIZE (1ULL << 39)
- 
-+/*
-+ * Range for task size calculated from the following Linux kernel files:
-+ *   arch/arm64/include/asm/memory.h
-+ *   arch/arm64/Kconfig
-+ */
-+#define TASK_SIZE_MIN (1UL << 39)
-+#define TASK_SIZE_MAX (1UL << 48)
-+
-+int munmap(void *addr, size_t length);
-+
-+static inline unsigned long task_size() {
-+	unsigned long task_size;
-+
-+	for (task_size = TASK_SIZE_MIN; task_size < TASK_SIZE_MAX; task_size <<= 1)
-+		if (munmap((void *)task_size, page_size()))
-+			break;
-+
-+	return task_size;
-+}
-+
- #define AT_VECTOR_SIZE 40
- 
- typedef UserAarch64RegsEntry UserRegsEntry;
-diff --git a/arch/arm/include/asm/types.h b/arch/arm/include/asm/types.h
-index 4efebdd..915db61 100644
---- a/arch/arm/include/asm/types.h
-+++ b/arch/arm/include/asm/types.h
-@@ -98,6 +98,8 @@ struct user_vfp_exc {
- 
- #define TASK_SIZE 0xbf000000
- 
-+static inline unsigned long task_size() { return TASK_SIZE; }
-+
- #define AT_VECTOR_SIZE 40
- 
- typedef UserArmRegsEntry UserRegsEntry;
-diff --git a/arch/ppc64/include/asm/types.h b/arch/ppc64/include/asm/types.h
-index 934a4fb..3412dc7 100644
---- a/arch/ppc64/include/asm/types.h
-+++ b/arch/ppc64/include/asm/types.h
-@@ -105,6 +105,8 @@ typedef uint64_t tls_t;
- #define TASK_SIZE_USER64 (0x0000400000000000UL)
- #define TASK_SIZE TASK_SIZE_USER64
- 
-+static inline unsigned long task_size() { return TASK_SIZE; }
-+
- static inline void *decode_pointer(uint64_t v) { return (void*)v; }
- static inline uint64_t encode_pointer(void *p) { return (uint64_t)p; }
- 
-diff --git a/arch/x86/include/asm/types.h b/arch/x86/include/asm/types.h
-index db41b75..b2d0189 100644
---- a/arch/x86/include/asm/types.h
-+++ b/arch/x86/include/asm/types.h
-@@ -119,6 +119,8 @@ typedef struct {
- # define TASK_SIZE	(0xffffe000)
- #endif
- 
-+static inline unsigned long task_size() { return TASK_SIZE; }
-+
- typedef u64 auxv_t;
- typedef u32 tls_t;
- 
-diff --git a/include/kerndat.h b/include/kerndat.h
-index c9e902a..b9ae749 100644
---- a/include/kerndat.h
-+++ b/include/kerndat.h
-@@ -23,6 +23,7 @@ struct kerndat_s {
- 	bool has_dirty_track;
- 	bool has_memfd;
- 	bool has_fdinfo_lock;
-+	unsigned long task_size;
- };
- 
- extern struct kerndat_s kdat;
-diff --git a/kerndat.c b/kerndat.c
-index 54ba8c7..4845532 100644
---- a/kerndat.c
-+++ b/kerndat.c
-@@ -273,6 +273,13 @@ static bool kerndat_has_memfd_create(void)
- 	return 0;
- }
- 
-+static int get_task_size(void)
-+{
-+	kdat.task_size = task_size();
-+	pr_debug("Found task size of %lx\n", kdat.task_size);
-+	return 0;
-+}
-+
- int kerndat_fdinfo_has_lock()
- {
- 	int fd, pfd = -1, exit_code = -1, len;
-@@ -323,6 +330,8 @@ int kerndat_init(void)
- 		ret = get_last_cap();
- 	if (!ret)
- 		ret = kerndat_fdinfo_has_lock();
-+	if (!ret)
-+		ret = get_task_size();
- 
- 	kerndat_lsm();
- 
-@@ -344,6 +353,8 @@ int kerndat_init_rst(void)
- 		ret = get_last_cap();
- 	if (!ret)
- 		ret = kerndat_has_memfd_create();
-+	if (!ret)
-+		ret = get_task_size();
- 
- 	kerndat_lsm();
- 
--- 
-1.9.1
-
diff --git a/meta-virtualization/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch b/meta-virtualization/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
index d37a806..ba414d9 100644
--- a/meta-virtualization/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
+++ b/meta-virtualization/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
@@ -1,28 +1,28 @@
-From e9c2a94b9eb37ad24672b10caa398bd18282b962 Mon Sep 17 00:00:00 2001
-From: Yang Shi <yang.shi@windriver.com>
-Date: Tue, 26 Aug 2014 14:44:51 -0700
+From 07d9b3d0c372e45127dd51781d9564e8bee90dbe Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Tue, 16 Aug 2016 09:42:24 +0800
 Subject: [PATCH 2/2] criu: Skip documentation install
 
 asciidoc is needed to generate CRIU documentation, so skip it in install.
 
-Signed-off-by: Yang Shi <yang.shi@windriver.com>
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
 
diff --git a/meta-virtualization/recipes-containers/criu/files/0002-restorer-Replace-most-hard-coded-TASK_SIZE-use.patch b/meta-virtualization/recipes-containers/criu/files/0002-restorer-Replace-most-hard-coded-TASK_SIZE-use.patch
deleted file mode 100644
index 1d48d18..0000000
--- a/meta-virtualization/recipes-containers/criu/files/0002-restorer-Replace-most-hard-coded-TASK_SIZE-use.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 7451fc7d2385fcebdbd907ecda903f087c8e7273 Mon Sep 17 00:00:00 2001
-From: Christopher Covington <cov@codeaurora.org>
-Date: Fri, 31 Jul 2015 10:36:25 -0400
-Subject: [PATCH 2/4] restorer: Replace most hard-coded TASK_SIZE use
-
-If we want one CRIU binary to work across all AArch64 kernel
-configurations, a single task size value cannot be hard coded.
-This fixes the following error on AArch64 kernels with
-CONFIG_ARM64_64K_PAGES=y.
-
-  pie: Error (pie/restorer.c:772): Unable to unmap (-): -1211695104
-
-Signed-off-by: Christopher Covington <cov@codeaurora.org>
-Signed-off-by: Pavel Emelyanov <xemul@parallels.com>
----
- cr-restore.c       |  2 ++
- include/restorer.h |  1 +
- pie/restorer.c     | 17 +++++++++--------
- 3 files changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/cr-restore.c b/cr-restore.c
-index cec3104..a475802 100644
---- a/cr-restore.c
-+++ b/cr-restore.c
-@@ -2893,6 +2893,8 @@ static int sigreturn_restore(pid_t pid, CoreEntry *core)
- 	task_args->premmapped_addr = (unsigned long)rsti(current)->premmapped_addr;
- 	task_args->premmapped_len = rsti(current)->premmapped_len;
- 
-+	task_args->task_size = kdat.task_size;
-+
- #define remap_array(name, nr, cpos)	do {				\
- 		task_args->name##_n = nr;				\
- 		task_args->name = rst_mem_remap_ptr(cpos, RM_PRIVATE);	\
-diff --git a/include/restorer.h b/include/restorer.h
-index 97a012c..56b9938 100644
---- a/include/restorer.h
-+++ b/include/restorer.h
-@@ -139,6 +139,7 @@ struct task_restore_args {
- 	unsigned int			zombies_n;
- 	/* * * * * * * * * * * * * * * * * * * * */
- 
-+	unsigned long			task_size;
- 	unsigned long			premmapped_addr;
- 	unsigned long			premmapped_len;
- 	rt_sigaction_t			sigchld_act;
-diff --git a/pie/restorer.c b/pie/restorer.c
-index d84a5c0..3e582cc 100644
---- a/pie/restorer.c
-+++ b/pie/restorer.c
-@@ -727,16 +727,17 @@ void __export_unmap(void)
-  * and arguments and the one with private vmas of the tasks we restore
-  * (a.k.a. premmaped area):
-  *
-- * 0                       TASK_SIZE
-+ * 0                       task_size
-  * +----+====+----+====+---+
-  *
-  * Thus to unmap old memory we have to do 3 unmaps:
-  * [ 0 -- 1st area start ]
-  * [ 1st end -- 2nd start ]
-- * [ 2nd start -- TASK_SIZE ]
-+ * [ 2nd start -- task_size ]
-  */
- static int unmap_old_vmas(void *premmapped_addr, unsigned long premmapped_len,
--		      void *bootstrap_start, unsigned long bootstrap_len)
-+		      void *bootstrap_start, unsigned long bootstrap_len,
-+		      unsigned long task_size)
- {
- 	unsigned long s1, s2;
- 	void *p1, *p2;
-@@ -766,10 +767,10 @@ static int unmap_old_vmas(void *premmapped_addr, unsigned long premmapped_len,
- 		return -1;
- 	}
- 
--	ret = sys_munmap(p2 + s2, (void *) TASK_SIZE - (p2 + s2));
-+	ret = sys_munmap(p2 + s2, task_size - (unsigned long)(p2 + s2));
- 	if (ret) {
- 		pr_err("Unable to unmap (%p-%p): %d\n",
--				p2 + s2, (void *)TASK_SIZE, ret);
-+				p2 + s2, (void *)task_size, ret);
- 		return -1;
- 	}
- 
-@@ -870,7 +871,7 @@ long __export_restore_task(struct task_restore_args *args)
- 		goto core_restore_end;
- 
- 	if (unmap_old_vmas((void *)args->premmapped_addr, args->premmapped_len,
--				bootstrap_start, bootstrap_len))
-+				bootstrap_start, bootstrap_len, args->task_size))
- 		goto core_restore_end;
- 
- 	/* Shift private vma-s to the left */
-@@ -880,7 +881,7 @@ long __export_restore_task(struct task_restore_args *args)
- 		if (!vma_entry_is_private(vma_entry))
- 			continue;
- 
--		if (vma_entry->end >= TASK_SIZE)
-+		if (vma_entry->end >= args->task_size)
- 			continue;
- 
- 		if (vma_entry->start > vma_entry->shmid)
-@@ -898,7 +899,7 @@ long __export_restore_task(struct task_restore_args *args)
- 		if (!vma_entry_is_private(vma_entry))
- 			continue;
- 
--		if (vma_entry->start > TASK_SIZE)
-+		if (vma_entry->start > args->task_size)
- 			continue;
- 
- 		if (vma_entry->start < vma_entry->shmid)
--- 
-1.9.1
-
diff --git a/meta-virtualization/recipes-containers/criu/files/0003-Pass-task_size-to-vma_area_is_private.patch b/meta-virtualization/recipes-containers/criu/files/0003-Pass-task_size-to-vma_area_is_private.patch
deleted file mode 100644
index b0f571b..0000000
--- a/meta-virtualization/recipes-containers/criu/files/0003-Pass-task_size-to-vma_area_is_private.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 1438f013a2ac70ca5b9b80c44f5b6cda65a30eac Mon Sep 17 00:00:00 2001
-From: Christopher Covington <cov@codeaurora.org>
-Date: Fri, 31 Jul 2015 10:36:26 -0400
-Subject: [PATCH 3/4] Pass task_size to vma_area_is_private()
-
-If we want one CRIU binary to work across all AArch64 kernel
-configurations, a single task size value cannot be hard coded. Since
-vma_area_is_private() is used by both restorer blob code and non
-restorer blob code, which must use different variables for recording
-the task size, make task_size a function argument and modify the call
-sites accordingly. This fixes the following error on AArch64 kernels
-with CONFIG_ARM64_64K_PAGES=y.
-
-  pie: Error (pie/restorer.c:929): Can't restore 0x3ffb7e70000 mapping w>
-  pie: ith 0xfffffffffffffff7
-
-Signed-off-by: Christopher Covington <cov@codeaurora.org>
-Signed-off-by: Pavel Emelyanov <xemul@parallels.com>
----
- cr-restore.c   | 10 +++++-----
- include/vma.h  | 10 ++++++----
- mem.c          |  6 +++---
- pie/restorer.c |  6 +++---
- proc_parse.c   |  2 +-
- 5 files changed, 18 insertions(+), 16 deletions(-)
-
-diff --git a/cr-restore.c b/cr-restore.c
-index a475802..1aa0919 100644
---- a/cr-restore.c
-+++ b/cr-restore.c
-@@ -269,7 +269,7 @@ static int map_private_vma(struct vma_area *vma, void **tgt_addr,
- 		if (p->e->start > vma->e->start)
- 			 break;
- 
--		if (!vma_area_is_private(p))
-+		if (!vma_area_is_private(p, kdat.task_size))
- 			continue;
- 
- 		 if (p->e->end != vma->e->end ||
-@@ -381,7 +381,7 @@ static int premap_priv_vmas(struct vm_area_list *vmas, void *at)
- 		}
- 		pstart = vma->e->start;
- 
--		if (!vma_area_is_private(vma))
-+		if (!vma_area_is_private(vma, kdat.task_size))
- 			continue;
- 
- 		ret = map_private_vma(vma, &at, &pvma, parent_vmas);
-@@ -447,7 +447,7 @@ static int restore_priv_vma_content(void)
- 			 */
- 			if (va < vma->e->start)
- 				goto err_addr;
--			else if (unlikely(!vma_area_is_private(vma))) {
-+			else if (unlikely(!vma_area_is_private(vma, kdat.task_size))) {
- 				pr_err("Trying to restore page for non-private VMA\n");
- 				goto err_addr;
- 			}
-@@ -590,7 +590,7 @@ static int unmap_guard_pages()
- 	struct list_head *vmas = &rsti(current)->vmas.h;
- 
- 	list_for_each_entry(vma, vmas, list) {
--		if (!vma_area_is_private(vma))
-+		if (!vma_area_is_private(vma, kdat.task_size))
- 			continue;
- 
- 		if (vma->e->flags & MAP_GROWSDOWN) {
-@@ -2713,7 +2713,7 @@ static int sigreturn_restore(pid_t pid, CoreEntry *core)
- 
- 		*vme = *vma->e;
- 
--		if (vma_area_is_private(vma))
-+		if (vma_area_is_private(vma, kdat.task_size))
- 			vma_premmaped_start(vme) = vma->premmaped_addr;
- 	}
- 
-diff --git a/include/vma.h b/include/vma.h
-index 8b7a06c..6c28136 100644
---- a/include/vma.h
-+++ b/include/vma.h
-@@ -92,17 +92,19 @@ static inline int in_vma_area(struct vma_area *vma, unsigned long addr)
- 		addr < (unsigned long)vma->e->end;
- }
- 
--static inline bool vma_entry_is_private(VmaEntry *entry)
-+static inline bool vma_entry_is_private(VmaEntry *entry,
-+					unsigned long task_size)
- {
- 	return vma_entry_is(entry, VMA_AREA_REGULAR)	&&
- 		(vma_entry_is(entry, VMA_ANON_PRIVATE)	||
- 		 vma_entry_is(entry, VMA_FILE_PRIVATE)) &&
--		 (entry->end <= TASK_SIZE);
-+		 (entry->end <= task_size);
- }
- 
--static inline bool vma_area_is_private(struct vma_area *vma)
-+static inline bool vma_area_is_private(struct vma_area *vma,
-+				       unsigned long task_size)
- {
--	return vma_entry_is_private(vma->e);
-+	return vma_entry_is_private(vma->e, task_size);
- }
- 
- #endif /* __CR_VMA_H__ */
-diff --git a/mem.c b/mem.c
-index 1821874..989efc3 100644
---- a/mem.c
-+++ b/mem.c
-@@ -178,7 +178,7 @@ static struct parasite_dump_pages_args *prep_dump_pages_args(struct parasite_ctl
- 	args->nr_vmas = 0;
- 
- 	list_for_each_entry(vma, &vma_area_list->h, list) {
--		if (!vma_area_is_private(vma))
-+		if (!vma_area_is_private(vma, kdat.task_size))
- 			continue;
- 		if (vma->e->prot & PROT_READ)
- 			continue;
-@@ -293,7 +293,7 @@ static int __parasite_dump_pages_seized(struct parasite_ctl *ctl,
- 		u64 off = 0;
- 		u64 *map;
- 
--		if (!vma_area_is_private(vma_area))
-+		if (!vma_area_is_private(vma_area, kdat.task_size))
- 			continue;
- 
- 		map = pmc_get_map(&pmc, vma_area);
-@@ -441,7 +441,7 @@ int prepare_mm_pid(struct pstree_item *i)
- 		}
- 		list_add_tail(&vma->list, &ri->vmas.h);
- 
--		if (vma_area_is_private(vma)) {
-+		if (vma_area_is_private(vma, kdat.task_size)) {
- 			ri->vmas.priv_size += vma_area_len(vma);
- 			if (vma->e->flags & MAP_GROWSDOWN)
- 				ri->vmas.priv_size += PAGE_SIZE;
-diff --git a/pie/restorer.c b/pie/restorer.c
-index 3e582cc..5e1db1f 100644
---- a/pie/restorer.c
-+++ b/pie/restorer.c
-@@ -878,7 +878,7 @@ long __export_restore_task(struct task_restore_args *args)
- 	for (i = 0; i < args->vmas_n; i++) {
- 		vma_entry = args->vmas + i;
- 
--		if (!vma_entry_is_private(vma_entry))
-+		if (!vma_entry_is_private(vma_entry, args->task_size))
- 			continue;
- 
- 		if (vma_entry->end >= args->task_size)
-@@ -896,7 +896,7 @@ long __export_restore_task(struct task_restore_args *args)
- 	for (i = args->vmas_n - 1; i >= 0; i--) {
- 		vma_entry = args->vmas + i;
- 
--		if (!vma_entry_is_private(vma_entry))
-+		if (!vma_entry_is_private(vma_entry, args->task_size))
- 			continue;
- 
- 		if (vma_entry->start > args->task_size)
-@@ -919,7 +919,7 @@ long __export_restore_task(struct task_restore_args *args)
- 		if (!vma_entry_is(vma_entry, VMA_AREA_REGULAR))
- 			continue;
- 
--		if (vma_entry_is_private(vma_entry))
-+		if (vma_entry_is_private(vma_entry, args->task_size))
- 			continue;
- 
- 		va = restore_mapping(vma_entry);
-diff --git a/proc_parse.c b/proc_parse.c
-index 5a61b6d..3b65c01 100644
---- a/proc_parse.c
-+++ b/proc_parse.c
-@@ -473,7 +473,7 @@ static int vma_list_add(struct vma_area *vma_area,
- 
- 	list_add_tail(&vma_area->list, &vma_area_list->h);
- 	vma_area_list->nr++;
--	if (vma_area_is_private(vma_area)) {
-+	if (vma_area_is_private(vma_area, kdat.task_size)) {
- 		unsigned long pages;
- 
- 		pages = vma_area_len(vma_area) / PAGE_SIZE;
--- 
-1.9.1
-
diff --git a/meta-virtualization/recipes-containers/criu/files/0004-Replace-remaining-hard-coded-TASK_SIZE-use.patch b/meta-virtualization/recipes-containers/criu/files/0004-Replace-remaining-hard-coded-TASK_SIZE-use.patch
deleted file mode 100644
index 4cb5b79..0000000
--- a/meta-virtualization/recipes-containers/criu/files/0004-Replace-remaining-hard-coded-TASK_SIZE-use.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From f9ae6d9dd4e4a1f4bc6db7f9e9d552ee7fa175a0 Mon Sep 17 00:00:00 2001
-From: Christopher Covington <cov@codeaurora.org>
-Date: Fri, 31 Jul 2015 10:36:27 -0400
-Subject: [PATCH 4/4] Replace remaining hard-coded TASK_SIZE use
-
-If we want one CRIU binary to work across all AArch64 kernel
-configurations, a single task size value cannot be hard coded. While
-trivial applications successfully checkpoint and restore on AArch64
-kernels with CONFIG_ARM64_64K_PAGES=y without this patch, replacing
-the remaining use of the hard-coded value seems like the best way to
-guard against failures that more complex process trees and future uses
-may expose.
-
-Signed-off-by: Christopher Covington <cov@codeaurora.org>
-Signed-off-by: Pavel Emelyanov <xemul@parallels.com>
----
- arch/aarch64/include/asm/types.h | 7 ++-----
- arch/aarch64/vdso.c              | 2 +-
- arch/arm/crtools.c               | 3 ++-
- cr-restore.c                     | 2 +-
- pagemap-cache.c                  | 5 +++--
- parasite-syscall.c               | 2 +-
- 6 files changed, 10 insertions(+), 11 deletions(-)
-
-diff --git a/arch/aarch64/include/asm/types.h b/arch/aarch64/include/asm/types.h
-index 0846dd9..d6c890d 100644
---- a/arch/aarch64/include/asm/types.h
-+++ b/arch/aarch64/include/asm/types.h
-@@ -61,15 +61,12 @@ typedef struct user_pt_regs user_regs_struct_t;
- #define REG_IP(regs)		((u64)(regs).pc)
- #define REG_SYSCALL_NR(regs)	((u64)(regs).regs[8])
- 
--// Copied from the Linux kernel arch/arm64/include/asm/memory.h
--// FIXME: what about a 32bit task?
--
--#define TASK_SIZE (1ULL << 39)
--
- /*
-  * Range for task size calculated from the following Linux kernel files:
-  *   arch/arm64/include/asm/memory.h
-  *   arch/arm64/Kconfig
-+ *
-+ * TODO: handle 32 bit tasks
-  */
- #define TASK_SIZE_MIN (1UL << 39)
- #define TASK_SIZE_MAX (1UL << 48)
-diff --git a/arch/aarch64/vdso.c b/arch/aarch64/vdso.c
-index 43d9637..2c127a4 100644
---- a/arch/aarch64/vdso.c
-+++ b/arch/aarch64/vdso.c
-@@ -87,7 +87,7 @@ int parasite_fixup_vdso(struct parasite_ctl *ctl, pid_t pid,
- 			continue;
- 		}
- 
--		if (vma->e->start > TASK_SIZE)
-+		if (vma->e->start > kdat.task_size)
- 			continue;
- 
- 		if (vma->e->flags & MAP_GROWSDOWN)
-diff --git a/arch/arm/crtools.c b/arch/arm/crtools.c
-index b692a7f..66405d2 100644
---- a/arch/arm/crtools.c
-+++ b/arch/arm/crtools.c
-@@ -18,6 +18,7 @@
- #include "parasite-syscall.h"
- #include "restorer.h"
- #include "errno.h"
-+#include "kerndat.h"
- 
- 
- /*
-@@ -212,7 +213,7 @@ void *mmap_seized(struct parasite_ctl *ctl,
- 
- 	err = syscall_seized(ctl, __NR_mmap2, &map,
- 			(unsigned long)addr, length, prot, flags, fd, offset >> 12);
--	if (err < 0 || map > TASK_SIZE)
-+	if (err < 0 || map > kdat.task_size)
- 		map = 0;
- 
- 	return (void *)map;
-diff --git a/cr-restore.c b/cr-restore.c
-index 1aa0919..b8b4473 100644
---- a/cr-restore.c
-+++ b/cr-restore.c
-@@ -2009,7 +2009,7 @@ static long restorer_get_vma_hint(struct list_head *tgt_vma_list,
- 	VmaEntry end_e;
- 
- 	end_vma.e = &end_e;
--	end_e.start = end_e.end = TASK_SIZE;
-+	end_e.start = end_e.end = kdat.task_size;
- 	prev_vma_end = PAGE_SIZE * 0x10; /* CONFIG_LSM_MMAP_MIN_ADDR=65536 */
- 
- 	s_vma = list_first_entry(self_vma_list, struct vma_area, list);
-diff --git a/pagemap-cache.c b/pagemap-cache.c
-index 9def587..9ce7b91 100644
---- a/pagemap-cache.c
-+++ b/pagemap-cache.c
-@@ -7,6 +7,7 @@
- #include "util.h"
- #include "log.h"
- #include "vma.h"
-+#include "kerndat.h"
- 
- #undef	LOG_PREFIX
- #define LOG_PREFIX "pagemap-cache: "
-@@ -66,8 +67,8 @@ static int pmc_fill_cache(pmc_t *pmc, struct vma_area *vma)
- 	size_t len = vma_area_len(vma);
- 	size_t size_map;
- 
--	if (high > TASK_SIZE)
--		high = TASK_SIZE;
-+	if (high > kdat.task_size)
-+		high = kdat.task_size;
- 
- 	pmc->start = vma->e->start;
- 	pmc->end = vma->e->end;
-diff --git a/parasite-syscall.c b/parasite-syscall.c
-index 6d2e7fc..ee339db 100644
---- a/parasite-syscall.c
-+++ b/parasite-syscall.c
-@@ -56,7 +56,7 @@ static struct vma_area *get_vma_by_ip(struct list_head *vma_area_list, unsigned
- 	struct vma_area *vma_area;
- 
- 	list_for_each_entry(vma_area, vma_area_list, list) {
--		if (vma_area->e->start >= TASK_SIZE)
-+		if (vma_area->e->start >= kdat.task_size)
- 			continue;
- 		if (!(vma_area->e->prot & PROT_EXEC))
- 			continue;
--- 
-1.9.1
-
-- 
2.8.1


