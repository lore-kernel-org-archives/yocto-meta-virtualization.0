Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C317E00B4C; Mon, 28 May 2018 06:16:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3338E00A51
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 06:16:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4SDFVDE008246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 06:16:12 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 28 May 2018 06:15:46 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 28 May 2018 09:14:49 -0400
Message-ID: <1527513289-5463-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527513289-5463-1-git-send-email-mark.asselstine@windriver.com>
References: <1527513289-5463-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] lxc: cleanup the lxc-networking package
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
X-List-Received-Date: Mon, 28 May 2018 13:16:24 -0000
Content-Type: text/plain

Adding missing RDEPENDS on iptables, the lxc-net service will fail
without this. Use the new 'pkg_postinst_ontarget_' instead of failing
out to signal runtime postinst scripts, this conforms with the latest
expectation for bitbake. The interfaces file is specific to sysvinit
and unneeded for systemd so block the creation of these files only
when building for sysvinit.

Lastly add a default 'lxc-net' file. Since we have a separate
lxc-networking package we can complete it with this configuration
which is sourced by '/etc/default/lxc' (which is part of the core lxc
package). In doing this we are like Debian when the lxc-networking
package is not installed in the image, and like Ubuntu when it is.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/lxc/files/lxc-net |  9 +++++++++
 recipes-containers/lxc/lxc_2.0.8.bb  | 24 +++++++++++++++---------
 2 files changed, 24 insertions(+), 9 deletions(-)
 create mode 100644 recipes-containers/lxc/files/lxc-net

diff --git a/recipes-containers/lxc/files/lxc-net b/recipes-containers/lxc/files/lxc-net
new file mode 100644
index 0000000..1c59b70
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-net
@@ -0,0 +1,9 @@
+USE_LXC_BRIDGE="true"
+LXC_BRIDGE="lxcbr0"
+LXC_ADDR="10.0.3.1"
+LXC_NETMASK="255.255.255.0"
+LXC_NETWORK="10.0.3.0/24"
+LXC_DHCP_RANGE="10.0.3.2,10.0.3.254"
+LXC_DHCP_MAX="253"
+LXC_DHCP_CONFILE=""
+LXC_DOMAIN=""
diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index 4473fdd..46fa9a7 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -30,6 +30,8 @@ RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
 
 RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash"
 
+RDEPENDS_${PN}-networking += "iptables"
+
 SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://runtest.patch \
@@ -40,6 +42,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
 	file://cgroups-work-around-issue-in-gcc-7.patch \
 	file://dnsmasq.conf \
+	file://lxc-net \
 	"
 
 SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
@@ -107,7 +110,10 @@ FILES_lua-${PN}-dbg += "${libdir}/lua/lxc/.debug"
 FILES_${PN}-templates += "${datadir}/lxc/templates"
 RDEPENDS_${PN}-templates += "bash"
 
-FILES_${PN}-networking += "${sysconfdir}/init.d/lxc-net"
+FILES_${PN}-networking += " \
+    ${sysconfdir}/init.d/lxc-net \
+    ${sysconfdir}/default/lxc-net \
+"
 
 PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
 
@@ -138,6 +144,11 @@ do_install_append() {
 	    rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
 	fi
 
+	# /etc/default/lxc sources lxc-net, this allows lxc bridge when lxc-networking
+	# is not installed this results in no lxcbr0, but when lxc-networking is installed
+	# lxcbr0 will be fully configured.
+	install -m 644 ${WORKDIR}/lxc-net ${D}${sysconfdir}/default/
+
 	# Force the main dnsmasq instance to bind only to specified interfaces and
 	# to not bind to virbr0. Libvirt will run its own instance on this interface.
 	install -d ${D}/${sysconfdir}/dnsmasq.d
@@ -156,14 +167,8 @@ pkg_postinst_${PN}() {
 	fi
 }
 
-pkg_postinst_${PN}-networking() {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	# setup for our bridge
-        echo "lxc.network.link=lxcbr0" >> ${sysconfdir}/lxc/default.conf
-
+pkg_postinst_ontarget_${PN}-networking() {
+if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 cat >> /etc/network/interfaces << EOF
 
 auto lxcbr0
@@ -187,4 +192,5 @@ if test "x\$IFACE" = xlxcbr0 ; then
 fi
 EOF
 chmod 755 /etc/network/if-pre-up.d/lxcbr0
+fi
 }
-- 
2.7.4


