Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7ADEFE00CD2; Fri,  8 Sep 2017 14:02:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22EBEE00B01
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Sep 2017 14:02:37 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v88L2a7o015581
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 8 Sep 2017 14:02:37 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 8 Sep 2017 14:02:35 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 8 Sep 2017 17:02:31 -0400
Message-ID: <1504904551-18649-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] criu: uprev to version 3.4
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
X-List-Received-Date: Fri, 08 Sep 2017 21:02:39 -0000
Content-Type: text/plain

Our current version of criu is about a year old and has some
compilation issues with the latest gcc (currently it is
unbuildable). Since the version of criu and the kernel version are
fairly tightly coupled it wouldn't be surprising of this old criu
would also be exhibiting some runtime issues with our fairly new
kernel version.

With the above in mind we uprev to criu v3.4 which was recently
released. This requires several of the patches to be updated (mostly
context). We are able to drop the selinux related change as RSS
prevents the situation this was working around from happenning.

This was validated using https://criu.org/Simple_loop (and a few
variants).

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Bruce, This depends on the revert of commit
d3c6004e92bf21f7f2b425d062b6276ff53c8c18 per the email thread around
that merge.


 recipes-containers/criu/criu_git.bb                | 13 +++--
 ...1-criu-Change-libraries-install-directory.patch | 25 +++++-----
 .../files/0001-criu-Fix-toolchain-hardcode.patch   | 57 +++++++++-------------
 .../criu/files/disable-selinux.patch               | 39 ---------------
 ...e-overwrite-install-lib-to-allow-multiarc.patch | 16 +++---
 5 files changed, 52 insertions(+), 98 deletions(-)
 delete mode 100644 recipes-containers/criu/files/disable-selinux.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 849a832..3a02103 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -13,21 +13,19 @@ EXCLUDE_FROM_WORLD = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
 
-SRCREV = "c031417255f6a5c4409d15ff0b36af5f6e90c559"
-PR = "r0"
-PV = "2.5+git${SRCPV}"
+SRCREV = "a31c1854e10580a09621e539c3ec052b875a8e06"
+PV = "3.4+git${SRCPV}"
 
 SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0001-criu-Fix-toolchain-hardcode.patch \
            file://0002-criu-Skip-documentation-install.patch \
            file://0001-criu-Change-libraries-install-directory.patch \
-           ${@bb.utils.contains('PACKAGECONFIG', 'selinux', '', 'file://disable-selinux.patch', d)} \
            file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
           "
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
-DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native libbsd"
+DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native libbsd libnet"
 RDEPENDS_${PN} = "bash"
 
 S = "${WORKDIR}/git"
@@ -78,3 +76,8 @@ FILES_${PN} += "${systemd_unitdir}/ \
             ${libdir}/pycriu/ \
             ${libdir}/crit-0.0.1-py2.7.egg-info \
             "
+
+FILES_${PN}-staticdev += " \
+            ${libexecdir}/compel/std.lib.a \
+            ${libexecdir}/compel/fds.lib.a \
+            "
diff --git a/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch b/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
index a721405..4908e47 100644
--- a/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
+++ b/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
@@ -1,26 +1,26 @@
-From 7ebde06e00b591a88397dad74a1aa47fd562eb50 Mon Sep 17 00:00:00 2001
-From: Jianchuan Wang <jianchuan.wang@windriver.com>
-Date: Tue, 16 Aug 2016 09:48:08 +0800
-Subject: [PATCH 1/2] criu: Change libraries install directory
+From 78390305829316633acee2ca5607331b0e37a104 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Fri, 8 Sep 2017 15:11:31 -0400
+Subject: [PATCH] criu: Change libraries install directory
 
 Install the libraries into /usr/lib(or /usr/lib64)
 
 Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
  Makefile.install | 13 -------------
  1 file changed, 13 deletions(-)
 
 diff --git a/Makefile.install b/Makefile.install
-index dbc22e1..a30dc96 100644
+index 3987bcc..73d98a4 100644
 --- a/Makefile.install
 +++ b/Makefile.install
-@@ -11,19 +11,6 @@ LIBDIR		?= $(PREFIX)/lib
- INCLUDEDIR	?= $(PREFIX)/include/criu
- LIBEXECDIR	?= $(PREFIX)/libexec
+@@ -9,19 +9,6 @@ LIBEXECDIR	?= $(PREFIX)/libexec
+ RUNDIR		?= /run
  
--#
+ #
 -# For recent Debian/Ubuntu with multiarch support.
--DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture -qDEB_HOST_MULTIARCH 2>/dev/null)
+-DEB_HOST_MULTIARCH := $(shell dpkg-architecture -qDEB_HOST_MULTIARCH 2>/dev/null)
 -ifneq "$(DEB_HOST_MULTIARCH)" ""
 -        LIBDIR			?= $(PREFIX)/lib/$(DEB_HOST_MULTIARCH)
 -else
@@ -31,8 +31,9 @@ index dbc22e1..a30dc96 100644
 -        endif
 -endif
 -
