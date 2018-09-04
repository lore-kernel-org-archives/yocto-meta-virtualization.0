Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 060FFE0079D; Mon,  3 Sep 2018 19:58:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A776BE00726
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Sep 2018 19:58:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w842w2bB019399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 3 Sep 2018 19:58:03 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Sep 2018 19:58:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 4 Sep 2018 10:47:46 +0800
Message-ID: <1536029271-11750-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/6] nagios-core: add recipe with latest stable version 4.4.2
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
X-List-Received-Date: Tue, 04 Sep 2018 02:58:07 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/nagios/nagios-common.inc          |  26 ++++
 .../nagios-core/0001-fix-autoheader-error.patch    |  63 +++++++++
 ...0001-fix-compile-error-of-missing-headers.patch |  75 ++++++++++
 .../nagios-core/0001-fix-segment-fault.patch       |  54 ++++++++
 .../nagios-core/eventhandlers_nagioscmd_path.patch |  73 ++++++++++
 .../nagios-core/nagios-core-systemd-volatile.conf  |   2 +
 .../nagios/nagios-core/nagios-core.service         |  18 +++
 recipes-extended/nagios/nagios-core/volatiles      |   2 +
 recipes-extended/nagios/nagios-core_4.4.2.bb       | 151 +++++++++++++++++++++
 9 files changed, 464 insertions(+)
 create mode 100644 recipes-extended/nagios/nagios-common.inc
 create mode 100644 recipes-extended/nagios/nagios-core/0001-fix-autoheader-error.patch
 create mode 100644 recipes-extended/nagios/nagios-core/0001-fix-compile-error-of-missing-headers.patch
 create mode 100644 recipes-extended/nagios/nagios-core/0001-fix-segment-fault.patch
 create mode 100644 recipes-extended/nagios/nagios-core/eventhandlers_nagioscmd_path.patch
 create mode 100644 recipes-extended/nagios/nagios-core/nagios-core-systemd-volatile.conf
 create mode 100644 recipes-extended/nagios/nagios-core/nagios-core.service
 create mode 100644 recipes-extended/nagios/nagios-core/volatiles
 create mode 100644 recipes-extended/nagios/nagios-core_4.4.2.bb

