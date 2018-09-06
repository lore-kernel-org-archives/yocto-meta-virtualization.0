Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 574FAE00ADD; Wed,  5 Sep 2018 18:49:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7371EE00AB3
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Sep 2018 18:49:29 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w861nSYL008729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Sep 2018 18:49:28 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Sep 2018 18:49:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Sep 2018 09:38:57 +0800
Message-ID: <1536197940-688-3-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536197940-688-1-git-send-email-Qi.Chen@windriver.com>
References: <1536197940-688-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/6] nagios-nsca: add recipe with latest stable version 2.9.1
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
X-List-Received-Date: Thu, 06 Sep 2018 01:49:30 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-Fix-missing-argument-in-open-calls.patch  | 52 +++++++++++++
 recipes-extended/nagios/nagios-nsca/init-script.in | 67 +++++++++++++++++
 .../nagios/nagios-nsca/nagios-nsca.service         | 12 +++
 recipes-extended/nagios/nagios-nsca_2.9.1.bb       | 85 ++++++++++++++++++++++
 4 files changed, 216 insertions(+)
 create mode 100644 recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch
 create mode 100644 recipes-extended/nagios/nagios-nsca/init-script.in
 create mode 100644 recipes-extended/nagios/nagios-nsca/nagios-nsca.service
 create mode 100644 recipes-extended/nagios/nagios-nsca_2.9.1.bb

