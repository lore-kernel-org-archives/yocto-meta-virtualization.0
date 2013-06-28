Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93A3DE00348
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Jun 2013 10:25:51 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5SHPquo004467
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Jun 2013 10:25:52 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 28 Jun 2013 10:25:51 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 28 Jun 2013 13:26:02 -0400
Message-ID: <1372440363-25329-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1372440363-25329-1-git-send-email-mark.asselstine@windriver.com>
References: <1372440363-25329-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH 2/3] libvirt: use 4 fields for PACKAGECONFIG[]
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
X-List-Received-Date: Fri, 28 Jun 2013 17:25:52 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

As per the PACKAGECONFIG documentation "You can omit any argument you
like but must retain the separating commas".

If we do not retain the separating commas, we might get parsing
errors, or, worse, we will think we depend on many items that we do
not enable.

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb | 38 ++++++++++++++++---------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index 845baf5..fb4b9bb 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 SECTION = "console/tools"
-PR = "r7"
+PR = "r8"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
 	   iptables ebtables dnsmasq readline"
@@ -115,29 +115,31 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
 	           polkit lxc test remote macvtap libvirtd netcf udev python ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 
-PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"
+# enable,disable,depends,rdepends
+#
+PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
-PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen"
-PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi"
-PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen"
-PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen"
-PACKAGECONFIG[uml] = "--with-uml, --without-uml"
-PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz"
-PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware"
-PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp"
-PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox"
-PACKAGECONFIG[esx] = "--with-esx,--without-esx"
-PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv"
+PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen,"
+PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
+PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
+PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen,"
+PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
+PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
+PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
+PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp,,"
+PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox,,"
+PACKAGECONFIG[esx] = "--with-esx,--without-esx,,"
+PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv,,"
 PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit,polkit"
-PACKAGECONFIG[lxc] = "--with-lxc,--without-lxc, lxc"
-PACKAGECONFIG[test] = "--with-test=yes,--with-test=no"
-PACKAGECONFIG[remote] = "--with-remote,--without-remote"
+PACKAGECONFIG[lxc] = "--with-lxc,--without-lxc, lxc,"
+PACKAGECONFIG[test] = "--with-test=yes,--with-test=no,,"
+PACKAGECONFIG[remote] = "--with-remote,--without-remote,,"
 PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
-PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
+PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd,,"
 PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
 PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
 PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciaccess,"
-PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
 # Enable the Python tool support
 require libvirt-python.inc
 
-- 
1.8.1.2


