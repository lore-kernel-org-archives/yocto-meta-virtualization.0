Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f68.google.com (mail-ee0-f68.google.com [74.125.83.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04B59E0144E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:14 -0800 (PST)
Received: by mail-ee0-f68.google.com with SMTP id b45so1261984eek.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=kxWuHkz/+sjhfOWl9NjCOd+Ayh9s18i5HQHkUnMuSmk=;
	b=UCyl4qcLZyKxuZGG2g4w+9LkyYMycEpd7M4apyoTLkN5lKWcgQ+YrEYFnJ42S8n9R9
	nd9vNa3+LDqOffpcBrpuHDg/osMMaAB/J23nkNJBkDcmroGioKxlSuNdTdm0kHd0+MCN
	MvUGc5kNBREyPx7j5+0bum+nN3YRs33kdY9+c4QWr25x32LxPFz+z7DE648RnnLsXEG6
	GkeS9+O8ZEQv9FhFcNY9Qgqg5RX3XqQlDVN0WQrxf4JTh16OpUE8ycTtEaqjfDbzKmOl
	1K31IrzjVQPXdURorZJIAtAxWxTKeyb7mHaw54FcDQX+2Vt72EbvNAcjzKoYsnMkl3Zu
	BCCQ==
Received: by 10.14.219.72 with SMTP id l48mr5806548eep.37.1354801513860;
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 44sm16027786eek.0.2012.12.06.05.45.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id EE80B4011BB; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:45 +0100
Message-Id: <1354801486-9482-14-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
References: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 13/14] Upgraded to libvirt 1.0.0, and added a more detailed packageconfig
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 recipes-extended/libvirt/libvirt_1.0.0.bb |  139 +++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt_1.0.0.bb

diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb b/recipes-extended/libvirt/libvirt_1.0.0.bb
new file mode 100644
index 0000000..45b460a
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
@@ -0,0 +1,139 @@
+DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux." 
+HOMEPAGE = "http://libvirt.org"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
+SECTION = "console/tools"
+PR = "r2"
+
+DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
+	   iptables ebtables dnsmasq readline"
+
+# These might be included by PACKAGECONFIG
+#RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
+
+RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq openbsd-netcat"
+RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
+RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
+
+#connman blocks the 53 port and libvirtd can't start its DNS service
+RCONFLICTS_${PN}_libvirtd = "connman"
+
+SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
+	file://libvirtd.sh \
+	file://libvirtd.conf"
+
+SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
+SRC_URI[sha256sum] = "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
+
+inherit autotools gettext update-rc.d
+
+CACHED_CONFIGUREVARS += "\
+ac_cv_path_XMLLINT=/usr/bin/xmllint \
+ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
+ac_cv_path_AUGPARSE=/usr/bin/augparse \
+ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
+ac_cv_path_BRCTL=/usr/sbin/brctl \
+ac_cv_path_TC=/sbin/tc \
+ac_cv_path_UDEVADM=/sbin/udevadm \
+ac_cv_path_MODPROBE=/sbin/modprobe \
+ac_cv_path_IP_PATH=/bin/ip \
+ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
+ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
+ac_cv_path_MOUNT=/bin/mount \
+ac_cv_path_UMOUNT=/bin/umount \
+ac_cv_path_MKFS=/usr/sbin/mkfs \
+ac_cv_path_SHOWMOUNT=/usr/sbin/showmount \
+ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
+ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
+ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
+ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
+ac_cv_path_VGREMOVE=/usr/sbin/vgremove \
+ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
+ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
+ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
+ac_cv_path_VGSCAN=/usr/sbin/vgscan \
+ac_cv_path_PVS=/usr/sbin/pvs \
+ac_cv_path_VGS=/usr/sbin/vgs \
+ac_cv_path_LVS=/usr/sbin/lvs \
+ac_cv_path_PARTED=/usr/sbin/parted \
+ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
+
+# Some other possible paths we are not yet setting
+#ac_cv_path_RPCGEN=
+#ac_cv_path_XSLTPROC=
+#ac_cv_path_RADVD=
+#ac_cv_path_UDEVSETTLE=
+#ac_cv_path_EBTABLES_PATH=
+#ac_cv_path_PKG_CONFIG=
+#ac_cv_path_ac_pt_PKG_CONFIG
+#ac_cv_path_PKCHECK_PATH=
+#ac_cv_path_POLKIT_AUTH=
+#ac_cv_path_DTRACE=
+#ac_cv_path_ISCSIADM=
+#ac_cv_path_MSGFMT=
+#ac_cv_path_GMSGFMT=
+#ac_cv_path_XGETTEXT=
+#ac_cv_path_MSGMERGE=
+#ac_cv_path_SCRUB=
+#ac_cv_path_PYTHON=
+
+ALLOW_EMPTY_${PN} = "1"
+
+PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
+
+FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
+	${sysconfdir}/sysctl.d \
+	${sysconfdir}/logrotate.d \
+	${sysconfdir}/libvirt/libvirtd.conf \
+	${sbindir}/libvirtd"
+
+FILES_${PN}-virsh = "${bindir}/virsh"
+FILES_${PN} += "${libdir}/libvirt/connection-driver \
+	    ${datadir}/augeas \
+	    ${datadir}/polkit-1"
+
+FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug"
+FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a"
+
+INITSCRIPT_PACKAGES = "${PN}-libvirtd"
+INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
+INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
+
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
+# Enable the Python tool support
+require libvirt-python.inc
+
+do_install_append() {
+	install -d ${D}/etc/init.d
+	install -d ${D}/etc/libvirt
+
+	install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
+	install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
+}
-- 
1.7.9.5


