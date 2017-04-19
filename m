Return-Path: <Rob.Woolley@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2EC76E00ACE; Wed, 19 Apr 2017 07:42:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4BC5E00995
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Apr 2017 07:42:23 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3JEgLCq010019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Apr 2017 07:42:21 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Apr 2017 07:42:20 -0700
From: Rob Woolley <rob.woolley@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <ray.danks@se-eng.com>,
	<bruce.ashfield@gmail.com>
Date: Wed, 19 Apr 2017 07:42:20 -0700
Message-ID: <20170419144220.115501-1-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] libvirt: Fix conditional dependencies on polkit
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
X-List-Received-Date: Wed, 19 Apr 2017 14:42:28 -0000
Content-Type: text/plain

The DIRFILES variable was a temporary workaround to resolve a do_rootfs
RPM package conflict between libvirt and polkit.

This happened because of the different permissions and ownership that the
packages placed on ${datadir}/usr/share/polkit-1/rules.d.

The behaviour is now conditional based on how PACKAGECONFIG is set.  The
polkit rules will be removed from the package if polkit is not enabled.
If polkit is enabled the permissions and ownership are set to match those
set by the polkit recipe.

This uses the useradd enhancements for RSS.  It requires that shadow-native
be included as a DEPENDS to provide the useradd command in the native
sysroot.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.3.5.bb | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index 7b55ead..a8e6f3f 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SECTION = "console/tools"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
-	   iptables dnsmasq readline libtasn1 libxslt-native acl"
+	   iptables dnsmasq readline libtasn1 libxslt-native acl \
+	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)}"
 
 # libvirt-guests.sh needs gettext.sh
 #
@@ -22,8 +23,6 @@ RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
 #connman blocks the 53 port and libvirtd can't start its DNS service
 RCONFLICTS_${PN}_libvirtd = "connman"
 
-DIRFILES = ""
-
 SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
            file://libvirtd.sh \
@@ -120,7 +119,8 @@ FILES_${PN}-libvirtd = " \
 FILES_${PN}-virsh = "${bindir}/virsh"
 FILES_${PN} += "${libdir}/libvirt/connection-driver \
 	    ${datadir}/augeas \
-	    ${datadir}/polkit-1"
+	    ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${datadir}/polkit-1', '', d)} \
+	    "
 
 FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
 FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
@@ -254,6 +254,15 @@ do_install_append() {
 	echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
 
+	# Manually set permissions and ownership to match polkit recipe
+	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
+		install -d -m 0700 ${D}/${datadir}/polkit-1/rules.d
+		chown polkitd ${D}/${datadir}/polkit-1/rules.d
+		chgrp root ${D}/${datadir}/polkit-1/rules.d
+	else
+		rm -rf ${D}/${datadir}/polkit-1
+	fi
+
 	# Add hook support for libvirt
 	mkdir -p ${D}/etc/libvirt/hooks
 
-- 2.11.0