diff --git a/recipes-extended/nagios/nagios-common.inc b/recipes-extended/nagios/nagios-common.inc
new file mode 100644
index 0000000..c173041
--- /dev/null
+++ b/recipes-extended/nagios/nagios-common.inc
@@ -0,0 +1,26 @@
+NAGIOS_CONF_DIR = "${sysconfdir}/nagios"
+NAGIOS_PLUGIN_DIR = "${libdir}/nagios/plugins"
+NAGIOS_PLUGIN_CONF_DIR = "${NAGIOS_CONF_DIR}/plugins"
+NAGIOS_STATE_DIR = "${localstatedir}/nagios"
+
+NAGIOS_USER = "nagios"
+NAGIOS_GROUP = "nagios"
+
+EXTRA_OECONF += "--sysconfdir=${NAGIOS_CONF_DIR} \
+                 --libexecdir=${NAGIOS_PLUGIN_DIR} \
+                 --localstatedir=${NAGIOS_STATE_DIR} \
+"
+
+FILES_${PN}-dbg += "${NAGIOS_PLUGIN_DIR}/.debug"
+
+DEPENDS = "nagios-core"
+
+COMPATIBLE_HOST_aarch64 = "null"
+
+inherit useradd
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r ${NAGIOS_GROUP}; -r nagcmd"
+USERADD_PARAM_${PN} = "-r -M -g ${NAGIOS_GROUP} ${NAGIOS_USER}"
+
+FILESYSTEM_PERMS_TABLES_append = " files/fs-perms-nagios.txt"
diff --git a/recipes-extended/nagios/nagios-core/0001-fix-autoheader-error.patch b/recipes-extended/nagios/nagios-core/0001-fix-autoheader-error.patch
new file mode 100644
index 0000000..014ed1d
--- /dev/null
+++ b/recipes-extended/nagios/nagios-core/0001-fix-autoheader-error.patch
@@ -0,0 +1,63 @@
+From 3c51d942f6da08045351ce61cc7f426fa0855489 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 31 Aug 2018 10:51:36 +0800
+Subject: [PATCH] fix autoheader error
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 17e436d..16b3e71 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -388,7 +388,7 @@ AC_ARG_WITH(iobroker,
+ case $IOBROKER_METHOD in
+ epoll*)
+ 	if test "$GLIBC_NEWER_2_4" -eq 1 -a "x$ac_cv_header_sys_epoll_h" = "xyes"; then
+-		AC_DEFINE([IOBROKER_USES_EPOLL])
++		AC_DEFINE([IOBROKER_USES_EPOLL], [1], [iobroker uses epoll])
+ 	else
+ 		echo "\"epoll\" is not available as an iobroker method."
+ 		echo "Please use one of the other options."
+@@ -397,7 +397,7 @@ epoll*)
+ 	;;
+ poll*)
+ 	if test "x$ac_cv_header_sys_poll_h" = "xyes" -o "x$ac_cv_header_poll_h" = "xyes"; then
+-		AC_DEFINE([IOBROKER_USES_POLL])
++		AC_DEFINE([IOBROKER_USES_POLL], [1], [iobroker uses poll])
+ 	else
+ 		echo "\"poll\" is not available as an iobroker method."
+ 		echo "Please use one of the other options."
+@@ -406,7 +406,7 @@ poll*)
+ 	;;
+ select*)
+ 	if test "x$ac_cv_header_sys_select_h" = "xyes"; then
+-		AC_DEFINE([IOBROKER_USES_SELECT])
++		AC_DEFINE([IOBROKER_USES_SELECT], [1], [iobroker uses select])
+ 	else
+ 		echo "\"select\" is not available as an iobroker method."
+ 		echo "Please use one of the other options."
+@@ -415,13 +415,13 @@ select*)
+ 	;;
+ none*)
+ 	if test "$GLIBC_NEWER_2_4" -eq 1 -a "x$ac_cv_header_sys_epoll_h" = "xyes"; then
+-		AC_DEFINE([IOBROKER_USES_EPOLL])
++		AC_DEFINE([IOBROKER_USES_EPOLL], [1], [iobroker uses epoll])
+ 		IOBROKER_METHOD="epoll"
+ 	elif test "x$ac_cv_header_sys_poll_h" = "xyes" -o "x$ac_cv_header_poll_h" = "xyes"; then
+-		AC_DEFINE([IOBROKER_USES_POLL])
++		AC_DEFINE([IOBROKER_USES_POLL], [1], [iobroker uses poll])
+ 		IOBROKER_METHOD="poll"
+ 	elif test "x$ac_cv_header_sys_select_h" = "xyes"; then
+-		AC_DEFINE([IOBROKER_USES_SELECT])
++		AC_DEFINE([IOBROKER_USES_SELECT], [1], [iobroker uses select])
+ 		IOBROKER_METHOD="select"
+ 	else
+ 		echo "There are no available options for iobroker polling"
+-- 
+2.7.4
+
diff --git a/recipes-extended/nagios/nagios-core/0001-fix-compile-error-of-missing-headers.patch b/recipes-extended/nagios/nagios-core/0001-fix-compile-error-of-missing-headers.patch
new file mode 100644
index 0000000..7f4cfbd
--- /dev/null
+++ b/recipes-extended/nagios/nagios-core/0001-fix-compile-error-of-missing-headers.patch
@@ -0,0 +1,75 @@
+From a5e12350cb25b2f9289c0d27e26afc337652d42e Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 31 Aug 2018 13:33:31 +0800
+Subject: [PATCH] fix compile error of missing headers
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ cgi/getcgi.c     |  3 ++-
+ include/shared.h | 31 +++++++++++++++++++++++++++++++
+ 2 files changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/cgi/getcgi.c b/cgi/getcgi.c
+index 37b479f..1f83e11 100644
+--- a/cgi/getcgi.c
++++ b/cgi/getcgi.c
+@@ -7,10 +7,11 @@
+ 
+ #include "../include/config.h"
+ #include "../include/getcgi.h"
++#include "../include/shared.h"
++
+ #include <stdio.h>
+ #include <stdlib.h>
+ 
+-
+ #undef PARANOID_CGI_INPUT
+ 
+ 
+diff --git a/include/shared.h b/include/shared.h
+index 84836c7..1dfa0c7 100644
+--- a/include/shared.h
++++ b/include/shared.h
+@@ -1,6 +1,37 @@
+ #ifndef NAGIOS_SHARED_H_INCLUDED
+ #define NAGIOS_SHARED_H_INCLUDED
+ 
++#include <stdio.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <sys/socket.h>
++#include <sys/mman.h>
++#include <stdlib.h>
++#include <stddef.h>
++#include <stdlib.h>
++#include <memory.h>
++#include <string.h>
++#include <strings.h>
++#include <inttypes.h>
++#include <stdint.h>
++#include <unistd.h>
++#include <dirent.h>
++#include <math.h>
++#include <fcntl.h>
++#include <regex.h>
++#include <ctype.h>
++#include <sys/prctl.h>
++#include <stdarg.h>
++#include <dlfcn.h>
++#include <getopt.h>
++#include <syslog.h>
++#include <pwd.h>
++#include <grp.h>
++#include <netdb.h>
++#include <wchar.h>
++#include <locale.h>
++#include <limits.h>
++
+ #include <time.h>
+ #include "lib/libnagios.h"
+ 
+-- 
+2.7.4
+
diff --git a/recipes-extended/nagios/nagios-core/0001-fix-segment-fault.patch b/recipes-extended/nagios/nagios-core/0001-fix-segment-fault.patch
new file mode 100644
index 0000000..1ea8da9
--- /dev/null
+++ b/recipes-extended/nagios/nagios-core/0001-fix-segment-fault.patch
@@ -0,0 +1,54 @@
+From 65e4539c6eca215d8d79ef8acc5c8842b886752a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 3 Sep 2018 13:15:29 +0800
+Subject: [PATCH] fix segment fault
+
+When using strdup(dirname(cfgfile)) directly, we will have segment
+fault. This happens at least for glibc 2.28. So we do it step by
+step, and this would avoid the segment fault.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ include/shared.h    | 1 +
+ xdata/xodtemplate.c | 4 +++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/include/shared.h b/include/shared.h
+index 1dfa0c7..0188c7d 100644
+--- a/include/shared.h
++++ b/include/shared.h
+@@ -31,6 +31,7 @@
+ #include <wchar.h>
+ #include <locale.h>
+ #include <limits.h>
++#include <libgen.h>
+ 
+ #include <time.h>
+ #include "lib/libnagios.h"
+diff --git a/xdata/xodtemplate.c b/xdata/xodtemplate.c
+index 33d51f4..da32e69 100644
+--- a/xdata/xodtemplate.c
++++ b/xdata/xodtemplate.c
+@@ -187,6 +187,7 @@ static void xodtemplate_free_template_skiplists(void) {
+ int xodtemplate_read_config_data(const char *main_config_file, int options) {
+ #ifdef NSCORE
+ 	char *cfgfile = NULL;
++	char *cfgfile_dir = NULL;
+ 	char *config_base_dir = NULL;
+ 	char *input = NULL;
+ 	char *var = NULL;
+@@ -261,7 +262,8 @@ int xodtemplate_read_config_data(const char *main_config_file, int options) {
+ 			printf("Unable to allocate memory!\n");
+ 			return ERROR;
+ 			}
+-		config_base_dir = (char *)strdup(dirname(cfgfile));
++		cfgfile_dir = dirname(cfgfile);
++		config_base_dir = (char *)strdup(cfgfile_dir);
+ 		my_free(cfgfile);
+ 
+ 		/* open the main config file for reading (we need to find all the config files to read) */
+-- 
+2.7.4
+
diff --git a/recipes-extended/nagios/nagios-core/eventhandlers_nagioscmd_path.patch b/recipes-extended/nagios/nagios-core/eventhandlers_nagioscmd_path.patch
new file mode 100644
index 0000000..c767162
--- /dev/null
+++ b/recipes-extended/nagios/nagios-core/eventhandlers_nagioscmd_path.patch
@@ -0,0 +1,73 @@
+change eventhandlers nagioscmd path
+
+Modify nagios.cmd path to the right location
+at "/var/nagios/rw/nagios.cmd"
+
+Signed-off-by: Rickard Engberg <rickard.engberg@windriver.com>
+Signed-off-by: Vu Tran <vu.tran@windriver.com>
+
+diff --git a/contrib/eventhandlers/disable_active_service_checks b/contrib/eventhandlers/disable_active_service_checks
+index c01f2be..2c2880b 100755
+--- a/contrib/eventhandlers/disable_active_service_checks
++++ b/contrib/eventhandlers/disable_active_service_checks
+@@ -16,7 +16,7 @@
+ 
+ printfcmd="/usr/bin/printf"
+ 
+-CommandFile="/usr/local/nagios/var/rw/nagios.cmd"
++CommandFile="/var/nagios/rw/nagios.cmd"
+ 
+ # get the current date/time in seconds since UNIX epoch
+ datetime=`date +%s`
+diff --git a/contrib/eventhandlers/disable_notifications b/contrib/eventhandlers/disable_notifications
+index a92bb7a..b2c9c06 100755
+--- a/contrib/eventhandlers/disable_notifications
++++ b/contrib/eventhandlers/disable_notifications
+@@ -14,7 +14,7 @@
+ 
+ printfcmd="/usr/bin/printf"
+ 
+-CommandFile="/usr/local/nagios/var/rw/nagios.cmd"
++CommandFile="/var/nagios/rw/nagios.cmd"
+ 
+ # get the current date/time in seconds since UNIX epoch
+ datetime=`date +%s`
+diff --git a/contrib/eventhandlers/enable_active_service_checks b/contrib/eventhandlers/enable_active_service_checks
+index 423c8d9..631fa00 100755
+--- a/contrib/eventhandlers/enable_active_service_checks
++++ b/contrib/eventhandlers/enable_active_service_checks
+@@ -16,7 +16,7 @@
+ 
+ printfcmd="/usr/bin/printf"
+ 
+-CommandFile="/usr/local/nagios/var/rw/nagios.cmd"
++CommandFile="/var/nagios/rw/nagios.cmd"
+ 
+ # get the current date/time in seconds since UNIX epoch
+ datetime=`date +%s`
+diff --git a/contrib/eventhandlers/enable_notifications b/contrib/eventhandlers/enable_notifications
+index 0d3f13d..2cc0b47 100755
+--- a/contrib/eventhandlers/enable_notifications
++++ b/contrib/eventhandlers/enable_notifications
+@@ -14,7 +14,7 @@
+ 
+ printfcmd="/usr/bin/printf"
+ 
+-CommandFile="/usr/local/nagios/var/rw/nagios.cmd"
++CommandFile="/var/nagios/rw/nagios.cmd"
+ 
+ # get the current date/time in seconds since UNIX epoch
+ datetime=`date +%s`
+diff --git a/contrib/eventhandlers/submit_check_result b/contrib/eventhandlers/submit_check_result
+index 5d89f31..790a988 100755
+--- a/contrib/eventhandlers/submit_check_result
++++ b/contrib/eventhandlers/submit_check_result
+@@ -24,7 +24,7 @@
+  
+ echocmd="/bin/echo"
+  
+-CommandFile="/usr/local/nagios/var/rw/nagios.cmd"
++CommandFile="/var/nagios/rw/nagios.cmd"
+  
+ # get the current date/time in seconds since UNIX epoch
+ datetime=`date +%s`
diff --git a/recipes-extended/nagios/nagios-core/nagios-core-systemd-volatile.conf b/recipes-extended/nagios/nagios-core/nagios-core-systemd-volatile.conf
new file mode 100644
index 0000000..134fb85
--- /dev/null
+++ b/recipes-extended/nagios/nagios-core/nagios-core-systemd-volatile.conf
@@ -0,0 +1,2 @@
+d /var/nagios 0755 nagios nagios -
+d /var/run/nagios 0755 nagios nagios -
diff --git a/recipes-extended/nagios/nagios-core/nagios-core.service b/recipes-extended/nagios/nagios-core/nagios-core.service
new file mode 100644
index 0000000..61fda3f
--- /dev/null
+++ b/recipes-extended/nagios/nagios-core/nagios-core.service
@@ -0,0 +1,18 @@
+[Unit]
+Description=Nagios core
+After=network.target local-fs.target
+
+[Service]
+Type=forking
+User=nagios
+Group=nagios
+PIDFile=/var/run/nagios/nagios.pid
+# Verify Nagios config before start as upstream suggested
+ExecStartPre=/usr/bin/nagios -v /etc/nagios/nagios.cfg
+ExecStart=/usr/bin/nagios -d /etc/nagios/nagios.cfg
+ExecStop=/bin/kill -TERM ${MAINPID}
+ExecStopPost=/bin/rm -f /var/spool/nagios/cmd/nagios.cmd
+ExecReload=/bin/kill -HUP ${MAINPID}
+
+[Install]
+WantedBy=multi-user.target
diff --git a/recipes-extended/nagios/nagios-core/volatiles b/recipes-extended/nagios/nagios-core/volatiles
new file mode 100644
index 0000000..e9bb768
--- /dev/null
+++ b/recipes-extended/nagios/nagios-core/volatiles
@@ -0,0 +1,2 @@
+d nagios nagios 0755 /var/nagios none
+d nagios nagios 0755 /var/run/nagios none
diff --git a/recipes-extended/nagios/nagios-core_4.4.2.bb b/recipes-extended/nagios/nagios-core_4.4.2.bb
new file mode 100644
index 0000000..b2196eb
--- /dev/null
+++ b/recipes-extended/nagios/nagios-core_4.4.2.bb
@@ -0,0 +1,151 @@
+require nagios-common.inc
+
+DESCRIPTION = "A host/service/network monitoring and management system core files"
+HOMEPAGE = "http://www.nagios.org"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4c4203caac58013115c9ca4b85f296ae"
+
+SRCNAME = "nagios"
+
+SRC_URI = "http://prdownloads.sourceforge.net/sourceforge/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+           file://eventhandlers_nagioscmd_path.patch \
+           file://0001-fix-autoheader-error.patch \
+           file://0001-fix-compile-error-of-missing-headers.patch \
+           file://0001-fix-segment-fault.patch \
+           file://volatiles \
+           file://nagios-core.service \
+           file://nagios-core-systemd-volatile.conf \
+           "
+
+SRC_URI[md5sum] = "7a9736281d4e2ebe4f4569a782f733c5"
+SRC_URI[sha256sum] = "3418923f326aa86dc8c84cfd0df788fa495a90d772f8071acf40fdbef0736853"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit autotools-brokensep update-rc.d systemd
+
+DEPENDS = "gd unzip-native"
+
+RDEPENDS_${PN} += "\
+    gd \
+    libpng \
+    fontconfig \
+    apache2 \
+    php \
+    nagios-base \
+"
+
+acpaths = "-I ${S}/autoconf-macros"
+
+# Set default password for the hardcoded Nagios admin user "nagiosadmin".
+# If this variable is empty then will prompt user for password.
+NAGIOS_DEFAULT_ADMINUSER_PASSWORD ??= "password"
+NAGIOS_CGIBIN_DIR = "${libdir}/nagios/cgi-bin"
+
+EXTRA_OECONF += "--sbindir=${NAGIOS_CGIBIN_DIR} \
+                 --datadir=${datadir}/nagios/htdocs \
+                 --with-command-group=nagcmd \
+                 --with-httpd-conf=${sysconfdir}/apache2/conf.d \
+                 --with-lockfile=${localstatedir}/run/nagios/nagios.pid \
+                 --with-init-dir=${sysconfdir}/init.d \
+"
+
+# Prevent nagios from stripping binaries, bitbake will take care of that
+EXTRA_OECONF += "ac_cv_path_STRIP=true"
+
+# Prevent nagios from using dynamic libtool library
+EXTRA_OECONF += "ac_cv_header_ltdl_h=no"
+
+# Prevent nagios from suffering host contamination if host has /bin/perl
+EXTRA_OECONF += "ac_cv_path_PERL=${bindir}/perl"
+
+# Set to "1" to allow nagios-core post-init to modify Apache configuration
+NAGIOS_MODIFY_APACHE ??= "1"
+
+do_configure_prepend() {
+	# rename these macros to have .m4 suffix so that autoreconf could recognize them
+	for macro in `ls ${S}/autoconf-macros/ax_nagios_get_*`; do
+		mv $macro $macro.m4
+	done
+}
+
+do_compile() {
+	oe_runmake all
+}
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+    oe_runmake 'DESTDIR=${D}' install-init
+    oe_runmake 'DESTDIR=${D}' install-config
+    oe_runmake 'DESTDIR=${D}' install-commandmode
+
+    install -d ${D}${sysconfdir}/apache2/conf.d
+    oe_runmake 'DESTDIR=${D}' install-webconf
+
+    install -d ${D}${NAGIOS_PLUGIN_CONF_DIR}
+
+    # There is no install target for the contributed eventhandlers so we
+    # just do it.
+    install -d ${D}${NAGIOS_PLUGIN_DIR}/eventhandlers
+    for f in ${S}/contrib/eventhandlers/* ; do
+        if ! [ -f $f ] ; then
+            continue;
+        fi
+        install $f ${D}${NAGIOS_PLUGIN_DIR}/eventhandlers/
+    done
+
+    echo "cfg_dir=${NAGIOS_PLUGIN_CONF_DIR}" >> ${D}${NAGIOS_CONF_DIR}/nagios.cfg
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/nagios-core.service ${D}${systemd_unitdir}/system/
+        # use our own service file
+        rm -f ${D}${systemd_unitdir}/system/nagios.service
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        install -m 755 ${WORKDIR}/nagios-core-systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/nagios-core-volatile.conf
+    else
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/99_nagios
+    fi
+}
+
+pkg_postinst_ontarget_${PN}-setup () {
+    # Set password for nagiosadmin user
+    if [ -z "${NAGIOS_DEFAULT_ADMINUSER_PASSWORD}" ]; then
+        htpasswd -c ${NAGIOS_CONF_DIR}/htpasswd.users nagiosadmin
+    else
+        htpasswd -b -c ${NAGIOS_CONF_DIR}/htpasswd.users nagiosadmin \
+           "${NAGIOS_DEFAULT_ADMINUSER_PASSWORD}"
+    fi
+
+    # Apache2 might by default turn off CGI
+    if [ "${NAGIOS_MODIFY_APACHE}" == "1" ] && [ -f "${sysconfdir}/apache2/httpd.conf" ]; then
+        sed -e 's/^#LoadModule cgid_module/LoadModule cgid_module/g' -i ${sysconfdir}/apache2/httpd.conf
+    fi
+}
+
+PACKAGES += "${SRCNAME}-base ${PN}-setup"
+
+FILES_${PN} += "${datadir} \
+                ${NAGIOS_PLUGIN_DIR} \
+                ${NAGIOS_CGIBIN_DIR} \
+"
+
+FILES_${PN}-dbg += "${NAGIOS_CGIBIN_DIR}/.debug"
+
+ALLOW_EMPTY_${SRCNAME}-base = "1"
+ALLOW_EMPTY_${PN}-setup = "1"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "nagios-core.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+
+USERADD_PACKAGES += "${SRCNAME}-base"
+GROUPADD_PARAM_${SRCNAME}-base = "-r ${NAGIOS_GROUP}"
+USERADD_PARAM_${SRCNAME}-base = "-r -M -g ${NAGIOS_GROUP} ${NAGIOS_USER}"
+
+INITSCRIPT_NAME = "nagios"
+INITSCRIPT_PARAMS = "defaults"
-- 
2.7.4


