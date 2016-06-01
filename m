Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68D9AE00E24; Wed,  1 Jun 2016 01:36:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8AE12E00E0B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 Jun 2016 01:36:04 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u518a434024421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 1 Jun 2016 01:36:04 -0700
Received: from k-desktop.wrs.com (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 1 Jun 2016 01:36:03 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 1 Jun 2016 16:35:43 +0800
Message-ID: <20160601083543.23700-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.0.rc0
MIME-Version: 1.0
Subject: [PATCH] criu: fix build-deps qa warning
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
X-List-Received-Date: Wed, 01 Jun 2016 08:36:06 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It shows warning when build crius if libselinux has been built already:

  WARNING: QA Issue: criu rdepends on libselinux, but it isn't a build dependency? [build-deps]

Add a patch to disable selinux support when 'selinux' is not in PACKAGECONF.

And update indentation at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-containers/criu/criu_git.bb                | 12 ++++++----
 .../criu/files/disable-selinux.patch               | 26 ++++++++++++++++++++++
 2 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 recipes-containers/criu/files/disable-selinux.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 816c806..c8be78f 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -18,10 +18,11 @@ PR = "r0"
 PV = "1.6+git${SRCPV}"
 
 SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
-	   file://0001-criu-Fix-toolchain-hardcode.patch \
-	   file://0002-criu-Skip-documentation-install.patch \
-       file://0001-criu-Change-libraries-install-directory.patch \
-	  "
+           file://0001-criu-Fix-toolchain-hardcode.patch \
+           file://0002-criu-Skip-documentation-install.patch \
+           file://0001-criu-Change-libraries-install-directory.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'selinux', '', 'file://disable-selinux.patch', d)} \
+          "
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
@@ -51,6 +52,9 @@ export HOST_SYS
 
 inherit setuptools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[selinux] = ",,libselinux"
+
 do_compile_prepend() {
     rm -rf ${S}/protobuf/google/protobuf/descriptor.proto
     ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/protobuf/google/protobuf/descriptor.proto
diff --git a/recipes-containers/criu/files/disable-selinux.patch b/recipes-containers/criu/files/disable-selinux.patch
new file mode 100644
index 0000000..da881dd
--- /dev/null
+++ b/recipes-containers/criu/files/disable-selinux.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Inappropriate [disable feature]
+
+It shows warning when build crius if libselinux has been built already:
+
+  WARNING: QA Issue: criu rdepends on libselinux, but it isn't a build dependency? [build-deps]
+
+Apply this patch to disable selinux support when 'selinux' is not in PACKAGECONF.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/Makefile.config b/Makefile.config
+index ce4b8d8..3ac2780 100644
+--- a/Makefile.config
++++ b/Makefile.config
+@@ -8,11 +8,6 @@ ifeq ($(call try-cc,$(LIBBSD_DEV_TEST),-lbsd),y)
+ 	DEFINES += -DCONFIG_HAS_LIBBSD
+ endif
+ 
+-ifeq ($(call pkg-config-check,libselinux),y)
+-	LIBS := -lselinux $(LIBS)
+-	DEFINES += -DCONFIG_HAS_SELINUX
+-endif
+-
+ $(CONFIG): scripts/utilities.mak scripts/feature-tests.mak include/config-base.h
+ 	$(E) "  GEN     " $@
+ 	$(Q) @echo '#ifndef __CR_CONFIG_H__' > $@
-- 
2.6.1


