Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A3DEE00CCB; Tue, 22 Nov 2016 10:56:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3F3BE00CC0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:42 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAMIue0N018528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:42 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 10:56:40 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 22 Nov 2016 13:56:13 -0500
Message-ID: <1479840976-10540-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 1/4] lxc: updates to allow the creation of lxcbr0 with systemd
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
X-List-Received-Date: Tue, 22 Nov 2016 18:56:44 -0000
Content-Type: text/plain

The recipe is setup to create lxcbr0 when used with sysvinit but there
are some gaps to getting this bridge working when the system is built
with systemd. Using parts found in the upstream package as well as
configurations hints from other distros we can fill in the gaps to
allow lxcbr0 to be created at startup, with the lxc-networking package
is included in the rootfs.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/lxc/files/default.lxc-net | 30 ++++++++++++++++++++++++++++
 recipes-containers/lxc/files/dnsmasq.lxc     |  5 +++++
 recipes-containers/lxc/lxc_2.0.0.bb          | 16 +++++++++++++--
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 recipes-containers/lxc/files/default.lxc-net
 create mode 100644 recipes-containers/lxc/files/dnsmasq.lxc

diff --git a/recipes-containers/lxc/files/default.lxc-net b/recipes-containers/lxc/files/default.lxc-net
new file mode 100644
index 0000000..8013453
--- /dev/null
+++ b/recipes-containers/lxc/files/default.lxc-net
@@ -0,0 +1,30 @@
+# Sourced from package lxc.spec file
+#
+# Leave USE_LXC_BRIDGE as "true" if you want to use lxcbr0 for your
+# containers.  Set to "false" if you'll use virbr0 or another existing
+# bridge, or mavlan to your host's NIC.
+USE_LXC_BRIDGE="true"
+
+# If you change the LXC_BRIDGE to something other than lxcbr0, then
+# you will also need to update your /etc/lxc/default.conf as well as the
+# configuration (/var/lib/lxc/<container>/config) for any containers
+# already created using the default config to reflect the new bridge
+# name.
+# If you have the dnsmasq daemon installed, you'll also have to update
+# /etc/dnsmasq.d/lxc and restart the system wide dnsmasq daemon.
+LXC_BRIDGE="lxcbr0"
+LXC_ADDR="10.0.3.1"
+LXC_NETMASK="255.255.255.0"
+LXC_NETWORK="10.0.3.0/24"
+LXC_DHCP_RANGE="10.0.3.2,10.0.3.254"
+LXC_DHCP_MAX="253"
+# Uncomment the next line if you'd like to use a conf-file for the lxcbr0
+# dnsmasq.  For instance, you can use 'dhcp-host=mail1,10.0.3.100' to have
+# container 'mail1' always get ip address 10.0.3.100.
+#LXC_DHCP_CONFILE=/etc/lxc/dnsmasq.conf
+
+# Uncomment the next line if you want lxcbr0's dnsmasq to resolve the .lxc
+# domain.  You can then add "server=/lxc/10.0.3.1' (or your actual $LXC_ADDR)
+# to /etc/dnsmasq.conf, after which 'container1.lxc' will resolve on your
+# host.
+#LXC_DOMAIN="lxc"
diff --git a/recipes-containers/lxc/files/dnsmasq.lxc b/recipes-containers/lxc/files/dnsmasq.lxc
new file mode 100644
index 0000000..36be353
--- /dev/null
+++ b/recipes-containers/lxc/files/dnsmasq.lxc
@@ -0,0 +1,5 @@
+# Tell any system-wide dnsmasq instance to make sure to bind to interfaces
+# instead of listening on 0.0.0.0
+# WARNING: changes to this file will get lost if lxc is removed.
+bind-interfaces
+except-interface=lxcbr0
diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.0.bb
index 5e45949..9e15508 100644
--- a/recipes-containers/lxc/lxc_2.0.0.bb
+++ b/recipes-containers/lxc/lxc_2.0.0.bb
@@ -30,6 +30,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-fix-B-S.patch \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
+	file://default.lxc-net \
+	file://dnsmasq.lxc \
 	"
 
 SRC_URI[md5sum] = "04a7245a614cd3296b0ae9ceeeb83fbb"
@@ -40,7 +42,7 @@ S = "${WORKDIR}/${BPN}-${PV}"
 # Let's not configure for the host distro.
 #
 PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
-EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
+EXTRA_OECONF += "--with-distro=yocto ${PTEST_CONF}"
 
 EXTRA_OECONF += "--with-init-script=\
 ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
@@ -76,6 +78,10 @@ SYSTEMD_PACKAGES = "${PN}-setup"
 SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
 SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
 
+SYSTEMD_PACKAGES += "${PN}-networking"
+SYSTEMD_SERVICE_${PN}-networking = "lxc-net.service"
+SYSTEMD_AUTO_ENABLE_${PN}-networking = "enable"
+
 INITSCRIPT_PACKAGES = "${PN}-setup"
 INITSCRIPT_NAME_{PN}-setup = "lxc"
 INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
@@ -89,7 +95,8 @@ PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
 FILES_${PN}-templates += "${datadir}/lxc/templates"
 RDEPENDS_${PN}-templates += "bash"
 
-ALLOW_EMPTY_${PN}-networking = "1"
+FILES_${PN}-networking += "/etc/default/lxc-net"
+FILES_${PN}-networking += "/etc/dnsmasq.d/lxc"
 
 FILES_${PN}-setup += "/etc/tmpfiles.d"
 FILES_${PN}-setup += "/lib/systemd/system"
@@ -126,6 +133,11 @@ do_install_append() {
 	    if [ -d ${D}${exec_prefix}/lib/python* ]; then mv ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi
 	    rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
 	fi
+
+	install -d ${D}${sysconfdir}/default
+	install -d ${D}${sysconfdir}/dnsmasq.d
+	install -m 644 ${WORKDIR}/default.lxc-net ${D}${sysconfdir}/default/lxc-net
+	install -m 644 ${WORKDIR}/dnsmasq.lxc ${D}${sysconfdir}/dnsmasq.d/lxc
 }
 
 EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
-- 
2.7.4


