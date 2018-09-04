Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83523E007DA; Mon,  3 Sep 2018 19:58:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FECEE00754
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Sep 2018 19:58:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w842w4Al004116
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 3 Sep 2018 19:58:05 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Sep 2018 19:58:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 4 Sep 2018 10:47:47 +0800
Message-ID: <1536029271-11750-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536029271-11750-1-git-send-email-Qi.Chen@windriver.com>
References: <1536029271-11750-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] nagios-nrpe: add recipe with latest stable version 3.2.1
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
X-List-Received-Date: Tue, 04 Sep 2018 02:58:08 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/nagios/nagios-nrpe/check_nrpe.cfg |  11 +++
 .../nagios-nrpe/fix-compile-without-openssl.patch  |  43 +++++++++
 .../fix-configure-uses-host-openssl.patch          |  52 +++++++++++
 .../nagios/nagios-nrpe/nagios-nrpe.service         |  10 +++
 recipes-extended/nagios/nagios-nrpe_3.2.1.bb       | 100 +++++++++++++++++++++
 5 files changed, 216 insertions(+)
 create mode 100644 recipes-extended/nagios/nagios-nrpe/check_nrpe.cfg
 create mode 100644 recipes-extended/nagios/nagios-nrpe/fix-compile-without-openssl.patch
 create mode 100644 recipes-extended/nagios/nagios-nrpe/fix-configure-uses-host-openssl.patch
 create mode 100644 recipes-extended/nagios/nagios-nrpe/nagios-nrpe.service
 create mode 100644 recipes-extended/nagios/nagios-nrpe_3.2.1.bb

