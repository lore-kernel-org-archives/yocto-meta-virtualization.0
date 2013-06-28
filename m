Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBFA4E003E3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Jun 2013 10:25:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5SHPqHa013112
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Jun 2013 10:25:52 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 28 Jun 2013 10:25:52 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 28 Jun 2013 13:26:03 -0400
Message-ID: <1372440363-25329-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1372440363-25329-2-git-send-email-mark.asselstine@windriver.com>
References: <1372440363-25329-1-git-send-email-mark.asselstine@windriver.com>
	<1372440363-25329-2-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH 3/3] libvirt: make ebtables a PACKAGECONFIG
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
X-List-Received-Date: Fri, 28 Jun 2013 17:25:53 -0000
Content-Type: text/plain

This is a bit ugly since ebtables isn't controlled via
--with/--without-PACKAGE but we can achieve the same result using the
cached path variable. Since there are no static hooks into ebtables it
doesn't get picked up via the automatic RDEPENDS so we also ensure
that we add the RDEPENDS explicitly here.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index fb4b9bb..0d1d081 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://libvirt.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 SECTION = "console/tools"
-PR = "r8"
+PR = "r9"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
-	   iptables ebtables dnsmasq readline"
+	   iptables dnsmasq readline"
 
 # These might be included by PACKAGECONFIG
 #RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
@@ -113,7 +113,9 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
 # full config
 PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
-	           polkit lxc test remote macvtap libvirtd netcf udev python ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+	           polkit lxc test remote macvtap libvirtd netcf udev python \
+	           ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+	           ebtables"
 
 # enable,disable,depends,rdepends
 #
@@ -140,6 +142,8 @@ PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
 PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
 PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciaccess,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
+PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
+
 # Enable the Python tool support
 require libvirt-python.inc
 
-- 
1.8.1.2


