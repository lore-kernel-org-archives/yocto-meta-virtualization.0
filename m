Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7AA9E00B67; Thu,  1 Jun 2017 23:14:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 64 seconds by postgrey-1.32 at yocto-www;
	Thu, 01 Jun 2017 23:14:51 PDT
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9982E00B5C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  1 Jun 2017 23:14:51 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19577151"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jun 2017 14:13:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D4C0C47C6531
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Jun 2017 14:13:39 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 2 Jun 2017 14:13:39 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 2 Jun 2017 14:13:22 +0800
Message-ID: <1496384002-11812-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: D4C0C47C6531.AA008
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [PATCH] lxc: 2.0.0 -> 2.0.8
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
X-List-Received-Date: Fri, 02 Jun 2017 06:14:56 -0000
Content-Type: text/plain

1) Upgrade lxc from 2.0.0 to 2.0.8.
2) Delete two patches, since it is integrated upstream.
   Generate-lxc-restore-net-properly.patch
   Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
3) Modify two patches, since the data has been changed.
   automake-ensure-VPATH-builds-correctly.patch
   runtest.patch
4) Add new patch "glibc.patch".

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../files/Generate-lxc-restore-net-properly.patch  | 121 ---------------------
 ...EADER_MAJOR-to-detect-major-minor-makedev.patch | 119 --------------------
 .../automake-ensure-VPATH-builds-correctly.patch   |   2 +-
 recipes-containers/lxc/files/glibc.patch           |  33 ++++++
 recipes-containers/lxc/files/runtest.patch         |   2 +-
 .../lxc/{lxc_2.0.0.bb => lxc_2.0.8.bb}             |  31 +++---
 6 files changed, 48 insertions(+), 260 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
 delete mode 100644 recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
 create mode 100644 recipes-containers/lxc/files/glibc.patch
 rename recipes-containers/lxc/{lxc_2.0.0.bb => lxc_2.0.8.bb} (87%)