diff --git a/recipes-extended/nagios/nagios-nrpe/check_nrpe.cfg b/recipes-extended/nagios/nagios-nrpe/check_nrpe.cfg
new file mode 100644
index 0000000..48f3fa5
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nrpe/check_nrpe.cfg
@@ -0,0 +1,11 @@
+# this command runs a program $ARG1$ with arguments $ARG2$
+define command {
+    command_name    check_nrpe
+    command_line    $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$ -a $ARG2$
+}
+
+# this command runs a program $ARG1$ with no arguments
+define command {
+    command_name    check_nrpe_1arg
+    command_line    $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
+}
diff --git a/recipes-extended/nagios/nagios-nrpe/fix-compile-without-openssl.patch b/recipes-extended/nagios/nagios-nrpe/fix-compile-without-openssl.patch
new file mode 100644
index 0000000..ab913a8
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nrpe/fix-compile-without-openssl.patch
@@ -0,0 +1,43 @@
+fix compile without openssl
+
+Build with --disable-ssl causes the build to break with
+this error:
+
+error: unknown type name 'SSL'
+ void complete_SSL_shutdown( SSL *);
+
+Signed-off-by: Rickard Engberg <rickard.engberg@windriver.com>
+Signed-off-by: Vu Tran <vu.tran@windriver.com>
+
+Index: nrpe-2.15/src/nrpe.c
+===================================================================
+--- nrpe-2.15.orig/src/nrpe.c	2013-09-06 17:27:13.000000000 +0200
++++ nrpe-2.15/src/nrpe.c	2013-11-20 23:22:49.546791020 +0100
+@@ -99,9 +99,9 @@
+ int     debug=FALSE;
+ int     use_src=FALSE; /* Define parameter for SRC option */
+ 
+-
++#ifdef HAVE_SSL
+ void complete_SSL_shutdown( SSL *);
+-
++#endif
+ 
+ int main(int argc, char **argv){
+ 	int result=OK;
+@@ -1796,6 +1796,7 @@
+ 	return OK;
+         }
+ 
++#ifdef HAVE_SSL
+ void complete_SSL_shutdown( SSL *ssl) {
+ 
+ 	/*  
+@@ -1816,6 +1817,7 @@
+ 		if( SSL_shutdown( ssl)) break;
+ 	}
+ }
++#endif
+ 
+ /* bail if daemon is running as root */
+ int check_privileges(void){
diff --git a/recipes-extended/nagios/nagios-nrpe/fix-configure-uses-host-openssl.patch b/recipes-extended/nagios/nagios-nrpe/fix-configure-uses-host-openssl.patch
new file mode 100644
index 0000000..920aabf
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nrpe/fix-configure-uses-host-openssl.patch
@@ -0,0 +1,52 @@
+fix configure uses host openssl
+
+include/dh.h file is needed to be generated with command:
+
+openssl dhparam -C 512
+
+just do not use openssl from host.
+
+Signed-off-by: Rickard Engberg <rickard.engberg@windriver.com>
+Signed-off-by: Vu Tran <vu.tran@windriver.com>
+
+Index: nrpe-2.15/configure.in
+===================================================================
+--- nrpe-2.15.orig/configure.in	2013-09-06 17:27:13.000000000 +0200
++++ nrpe-2.15/configure.in	2013-11-21 14:09:31.798606782 +0100
+@@ -330,17 +330,6 @@
+ 
+ 			AC_DEFINE_UNQUOTED(HAVE_SSL,[1],[Have SSL support])
+ 			AC_SUBST(HAVE_SSL)
+-	
+-			dnl Generate DH parameters
+-			echo ""
+-			echo "*** Generating DH Parameters for SSL/TLS ***"
+-			if test -f "$ssldir/sbin/openssl"; then
+-				sslbin=$ssldir/sbin/openssl
+-			else
+-				sslbin=$ssldir/bin/openssl
+-			fi
+-			# awk to strip off meta data at bottom of dhparam output
+-			$sslbin dhparam -C 512 | awk '/^-----/ {exit} {print}' > include/dh.h
+ 		fi
+ 	fi
+ 
+Index: nrpe-2.15/configure
+===================================================================
+--- nrpe-2.15.orig/configure	2013-09-06 17:27:13.000000000 +0200
++++ nrpe-2.15/configure	2013-11-21 14:11:45.491269701 +0100
+@@ -6738,14 +6738,6 @@
+ 
+ 
+ 						echo ""
+-			echo "*** Generating DH Parameters for SSL/TLS ***"
+-			if test -f "$ssldir/sbin/openssl"; then
+-				sslbin=$ssldir/sbin/openssl
+-			else
+-				sslbin=$ssldir/bin/openssl
+-			fi
+-			# awk to strip off meta data at bottom of dhparam output
+-			$sslbin dhparam -C 512 | awk '/^-----/ {exit} {print}' > include/dh.h
+ 		fi
+ 	fi
+ 
diff --git a/recipes-extended/nagios/nagios-nrpe/nagios-nrpe.service b/recipes-extended/nagios/nagios-nrpe/nagios-nrpe.service
new file mode 100644
index 0000000..c5a0bda
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nrpe/nagios-nrpe.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Nagios nrpe plugin
+After=syslog.target network.target
+
+[Service]
+ExecStart=/usr/bin/nrpe -c /etc/nagios/nrpe.cfg -f
+TimeoutSec=60
+
+[Install]
+WantedBy=multi-user.target
diff --git a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
new file mode 100644
index 0000000..9493336
--- /dev/null
+++ b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
@@ -0,0 +1,100 @@
+require nagios-common.inc
+
+DESCRIPTION = "Nagios Remote Plugin Executor"
+HOMEPAGE = "http://exchange.nagios.org"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://src/nrpe.c;beginline=1;endline=35;md5=0dadd78599abbc737af81432702e9161"
+
+SRCNAME = "nrpe"
+
+SRC_URI = "https://github.com/NagiosEnterprises/nrpe/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.gz \
+           file://check_nrpe.cfg \
+           file://nagios-nrpe.service \
+"
+
+SRC_URI[md5sum] = "8997e195fea93cdceb8c7ed8ac1d43bc"
+SRC_URI[sha256sum] = "8ad2d1846ab9011fdd2942b8fc0c99dfad9a97e57f4a3e6e394a4ead99c0f1f0"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit autotools-brokensep update-rc.d systemd
+
+# IP address of server which proxy should connect to
+MONITORING_PROXY_SERVER_IP ??= "192.168.7.2"
+
+# IP address of server which agent should connect to
+MONITORING_AGENT_SERVER_IP ??= "192.168.7.4"
+
+EXTRA_OECONF += "--with-nrpe-user=${NAGIOS_USER} \
+                 --with-nrpe-group=${NAGIOS_GROUP} \
+                 ac_cv_lib_wrap_main=no \
+                 ac_cv_path_PERL=${bindir}/perl \
+"
+
+EXTRA_OECONF_SSL = "--with-ssl=${STAGING_DIR_HOST} \
+                    --with-ssl-inc=${STAGING_DIR_HOST}${includedir} \
+                    --with-ssl-lib=${STAGING_DIR_HOST}${libdir} \
+"
+
+PACKAGECONFIG[ssl] = "${EXTRA_OECONF_SSL},--disable-ssl,openssl,"
+PACKAGECONFIG[cmdargs] = "--enable-command-args,--disable-command-args,,"
+PACKAGECONFIG[bashcomp] = "--enable-bash-command-substitution,--disable-bash-command-substitution,,"
+
+PACKAGECONFIG ??= "cmdargs bashcomp"
+
+do_configure() {
+    oe_runconf || die "make failed"
+}
+
+do_compile() {
+    oe_runmake all
+}
+
+do_install_append() {
+    oe_runmake 'DESTDIR=${D}' install-daemon
+    oe_runmake 'DESTDIR=${D}' install-config
+
+    install -d ${D}${sysconfdir}/init.d
+    install -m 755 ${B}/startup/debian-init ${D}${sysconfdir}/init.d/nrpe
+
+    install -d ${D}${NAGIOS_CONF_DIR}/nrpe.d
+    echo "include_dir=${NAGIOS_CONF_DIR}/nrpe.d" >> ${D}${NAGIOS_CONF_DIR}/nrpe.cfg
+
+    sed -e "s/^allowed_hosts=.*/allowed_hosts=${MONITORING_AGENT_SERVER_IP}/g" \
+        -i ${D}${NAGIOS_CONF_DIR}/nrpe.cfg
+
+    install -d ${D}${NAGIOS_PLUGIN_CONF_DIR}
+    install -m 664 ${WORKDIR}/check_nrpe.cfg ${D}${NAGIOS_PLUGIN_CONF_DIR}
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/nagios-nrpe.service ${D}${systemd_unitdir}/system/
+    fi
+
+    rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/nagios
+}
+
+PACKAGES = "${PN}-dbg ${PN}-plugin ${PN}-daemon"
+
+FILES_${PN}-plugin = "${NAGIOS_PLUGIN_DIR} \
+                      ${NAGIOS_PLUGIN_CONF_DIR} \
+"
+
+FILES_${PN}-daemon = "${sysconfdir} \
+                      ${bindir} \
+                      ${nonarch_libdir}/tmpfiles.d/ \
+"
+
+RDEPENDS_${PN}-daemon = "nagios-base"
+RDEPENDS_${PN}-plugin = "nagios-base"
+
+SYSTEMD_PACKAGES = "${PN}-daemon"
+SYSTEMD_SERVICE_${PN}-daemon = "nagios-nrpe.service"
+SYSTEMD_AUTO_ENABLE_${PN}-daemon = "enable"
+
+INITSCRIPT_PACKAGES = "${PN}-daemon"
+INITSCRIPT_NAME_${PN}-daemon = "nrpe"
+INITSCRIPT_PARAMS_${PN}-daemon = "defaults"
-- 
2.7.4


