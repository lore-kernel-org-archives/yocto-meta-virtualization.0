Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6EF76E009A5; Thu,  2 Feb 2017 09:01:32 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C0B5E00992
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Feb 2017 09:01:24 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v12H1Kwo029453
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 2 Feb 2017 09:01:20 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Feb 2017 09:01:19 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Thu, 2 Feb 2017 12:01:13 -0500
Message-ID: <1486054873-28581-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] lxc: fixup builds with newer glibc
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
X-List-Received-Date: Thu, 02 Feb 2017 17:01:32 -0000
Content-Type: text/plain

The poky/oe-core commit [glibc: Upgrade to 2.25 snapshot] brought with
it a change that has apparently been in the works for a while, to move
major() and minor() definitions from <sys/types.h> to
<sys/sysmacros.h>. This version of glibc took the step of adding a
warning about this change which results in the build failure of lxc
since we build with -Werror:

  | lxclvm.c:139:13: error: In the GNU C Library, "major" is defined
  |  by <sys/sysmacros.h>. For historical compatibility, it is
  |  currently defined by <sys/types.h> as well, but we plan to
  |  remove this soon. To use "major", include <sys/sysmacros.h>
  |  directly. If you did not intend to use a system-defined macro
  |  "major", you should undefine it after including <sys/types.h>. [-Werror]
  |     major(statbuf.st_rdev), minor(statbuf.st_rdev));
  |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Instead of dropping -Werror we are opting instead to apply the
upstream fix for this since it is available and applies relatively
cleanly.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...EADER_MAJOR-to-detect-major-minor-makedev.patch | 119 +++++++++++++++++++++
 recipes-containers/lxc/lxc_2.0.0.bb                |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch

diff --git a/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch b/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
new file mode 100644
index 0000000..f9cecc0
--- /dev/null
+++ b/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
@@ -0,0 +1,119 @@
+From 5c957671a511441b112b137b88bf0b1f31adac20 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <siarheit@google.com>
+Date: Sat, 21 Jan 2017 11:57:13 +0000
+Subject: [PATCH] Use AC_HEADER_MAJOR to detect major()/minor()/makedev()
+
+commit af6824fce9c9536fbcabef8d5547f6c486f55fdf from
+git://github.com/lxc/lxc.git
+
+Before the change build failed on Gentoo as:
+
+  bdev/lxclvm.c: In function 'lvm_detect':
+  bdev/lxclvm.c:140:4: error: implicit declaration of function 'major' [-Werror=implicit-function-declaration]
+    major(statbuf.st_rdev), minor(statbuf.st_rdev));
+    ^~~~~
+  bdev/lxclvm.c:140:28: error: implicit declaration of function 'minor' [-Werror=implicit-function-declaration]
+    major(statbuf.st_rdev), minor(statbuf.st_rdev));
+                            ^~~~~
+
+glibc plans to remove <sys/sysmacros.h> from glibc's <sys/types.h>:
+    https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html
+
+Gentoo already applied glibc patch to experimental glibc-2.24
+to start preparingfor the change.
+
+Autoconf has AC_HEADER_MAJOR to find out which header defines
+reqiured macros:
+    https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Particular-Headers.html
+
+This change should also increase portability across other libcs.
+
+Bug: https://bugs.gentoo.org/604360
+Signed-off-by: Sergei Trofimovich <siarheit@google.com>
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ configure.ac           | 3 +++
+ src/lxc/bdev/lxclvm.c  | 9 +++++++++
+ src/lxc/conf.c         | 8 ++++++++
+ src/lxc/lxccontainer.c | 8 ++++++++
+ 4 files changed, 28 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8f31c29..924baa1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -601,6 +601,9 @@ AC_CHECK_DECLS([PR_CAPBSET_DROP], [], [], [#include <sys/prctl.h>])
+ # Check for some headers
+ AC_CHECK_HEADERS([sys/signalfd.h pty.h ifaddrs.h sys/capability.h sys/personality.h utmpx.h sys/timerfd.h])
+ 
++# lookup major()/minor()/makedev()
++AC_HEADER_MAJOR
++
+ # Check for some syscalls functions
+ AC_CHECK_FUNCS([setns pivot_root sethostname unshare rand_r confstr faccessat])
+ 
+diff --git a/src/lxc/bdev/lxclvm.c b/src/lxc/bdev/lxclvm.c
+index 3d41b10..419d1c2 100644
+--- a/src/lxc/bdev/lxclvm.c
++++ b/src/lxc/bdev/lxclvm.c
+@@ -32,10 +32,19 @@
+ #include <sys/wait.h>
+ 
+ #include "bdev.h"
++#include "config.h"
+ #include "log.h"
+ #include "lxclvm.h"
+ #include "utils.h"
+ 
++/* major()/minor() */
++#ifdef MAJOR_IN_MKDEV
++#    include <sys/mkdev.h>
++#endif
++#ifdef MAJOR_IN_SYSMACROS
++#    include <sys/sysmacros.h>
++#endif
++
+ lxc_log_define(lxclvm, lxc);
+ 
+ extern char *dir_new_path(char *src, const char *oldname, const char *name,
+diff --git a/src/lxc/conf.c b/src/lxc/conf.c
+index 3b023ef..53406ca 100644
+--- a/src/lxc/conf.c
++++ b/src/lxc/conf.c
+@@ -39,6 +39,14 @@
+ #include <grp.h>
+ #include <time.h>
+ 
++/* makedev() */
++#ifdef MAJOR_IN_MKDEV
++#    include <sys/mkdev.h>
++#endif
++#ifdef MAJOR_IN_SYSMACROS
++#    include <sys/sysmacros.h>
++#endif
++
+ #ifdef HAVE_STATVFS
+ #include <sys/statvfs.h>
+ #endif
+diff --git a/src/lxc/lxccontainer.c b/src/lxc/lxccontainer.c
+index 9f12ca2..aa02833 100644
+--- a/src/lxc/lxccontainer.c
++++ b/src/lxc/lxccontainer.c
+@@ -61,6 +61,14 @@
+ #include "utils.h"
+ #include "version.h"
+ 
++/* major()/minor() */
++#ifdef MAJOR_IN_MKDEV
++#    include <sys/mkdev.h>
++#endif
++#ifdef MAJOR_IN_SYSMACROS
++#    include <sys/sysmacros.h>
++#endif
++
+ #if HAVE_IFADDRS_H
+ #include <ifaddrs.h>
+ #else
+-- 
+2.7.4
+
diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.0.bb
index dcbd171..f34d9bc 100644
--- a/recipes-containers/lxc/lxc_2.0.0.bb
+++ b/recipes-containers/lxc/lxc_2.0.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-fix-B-S.patch \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
+	file://Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch \
 	"
 
 SRC_URI[md5sum] = "04a7245a614cd3296b0ae9ceeeb83fbb"
-- 
2.7.4


