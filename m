Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A97EAE00D7B; Thu, 10 Sep 2015 10:59:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 712B1E00B0B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 10:59:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8AHx2SN011962
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 10:59:03 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 10 Sep 2015 10:59:02 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 10 Sep 2015 13:59:01 -0400
Message-ID: <1441907941-29159-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: enable systemd support
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
X-List-Received-Date: Thu, 10 Sep 2015 17:59:07 -0000
Content-Type: text/plain

Commit d114a62dd8a2121fa3026b83c5b250eb0ee6f21d [libvirt: kill
update-rc.d when not using sysvinit] resulted in libvirt services not
starting automatically at boot when using systemd. The upstream
libvirt package already has the necessary systemd service files so it
is just a matter of activating them via the '--with-init-script'
configure option and making the recipe use these.

We always set '--with-init-script' to 'systemd' regardless of
the systemd vs sysvinit DISTRO_FLAG since our sysvinit scripts are
external and thus not affected by this setting when building for
sysvinit.

Both sysvinit and systemd packages will be libvirt-libvirtd, the
bbclasses ensure that only the files for one init system will exist in
the package, so this 'overloading' is acceptable.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...vert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch | 84 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.2.17.bb         | 24 ++++++-
 2 files changed, 105 insertions(+), 3 deletions(-)
 create mode 100644 recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch

diff --git a/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch b/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
new file mode 100644
index 0000000..c2606bd
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
@@ -0,0 +1,84 @@
+From 171fc890bb5972e566bd7b3d87a40ac434a5b3e6 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Wed, 9 Sep 2015 11:52:44 -0400
+Subject: [PATCH] Revert "build: add $(prefix) to SYSTEMD_UNIT_DIR"
+
+This reverts upstream commit 00e9d6071b2450659ce01bc984f64ecb5d7ba62d
+with minor context changes to allow it to apply.
+
+Yocto based builds use /lib/systemd/system for systemd unit files and
+since upstream has chosen to use a mechanism for setting
+SYSTEMD_UNIT_DIR which is not flexible we have to resort to reverting
+this upstream commit to avoid having ${prefix} added to the path.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ daemon/Makefile.am | 4 ++--
+ src/Makefile.am    | 4 ++--
+ tools/Makefile.am  | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/daemon/Makefile.am b/daemon/Makefile.am
+index 00221ab..e5c5db8 100644
+--- a/daemon/Makefile.am
++++ b/daemon/Makefile.am
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-## Copyright (C) 2005-2015 Red Hat, Inc.
++## Copyright (C) 2005-2015 Red Hat, Inc.
+ ##
+ ## This library is free software; you can redistribute it and/or
+ ## modify it under the terms of the GNU Lesser General Public
+@@ -387,7 +387,7 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART
+ 
+ if LIBVIRT_INIT_SCRIPT_SYSTEMD
+ 
+-SYSTEMD_UNIT_DIR = $(prefix)/lib/systemd/system
++SYSTEMD_UNIT_DIR = /lib/systemd/system
+ BUILT_SOURCES += libvirtd.service libvirtd.socket
+ 
+ install-init-systemd: install-sysconfig libvirtd.service
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 8f77658..57e163f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-## Copyright (C) 2005-2015 Red Hat, Inc.
++## Copyright (C) 2005-2015 Red Hat, Inc.
+ ##
+ ## This library is free software; you can redistribute it and/or
+ ## modify it under the terms of the GNU Lesser General Public
+@@ -2220,7 +2220,7 @@ EXTRA_DIST += \
+ if WITH_LIBVIRTD
+ if LIBVIRT_INIT_SCRIPT_SYSTEMD
+ 
+-SYSTEMD_UNIT_DIR = $(prefix)/lib/systemd/system
++SYSTEMD_UNIT_DIR = /lib/systemd/system
+ 
+ BUILT_SOURCES += virtlockd.service virtlockd.socket
+ DISTCLEANFILES += virtlockd.service virtlockd.socket
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 6847f13..256a8f3 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -1,4 +1,4 @@
+-## Copyright (C) 2005-2014 Red Hat, Inc.
++## Copyright (C) 2005-2013 Red Hat, Inc.
+ ##
+ ## This library is free software; you can redistribute it and/or
+ ## modify it under the terms of the GNU Lesser General Public
+@@ -306,7 +306,7 @@ libvirt-guests.init: libvirt-guests.init.in libvirt-guests.sh
+ 
+ 
+ EXTRA_DIST += libvirt-guests.service.in
+-SYSTEMD_UNIT_DIR = $(prefix)/lib/systemd/system
++SYSTEMD_UNIT_DIR = /lib/systemd/system
+ 
+ if LIBVIRT_INIT_SCRIPT_SYSTEMD
+ install-systemd: libvirt-guests.service install-sysconfig libvirt-guests.sh
+-- 
+1.9.1
+
diff --git a/recipes-extended/libvirt/libvirt_1.2.17.bb b/recipes-extended/libvirt/libvirt_1.2.17.bb
index 26953b6..28a22bb 100644
--- a/recipes-extended/libvirt/libvirt_1.2.17.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.17.bb
@@ -32,12 +32,13 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://tests-allow-separated-src-and-build-dirs.patch \
            file://libvirt-use-pkg-config-to-locate-libcap.patch \
            file://0001-to-fix-build-error.patch \
+           file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "a1f49050223be3cbd7678c32b1ee2756"
 SRC_URI[libvirt.sha256sum] = "e07eaf20b0590fae05ba3b53ad4dac3e5fbd771437563cc78b692f23ddd02fad"
 
-inherit autotools gettext update-rc.d pkgconfig ptest
+inherit autotools gettext update-rc.d pkgconfig ptest systemd
 
 CACHED_CONFIGUREVARS += "\
 ac_cv_path_XMLLINT=/usr/bin/xmllint \
@@ -98,12 +99,15 @@ PACKAGES =+ "${PN}-libvirtd ${PN}-virsh"
 
 ALLOW_EMPTY_${PN}-libvirtd = "1"
 
-FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
+FILES_${PN}-libvirtd = " \
+	${sysconfdir}/init.d \
 	${sysconfdir}/sysctl.d \
 	${sysconfdir}/logrotate.d \
 	${sysconfdir}/libvirt/libvirtd.conf \
         /usr/lib/sysctl.d/60-libvirtd.conf \
-	${sbindir}/libvirtd"
+	${sbindir}/libvirtd \
+	${systemd_unitdir}/system/* \
+        "
 
 FILES_${PN}-virsh = "${bindir}/virsh"
 FILES_${PN} += "${libdir}/libvirt/connection-driver \
@@ -129,6 +133,16 @@ INITSCRIPT_PACKAGES = "${PN}-libvirtd"
 INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
 INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
+SYSTEMD_PACKAGES = "${PN}-libvirtd"
+SYSTEMD_SERVICE_${PN}-libvirtd = " \
+    libvirtd.socket \
+    libvirtd.service \
+    virtlockd.service \
+    libvirt-guests.service \
+    virtlockd.socket \
+    "
+
+
 PRIVATE_LIBS_${PN}-ptest = " \
 	libvirt-lxc.so.0 \
 	libvirt.so.0 \
@@ -224,6 +238,10 @@ do_install_append() {
 	mkdir -p ${D}/etc/libvirt/hooks 
 }
 
+EXTRA_OECONF += " \
+    --with-init-script=systemd \
+    "
+
 EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH}"
 
 do_compile_ptest() {
-- 
2.1.4


