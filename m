Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E8D3E00CAC; Sun,  1 May 2016 07:28:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A5A3E00CA5
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 May 2016 07:28:11 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id b63so10061751qkg.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 01 May 2016 07:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=urdriTcVAAJ9pvdc1QgmuEoP6sJSiYFEWbdP0MpkvOs=;
	b=WKfR5HyPOj045RSEOecbbINQBwsFiHry9YQEyRoNiCSSfK1j/lDpi+OpGP4gApdxSk
	HpvtEpGZQJILbguACjQMMkDrkve05TP1Z51NX+zqZCNrETaMb+3WqOHXCb47O2B/RTry
	mvp9KWBbPRdiGHA2aohzzuDHdOIZPCQah7sSQD4ueEjmqO5rrllq7mxhyt1twbQpBp1B
	jgg4A2Hr0qMLj8FDOgwIoihceJJTUxq8DyiV+HdlA5oIJp5fCaP4zaIsEllbVP+4kl2u
	Gh99eBDoA0bIVzl37JdK+xENUeAg2vM2t9s6HuMpYECcWpBKSDmSwu9B0NIzxBTppUXF
	eeYA==
X-Gm-Message-State: AOPr4FW/Lmzl9Es0Z8WH/ycuopkNI4x3QSlq+XthNxwJ4/yq8bLrLdjIdLovAxACknWZmg==
X-Received: by 10.55.24.159 with SMTP id 31mr5426909qky.123.1462112890769;
	Sun, 01 May 2016 07:28:10 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	g19sm7697771qgd.49.2016.05.01.07.28.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 May 2016 07:28:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Sun,  1 May 2016 10:27:45 -0400
Message-Id: <1462112865-19058-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] globally replace 'base_contains' calls with 'bb.utils.contains'
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
X-List-Received-Date: Sun, 01 May 2016 14:28:15 -0000

The 'base_contains' is now deprecated and only kept as a compatibility method.  It will be removed in future releases.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-containers/docker-registry/docker-registry_git.bb |  6 +++---
 recipes-containers/docker/docker_git.bb                   | 10 +++++-----
 recipes-containers/lxc/lxc_2.0.0.bb                       |  6 +++---
 recipes-extended/images/xen-guest-image-minimal.bb        |  4 ++--
 recipes-extended/libvirt/libvirt_1.3.2.bb                 |  8 ++++----
 recipes-kernel/linux/linux-yocto_4.1.bbappend             |  4 ++--
 recipes-kernel/linux/linux-yocto_4.4.bbappend             |  4 ++--
 7 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/recipes-containers/docker-registry/docker-registry_git.bb b/recipes-containers/docker-registry/docker-registry_git.bb
index 3d8d74b..996dfdd 100644
--- a/recipes-containers/docker-registry/docker-registry_git.bb
+++ b/recipes-containers/docker-registry/docker-registry_git.bb
@@ -73,14 +73,14 @@ RDEPENDS_${PN} += "\
 
 inherit setuptools systemd
 
-SYSTEMD_PACKAGES = "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
-SYSTEMD_SERVICE_${PN} = "${@base_contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
+SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
 
 do_install_append() {
 	mkdir -p ${D}/etc/default/
 	cp ${WORKDIR}/docker-registry.conf ${D}/etc/default/docker-registry
 
-	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}${systemd_unitdir}/system
 		install -m 644 ${WORKDIR}/docker-registry.service ${D}/${systemd_unitdir}/system
 		sed -i "s|#WORKDIR#|${PYTHON_SITEPACKAGES_DIR}/docker_registry|" ${D}/${systemd_unitdir}/system/docker-registry.service
diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 19fdef0..c2681a2 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -101,11 +101,11 @@ do_compile() {
 
 inherit systemd update-rc.d
 
-SYSTEMD_PACKAGES = "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
-SYSTEMD_SERVICE_${PN} = "${@base_contains('DISTRO_FEATURES','systemd','docker.service','',d)}"
+SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker.service','',d)}"
 
-INITSCRIPT_PACKAGES += "${@base_contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
-INITSCRIPT_NAME_${PN} = "${@base_contains('DISTRO_FEATURES','sysvinit','docker.init','',d)}"
+INITSCRIPT_PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
+INITSCRIPT_NAME_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','docker.init','',d)}"
 INITSCRIPT_PARAMS_${PN} = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
 
 do_install() {
@@ -115,7 +115,7 @@ do_install() {
 	cp ${S}/bundles/${DOCKER_VERSION}/dynbinary/dockerinit-${DOCKER_VERSION} \
 	  ${D}/${bindir}/dockerinit
 
-	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}${systemd_unitdir}/system
 		install -m 644 ${S}/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
 		# replaces one copied from above with one that uses the local registry for a mirror
diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.0.bb
index 34aab38..9f01edd 100644
--- a/recipes-containers/lxc/lxc_2.0.0.bb
+++ b/recipes-containers/lxc/lxc_2.0.0.bb
@@ -38,7 +38,7 @@ S = "${WORKDIR}/${BPN}-${PV}"
 
 # Let's not configure for the host distro.
 #
-PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
+PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
 EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
 
 EXTRA_OECONF += "--with-init-script=\
@@ -48,7 +48,7 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 EXTRA_OECONF += "--enable-log-src-basename"
 
 PACKAGECONFIG ??= "templates \
-    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
 "
 PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
@@ -109,7 +109,7 @@ do_install_append() {
 	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
 	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
 
-	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 	    install -d ${D}${sysconfdir}/init.d
 	    install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
 	fi
diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
index f13940c..ab7e92c 100644
--- a/recipes-extended/images/xen-guest-image-minimal.bb
+++ b/recipes-extended/images/xen-guest-image-minimal.bb
@@ -7,8 +7,8 @@ IMAGE_INSTALL += " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
     "
 
-IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', ' xf86-video-fbdev', '', d)}"
-IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
+IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' xf86-video-fbdev', '', d)}"
+IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
 
 LICENSE = "MIT"
 
diff --git a/recipes-extended/libvirt/libvirt_1.3.2.bb b/recipes-extended/libvirt/libvirt_1.3.2.bb
index 42066c1..be21910 100644
--- a/recipes-extended/libvirt/libvirt_1.3.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.2.bb
@@ -107,7 +107,7 @@ FILES_${PN}-libvirtd = " \
         /usr/lib/sysctl.d/60-libvirtd.conf \
 	${sbindir}/libvirtd \
 	${systemd_unitdir}/system/* \
-	${@base_contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
         "
 
 FILES_${PN}-virsh = "${bindir}/virsh"
@@ -167,9 +167,9 @@ PRIVATE_LIBS_${PN}-ptest = " \
 # full config
 PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
                    remote macvtap libvirtd netcf udev python ebtables \
-                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
                   "
 
 # enable,disable,depends,rdepends
diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend b/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 85e98cc..f3be89e 100644
--- a/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -13,7 +13,7 @@ KERNEL_MODULE_AUTOLOAD += "kvm-amd"
 KERNEL_MODULE_AUTOLOAD += "kvm-intel"
 
 # aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
 
 # xen kernel support
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend b/recipes-kernel/linux/linux-yocto_4.4.bbappend
index 85e98cc..f3be89e 100644
--- a/recipes-kernel/linux/linux-yocto_4.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_4.4.bbappend
@@ -13,7 +13,7 @@ KERNEL_MODULE_AUTOLOAD += "kvm-amd"
 KERNEL_MODULE_AUTOLOAD += "kvm-intel"
 
 # aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
 
 # xen kernel support
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
1.9.1


