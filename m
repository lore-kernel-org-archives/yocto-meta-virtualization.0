Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FF69E00C82; Sun,  6 Sep 2015 22:39:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C66F6E00C3E
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Sep 2015 22:39:34 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t875dYgU028713
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 6 Sep 2015 22:39:34 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sun, 6 Sep 2015 22:39:34 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 7 Sep 2015 13:29:57 +0800
Message-ID: <1441603797-10160-3-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441603797-10160-1-git-send-email-jianchuan.wang@windriver.com>
References: <1441603797-10160-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] criu: upgrade 1.4 -> 1.6
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
X-List-Received-Date: Mon, 07 Sep 2015 05:39:38 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 recipes-containers/criu/criu_git.bb                | 30 ++++++++++----
 ...1-criu-Change-libraries-install-directory.patch | 48 ++++++++++++++++++++++
 2 files changed, 71 insertions(+), 7 deletions(-)
 create mode 100644 recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 2b8921f..48bcdc2 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -13,16 +13,17 @@ EXCLUDE_FROM_WORLD = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5cc804625b8b491b6b4312f0c9cb5efa"
 
-SRCREV = "bda033e1e91ac5b86afd0a9fdb9fcdd581da6185"
+SRCREV = "4c5b23e52c1dc4e3fbbc7472b92e7b1ce9d22f02"
 PR = "r0"
-PV = "1.4+git${SRCPV}"
+PV = "1.6+git${SRCPV}"
 
-SRC_URI = "git://git.criu.org/crtools.git;protocol=git \
+SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
 	   file://0001-criu-Fix-toolchain-hardcode.patch \
 	   file://0002-criu-Skip-documentation-install.patch \
+       file://0001-criu-Change-libraries-install-directory.patch \
 	  "
 
-COMPATIBLE_HOST = "(x86_64|arm).*-linux"
+COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
 DEPENDS += "protobuf-c-native protobuf-c"
 
@@ -35,8 +36,9 @@ S = "${WORKDIR}/git"
 #
 EXTRA_OEMAKE_arm += "ARCH=${CRIU_BUILD_ARCH} WERROR=0"
 EXTRA_OEMAKE_x86-64 += "ARCH=${TARGET_ARCH} WERROR=0"
+EXTRA_OEMAKE_aarch64 += "ARCH=${TARGET_ARCH} WERROR=0"
 
-EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
+EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir} INCLUDEDIR=${includedir} PIEGEN=no"
 EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unitdir}"
 
 CFLAGS += "-D__USE_GNU -D_GNU_SOURCE"
@@ -44,12 +46,26 @@ CFLAGS += "-D__USE_GNU -D_GNU_SOURCE"
 # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
 export LDFLAGS=""
 
+export BUILD_SYS
+export HOST_SYS
+
+inherit setuptools
+
+do_compile_prepend() {
+    rm -rf ${S}/protobuf/google/protobuf/descriptor.proto
+    ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/protobuf/google/protobuf/descriptor.proto
+}
+
 do_compile () {
 	oe_runmake
 }
 
 do_install () {
-	oe_runmake DESTDIR="${D}" install
+    oe_runmake PREFIX=${exec_prefix} LIBDIR=${libdir} DESTDIR="${D}" install
 }
 
-FILES_${PN} += "${systemd_unitdir}/"
+FILES_${PN} += "${systemd_unitdir}/ \
+            ${libdir}/python2.7/site-packages/ \
+            ${libdir}/pycriu/ \
+            ${libdir}/crit-0.0.1-py2.7.egg-info \
+            "
diff --git a/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch b/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
new file mode 100644
index 0000000..28d638b
--- /dev/null
+++ b/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
@@ -0,0 +1,48 @@
+From cb9933dc34af0b4d52c4584332600114ac65c402 Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Tue, 4 Aug 2015 17:45:51 +0800
+Subject: [PATCH] criu: Change libraries install directory
+
+Install the libraries into /usr/lib(/usr/lib64)
+
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ Makefile     | 2 +-
+ Makefile.inc | 9 ---------
+ 2 files changed, 1 insertion(+), 10 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7f5c890..6dbc436 100644
+--- a/Makefile
++++ b/Makefile
+@@ -351,7 +351,7 @@ install-man:
+ 
+ install-crit: crit
+ 	$(E) "  INSTALL crit"
+-	$(Q) python scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX)
++	$(Q) python scripts/crit-setup.py install --root=$(DESTDIR) --prefix=$(PREFIX) --install-lib=$(LIBDIR)
+ 
+ .PHONY: install install-man install-crit install-criu
+ 
+diff --git a/Makefile.inc b/Makefile.inc
+index 5496f41..ba70aea 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -17,14 +17,5 @@ MANDIR		:= $(PREFIX)/share/man
+ SYSTEMDUNITDIR	:= $(PREFIX)/lib/systemd/system/
+ LOGROTATEDIR	:= $(PREFIX)/etc/logrotate.d/
+ LIBDIR		:= $(PREFIX)/lib
+-# For recent Debian/Ubuntu with multiarch support
+-DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture \
+-			-qDEB_HOST_MULTIARCH 2>/dev/null)
+-ifneq "$(DEB_HOST_MULTIARCH)" ""
+-LIBDIR		:= $(PREFIX)/lib/$(DEB_HOST_MULTIARCH)
+-# For most other systems
+-else ifeq "$(shell uname -m)" "x86_64"
+-LIBDIR		:= $(PREFIX)/lib64
+-endif
+ 
+ INCLUDEDIR	:= $(PREFIX)/include/criu
+-- 
+1.9.1
+
-- 
1.9.1