diff --git a/recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch b/recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch
new file mode 100644
index 0000000..6b39fec
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch
@@ -0,0 +1,52 @@
+From da37e6ce2a8cc315845440488cd2f8dab0a17bfe Mon Sep 17 00:00:00 2001
+From: "John C. Frickson" <jfrickson@nagios.com>
+Date: Wed, 7 Oct 2015 14:06:58 -0500
+Subject: [PATCH] Fix missing argument in open calls
+
+Commit b9f2c08dfdf31430f972a48781fc115c4af13cfe
+from https://github.com/NagiosEnterprises/nsca
+
+Fix for issue http://tracker.nagios.org/view.php?id=286
+
+Upstream-Status: Backport
+
+Singed-off-by: John C. Frickson <jfrickson@nagios.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[MA: Context updated to allow application to older version]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ Changelog  | 4 ++++
+ src/nsca.c | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Changelog b/Changelog
+index 3a7edd4..00ea11e 100644
+--- a/Changelog
++++ b/Changelog
+@@ -2,6 +2,10 @@
+ NSCA Changelog
+ **************
+ 
++2.9.x - xx/xx/xxxx
++------------------
++- Fix missing argument in open calls (Xavier Bachelot / John Frickson)
++
+ 2.9.1 - 01/27/2012
+ ------------------
+ - Applied patch to allow packets arriving with a future time stamp (Daniel Wittenberg)
+diff --git a/src/nsca.c b/src/nsca.c
+index 6b0e436..0e70b8b 100644
+--- a/src/nsca.c
++++ b/src/nsca.c
+@@ -477,7 +477,7 @@ static int read_config_file(char *filename){
+                             int checkresult_test_fd=-1;
+                             char *checkresult_test=NULL;
+                             asprintf(&checkresult_test,"%s/nsca.test.%i",check_result_path,getpid());
+-                            checkresult_test_fd=open(checkresult_test,O_WRONLY|O_CREAT);
++                            checkresult_test_fd=open(checkresult_test,O_WRONLY|O_CREAT,S_IWUSR);
+                             if (checkresult_test_fd>0){
+                                     unlink(checkresult_test);
+                                     }
+-- 
+2.11.0
+
diff --git a/recipes-extended/nagios/nagios-nsca/init-script.in b/recipes-extended/nagios/nagios-nsca/init-script.in
new file mode 100644
index 0000000..a76b34e
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nsca/init-script.in
@@ -0,0 +1,67 @@
+#!/bin/sh
+#
+#  Last Modified 01-07-2003 Ethan Galstad (nagios@nagios.org)
+#  Notes
+#  This script takes care of starting and stopping the NSCA daemon.
+#  Modeled after init script for NRPE written by jaclu@grm.se
+#
+# chkconfig: 2345 80 30
+# description: nsca is a daemon for accepting service check results \
+#              from applications running on other hosts.
+# processname: nsca
+# config: /usr/local/nagios/etc/nsca.cfg
+
+### BEGIN INIT INFO
+# Provides:          nsca
+# Required-Start:    $remote_fs $syslog
+# Required-Stop:     $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: start and stop nagios nsca daemon
+# Description:       start and stop nagios nsca daemon
+### END INIT INFO
+
+
+# Source function library
+if [ -f /etc/rc.d/init.d/functions ]; then
+. /etc/rc.d/init.d/functions
+elif [ -f /etc/init.d/functions ]; then
+. /etc/init.d/functions
+elif [ -f /etc/rc.d/functions ]; then
+. /etc/rc.d/functions
+fi
+
+NscaBin=@bindir@/nsca
+NscaCfg=@sysconfdir@/nsca.cfg
+LockFile=/var/lock/nsca
+
+# See how we were called.
+case "$1" in
+  start)
+	# Start daemons.
+	echo -n "Starting nsca: "
+	start-stop-daemon --start --exec $NscaBin -- -s -c $NscaCfg
+	RETVAL=$?
+	echo
+	touch $LockFile
+	;;
+  stop)
+	# Stop daemons.
+	echo -n "Shutting down nsca: "
+	start-stop-daemon --stop --exec $NscaBin
+	echo
+	rm -f $LockFile
+	;;
+  restart)
+	$0 stop
+	$0 start
+	;;
+  status)
+	status nsca
+	;;
+  *)
+	echo "Usage: nsca {start|stop|restart|status}"
+	exit 1
+esac
+
+exit 0
diff --git a/recipes-extended/nagios/nagios-nsca/nagios-nsca.service b/recipes-extended/nagios/nagios-nsca/nagios-nsca.service
new file mode 100644
index 0000000..aa38b7f
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nsca/nagios-nsca.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Nagios nsca plugin
+After=syslog.target network.target
+
+[Service]
+Type=forking
+ExecStart=/usr/bin/nsca -s -c /etc/nagios/nsca.cfg
+PIDFile=/var/run/nsca.pid
+TimeoutSec=60
+
+[Install]
+WantedBy=multi-user.target
diff --git a/recipes-extended/nagios/nagios-nsca_2.9.1.bb b/recipes-extended/nagios/nagios-nsca_2.9.1.bb
new file mode 100644
index 0000000..f53a47a
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nsca_2.9.1.bb
@@ -0,0 +1,85 @@
+require nagios-common.inc
+
+DESCRIPTION = "Nagios Service Check Acceptor"
+HOMEPAGE = "http://exchange.nagios.org"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://src/nsca.c;beginline=1;endline=16;md5=c1bd17485c5c1dd42f664fe8b3528674"
+
+SRCNAME = "nsca"
+
+SRC_URI = "http://prdownloads.sourceforge.net/sourceforge/nagios/${SRCNAME}-${PV}.tar.gz \
+           file://init-script.in \
+           file://nagios-nsca.service \
+           file://0001-Fix-missing-argument-in-open-calls.patch \
+"
+
+SRC_URI[md5sum] = "3fe2576a8cc5b252110a93f4c8d978c6"
+SRC_URI[sha256sum] = "fb12349e50838c37954fe896ba6a026c09eaeff2f9408508ad7ede53e9ea9580"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit update-rc.d autotools-brokensep systemd dos2unix
+
+DEPENDS = "libmcrypt"
+
+EXTRA_OECONF += "--with-nsca-user=${NAGIOS_USER} \
+                 --with-nsca-group=${NAGIOS_GROUP} \
+                 --with-libmcrypt-prefix=${STAGING_DIR_HOST} \
+                 ac_cv_path_LIBMCRYPT_CONFIG=${STAGING_BINDIR_CROSS}/libmcrypt-config \
+                 ac_cv_lib_wrap_main=no \
+                 ac_cv_path_PERL=${bindir}/perl \
+"
+
+do_configure() {
+    cp ${WORKDIR}/init-script.in ${S}/init-script.in
+    oe_runconf || die "make failed"
+}
+
+do_install() {
+    CONF_DIR=${D}${NAGIOS_CONF_DIR}
+
+    install -d ${CONF_DIR}
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${bindir}
+
+    install -m 755 ${S}/sample-config/nsca.cfg ${CONF_DIR}
+    install -m 755 ${S}/sample-config/send_nsca.cfg ${CONF_DIR}
+    install -m 755 ${S}/init-script ${D}${sysconfdir}/init.d/nsca
+
+    install -m 755 ${S}/src/nsca ${D}${bindir}
+    install -m 755 ${S}/src/send_nsca ${D}${bindir}
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/nagios-nsca.service ${D}${systemd_unitdir}/system/
+    fi
+}
+
+PACKAGES = "${PN}-dbg ${PN}-daemon ${PN}-client"
+
+FILES_${PN}-daemon = "${sysconfdir}/init.d \
+                      ${NAGIOS_CONF_DIR}/nsca.cfg \
+                      ${bindir}/nsca \
+"
+
+FILES_${PN}-client = "${NAGIOS_CONF_DIR}/send_nsca.cfg \
+                      ${bindir}/send_nsca \
+"
+
+RDEPENDS_${PN}-daemon += "libmcrypt \
+                          nagios-base \
+"
+RDEPENDS_${PN}-client += "libmcrypt \
+                          nagios-base \
+"
+
+SYSTEMD_PACKAGES = "${PN}-daemon"
+SYSTEMD_SERVICE_${PN}-daemon = "nagios-nsca.service"
+SYSTEMD_AUTO_ENABLE_${PN}-daemon = "enable"
+
+INITSCRIPT_PACKAGES = "${PN}-daemon"
+INITSCRIPT_NAME_${PN}-daemon = "nsca"
+INITSCRIPT_PARAMS_${PN}-daemon = "defaults"
-- 
2.7.4


