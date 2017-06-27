Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 812C6E0084A; Mon, 26 Jun 2017 17:26:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C655E00524
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Jun 2017 17:26:43 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5R0QfE6025831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Jun 2017 17:26:43 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 26 Jun 2017 17:26:41 -0700
From: <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@windriver.com>
Date: Tue, 27 Jun 2017 08:26:39 +0800
Message-ID: <1498523199-15721-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] diod: add new recipe
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
X-List-Received-Date: Tue, 27 Jun 2017 00:26:54 -0000
Content-Type: text/plain

From: Yi Zhao <yi.zhao@windriver.com>

diod is a multi-threaded, user space file server that speaks 9P2000.L
protocol.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 recipes-extended/diod/diod_1.0.24.bb               |  32 ++++++
 ...ow-builds-to-work-with-separate-build-dir.patch | 126 +++++++++++++++++++++
 .../files/0002-auto.diod.in-remove-bashisms.patch  |  47 ++++++++
 recipes-extended/diod/files/diod                   |  75 ++++++++++++
 recipes-extended/diod/files/diod.conf              |  15 +++
 5 files changed, 295 insertions(+)
 create mode 100644 recipes-extended/diod/diod_1.0.24.bb
 create mode 100644 recipes-extended/diod/files/0001-build-allow-builds-to-work-with-separate-build-dir.patch
 create mode 100644 recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
 create mode 100644 recipes-extended/diod/files/diod
 create mode 100644 recipes-extended/diod/files/diod.conf

diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/diod_1.0.24.bb
new file mode 100644
index 0000000..a4d159a
--- /dev/null
+++ b/recipes-extended/diod/diod_1.0.24.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Diod is a user space server for the kernel v9fs client."
+DESCRIPTION = "\
+Diod is a user space server for the kernel v9fs client (9p.ko, 9pnet.ko). \
+Although the kernel client supports several 9P variants, diod only supports \
+9P2000.L, and only in its feature-complete form, as it appeared in 2.6.38."
+SECTION = "console/network"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+PV = "1.0.24+git${SRCPV}"
+SRCREV = "0ea3fe3d829b5085307cd27a512708d99ef48199"
+SRC_URI = "git://github.com/chaos/diod.git;protocol=git \
+           file://diod \
+           file://diod.conf \
+           file://0001-build-allow-builds-to-work-with-separate-build-dir.patch \
+           file://0002-auto.diod.in-remove-bashisms.patch \
+          "
+DEPENDS = "libcap ncurses tcp-wrappers lua"
+
+S = "${WORKDIR}/git"
+
+inherit autotools systemd
+
+do_install_append () {
+        # install our init based on start-stop-daemon
+        install -D -m 0755 ${WORKDIR}/diod ${D}${sysconfdir}/init.d/diod
+        # install a real(not commented) configuration file for diod
+        install -m 0644 ${WORKDIR}/diod.conf ${D}${sysconfdir}/diod.conf
+}
+
+FILES_${PN} += "${systemd_unitdir}"
diff --git a/recipes-extended/diod/files/0001-build-allow-builds-to-work-with-separate-build-dir.patch b/recipes-extended/diod/files/0001-build-allow-builds-to-work-with-separate-build-dir.patch
new file mode 100644
index 0000000..f40e0eb
--- /dev/null
+++ b/recipes-extended/diod/files/0001-build-allow-builds-to-work-with-separate-build-dir.patch
@@ -0,0 +1,126 @@
+From 43403468298ef4167baa5d84de2ee2eaf7f4007a Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Fri, 9 Jan 2015 18:34:04 +0000
+Subject: [PATCH 1/2] build: allow builds to work with separate build dir
+
+Remove assumptions in include paths that assume the build
+is happening in the source directories.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ diod/Makefile.am              | 2 +-
+ libdiod/Makefile.am           | 2 +-
+ liblsd/Makefile.am            | 2 +-
+ libnpclient/Makefile.am       | 2 +-
+ scripts/Makefile.am           | 6 +++---
+ tests/kern/dbench/Makefile.am | 4 ++--
+ utils/Makefile.am             | 2 +-
+ 7 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/diod/Makefile.am b/diod/Makefile.am
+index 7644be7..fdaf130 100644
+--- a/diod/Makefile.am
++++ b/diod/Makefile.am
+@@ -1,7 +1,7 @@
+ AM_CFLAGS = @GCCWARN@
+ 
+ AM_CPPFLAGS = \
+-	-I../libnpfs -I../liblsd -I../libdiod
++	-I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libdiod
+ 
+ sbin_PROGRAMS = diod
+ 
+diff --git a/libdiod/Makefile.am b/libdiod/Makefile.am
+index 4810e14..6905cdd 100644
+--- a/libdiod/Makefile.am
++++ b/libdiod/Makefile.am
+@@ -1,7 +1,7 @@
+ AM_CFLAGS = @GCCWARN@
+ 
+ AM_CPPFLAGS = \
+-	-I../libnpfs -I../libnpclient -I../liblsd
++	-I$(srcdir)/../libnpfs -I$(srcdir)/../libnpclient -I$(srcdir)/../liblsd
+ 
+ noinst_LIBRARIES = libdiod.a
+ 
+diff --git a/liblsd/Makefile.am b/liblsd/Makefile.am
+index c3e5658..7e18bf8 100644
+--- a/liblsd/Makefile.am
++++ b/liblsd/Makefile.am
+@@ -1,6 +1,6 @@
+ AM_CFLAGS = @GCCWARN@
+ 
+-AM_CPPFLAGS = -I../libdiod
++AM_CPPFLAGS = -I$(srcdir)/../libdiod
+ 
+ noinst_LIBRARIES = liblsd.a
+ 
+diff --git a/libnpclient/Makefile.am b/libnpclient/Makefile.am
+index 5305df9..cbaf266 100644
+--- a/libnpclient/Makefile.am
++++ b/libnpclient/Makefile.am
+@@ -1,7 +1,7 @@
+ AM_CFLAGS = @GCCWARN@
+ 
+ AM_CPPFLAGS = \
+-	-I../libnpfs
++	-I$(srcdir)/../libnpfs
+ 
+ noinst_LIBRARIES = libnpclient.a
+ 
+diff --git a/scripts/Makefile.am b/scripts/Makefile.am
+index 51c24a3..2aba728 100644
+--- a/scripts/Makefile.am
++++ b/scripts/Makefile.am
+@@ -1,9 +1,9 @@
+-systemddir=$(sysconfdir)/systemd/system
++systemddir=/lib/systemd/system
+ 
+ install-data-local:
+-	$(top_srcdir)/config/install-sh -m 755 $(srcdir)/auto.diod \
++	$(top_srcdir)/config/install-sh -m 755 ./auto.diod \
+ 		$(DESTDIR)$(sysconfdir)/auto.diod
+-	$(top_srcdir)/config/install-sh -m 755 $(srcdir)/diod.service \
++	$(top_srcdir)/config/install-sh -m 644 ./diod.service \
+ 		$(DESTDIR)$(systemddir)/diod.service
+ 
+ uninstall-local:
+diff --git a/tests/kern/dbench/Makefile.am b/tests/kern/dbench/Makefile.am
+index e0cdefa..1704f9f 100644
+--- a/tests/kern/dbench/Makefile.am
++++ b/tests/kern/dbench/Makefile.am
+@@ -2,7 +2,7 @@ AM_CFLAGS = -w
+ 
+ # VERSION=4.00
+ 
+-AM_CPPFLAGS = -DDATADIR=\"$(X_DATADIR)\"
++AM_CPPFLAGS = -I. -DDATADIR=\"$(X_DATADIR)\"
+ 
+ LDADD = $(LIBPOPT)
+ 
+@@ -25,6 +25,6 @@ BUILT_SOURCES = proto.h
+ CLEANFILES = proto.h
+ 
+ proto.h: $(dbench_SOURCES) mkproto.pl
+-	perl mkproto.pl $(dbench_SOURCES) > proto.h
++	$(srcdir)/mkproto.pl $(patsubst %,$(srcdir),$(dbench_SOURCES)) > proto.h
+ 
+ EXTRA_DIST = mkproto.pl
+diff --git a/utils/Makefile.am b/utils/Makefile.am
+index 169b6c4..91d571d 100644
+--- a/utils/Makefile.am
++++ b/utils/Makefile.am
+@@ -1,7 +1,7 @@
+ AM_CFLAGS = @GCCWARN@
+ 
+ AM_CPPFLAGS = \
+-	-I../libnpfs -I../liblsd -I../libdiod -I../libnpclient
++	-I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libdiod -I$(srcdir)/../libnpclient
+ 
+ sbin_PROGRAMS = diodmount diodcat dtop diodload diodls diodshowmount dioddate
+ 
+-- 
+2.11.0
+
diff --git a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch b/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
new file mode 100644
index 0000000..65d6ff6
--- /dev/null
+++ b/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
@@ -0,0 +1,47 @@
+From 5a9e09dc5de833db11607530351cd87cecbfd17e Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Thu, 22 Jun 2017 06:32:30 +0000
+Subject: [PATCH 2/2] auto.diod.in: remove bashisms
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ scripts/auto.diod.in | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/scripts/auto.diod.in b/scripts/auto.diod.in
+index f63e004..4d5fc3a 100755
+--- a/scripts/auto.diod.in
++++ b/scripts/auto.diod.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # auto.diod - executable automounter map for diod file systems
+ #
+@@ -41,15 +41,15 @@ dcatopts="${DIOD_TIMEOUT:+-t $DIOD_TIMEOUT}"
+ for server in $DIOD_SERVERS; do
+     $DIOD_DIODCAT -s $server $dcatopts exports | awk '{print $1}' |\
+     while read path; do
+-        if [ "$path" == "/" ]; then
+-            if [ "$key" == "ROOT" ]; then
++        if [ "$path" = "/" ]; then
++            if [ "$key" = "ROOT" ]; then
+                 echo "$prefix $server:$path"
+                 exit 0
+             fi
+-        elif [ "$key" == "$(echo $path|sed -e's/^\///' -e's/\//./g')" ] \
+-          || [ "$key" == "$(echo $path|sed -e's/^\///' -e's/\//_/g')" ] \
+-          || [ "$key" == "$(echo $path|sed -e's/^\///' -e's/\//-/g')" ] \
+-          || [ "$key" == "$(basename $path)" ]; then
++        elif [ "$key" = "$(echo $path|sed -e's/^\///' -e's/\//./g')" ] \
++          || [ "$key" = "$(echo $path|sed -e's/^\///' -e's/\//_/g')" ] \
++          || [ "$key" = "$(echo $path|sed -e's/^\///' -e's/\//-/g')" ] \
++          || [ "$key" = "$(basename $path)" ]; then
+             echo "$prefix $server:$path"
+             exit 0
+         fi
+-- 
+2.11.0
+
diff --git a/recipes-extended/diod/files/diod b/recipes-extended/diod/files/diod
new file mode 100644
index 0000000..cd0bf98
--- /dev/null
+++ b/recipes-extended/diod/files/diod
@@ -0,0 +1,75 @@
+#!/bin/sh
+#
+# chkconfig: 35 20 80
+# description: Distributed Input Output Daemon 
+#
+
+# Get function from functions library
+. /etc/init.d/functions
+
+BASE=diod
+PIDFILE=/var/run/$BASE.pid
+PID=`test -f $PIDFILE && cat $PIDFILE`
+DIOD_BIN=/usr/sbin/$BASE
+DIOD_CONF=/etc/$BASE.conf
+DIOD_OPTS="-c $DIOD_CONF"
+DIOD="$DIOD_BIN $DIOD_OPTS"
+RETVAL=0
+
+# Start the service $BASE
+start()
+{
+       # Force creation of the log directory even on a tmpfs /var/log.
+       mkdir -p /var/log/diod
+
+       start-stop-daemon --stop --test --quiet --pidfile $PIDFILE
+       status=$?
+       if [ $status -eq 0 ]; then
+           echo "diod service is already running with pid $PID"
+           exit 1
+       else
+           echo -n "Starting $BASE:"
+           start-stop-daemon --start --pidfile $PIDFILE \
+	     --exec $DIOD_BIN -- $DIOD_OPTS
+           RETVAL=$?
+           echo
+           [ $RETVAL -ne 0 ] && exit $RETVAL
+       fi
+}
+
+# Stop the service $BASE
+stop()
+{
+    echo -n "Stopping $BASE:"
+    start-stop-daemon --stop --test --quiet --pidfile $PIDFILE
+    status=$?
+    if [ $status -eq 0 ]; then
+        start-stop-daemon --stop --quiet --pidfile $PIDFILE
+        [ -w $PIDFILE ] && rm -f $PIDFILE
+    else
+	start-stop-daemon --stop --quiet --name $BASE
+    fi
+}
+
+
+### service arguments ###
+case $1 in
+    start)
+        start
+        ;;
+    stop)
+        stop
+        ;;
+    status)
+        status $BASE
+        ;;
+    restart | force-reload)
+        $0 stop
+        $0 start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|status|restart}."
+        exit 1
+esac
+
+exit 0
diff --git a/recipes-extended/diod/files/diod.conf b/recipes-extended/diod/files/diod.conf
new file mode 100644
index 0000000..e97743a
--- /dev/null
+++ b/recipes-extended/diod/files/diod.conf
@@ -0,0 +1,15 @@
+--
+-- /etc/diod.conf - config file for diod distributed I/O daemon
+--
+-- NOTE: This config file is a lua script that diod runs, then extracts
+-- the value of certain globally defined variables.  See diod.conf(5).
+
+listen = { "0.0.0.0:564" }
+nwthreads = 16
+auth_required = 1
+logdest = "syslog:daemon:err"
+
+exports = { "/g/g0", "/g/g10" }
+
+allsquash = 0
+squashuser = "nobody"
-- 
2.7.4


