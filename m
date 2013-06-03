Return-Path: <Paul.Barrette@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB919E01409
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Jun 2013 14:02:33 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r53L2W88029064
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jun 2013 14:02:32 -0700 (PDT)
Received: from yow-pbarrett-lx.wrs.com (128.224.146.11) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 3 Jun 2013 14:02:31 -0700
From: Paul Barrette <paul.barrette@windriver.com>
To: <bruce.ashfield@mail.windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 3 Jun 2013 17:02:27 -0400
Message-ID: <1370293347-30609-1-git-send-email-paul.barrette@windriver.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH] openvswitch: uprev to 1.10 and documentation update.
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
X-List-Received-Date: Mon, 03 Jun 2013 21:02:34 -0000
Content-Type: text/plain

-Uprev to 1.10
-removed vswitch_test.sh
-added openvswitch.txt.

Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
---
 docs/00-INDEX                                      |   2 +
 docs/openvswitch.txt                               |  96 +++++++++++++++++++
 docs/vswitch_test.sh                               |  36 --------
 .../openvswitch/openvswitch_1.10.0.bb              | 102 +++++++++++++++++++++
 4 files changed, 200 insertions(+), 36 deletions(-)
 create mode 100644 docs/openvswitch.txt
 delete mode 100755 docs/vswitch_test.sh
 create mode 100644 recipes-networking/openvswitch/openvswitch_1.10.0.bb

diff --git a/docs/00-INDEX b/docs/00-INDEX
index 41d83a5..a2ffd99 100644
--- a/docs/00-INDEX
+++ b/docs/00-INDEX
@@ -8,3 +8,5 @@ alphabetical order as well.
 00-README
         - info on the goals of meta-virtualization and this docs subdir
 
