Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6ADC6E01410
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 19:28:19 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0N3SDK9005951
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2013 19:28:14 -0800 (PST)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 22 Jan 2013 19:28:13 -0800
From: <lei.yang@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <david.nystrom@enea.com>
Date: Wed, 23 Jan 2013 11:28:11 +0800
Message-ID: <1358911691-31413-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] multipath-tools: add multipath-tools recipe
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
X-List-Received-Date: Wed, 23 Jan 2013 03:28:19 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

This package provides:
- multipath: scans the system for multipathed devices, assembles
- multipathd: waits for maps events then execs multipath
- kpartx: maps linear devmaps to device partitions, which makes
  multipath maps partionable
......

Now,It can be used for kvm disk img partion mounting for me.

Signed-off-by: Lei Yang <lei.yang@windriver.com>
---
 .../multipath-tools/multipath-tools_git.bb         |   46 ++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 recipes-extended/multipath-tools/multipath-tools_git.bb

diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
new file mode 100644
index 0000000..633b9f2
--- /dev/null
+++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Tools to Manage Multipathed Devices with the device-mapper"
+DESCRIPTION = "This package provides the tools to manage multipathed devices by \
+instructing the device-mapper multipath module what to do"
+
+HOMEPAGE = "http://christophe.varoqui.free.fr/"
+DEPENDS = "readline libaio lvm2"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
+S="${WORKDIR}/git"
+
+
+SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
+
+SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
+PV = "0.4.9+gitr${SRCPV}"
+
+inherit autotools
+
+EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
+
+PACKAGES =+ "libmpathpersist mpathpersist kpartx libmultipath multipath multipathd libmultipath-dev libmpathpersist-dev"
+
+
+RDEPENDS_${PN} += "libmpathpersist mpathpersist kpartx libmultipath multipath multipathd udev"
+
+do_install_append () {
+	ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
+	ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}     = ""
+
+FILES_libmpathpersist = "${libdir}/libmpathpersist*.so.0"
+FILES_mpathpersist = "${sbindir}/mpathpersist"
+FILES_kpartx = "${sbindir}/kpartx ${base_libdir}/udev/"
+FILES_libmultipath = "${libdir}/libcheck*.so ${libdir}/libpri*.so ${libdir}/libmultipath*.so.0"
+FILES_multipath = "${sbindir}/multipath ${sysconfdir}"
+FILES_multipathd = "${sbindir}/multipathd ${base_libdir}"
+
+#put the symbol link lib in -dev 
+FILES_libmultipath-dev = "${libdir}/libmultipath*.so"
+FILES_libmpathpersist-dev = "${libdir}/libmpathpersist*.so"
+
+
-- 
1.7.1