- export BINDIR SBINDIR MANDIR SYSTEMDUNITDIR LOGROTATEDIR
- export INCLUDEDIR LIBDIR DESTDIR PREFIX LIBEXECDIR
+-#
+ # LIBDIR falls back to the standard path.
+ LIBDIR ?= $(PREFIX)/lib
  
 -- 
 2.7.4
diff --git a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
index d30f2ac..dc5b897 100644
--- a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
+++ b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
@@ -1,6 +1,6 @@
-From 057d30f15e81dcc4162d6fbee06f126564596397 Mon Sep 17 00:00:00 2001
-From: Jianchuan Wang <jianchuan.wang@windriver.com>
-Date: Wed, 7 Sep 2016 23:55:15 -0400
+From af679853a45fe63f680c99e70416c8ac620d23b8 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Fri, 8 Sep 2017 15:02:14 -0400
 Subject: [PATCH] criu: Fix toolchain hardcode
 
 Replace ":=" to "?=" so that the toolchain used by bitbake build system will
@@ -8,45 +8,32 @@ be taken.
 
 Signed-off-by: Yang Shi <yang.shi@windriver.com>
 Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
  Makefile                       |  2 +-
- criu/pie/Makefile              |  2 +-
  scripts/nmk/scripts/include.mk |  2 +-
  scripts/nmk/scripts/tools.mk   | 40 ++++++++++++++++++++--------------------
- 4 files changed, 23 insertions(+), 23 deletions(-)
+ 3 files changed, 22 insertions(+), 22 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 52cbd6a..f66279b 100644
+index f2583a2..d7f51e5 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -60,7 +60,7 @@ LDARCH			?= $(SRCARCH)
- 
- export SRCARCH LDARCH VDSO
+@@ -17,7 +17,7 @@ ifeq ($(origin HOSTCFLAGS), undefined)
+         HOSTCFLAGS := $(CFLAGS) $(USERCFLAGS)
+ endif
  
 -UNAME-M := $(shell uname -m)
 +UNAME-M ?= $(shell uname -m)
- export UNAME-M
  
- ifeq ($(ARCH),arm)
-diff --git a/criu/pie/Makefile b/criu/pie/Makefile
-index 125b02f..9975871 100644
---- a/criu/pie/Makefile
-+++ b/criu/pie/Makefile
-@@ -17,7 +17,7 @@ restorer-obj-e		+= ./$(ARCH_DIR)/syscalls.built-in.o
  #
- CFLAGS			:= $(filter-out -pg $(CFLAGS-GCOV),$(CFLAGS))
- CFLAGS			+= -iquote $(SRC_DIR)/criu/pie/piegen
--CFLAGS			+= -iquote $(SRC_DIR)/criu/arch/$(ARCH)/include
-+CFLAGS			+= -iquote $(SRC_DIR)/criu/arch/$(SRCARCH)/include
- CFLAGS			+= -iquote $(SRC_DIR)/criu/include
- CFLAGS			+= -iquote $(SRC_DIR)
- 
+ # Supported Architectures
 diff --git a/scripts/nmk/scripts/include.mk b/scripts/nmk/scripts/include.mk
-index 4c496f7..a7250cd 100644
+index 04ccb3a..0d63bc7 100644
 --- a/scripts/nmk/scripts/include.mk
 +++ b/scripts/nmk/scripts/include.mk
 @@ -20,7 +20,7 @@ SUBARCH := $(shell uname -m | sed       \
-                 -e s/aarch64.*/arm64/)
+                 -e s/aarch64.*/aarch64/)
  
  ARCH		?= $(SUBARCH)
 -SRCARCH 	:= $(ARCH)
@@ -55,16 +42,20 @@ index 4c496f7..a7250cd 100644
  export SUBARCH ARCH SRCARCH
  
 diff --git a/scripts/nmk/scripts/tools.mk b/scripts/nmk/scripts/tools.mk
-index 0538dde..e4af068 100644
+index 56dba84..1698821 100644
 --- a/scripts/nmk/scripts/tools.mk
 +++ b/scripts/nmk/scripts/tools.mk
-@@ -2,28 +2,28 @@ ifndef ____nmk_defined__tools
+@@ -2,30 +2,30 @@ ifndef ____nmk_defined__tools
  
  #
  # System tools shorthands
 -RM		:= rm -f
--LD		:= $(CROSS_COMPILE)ld
--CC		:= $(CROSS_COMPILE)gcc
++RM		?= rm -f
+ HOSTLD		?= ld
+-LD		:= $(CROSS_COMPILE)$(HOSTLD)
++LD		?= $(CROSS_COMPILE)$(HOSTLD)
+ HOSTCC		?= gcc
+-CC		:= $(CROSS_COMPILE)$(HOSTCC)
 -CPP		:= $(CC) -E
 -AS		:= $(CROSS_COMPILE)as
 -AR		:= $(CROSS_COMPILE)ar