+openvswitch.txt
+	- example on how to setup openvswitch with qemu/kvm.
diff --git a/docs/openvswitch.txt b/docs/openvswitch.txt
new file mode 100644
index 0000000..4410d27
--- /dev/null
+++ b/docs/openvswitch.txt
@@ -0,0 +1,96 @@
+Simple setup for connecting openvswitch to qemu/kvm
+===================================================
+This example brings up openvswitch using a private network.
+
+Preliminary notes
+=================
+1. Make sure to build kernel support for openvswitch as a module.  The
+openvswitch init scripts expect to load a module and upon success
+continue to setup the switch.  If openvswitch is compiled
+statically, the init scripts not load the ovs-vswitchd daemon
+and none of the configured bridges will show up in the interfaces
+table (ifconfig).  You can get around this limiation by running the
+following by hand:
+	# ovs-vswitchd --pidfile --detach
+
+2. Verify that ovs-vswitchd is running before proceeding:
+	# /etc/init.d/openvswitch-switch status
+	ovsdb-server is running with pid 1867
+	ovs-vswitchd is running with pid 1877
+
+3. A kernel and rootfs is required for qemu bring up.
+
+Qemu Setup
+==========
+The host requires a /etc/qemu-ifup script to setup the bridging and tap
+devices.  Qemu will invoke this qemu-ifup script at startup.  Here is
+an example script:
+$ cat /etc/qemu-fup
+	#!/bin/sh
+	# the tap is dynamically assigned and passed into this script
+	# as a parameter
+	TAP=$1
+
+	# Note: if booting over NFS, once the $ETH0 device is added to the bridge,
+	# your host will be unusable.  In that case, setup networking
+	# init scripts appropriately and change the following to work
+	# with it.
+	ETH0="eth1"
+	NETMASK=255.255.255.0
+	IP=192.168.1.1
+	GATEWAY=
+	SWITCH=ovsbr0
+	if [ -n "$TAP" ];then
+		ifconfig $TAP up
+		ifconfig $SWITCH down &>/dev/null
+		ovs-vsctl del-br $SWITCH
+		ovs-vsctl add-br $SWITCH
+		ifconfig $ETH0 0.0.0.0
+		ifconfig $SWITCH $IP up netmask $NETMASK
+		#-- external access not required for this test.
+		#route add default gw $GATEWAY
+		ovs-vsctl add-port $SWITCH $ETH0
+		ovs-vsctl add-port $SWITCH $TAP
+		exit 0
+	else
+		echo "$0: No tap device"
+		exit 1
+	fi
+
+Start Qemu
+==========
+This example will bring up qemu with a tap network interface.
+Note: this command must be run as root due to the networking setup.
+
+	$ qemu-system-x86_64 -nographic -k en-us -m 1024  \
+		-net nic,macaddr=1a:46:0b:ca:bc:7a,model=virtio \
+		-net tap -enable-kvm\
+		-kernel /opt/dpdk-guest-kernel \
+		-append 'root=/dev/vda ro console=ttyS0' \
+		-drive file=/opt/intel-xeon-core-ovp-kvm-preempt-rt-dist.ext3,cache=none,if=virtio
+
+Once the guest OS is up and running, configure the quest network interface:
+	$ ifconfig eth0 192.168.1.10
+
+Ping the bridge:
+	$ ping 192.168.1.1
+
+From the host, view the bridged network:
+$ ovs-vsctl show
+c1212b96-ef49-4a8e-b598-09b05b854dd0
+    Bridge "ovsbr0"
+        Port "tap0"
+            Interface "tap0"
+        Port "eth1"
+            Interface "eth1"
+        Port "ovsbr0"
+            Interface "ovsbr0"
+                type: internal
+
+At this point, openvswitch is up and running.  If you want external
+network access, you need to set a GATEWAY in the qemu-ifup script and
+make sure the external device is part of the bridge.
+
+Note:
+Proper setup will require a /etc/qemu-ifdown script to tear down the
+bridge and interfaces. (not provided here).
diff --git a/docs/vswitch_test.sh b/docs/vswitch_test.sh
deleted file mode 100755
index 63168e3..0000000
--- a/docs/vswitch_test.sh
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/bin/sh
-
-# runqemu defaults for the first "guest"
-#
-my_inet4="192.168.7.2"
-my_gw="192.168.7.1"
-
-# create a bridge
-#
-ovs-vsctl add-br br-int
-
-# Add a physical interface to your virtual bridge for connectivity off box.
-# If your rootfs is nfs mounted (on eth0), you will die after attaching it
-# to the bridge.
-#
-ovs-vsctl add-port br-int eth0
-
-# Zero out your eth0 interface and slap it on the bridge interface.
-#
-ifconfig eth0 0
-ifconfig br-int ${my_inet4} netmask 255.255.255.0
-
-# Change your default route.  If you don't do this, nothing will
-# be reachable.
-#
-route add default gw ${my_gw} br-int
-
-(You can then check that the connection works.)
-
-# The bridge configuration is persistant, so if something goes wrong
-# and you reboot, it will still be messed up.  Destroy the bridge,
-# then add a route, or reboot.
-#
-ovs-vsctl del-br br-int
-ifconfig eth0 ${my_inet4}
-route add default gw ${my_gw} eth0
diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
new file mode 100644
index 0000000..2e89454
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -0,0 +1,102 @@
+SUMMARY = "OpenvSwitch"
+DESCRIPTION = "Open vSwitch is a production quality, multilayer virtual switch licensed under the open source Apache 2.0 license. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
+HOMEPAGE = "http://openvswitch.org/"
+SECTION = "networking"
+LICENSE = "Apache-2"
+
+DEPENDS += "bridge-utils openssl python perl"
+
+RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid \
+	       python perl perl-module-strict ${PN}-switch ${PN}-controller"
+RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
+RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
+RDEPENDS_${PN}-pki = "${PN}"
+RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
+RRECOMMENDS_${PN} += "kernel-module-openvswitch"
+
+PR = "r0"
+
+SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
+	file://openvswitch-switch \
+	file://openvswitch-switch-setup \
+	file://openvswitch-controller \
+	file://openvswitch-controller-setup \
+	"
+
+SRC_URI[md5sum] = "e9004202b0e10c0de9870f19d2044f11"
+SRC_URI[sha256sum] = "825730db82c7b46a142f057a43345590c299e66704ef7a88d9ed4ffd0c3d6b64"
+LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
+
+# Don't compile kernel modules by default since it heavily depends on
+# kernel version. Use the in-kernel module for now.
+# distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
+# EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
+
+ALLOW_EMPTY_${PN}-pki = "1"
+PACKAGES =+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
+
+FILES_${PN}-controller = "${sysconfdir}/init.d/openvswitch-controller \
+	${sysconfdir}/default/openvswitch-controller \
+	${sysconfdir}/openvswitch-controller \
+	${bindir}/ovs-controller"
+
+FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
+
+FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
+		   ${sysconfdir}/default/openvswitch-switch \
+		   "
+# silence a warning
+FILES_${PN} += "${datadir}/ovsdbmonitor"
+
+inherit autotools update-rc.d
+
+INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
+INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
+INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
+
+INITSCRIPT_NAME_${PN}-controller = "openvswitch-controller"
+INITSCRIPT_PARAMS_${PN}-controller = "defaults 72"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/default/
+	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
+	install -d ${D}/${sysconfdir}/openvswitch-controller
+	install -m 660 ${WORKDIR}/openvswitch-controller-setup ${D}/${sysconfdir}/default/openvswitch-controller
+
+	install -d ${D}/${sysconfdir}/init.d/
+	install -m 755 ${WORKDIR}/openvswitch-controller ${D}/${sysconfdir}/init.d/openvswitch-controller
+	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
+	true || rm -fr ${D}/${datadir}/${PN}/pki
+}
+
+pkg_postinst_${PN}-pki () {
+	# can't do this offline
+        if [ "x$D" != "x" ]; then
+                exit 1
+        fi
+	if test ! -d $D/${datadir}/${PN}/pki; then
+            ovs-pki init --dir=$D/${datadir}/${PN}/pki
+        fi
+}
+
+pkg_postinst_${PN}-controller () {
+        # can't do this offline
+        if [ "x$D" != "x" ]; then
+                exit 1
+        fi
+
+	cd $D/${sysconfdir}/openvswitch-controller
+        if ! test -e cacert.pem; then
+            ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
+        fi
+        if ! test -e privkey.pem || ! test -e cert.pem; then
+            oldumask=$(umask)
+            umask 077
+            ovs-pki req+sign --dir=$D/${datadir}/${PN}/pki tmp controller >/dev/null
+            mv tmp-privkey.pem privkey.pem
+            mv tmp-cert.pem cert.pem
+            mv tmp-req.pem req.pem
+            chmod go+r cert.pem req.pem
+            umask $oldumask
+        fi
+}
-- 
1.8.1.4


