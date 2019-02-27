Return-Path: <Dengke.Du@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91EC6E00D04; Tue, 26 Feb 2019 23:14:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBF17E0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Feb 2019 23:14:53 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1R7ErXn026775
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Feb 2019 23:14:53 -0800 (PST)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Tue, 26 Feb 2019 23:14:52 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 27 Feb 2019 15:33:56 +0800
Message-ID: <1551252836-30506-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: add hook support
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
X-List-Received-Date: Wed, 27 Feb 2019 07:14:54 -0000
Content-Type: text/plain

1. Add a hook support script for libvirt
   Add daemon, qemu, lxc and network script when the correspond to
   libvirt daemon, qemu guest, lxc guest and network started or stoped,
   based on:
   https://libvirt.org/hooks.html

2. Add a qemu user and a qemu group and a kvm group

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-extended/libvirt/libvirt/hook_support.py | 55 ++++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_4.9.0.bb        | 25 ++++++++++-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100755 recipes-extended/libvirt/libvirt/hook_support.py

diff --git a/recipes-extended/libvirt/libvirt/hook_support.py b/recipes-extended/libvirt/libvirt/hook_support.py
new file mode 100755
index 0000000..c3eb8b3
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/hook_support.py
@@ -0,0 +1,55 @@
+#!/usr/bin/env python
+#
+# Copyright (C) 2014 Wind River Systems, Inc. 
+# 
+# Description: Calls other scripts in order, so that there can be multiple
+# scripts for a particular hook tied to libvirt.
+#
+# For example: If this script is called "qemu" and is in the
+# "/etc/libvirt/hooks/" directory.  This script will be called by libvirt
+# when certain actions are performed on a qemu guest.  This script then
+# will in turn call any executable file in the same directory matching
+# "qemu-" followed by at least one alpha-numeric character.  The scripts
+# are called in order (based on the python sorted function), and once any
+# sub-script returns a non-zero exit code no futher scripts are called.
+# This script passes any arguments it retrieves on the command line and a
+# copy of stdin to the sub-scripts it calls.
+
+import os
+import re
+import subprocess
+import sys
+
+def main():
+	return_value = 0
+	hook_name = os.path.basename( __file__ )
+	try:
+		hook_dir = os.path.dirname( __file__ )
+		hook_args = sys.argv
+		del hook_args[ 0 ] # Remove executable from argument list
+
+		# Save stdin, so we can pass it to each sub-script.
+		if sys.stdin.isatty():
+			stdin_save = [ "" ]
+		else: 
+			stdin_save = sys.stdin.readlines()
+		# Match the name name of the hook + a dash + atleast
+		# one alpha-numeric character.
+		matcher = re.compile( "%s-\w+" % hook_name )
+		for file_name in sorted( os.listdir( hook_dir ) ):
+			file_path = os.path.join( hook_dir, file_name )
+			if matcher.match( file_name ) \
+			   and os.access( file_path, os.X_OK ) \
+			   and os.path.isfile( file_path ) \
+			   and return_value == 0:
+				cmd = [ file_path ] + hook_args
+				p = subprocess.Popen( cmd, stdin=subprocess.PIPE )
+				p.communicate( input = ''.join( stdin_save ) )[0]
+				return_value = p.wait()
+	except Exception as e:
+		sys.stderr.write( "%s hook error: %s\n" % ( hook_name, str( e ) ) )
+		return_value = 1
+	return return_value
+
+if __name__ == '__main__':
+	sys.exit( main() )
diff --git a/recipes-extended/libvirt/libvirt_4.9.0.bb b/recipes-extended/libvirt/libvirt_4.9.0.bb
index ccd4f83..17ac799 100644
--- a/recipes-extended/libvirt/libvirt_4.9.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.9.0.bb
@@ -35,12 +35,16 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://install-missing-file.patch \
            file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
            file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
+           file://hook_support.py \
           "
 
 SRC_URI[libvirt.md5sum] = "aaf7b265ac2013d6eb184a86b5f7eeb9"
 SRC_URI[libvirt.sha256sum] = "4fd4bfe7312b7996a817c7919cf0062de0d5b3c400c93bd30855a46c40dd455a"
 
-inherit autotools gettext update-rc.d pkgconfig ptest systemd
+inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r qemu; -r kvm"
+USERADD_PARAM_${PN} = "-r -g qemu -G kvm qemu"
 
 # Override the default set in autotools.bbclass so that we will use relative pathnames
 # to our local m4 files.  This prevents an "Argument list too long" error during configuration
@@ -180,9 +184,11 @@ PRIVATE_LIBS_${PN}-ptest = " \
 # full config
 PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
                    remote macvtap libvirtd netcf udev python ebtables \
+                   fuse iproute2 firewalld libpcap \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
+                   ${@bb.utils.contains('KARCH', 'arm', '', 'numactl', d)} \
                   "
 
 # qemu is NOT compatible with mips64
@@ -221,6 +227,10 @@ PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
 PACKAGECONFIG[libcap-ng] = "--with-capng,--without-capng,libcap-ng,"
 PACKAGECONFIG[wireshark] = "--with-wireshark-dissector,--without-wireshark-dissector,wireshark libwsutil,"
+PACKAGECONFIG[apparmor-profiles] = "--with-apparmor-profiles, --without-apparmor-profiles,"
+PACKAGECONFIG[firewalld] = "--with-firewalld, --without-firewalld,"
+PACKAGECONFIG[libpcap] = "--with-libpcap, --without-libpcap,libpcap,libpcap"
+PACKAGECONFIG[numad] = "--with-numad, --without-numad,"
 
 # Enable the Python tool support
 require libvirt-python.inc
@@ -281,6 +291,10 @@ do_install_append() {
 
 	# Add hook support for libvirt
 	mkdir -p ${D}/etc/libvirt/hooks
+	for hook in "daemon" "lxc" "network" "qemu"
+	do
+		install -m 0755 ${WORKDIR}/hook_support.py ${D}/etc/libvirt/hooks/${hook}
+	done
 
 	# Force the main dnsmasq instance to bind only to specified interfaces and
 	# to not bind to virbr0. Libvirt will run its own instance on this interface.
@@ -290,11 +304,19 @@ do_install_append() {
 	for i in `find ${D}${libdir} -type f -name *.la`; do
 	    sed -i -e 's#-L${B}/src/.libs##g' $i
 	done
+
+	sed -i -e 's/^\(unix_sock_group\ =\ \).*/\1"kvm"/' ${D}/etc/libvirt/libvirtd.conf
+	sed -i -e 's/^\(unix_sock_rw_perms\ =\ \).*/\1"0776"/' ${D}/etc/libvirt/libvirtd.conf
+	chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
+	echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" \
+	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
 }
 
 EXTRA_OECONF += " \
     --with-init-script=systemd \
     --with-test-suite \
+    --with-qemu-user=qemu \
+    --with-qemu-group=qemu \
     "
 
 EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
@@ -318,6 +340,7 @@ pkg_postinst_${PN}() {
         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                 /etc/init.d/populate-volatile.sh update
         fi
+        mkdir -m 711 -p $D/data/images
 }
 
 python () {
-- 
2.7.4