@@ -79,9 +70,7 @@ index 0538dde..e4af068 100644
 -PYTHON		:= python
 -FIND		:= find
 -SH		:= $(shell if [ -x "$$BASH" ]; then echo $$BASH;        \
-+RM		?= rm -f
-+LD		?= $(CROSS_COMPILE)ld
-+CC		?= $(CROSS_COMPILE)gcc
++CC		?= $(CROSS_COMPILE)$(HOSTCC)
 +CPP		?= $(CC) -E
 +AS		?= $(CROSS_COMPILE)as
 +AR		?= $(CROSS_COMPILE)ar
@@ -105,8 +94,8 @@ index 0538dde..e4af068 100644
 +ETAGS		?= etags
 +CTAGS		?= ctags
  
- export RM LD CC CPP AS AR STRIP OBJCOPY OBJDUMP
+ export RM HOSTLD LD HOSTCC CC CPP AS AR STRIP OBJCOPY OBJDUMP
  export NM SH MAKE MKDIR AWK PERL PYTHON SH CSCOPE
 -- 
-2.8.1
+2.7.4
 
diff --git a/recipes-containers/criu/files/disable-selinux.patch b/recipes-containers/criu/files/disable-selinux.patch
deleted file mode 100644
index 5d5d035..0000000
--- a/recipes-containers/criu/files/disable-selinux.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bd2eeaddfc1f12f87184d870cc9a1adde1cf0b10 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Mon, 24 Apr 2017 13:08:48 -0400
-Subject: [PATCH] criu/Makefile.config: explicitly remove selinux support
-
-Upstream-Status: Inappropriate [disable feature]
-
-It shows warning when build crius if libselinux has been built already:
-
-  WARNING: QA Issue: criu rdepends on libselinux, but it isn't a build dependency? [build-deps]
-
-Apply this patch to disable selinux support when 'selinux' is not in PACKAGECONF.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-[MA: Context updated to apply against criu v2.5]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- criu/Makefile.config | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/criu/Makefile.config b/criu/Makefile.config
-index f531b3b..37216f8 100644
---- a/criu/Makefile.config
-+++ b/criu/Makefile.config
-@@ -7,11 +7,6 @@ ifeq ($(call try-cc,$(FEATURE_TEST_LIBBSD_DEV),-lbsd),true)
-         FEATURE_DEFINES	+= -DCONFIG_HAS_LIBBSD
- endif
- 
--ifeq ($(call pkg-config-check,libselinux),y)
--        LIBS		+= -lselinux
--        FEATURE_DEFINES	+= -DCONFIG_HAS_SELINUX
--endif
--
- export DEFINES += $(FEATURE_DEFINES)
- export CFLAGS += $(FEATURE_DEFINES)
- 
--- 
-2.7.4
-
diff --git a/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch b/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
index 8bda8c4..c2512a0 100644
--- a/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
+++ b/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
@@ -1,6 +1,6 @@
-From 2e0c5c66786016f6443da2c1ff15ad77f018ec9b Mon Sep 17 00:00:00 2001
+From 89f9b87904bd312b817ffaa7d83abfd5e84d723d Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Mon, 24 Apr 2017 16:12:05 -0400
+Date: Fri, 8 Sep 2017 15:40:49 -0400
 Subject: [PATCH] lib/Makefile: overwrite install-lib, to allow multiarch
 
 I am not sure why Yocto installs python modules in arch specific
@@ -13,15 +13,15 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/Makefile b/lib/Makefile
-index f1c0821..c714d12 100644
+index b1bb057..06f5c5d 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -56,7 +56,7 @@ install: lib-c lib-py ../crit/crit c/criu.pc.in
- 	$(Q) sed -e 's,@version@,$(CRIU_VERSION),' -e 's,@libdir@,$(LIBDIR),' -e 's,@includedir@,$(dir $(INCLUDEDIR)),' c/criu.pc.in > c/criu.pc
- 	$(Q) install -m 644 c/criu.pc $(DESTDIR)$(LIBDIR)/pkgconfig
+@@ -56,7 +56,7 @@ install: lib-c lib-py crit/crit lib/c/criu.pc.in
+ 	$(Q) sed -e 's,@version@,$(CRIU_VERSION),' -e 's,@libdir@,$(LIBDIR),' -e 's,@includedir@,$(dir $(INCLUDEDIR)/criu/),' lib/c/criu.pc.in > lib/c/criu.pc
+ 	$(Q) install -m 644 lib/c/criu.pc $(DESTDIR)$(LIBDIR)/pkgconfig
  	$(E) "  INSTALL " crit
--	$(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX) --record $(CRIT_SETUP_FILES)
-+	$(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX) --record $(CRIT_SETUP_FILES) --install-lib=$(INSTALL_LIB)
+-	$(Q) $(PYTHON_BIN) scripts/crit-setup.py install --prefix=$(DESTDIR)$(PREFIX) --record $(CRIT_SETUP_FILES)
++	$(Q) $(PYTHON_BIN) scripts/crit-setup.py install --prefix=$(DESTDIR)$(PREFIX) --record $(CRIT_SETUP_FILES) --install-lib=$(DESTDIR)$(INSTALL_LIB)
  .PHONY: install
  
  uninstall:
-- 
2.7.4


