Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF4F2E009CA; Mon, 30 Jul 2018 14:09:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB507E008CA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jul 2018 14:09:49 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6UL9m0K002751
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jul 2018 14:09:49 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 30 Jul 2018 14:09:48 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 30 Jul 2018 17:09:43 -0400
Message-ID: <1532984983-24575-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] criu: uprev to version 3.10
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
X-List-Received-Date: Mon, 30 Jul 2018 21:09:52 -0000
Content-Type: text/plain

A fairly straightforward uprev requiring minimal patch refreshing
since a few hunks were failing due to conflicts with upstream updates.

Unfortunately upstream starting using the now overloaded "PYTHON"
variable in their Makefiles, this is not the path to the python
executable but rather the name 'python2' or 'python3' which is used to
determine which local directories to include. Due to this we must
explicitly assign values to 'PYTHON_FULL' and 'PYTHON'. We use
'python2' since we are using 'setuptools' and therefore are explicitly
using python v2, at some point we might want to make this recipe work
with either python v2 or v3 but for now we continue to explicitly use
v2.

Instead of using version specific filename we switch to using _git.bb
which is inline with similar 'git' recipes found in oe-core and other
repos.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/criu/{criu_3.9.bb => criu_git.bb}        |  8 ++++----
 .../criu/files/0001-criu-Fix-toolchain-hardcode.patch       | 13 +++++++------
 ...b-Makefile-overwrite-install-lib-to-allow-multiarc.patch |  6 +++---
 3 files changed, 14 insertions(+), 13 deletions(-)
 rename recipes-containers/criu/{criu_3.9.bb => criu_git.bb} (94%)

diff --git a/recipes-containers/criu/criu_3.9.bb b/recipes-containers/criu/criu_git.bb
similarity index 94%
rename from recipes-containers/criu/criu_3.9.bb
rename to recipes-containers/criu/criu_git.bb
index 36c356d..00de417 100644
--- a/recipes-containers/criu/criu_3.9.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -13,8 +13,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
 
-SRCREV = "202b7745bd0c37a1732ebe2fb009a157d338bf95"
-PV = "3.9+git${SRCPV}"
+SRCREV = "c49eab368a68682475c4e693258246e04232e6d2"
+PV = "3.10+git${SRCPV}"
 
 SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
            file://0001-criu-Fix-toolchain-hardcode.patch \
@@ -67,12 +67,12 @@ do_compile_prepend() {
 }
 
 do_compile () {
-	oe_runmake
+	oe_runmake FULL_PYTHON=${PYTHON} PYTHON=python2
 }
 
 do_install () {
     export INSTALL_LIB="${libdir}/${PYTHON_DIR}/site-packages"
-    oe_runmake PREFIX=${exec_prefix} LIBDIR=${libdir} DESTDIR="${D}" install
+    oe_runmake PREFIX=${exec_prefix} LIBDIR=${libdir} DESTDIR="${D}" FULL_PYTHON=${PYTHON} PYTHON=python2 install
 }
 
 FILES_${PN} += "${systemd_unitdir}/ \
diff --git a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
index d1f136c..838cbdc 100644
--- a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
+++ b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
@@ -33,7 +33,7 @@ diff --git a/scripts/nmk/scripts/include.mk b/scripts/nmk/scripts/include.mk
 index 04ccb3a..0d63bc7 100644
 --- a/scripts/nmk/scripts/include.mk
 +++ b/scripts/nmk/scripts/include.mk
-@@ -20,7 +20,7 @@ SUBARCH := $(shell uname -m | sed       \
+@@ -22,7 +22,7 @@ SUBARCH := $(shell uname -m | sed       \
                  -e s/aarch64.*/aarch64/)
  
  ARCH		?= $(SUBARCH)
@@ -46,7 +46,7 @@ diff --git a/scripts/nmk/scripts/tools.mk b/scripts/nmk/scripts/tools.mk
 index 56dba84..1698821 100644
 --- a/scripts/nmk/scripts/tools.mk
 +++ b/scripts/nmk/scripts/tools.mk
-@@ -2,30 +2,30 @@ ifndef ____nmk_defined__tools
+@@ -2,31 +2,31 @@ ifndef ____nmk_defined__tools
  
  #
  # System tools shorthands
@@ -68,9 +68,7 @@ index 56dba84..1698821 100644
 -MKDIR		:= mkdir -p
 -AWK		:= awk
 -PERL		:= perl
--PYTHON		:= python
--FIND		:= find
--SH		:= $(shell if [ -x "$$BASH" ]; then echo $$BASH;        \
+-FULL_PYTHON	:= $(shell which python2 2>/dev/null || which python3 2>/dev/null)
 +CC		?= $(CROSS_COMPILE)$(HOSTCC)
 +CPP		?= $(CC) -E
 +AS		?= $(CROSS_COMPILE)as
@@ -83,7 +81,10 @@ index 56dba84..1698821 100644
 +MKDIR		?= mkdir -p
 +AWK		?= awk
 +PERL		?= perl
-+PYTHON		?= python
++FULL_PYTHON	?= $(shell which python2 2>/dev/null || which python3 2>/dev/null)
+ PYTHON		?= $(shell basename $(FULL_PYTHON))
+-FIND		:= find
+-SH		:= $(shell if [ -x "$$BASH" ]; then echo $$BASH;        \
 +FIND		?= find
 +SH		?= $(shell if [ -x "$$BASH" ]; then echo $$BASH;        \
                          else if [ -x /bin/bash ]; then echo /bin/bash;  \
diff --git a/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch b/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
index 59e7bcb..70ccb28 100644
--- a/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
+++ b/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
@@ -17,12 +17,12 @@ diff --git a/lib/Makefile b/lib/Makefile
 index b1bb057..06f5c5d 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -56,7 +56,7 @@ install: lib-c lib-py crit/crit lib/c/criu.pc.in
+@@ -53,7 +53,7 @@ install: lib-c lib-py crit/crit lib/c/criu.pc.in
  	$(Q) sed -e 's,@version@,$(CRIU_VERSION),' -e 's,@libdir@,$(LIBDIR),' -e 's,@includedir@,$(dir $(INCLUDEDIR)/criu/),' lib/c/criu.pc.in > lib/c/criu.pc
  	$(Q) install -m 644 lib/c/criu.pc $(DESTDIR)$(LIBDIR)/pkgconfig
  	$(E) "  INSTALL " crit
--	$(Q) $(PYTHON_BIN) scripts/crit-setup.py install --prefix=$(DESTDIR)$(PREFIX) --record $(CRIT_SETUP_FILES)
-+	$(Q) $(PYTHON_BIN) scripts/crit-setup.py install --prefix=$(DESTDIR)$(PREFIX) --record $(CRIT_SETUP_FILES) --install-lib=$(DESTDIR)$(INSTALL_LIB)
+-	$(Q) $(PYTHON) scripts/crit-setup.py install --prefix=$(DESTDIR)$(PREFIX) --record $(CRIT_SETUP_FILES)
++	$(Q) $(PYTHON) scripts/crit-setup.py install --prefix=$(DESTDIR)$(PREFIX) --record $(CRIT_SETUP_FILES) --install-lib=$(DESTDIR)$(INSTALL_LIB)
  .PHONY: install
  
  uninstall:
-- 
2.7.4


