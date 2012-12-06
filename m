Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50928E006C0
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:50 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4182794eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=GOHB4+CwGL00RspRbiRYT8Jq5WuyecaF6gXcaia3A7Q=;
	b=tXClgbRCD2Kd+FV3x9MFvSOwaBNK+qmnSojiZRmykrYGy8AptOrukKhMYYAT/xIgzF
	UAACJScf8U4OfkAV5PjTixwtL5JivQJammNxcWf1LUE+acZ7S7ALHwwdoAY5YH+6BjtQ
	VR16zx1JuJbcRc0KJSVJIUS3dFCSI1h+4V3xYVs7R7Esz3wsiIOJTEDS1vjxE6XWRJaR
	45kb0liniLF01AQB7Utjx76ZZLBn2NEaOub/of/puke3ED+YrtR+y2EroBCg8z4hbZfl
	oJprRq5Ctb5v/yAnUyjw27noTNQ6QYldfnsCI9ANS+zC/Dt/JsQqEI5M82c5DK/cAY/c
	qeKw==
Received: by 10.14.203.8 with SMTP id e8mr7799820eeo.2.1354813609876;
	Thu, 06 Dec 2012 09:06:49 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id b2sm16975117eep.9.2012.12.06.09.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 576544011BC; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:34 +0100
Message-Id: <1354813596-8233-14-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 13/15] Updated libvirt to 1.0.0, added more details to packageconfig
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 .../{libvirt_0.10.2.bb => libvirt_1.0.0.bb}        |   69 +++++++++++++-------
 1 file changed, 46 insertions(+), 23 deletions(-)
 copy recipes-extended/libvirt/{libvirt_0.10.2.bb => libvirt_1.0.0.bb} (61%)

diff --git a/recipes-extended/libvirt/libvirt_0.10.2.bb b/recipes-extended/libvirt/libvirt_1.0.0.bb
similarity index 61%
copy from recipes-extended/libvirt/libvirt_0.10.2.bb
copy to recipes-extended/libvirt/libvirt_1.0.0.bb
index 23cd885..5374237 100644
--- a/recipes-extended/libvirt/libvirt_0.10.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
@@ -5,9 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 SECTION = "console/tools"
 PR = "r0"
 
-DEPENDS="bridge-utils gnutls libxml2 lvm2 avahi polkit parted curl libpcap util-linux e2fsprogs pm-utils iptables ebtables dnsmasq"
+DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
+	   iptables ebtables dnsmasq readline"
 
-RDEPENDS_${PN}-libvirtd = "bridge-utils iptables pm-utils dnsmasq ebtables dmidecode "
+# These might be included by PACKAGECONFIG
+#RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
+
+RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq openbsd-netcat"
+RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
+RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
 
 #connman blocks the 53 port and libvirtd can't start its DNS service
 RCONFLICTS_${PN}_libvirtd = "connman"
@@ -16,25 +22,11 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
 	file://libvirtd.sh \
 	file://libvirtd.conf"
 
-SRC_URI[md5sum] = "a5e50860d9da238ba270b528411c4a0d"
-SRC_URI[sha256sum] = "1fe69ae1268a097cc0cf83563883b51780d528c6493efe3e7d94c4160cc46977"
+SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
+SRC_URI[sha256sum] = "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
 
 inherit autotools gettext update-rc.d
 
-# Trimmed down version for Xen daemon server
-EXTRA_OECONF = "--with-libvirtd --with-test=yes --with-remote=yes --with-macvtap=no --with-polkit=no"
-
-PACKAGECONFIG ??= "xen"
-PACKAGECONFIG[qemu] = "--with-qemu --with-yajl,--without-qemu --without-yajl,qemu yajl"
-PACKAGECONFIG[xen] = "--with-xen --with-xenapi --with-libxl=${STAGING_DIR_TARGET}/lib --with-xen-inotify,--without-xen --without-xenapi --without-libxl --without-xen-inotify,xen"
-PACKAGECONFIG[uml] = "--with-uml, --without-uml"
-PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz"
-PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware"
-PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp"
-PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox"
-PACKAGECONFIG[esx] = "--with-esx,--without-esx"
-PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv"
-
 CACHED_CONFIGUREVARS += "\
 ac_cv_path_XMLLINT=/usr/bin/xmllint \
 ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
@@ -89,6 +81,8 @@ ALLOW_EMPTY_${PN} = "1"
 
 PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
 
+ALLOW_EMPTY_${PN}-libvirtd = "1"
+
 FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
 	${sysconfdir}/sysctl.d \
 	${sysconfdir}/logrotate.d \
@@ -96,16 +90,45 @@ FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
 	${sbindir}/libvirtd"
 
 FILES_${PN}-virsh = "${bindir}/virsh"
-FILES_${PN} += "${datadir}/augeas/*"
-FILES_${PN}-dbg += "${libdir}/${PN}/connection-driver/.debug/*"
-FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/${PN}/connection-driver/*.a"
+FILES_${PN} += "${libdir}/libvirt/connection-driver \
+	    ${datadir}/augeas \
+	    ${datadir}/polkit-1"
+
+FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug"
+FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a"
 
 INITSCRIPT_PACKAGES = "${PN}-libvirtd"
 INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
 INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
-# Disable the Python tool support
-#EXTRA_OECONF += " --with-python=no"
+# xen-minimal config
+#PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
+
+# full config
+PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
+	           polkit lxc test remote macvtap libvirtd netcf"
+
+PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"
+PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
+PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen"
+PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi"
+PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen"
+PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen"
+PACKAGECONFIG[uml] = "--with-uml, --without-uml"
+PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz"
+PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware"
+PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp"
+PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox"
+PACKAGECONFIG[esx] = "--with-esx,--without-esx"
+PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv"
+PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit,polkit"
+PACKAGECONFIG[lxc] = "--with-lxc,--without-lxc, lxc"
+PACKAGECONFIG[test] = "--with-test=yes,--with-test=no"
+PACKAGECONFIG[remote] = "--with-remote,--without-remote"
+PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
+PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
+PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
+
 # Enable the Python tool support
 require libvirt-python.inc
 
-- 
1.7.9.5


