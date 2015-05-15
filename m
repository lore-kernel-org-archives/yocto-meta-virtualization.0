Return-Path: <Rongqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6D6FE009C1; Thu, 14 May 2015 18:29:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95C72E00985
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 May 2015 18:29:33 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4F1TWSU004445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 May 2015 18:29:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 14 May 2015 18:29:32 -0700
From: <rongqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 15 May 2015 09:24:49 +0800
Message-ID: <1431653089-19771-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-virt] libvirt: upgrade to 1.2.15
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
X-List-Received-Date: Fri, 15 May 2015 01:29:34 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Remove libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch, since
rules for install *.xml are changed, the race issue does not exist.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc        |  4 +--
 ...virt-Fix-cannot-symlink-cpu_map.xml-error.patch | 34 ----------------------
 .../{libvirt_1.2.12.bb => libvirt_1.2.15.bb}       |  7 ++---
 3 files changed, 5 insertions(+), 40 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
 rename recipes-extended/libvirt/{libvirt_1.2.12.bb => libvirt_1.2.15.bb} (97%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 21cfa55..550236a 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "4255f2bfece23aacbc8d94256598b302"
-SRC_URI[libvirt_python.sha256sum] = "432f438f9759e216424490f51a8804398b70fb1b2f2211f45fb05f72f5ad849f"
+SRC_URI[libvirt_python.md5sum] = "f13b566b54fe71ec0f26992aee11dd09"
+SRC_URI[libvirt_python.sha256sum] = "9a6dfbd487d49f887a41aca4bfb1b4e043fd9fbdfc041252cae84023f5c387ba"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch b/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
deleted file mode 100644
index 090bc6e..0000000
--- a/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-libvirt: do_compile fails 'src/cpu/cpu_map.xml': No such file or directory'
-
-In some very rare circumstances, libvirt's compile will try to create the
-symlink for cpu_map.xml before creating the directory $(abs_builddir)/cpu.
-
-Add a test to create this directory if it hasn't already been created.
-
-Signed-off-by: Amy Fong <amy.fong@windriver.com>
-
----
- src/Makefile.am |    1 +
- src/Makefile.in |    1 +
- 2 files changed, 2 insertions(+)
-
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1053,6 +1053,7 @@
- libvirt_cpu_la_DEPENDENCIES = $(abs_builddir)/cpu/cpu_map.xml
- 
- $(abs_builddir)/cpu/cpu_map.xml:
-+	if [ ! -d $(abs_builddir)/cpu ]; then $(MKDIR_P) $(abs_builddir)/cpu/; fi
- 	$(AM_V_GEN)ln -s $(abs_srcdir)/cpu/cpu_map.xml $@
- 
- if WITH_VMX
---- a/src/Makefile.in
-+++ b/src/Makefile.in
-@@ -10338,6 +10338,7 @@
- 	  $(srcdir)/lxc/lxc_controller_dispatch.h
- 
- $(abs_builddir)/cpu/cpu_map.xml:
-+	if [ ! -d $(abs_builddir)/cpu ]; then $(MKDIR_P) $(abs_builddir)/cpu/; fi
- 	$(AM_V_GEN)ln -s $(abs_srcdir)/cpu/cpu_map.xml $@
- 
- %protocol.c: %protocol.x %protocol.h $(srcdir)/rpc/genprotocol.pl
diff --git a/recipes-extended/libvirt/libvirt_1.2.12.bb b/recipes-extended/libvirt/libvirt_1.2.15.bb
similarity index 97%
rename from recipes-extended/libvirt/libvirt_1.2.12.bb
rename to recipes-extended/libvirt/libvirt_1.2.15.bb
index 298da2b..8abd41e 100644
--- a/recipes-extended/libvirt/libvirt_1.2.12.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.15.bb
@@ -30,12 +30,11 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://runptest.patch \
            file://run-ptest \
            file://tests-allow-separated-src-and-build-dirs.patch \
-           file://libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch \
            file://libvirt-use-pkg-config-to-locate-libcap.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "2ae99535265ce4687d8718d744024c27"
-SRC_URI[libvirt.sha256sum] = "eff5227f774560d97f0b44402a444e821c51e8cd44add89f74bc3c1f4dede66a"
+SRC_URI[libvirt.md5sum] = "08c2ea825d076ee67b1bbc600c220b97"
+SRC_URI[libvirt.sha256sum] = "5f88041b8c212f8f687c672fe583108833240d6175b512ce4de92ab6660194c6"
 
 inherit autotools gettext update-rc.d pkgconfig ptest
 
@@ -102,7 +101,7 @@ FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
 	${sysconfdir}/sysctl.d \
 	${sysconfdir}/logrotate.d \
 	${sysconfdir}/libvirt/libvirtd.conf \
-        /usr/lib/sysctl.d/libvirtd.conf \
+        /usr/lib/sysctl.d/60-libvirtd.conf \
 	${sbindir}/libvirtd"
 
 FILES_${PN}-virsh = "${bindir}/virsh"
-- 
1.9.1


