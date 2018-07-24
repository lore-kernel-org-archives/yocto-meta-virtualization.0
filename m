Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B59CE009AA; Tue, 24 Jul 2018 03:12:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB33BE006F1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jul 2018 03:12:29 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6OACSpm004758
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jul 2018 03:12:29 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 24 Jul 2018 03:12:28 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 24 Jul 2018 03:12:28 -0700
Message-ID: <20180724101228.47140-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] libvmi: add a new recipe
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
X-List-Received-Date: Tue, 24 Jul 2018 10:12:31 -0000
Content-Type: text/plain

LibVMI is a C library with Python bindings that makes it easy to
monitor the low-level details of a running virtual machine by
viewing its memory, trapping on hardware events, and accessing
the vCPU registers. This is called virtual machine introspection.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 recipes-extended/libvmi/libvmi_git.bb | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-extended/libvmi/libvmi_git.bb

diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
new file mode 100644
index 0000000..a746638
--- /dev/null
+++ b/recipes-extended/libvmi/libvmi_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "An introspection library, written in C, focused on reading \
+               and writing memory from virtual machines (VM's)."
+HOMEPAGE = "https://github.com/libvmi/libvmi"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
+SECTION = "console/tools"
+PV = "0.12.0"
+
+DEPENDS = "libvirt libcheck bison fuse"
+
+SRC_URI = "git://github.com/libvmi/libvmi.git \
+"
+
+SRCREV = "6934e8a4758018983ec53ec791dd14a7d6ac31a9"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig
+
+# Noramlly dynamic libs would be of the form libXX.so.1.0.0 in which case
+# bitbake should be able to properly populate the -dev package and the main
+# packages. Since libvmi uses the form libXX.1.0.0.so it breaks this automatic
+# packaging so we need to be more explicit about what goes where.
+FILES_${PN} += "${libdir}/libvmi-0.9.so"
+FILES_${PN}-dev = "${includedir} ${libdir}/${BPN}.so ${libdir}/*.la \
+                ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
+                ${datadir}/aclocal ${base_libdir}/*.o \
+                ${libdir}/${BPN}/*.la ${base_libdir}/*.la"
+
+PACKAGECONFIG ??= "json-c"
+PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,"
+PACKAGECONFIG[json-c] = ",,json-c,"
+
+# We include a sample conf file to which we have added
+do_install_append () {
+	mkdir ${D}${sysconfdir}
+	cp etc/*.conf ${D}${sysconfdir}
+}
+
+# Construction of grammar.h is not parallel safe.
+PARALLEL_MAKE = "-j1"
-- 
2.11.0


