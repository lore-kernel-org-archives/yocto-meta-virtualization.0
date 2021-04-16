Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.7698.1618573130849820764
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 04:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: rameshkrishnanx.geddy.sekar@intel.com)
IronPort-SDR: 9COUoYJtrSvgadbMMKs7a9dhfD1yyQFtfTPoYb8NVKv1eOEIQYL3loPudEkqif5juOGIqO5VCb
 ODAmulDQWXXA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="194586159"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="194586159"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 04:38:49 -0700
IronPort-SDR: jERwTip0YkRUDkgMm/udw3+j/bHuLoaGArslNJXvkKpUFP3eXj1CfZ5qd9pXyidkCKmnVzL5Cw
 1cuskmXC5lmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="390023756"
Received: from gio-c697a622fbe.png.intel.com ([10.221.254.119])
  by fmsmga007.fm.intel.com with ESMTP; 16 Apr 2021 04:38:48 -0700
From: rameshkrishnanx.geddy.sekar@intel.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH] lxc-recipe: Fix compilation without seccomp when libseccomp is installed
Date: Sat, 17 Apr 2021 03:34:25 +0800
Message-Id: <20210416193425.22909-1-rameshkrishnanx.geddy.sekar@intel.com>
X-Mailer: git-send-email 2.17.1

From: RameshkrishnanX Geddy Sekar <rameshkrishnanx.geddy.sekar@intel.com>

Original URL:  https://github.com/lxc/lxc/pull/3623

Signed-off-by: RameshkrishnanX Geddy Sekar <rameshkrishnanx.geddy.sekar@intel.com>
---
 ...fix-check-for-seccomp-notify-support.patch | 42 +++++++++++++++
 ...p-libseccomp-tests-if-it-is-disabled.patch | 51 +++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.6.bb           |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
 create mode 100644 recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch

diff --git a/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch b/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
new file mode 100644
index 0000000..ed6cf7f
--- /dev/null
+++ b/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
@@ -0,0 +1,42 @@
+From a342b11fedb3010630de4909ca707ebdc0862060 Mon Sep 17 00:00:00 2001
+From: Eneas U de Queiroz <cotequeiroz@gmail.com>
+Date: Fri, 25 Dec 2020 13:54:14 -0300
+Subject: [PATCH] commands: fix check for seccomp notify support
+
+Use HAVE_SECCOMP_NOTIFY instead of HAVE_DECL_SECCOMP_NOTIFY_FD.
+Currently the latter will be true if the declaration is found by
+configure, even if 'configure --disable-seccomp' is used.
+
+HAVE_SECCOMP_NOTIFY is defined in lxcseccomp.h if both HAVE_SECCOMP and
+HAVE_DECL_SECCOMP_NOTIFY_FD are true, which is the correct behavior.
+
+Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
+---
+ src/lxc/commands.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lxc/commands.c b/src/lxc/commands.c
+index a9a03ca2c..37d1abcef 100644
+--- a/src/lxc/commands.c
++++ b/src/lxc/commands.c
+@@ -501,7 +501,7 @@ static int lxc_cmd_get_devpts_fd_callback(int fd, struct lxc_cmd_req *req,
+ 
+ int lxc_cmd_get_seccomp_notify_fd(const char *name, const char *lxcpath)
+ {
+-#if HAVE_DECL_SECCOMP_NOTIFY_FD
++#ifdef HAVE_SECCOMP_NOTIFY
+ 	int ret, stopped;
+ 	struct lxc_cmd_rr cmd = {
+ 		.req = {
+@@ -526,7 +526,7 @@ static int lxc_cmd_get_seccomp_notify_fd_callback(int fd, struct lxc_cmd_req *re
+ 						  struct lxc_handler *handler,
+ 						  struct lxc_epoll_descr *descr)
+ {
+-#if HAVE_DECL_SECCOMP_NOTIFY_FD
++#ifdef HAVE_SECCOMP_NOTIFY
+ 	struct lxc_cmd_rsp rsp = {
+ 		.ret = 0,
+ 	};
+-- 
+2.17.1
+
diff --git a/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch b/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch
new file mode 100644
index 0000000..7ba992f
--- /dev/null
+++ b/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch
@@ -0,0 +1,51 @@
+From 67cd8bde2d46983df8fa9f647e9fc0b96370ec29 Mon Sep 17 00:00:00 2001
+From: Eneas U de Queiroz <cotequeiroz@gmail.com>
+Date: Sat, 16 Jan 2021 13:54:07 -0300
+Subject: [PATCH] configure: skip libseccomp tests if it is disabled
+
+Move the block checking for libseccomp api compatibility inside
+AM_COND_IF([ENABLE_SECCOMP] ... ).
+
+Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
+---
+ configure.ac | 17 ++++++++---------
+ 1 file changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f58487f5d..ce6363136 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -312,6 +312,14 @@ AM_COND_IF([ENABLE_SECCOMP],
+ 		AC_CHECK_LIB([seccomp], [seccomp_init],[],[AC_MSG_ERROR([You must install the seccomp development package in order to compile lxc])])
+ 		AC_SUBST([SECCOMP_LIBS], [-lseccomp])
+ 		])
++	# HAVE_SCMP_FILTER_CTX=1 will tell us we have libseccomp api >= 1.0.0
++	OLD_CFLAGS="$CFLAGS"
++	CFLAGS="$CFLAGS $SECCOMP_CFLAGS"
++	AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include <seccomp.h>]])
++	AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#include <seccomp.h>]])
++	AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [], [[#include <seccomp.h>]])
++	AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], [], [], [[#include <seccomp.h>]])
++	CFLAGS="$OLD_CFLAGS"
+ 	])
+ 
+ AC_MSG_CHECKING(for static libcap)
+@@ -359,15 +367,6 @@ AM_COND_IF([ENABLE_CAP],
+         AC_CHECK_LIB(cap,cap_get_file, AC_DEFINE(LIBCAP_SUPPORTS_FILE_CAPABILITIES,1,[Have cap_get_file]),[],[])
+         AC_SUBST([CAP_LIBS], [-lcap])])
+ 
+-# HAVE_SCMP_FILTER_CTX=1 will tell us we have libseccomp api >= 1.0.0
+-OLD_CFLAGS="$CFLAGS"
+-CFLAGS="$CFLAGS $SECCOMP_CFLAGS"
+-AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include <seccomp.h>]])
+-AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#include <seccomp.h>]])
+-AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [], [[#include <seccomp.h>]])
+-AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], [], [], [[#include <seccomp.h>]])
+-CFLAGS="$OLD_CFLAGS"
+-
+ AC_CHECK_HEADERS([linux/bpf.h], [
+ 	AC_CHECK_TYPES([struct bpf_cgroup_dev_ctx], [], [], [[#include <linux/bpf.h>]])
+ ], [], [])
+-- 
+2.17.1
+
diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/lxc_4.0.6.bb
index b422909..c9bf3d0 100644
--- a/recipes-containers/lxc/lxc_4.0.6.bb
+++ b/recipes-containers/lxc/lxc_4.0.6.bb
@@ -49,6 +49,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://tests-add-no-validate-when-using-download-template.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
+	file://configure-skip-libseccomp-tests-if-it-is-disabled.patch \
+	file://commands-fix-check-for-seccomp-notify-support.patch \
 	"
 
 SRC_URI[md5sum] = "732571c7cb4ab845068afb227bf35256"
-- 
2.17.1