diff --git a/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch b/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
deleted file mode 100644
index 5adb730..0000000
--- a/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From e08f3573b3561f1f0490624f7ca95b7ccd8157cb Mon Sep 17 00:00:00 2001
-Message-Id: <e08f3573b3561f1f0490624f7ca95b7ccd8157cb.1435177418.git.Jim.Somerville@windriver.com>
-From: Jim Somerville <Jim.Somerville@windriver.com>
-Date: Wed, 24 Jun 2015 16:16:38 -0400
-Subject: [PATCH 1/1] Generate lxc-restore-net properly
-
-It's a script that should be run through the configure
-mechanism the same as the others.  We simply rename it
-to have a .in extension and add it to configure.ac .
-
-Also, by generating the script from a .in file, it gets
-placed into the build directory.  This plays nice with
-build systems that keep the src separate from the build
-directory.  Without this change, the install step won't
-find the lxc-restore-net script as it still just resides
-in the src directory and not in the build directory.
-
-Upstream-Status: Not applicable.  This script has already
-been rearchitected out of existence by
-cba98d127bf490b018a016b792ae05fd2d29c5ee:
-"c/r: use criu option instead of lxc-restore-net
-
-As of criu 1.5, the --veth-pair argument supports an additional parameter that
-is the bridge name to attach to. This enables us to get rid of the goofy
-action-script hack that passed bridge names as environment variables.
-
-This patch is on top of the systemd/lxcfs mount rework patch, as we probably
-want to wait to use 1.5 options until it has been out for a while and is in
-distros.
-
-Signed-off-by: Tycho Andersen <tycho.andersen@canonical.com>
-Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>"
-
-Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
----
- configure.ac               |  1 +
- src/lxc/lxc-restore-net    | 26 --------------------------
- src/lxc/lxc-restore-net.in | 26 ++++++++++++++++++++++++++
- 3 files changed, 27 insertions(+), 26 deletions(-)
- delete mode 100755 src/lxc/lxc-restore-net
- create mode 100755 src/lxc/lxc-restore-net.in
-
-diff --git a/configure.ac b/configure.ac
-index 574b2cd..4972803 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -768,6 +768,7 @@ AC_CONFIG_FILES([
- 	src/lxc/legacy/lxc-ls
- 	src/lxc/lxc.functions
- 	src/lxc/version.h
-+	src/lxc/lxc-restore-net
- 	src/python-lxc/Makefile
- 	src/python-lxc/setup.py
- 
-diff --git a/src/lxc/lxc-restore-net b/src/lxc/lxc-restore-net
-deleted file mode 100755
-index 6ae3c19..0000000
---- a/src/lxc/lxc-restore-net
-+++ /dev/null
-@@ -1,26 +0,0 @@
--#!/bin/sh
--
--set -e
--
--i=0
--while true; do
--	eval "bridge=\$LXC_CRIU_BRIDGE$i"
--	eval "veth=\$LXC_CRIU_VETH$i"
--
--	if [ -z "$bridge" ] || [ -z "$veth" ]; then
--		exit 0
--	fi
--
--	if [ "$CRTOOLS_SCRIPT_ACTION" = "network-lock" ]; then
--		brctl delif $bridge $veth
--	fi
--
--	if [ "$CRTOOLS_SCRIPT_ACTION" = "network-unlock" ]; then
--		brctl addif $bridge $veth
--		ip link set dev $veth up
--	fi
--
--	i=$((i+1))
--done
--
--exit 1
-diff --git a/src/lxc/lxc-restore-net.in b/src/lxc/lxc-restore-net.in
-new file mode 100755
-index 0000000..6ae3c19
---- /dev/null
-+++ b/src/lxc/lxc-restore-net.in
-@@ -0,0 +1,26 @@
-+#!/bin/sh
-+
-+set -e
-+
-+i=0
-+while true; do
-+	eval "bridge=\$LXC_CRIU_BRIDGE$i"
-+	eval "veth=\$LXC_CRIU_VETH$i"
-+
-+	if [ -z "$bridge" ] || [ -z "$veth" ]; then
-+		exit 0
-+	fi
-+
-+	if [ "$CRTOOLS_SCRIPT_ACTION" = "network-lock" ]; then
-+		brctl delif $bridge $veth
-+	fi
-+
-+	if [ "$CRTOOLS_SCRIPT_ACTION" = "network-unlock" ]; then
-+		brctl addif $bridge $veth
-+		ip link set dev $veth up
-+	fi
-+
-+	i=$((i+1))
-+done
-+
-+exit 1
--- 
-1.8.3.2
-
diff --git a/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch b/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
deleted file mode 100644
index f9cecc0..0000000
--- a/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 5c957671a511441b112b137b88bf0b1f31adac20 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <siarheit@google.com>
-Date: Sat, 21 Jan 2017 11:57:13 +0000
-Subject: [PATCH] Use AC_HEADER_MAJOR to detect major()/minor()/makedev()
-
-commit af6824fce9c9536fbcabef8d5547f6c486f55fdf from
-git://github.com/lxc/lxc.git
-
-Before the change build failed on Gentoo as:
-
-  bdev/lxclvm.c: In function 'lvm_detect':
-  bdev/lxclvm.c:140:4: error: implicit declaration of function 'major' [-Werror=implicit-function-declaration]
-    major(statbuf.st_rdev), minor(statbuf.st_rdev));
-    ^~~~~
-  bdev/lxclvm.c:140:28: error: implicit declaration of function 'minor' [-Werror=implicit-function-declaration]
-    major(statbuf.st_rdev), minor(statbuf.st_rdev));
-                            ^~~~~
-
-glibc plans to remove <sys/sysmacros.h> from glibc's <sys/types.h>:
-    https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html
-
-Gentoo already applied glibc patch to experimental glibc-2.24
-to start preparingfor the change.
-
-Autoconf has AC_HEADER_MAJOR to find out which header defines
-reqiured macros:
-    https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Particular-Headers.html
-
-This change should also increase portability across other libcs.
-
-Bug: https://bugs.gentoo.org/604360
-Signed-off-by: Sergei Trofimovich <siarheit@google.com>
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- configure.ac           | 3 +++
- src/lxc/bdev/lxclvm.c  | 9 +++++++++
- src/lxc/conf.c         | 8 ++++++++
- src/lxc/lxccontainer.c | 8 ++++++++
- 4 files changed, 28 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 8f31c29..924baa1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -601,6 +601,9 @@ AC_CHECK_DECLS([PR_CAPBSET_DROP], [], [], [#include <sys/prctl.h>])
- # Check for some headers
- AC_CHECK_HEADERS([sys/signalfd.h pty.h ifaddrs.h sys/capability.h sys/personality.h utmpx.h sys/timerfd.h])
- 
-+# lookup major()/minor()/makedev()
-+AC_HEADER_MAJOR
-+
- # Check for some syscalls functions
- AC_CHECK_FUNCS([setns pivot_root sethostname unshare rand_r confstr faccessat])
- 
-diff --git a/src/lxc/bdev/lxclvm.c b/src/lxc/bdev/lxclvm.c
-index 3d41b10..419d1c2 100644
---- a/src/lxc/bdev/lxclvm.c
-+++ b/src/lxc/bdev/lxclvm.c
-@@ -32,10 +32,19 @@
- #include <sys/wait.h>
- 
- #include "bdev.h"
-+#include "config.h"
- #include "log.h"
- #include "lxclvm.h"
- #include "utils.h"
- 
-+/* major()/minor() */
-+#ifdef MAJOR_IN_MKDEV
-+#    include <sys/mkdev.h>
-+#endif
-+#ifdef MAJOR_IN_SYSMACROS
-+#    include <sys/sysmacros.h>
-+#endif
-+
- lxc_log_define(lxclvm, lxc);
- 
- extern char *dir_new_path(char *src, const char *oldname, const char *name,
-diff --git a/src/lxc/conf.c b/src/lxc/conf.c
-index 3b023ef..53406ca 100644
---- a/src/lxc/conf.c
-+++ b/src/lxc/conf.c
-@@ -39,6 +39,14 @@
- #include <grp.h>
- #include <time.h>
- 
-+/* makedev() */
-+#ifdef MAJOR_IN_MKDEV
-+#    include <sys/mkdev.h>
-+#endif
-+#ifdef MAJOR_IN_SYSMACROS
-+#    include <sys/sysmacros.h>
-+#endif
-+
- #ifdef HAVE_STATVFS
- #include <sys/statvfs.h>
- #endif
-diff --git a/src/lxc/lxccontainer.c b/src/lxc/lxccontainer.c
-index 9f12ca2..aa02833 100644
---- a/src/lxc/lxccontainer.c
-+++ b/src/lxc/lxccontainer.c
-@@ -61,6 +61,14 @@
- #include "utils.h"
- #include "version.h"
- 
-+/* major()/minor() */
-+#ifdef MAJOR_IN_MKDEV
-+#    include <sys/mkdev.h>
-+#endif
-+#ifdef MAJOR_IN_SYSMACROS
-+#    include <sys/sysmacros.h>
-+#endif
-+
- #if HAVE_IFADDRS_H
- #include <ifaddrs.h>
- #else
--- 
-2.7.4
-
diff --git a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
index 2b5c853..61c0e29 100644
--- a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
+++ b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
@@ -15,7 +15,7 @@ index d74c10d..6225f78 100644
 @@ -66,7 +66,7 @@ buildtest-TESTS: $(TESTS)
  install-ptest:
  	install -d $(TEST_DIR)
- 	install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
+ 	install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
 -	install -D ../../config/test-driver $(TEST_DIR)/../../config/test-driver
 +	install -D $(top_srcdir)/config/test-driver $(TEST_DIR)/../../config/test-driver
  	cp Makefile $(TEST_DIR)
diff --git a/recipes-containers/lxc/files/glibc.patch b/recipes-containers/lxc/files/glibc.patch
new file mode 100644
index 0000000..5beb6e1
--- /dev/null
+++ b/recipes-containers/lxc/files/glibc.patch
@@ -0,0 +1,33 @@
+diff -uNr lxc-2.0.5.orig/src/lxc/bdev/lxclvm.c lxc-2.0.5/src/lxc/bdev/lxclvm.c
+--- lxc-2.0.5.orig/src/lxc/bdev/lxclvm.c	2016-10-05 11:47:41.000000000 +0200
++++ lxc-2.0.5/src/lxc/bdev/lxclvm.c	2017-02-03 19:45:06.461468704 +0100
+@@ -30,6 +30,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/wait.h>
++#include <sys/sysmacros.h>
+ 
+ #include "bdev.h"
+ #include "log.h"
+diff -uNr lxc-2.0.5.orig/src/lxc/conf.c lxc-2.0.5/src/lxc/conf.c
+--- lxc-2.0.5.orig/src/lxc/conf.c	2016-10-05 11:47:41.000000000 +0200
++++ lxc-2.0.5/src/lxc/conf.c	2017-02-03 19:45:09.990469005 +0100
+@@ -35,6 +35,7 @@
+ #include <sys/wait.h>
+ #include <sys/syscall.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <pwd.h>
+ #include <grp.h>
+ #include <time.h>
+diff -uNr lxc-2.0.5.orig/src/lxc/lxccontainer.c lxc-2.0.5/src/lxc/lxccontainer.c
+--- lxc-2.0.5.orig/src/lxc/lxccontainer.c	2016-10-05 11:47:41.000000000 +0200
++++ lxc-2.0.5/src/lxc/lxccontainer.c	2017-02-03 19:44:57.093467907 +0100
+@@ -36,6 +36,7 @@
+ #include <sys/mount.h>
+ #include <sys/syscall.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/wait.h>
+ 
+ #include "attach.h"
diff --git a/recipes-containers/lxc/files/runtest.patch b/recipes-containers/lxc/files/runtest.patch
index e4e034b..6572265 100644
--- a/recipes-containers/lxc/files/runtest.patch
+++ b/recipes-containers/lxc/files/runtest.patch
@@ -19,7 +19,7 @@ diff -uNr a/src/tests/Makefile.am b/src/tests/Makefile.am
 +
 +install-ptest:
 +	install -d $(TEST_DIR)
-+	install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
++	install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
 +	install -D ../../config/test-driver $(TEST_DIR)/../../config/test-driver
 +	cp Makefile $(TEST_DIR)
 +	@(for file in $(TESTS); do install $$file $(TEST_DIR);  done;)
diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.8.bb
similarity index 87%
rename from recipes-containers/lxc/lxc_2.0.0.bb
rename to recipes-containers/lxc/lxc_2.0.8.bb
index c98d1a7..80c8da7 100644
--- a/recipes-containers/lxc/lxc_2.0.0.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspac
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-PRIORITY = "optional"
 DEPENDS = "libxml2 libcap"
 RDEPENDS_${PN} = " \
 		rsync \
@@ -10,7 +9,6 @@ RDEPENDS_${PN} = " \
 		libcap-bin \
 		bridge-utils \
 		dnsmasq \
-		initscripts \
 		perl-module-strict \
 		perl-module-getopt-long \
 		perl-module-vars \
@@ -20,11 +18,7 @@ RDEPENDS_${PN} = " \
 		perl-module-overload \
 		perl-module-exporter-heavy \
 "
-RDEPENDS_${PN}_append_libc-glibc = "\
-		glibc-utils \
-"
-
-RDEPENDS_${PN}-ptest += "file make"
+RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls"
 
 SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
@@ -34,11 +28,10 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-fix-B-S.patch \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
-	file://Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch \
 	"
 
-SRC_URI[md5sum] = "04a7245a614cd3296b0ae9ceeeb83fbb"
-SRC_URI[sha256sum] = "5b737e114d8ef1feb193fba936d77a5697a7c8a10199a068cdd90d1bd27c10e4"
+SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
+SRC_URI[sha256sum] = "0d8e34b302cfe4c40c6c9ae5097096aa5cc2c1dfceea3f0f22e3e16c4a4e8494"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
@@ -87,19 +80,21 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
 FILES_${PN} += "${docdir}"
 FILES_${PN} += "${libdir}/python3*"
-FILES_${PN} += "${datadir}/lua/*"
-FILES_${PN} += "${libdir}/lua/lxc/*"
-FILES_${PN}-dbg += "${libdir}/lua/lxc/.debug"
-FILES_${PN}-dbg += "${libexecdir}/lxc/.debug ${libexecdir}/lxc/hooks/.debug"
-PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
+FILES_${PN} += "${datadir}/bash-completion"
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
+FILES_${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
+PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking ${PN}-lua"
+FILES_lua-${PN} = "${datadir}/lua ${libdir}/lua"
+FILES_lua-${PN}-dbg += "${libdir}/lua/lxc/.debug"
 FILES_${PN}-templates += "${datadir}/lxc/templates"
 RDEPENDS_${PN}-templates += "bash"
 
 ALLOW_EMPTY_${PN}-networking = "1"
 
-FILES_${PN}-setup += "${sysconfdir}/tmpfiles.d"
-FILES_${PN}-setup += "${systemd_system_unitdir}"
-FILES_${PN}-setup += "${sysconfdir}/init.d"
+FILES_${PN}-setup += "/etc/tmpfiles.d"
+FILES_${PN}-setup += "/lib/systemd/system"
+FILES_${PN}-setup += "/usr/lib/systemd/system"
+FILES_${PN}-setup += "/etc/init.d"
 
 PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
 
-- 
2.7.4




