Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED3E5E0127A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:49 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4182735eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=MRtt2KoLknoWhX2Ibk1c3heTseyhaemZAy7VAndzIHE=;
	b=ENmg/cC2I8dpd3p/9WXC+H0vwYALG6oTf9Bzww/0tfhhFUv3KpWUIZb+F8FUWe83Ap
	i446CM/PaE8lmML3slRUtpWtFVLKabtAFfuqr7Pd4m6ptK4TeyN2qdtA61hVjgdvPyPN
	azgieEaKop+EzroSxj6bJW6qNmSo78vBj7X1Zu5f5mpd7l7h/SPf9ZWm6LL8BD1DBoII
	v9Ymvzu1tC9hzm7csjbNUIfKQZarlhvqkFG2GHEgi0MrunlyrbEc6F00yAkXDGCxaSWy
	2X8xX6d5UEsYEvBg+ovxt1XWanTc5Nbk8JmsEOBpaJGJQANeZU7LvrYhC885X0mawk8A
	9O5A==
Received: by 10.14.0.71 with SMTP id 47mr7542678eea.19.1354813609642;
	Thu, 06 Dec 2012 09:06:49 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id i49sm16985734eem.6.2012.12.06.09.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 5DAFA4011BD; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:35 +0100
Message-Id: <1354813596-8233-15-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 14/15] Removed old version of libvirt
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
 recipes-extended/libvirt/libvirt_0.10.2.bb |  118 ----------------------------
 1 file changed, 118 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt_0.10.2.bb

diff --git a/recipes-extended/libvirt/libvirt_0.10.2.bb b/recipes-extended/libvirt/libvirt_0.10.2.bb
deleted file mode 100644
index 23cd885..0000000
--- a/recipes-extended/libvirt/libvirt_0.10.2.bb
+++ /dev/null
@@ -1,118 +0,0 @@
-DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux." 
-HOMEPAGE = "http://libvirt.org"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
-SECTION = "console/tools"
-PR = "r0"
-
-DEPENDS="bridge-utils gnutls libxml2 lvm2 avahi polkit parted curl libpcap util-linux e2fsprogs pm-utils iptables ebtables dnsmasq"
-
-RDEPENDS_${PN}-libvirtd = "bridge-utils iptables pm-utils dnsmasq ebtables dmidecode "
-
-#connman blocks the 53 port and libvirtd can't start its DNS service
-RCONFLICTS_${PN}_libvirtd = "connman"
-
-SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
-	file://libvirtd.sh \
-	file://libvirtd.conf"
-
-SRC_URI[md5sum] = "a5e50860d9da238ba270b528411c4a0d"
-SRC_URI[sha256sum] = "1fe69ae1268a097cc0cf83563883b51780d528c6493efe3e7d94c4160cc46977"
-
-inherit autotools gettext update-rc.d
-
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
-CACHED_CONFIGUREVARS += "\
-ac_cv_path_XMLLINT=/usr/bin/xmllint \
-ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
-ac_cv_path_AUGPARSE=/usr/bin/augparse \
-ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
-ac_cv_path_BRCTL=/usr/sbin/brctl \
-ac_cv_path_TC=/sbin/tc \
-ac_cv_path_UDEVADM=/sbin/udevadm \
-ac_cv_path_MODPROBE=/sbin/modprobe \
-ac_cv_path_IP_PATH=/bin/ip \
-ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
-ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
-ac_cv_path_MOUNT=/bin/mount \
-ac_cv_path_UMOUNT=/bin/umount \
-ac_cv_path_MKFS=/usr/sbin/mkfs \
-ac_cv_path_SHOWMOUNT=/usr/sbin/showmount \
-ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
-ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
-ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
-ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
-ac_cv_path_VGREMOVE=/usr/sbin/vgremove \
-ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
-ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
-ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
-ac_cv_path_VGSCAN=/usr/sbin/vgscan \
-ac_cv_path_PVS=/usr/sbin/pvs \
-ac_cv_path_VGS=/usr/sbin/vgs \
-ac_cv_path_LVS=/usr/sbin/lvs \
-ac_cv_path_PARTED=/usr/sbin/parted \
-ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
-
-# Some other possible paths we are not yet setting
-#ac_cv_path_RPCGEN=
-#ac_cv_path_XSLTPROC=
-#ac_cv_path_RADVD=
-#ac_cv_path_UDEVSETTLE=
-#ac_cv_path_EBTABLES_PATH=
-#ac_cv_path_PKG_CONFIG=
-#ac_cv_path_ac_pt_PKG_CONFIG
-#ac_cv_path_PKCHECK_PATH=
-#ac_cv_path_POLKIT_AUTH=
-#ac_cv_path_DTRACE=
-#ac_cv_path_ISCSIADM=
-#ac_cv_path_MSGFMT=
-#ac_cv_path_GMSGFMT=
-#ac_cv_path_XGETTEXT=
-#ac_cv_path_MSGMERGE=
-#ac_cv_path_SCRUB=
-#ac_cv_path_PYTHON=
-
-ALLOW_EMPTY_${PN} = "1"
-
-PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
-
-FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
-	${sysconfdir}/sysctl.d \
-	${sysconfdir}/logrotate.d \
-	${sysconfdir}/libvirt/libvirtd.conf \
-	${sbindir}/libvirtd"
-
-FILES_${PN}-virsh = "${bindir}/virsh"
-FILES_${PN} += "${datadir}/augeas/*"
-FILES_${PN}-dbg += "${libdir}/${PN}/connection-driver/.debug/*"
-FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/${PN}/connection-driver/*.a"
-
-INITSCRIPT_PACKAGES = "${PN}-libvirtd"
-INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
-INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
-
-# Disable the Python tool support
-#EXTRA_OECONF += " --with-python=no"
-# Enable the Python tool support
-require libvirt-python.inc
-
-do_install_append() {
-	install -d ${D}/etc/init.d
-	install -d ${D}/etc/libvirt
-
-	install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
-	install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
-}
-- 
1.7.9.5


