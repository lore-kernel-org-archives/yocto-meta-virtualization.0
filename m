Return-Path: <paul@paulbarker.me.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBC65E00816; Sun,  1 Jan 2017 14:45:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [217.70.178.86 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 326D9E007F1
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Jan 2017 14:45:21 -0800 (PST)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id B454E47FE52
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Jan 2017 23:21:07 +0100 (CET)
Received: from mfilter14-d.gandi.net (mfilter14-d.gandi.net [217.70.178.142])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 7D77EA80D0;
	Sun,  1 Jan 2017 23:20:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter14-d.gandi.net
Received: from relay3-d.mail.gandi.net ([IPv6:::ffff:217.70.183.195])
	by mfilter14-d.gandi.net (mfilter14-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id dBxPUIgjaXyJ; Sun,  1 Jan 2017 23:20:56 +0100 (CET)
X-Originating-IP: 5.9.142.21
Received: from autobuilder.betafive.co.uk (srv1.betafive.co.uk [5.9.142.21])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9FE45A80CD;
	Sun,  1 Jan 2017 23:20:56 +0100 (CET)
From: Paul Barker <paul@paulbarker.me.uk>
To: meta-virtualization@yoctoproject.org
Date: Sun,  1 Jan 2017 22:21:20 +0000
Message-Id: <1483309280-9112-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1483309280-9112-1-git-send-email-paul@paulbarker.me.uk>
References: <1483309280-9112-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/2] Remove True option to getVar calls
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
X-List-Received-Date: Sun, 01 Jan 2017 22:45:22 -0000

getVar() now defaults to expanding by default.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 classes/go-osarchmap.bbclass                | 18 +++++++++---------
 recipes-devtools/go-cross/go-cross.inc      |  2 +-
 recipes-extended/libvirt/libvirt-python.inc |  2 +-
 recipes-extended/xen/xen-arch.inc           |  2 +-
 recipes-extended/xen/xen.inc                | 10 +++++-----
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/classes/go-osarchmap.bbclass b/classes/go-osarchmap.bbclass
index 303b30b..058bf64 100644
--- a/classes/go-osarchmap.bbclass
+++ b/classes/go-osarchmap.bbclass
@@ -1,19 +1,19 @@
-BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS', True), d)}"
-BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH', True), d)}"
+BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS'), d)}"
+BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH'), d)}"
 BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
-HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS', True), d)}"
-HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH', True), d)}"
-HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH', True), d.getVar('TUNE_FEATURES', True), d)}"
+HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
+HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
+HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
-TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS', True), d)}"
-TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH', True), d)}"
-TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEATURES', True), d)}"
+TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
+TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
+TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
 
 python() {
     if d.getVar('TARGET_GOARCH') == 'INVALID':
-        raise bb.parse.SkipPackage('Cannot map `%s` to a go architecture' % d.getVar('TARGET_ARCH', True))
+        raise bb.parse.SkipPackage('Cannot map `%s` to a go architecture' % d.getVar('TARGET_ARCH'))
 }
 
 def go_map_arch(a, d):
diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go-cross/go-cross.inc
index 3174987..0859fd0 100644
--- a/recipes-devtools/go-cross/go-cross.inc
+++ b/recipes-devtools/go-cross/go-cross.inc
@@ -17,7 +17,7 @@ export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
 export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
 export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-CC = "${@d.getVar('BUILD_CC', True).strip()}"
+CC = "${@d.getVar('BUILD_CC').strip()}"
 
 do_configure[noexec] = "1"
 
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index bc2f1de..15aa804 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -32,7 +32,7 @@ LIBVIRT_INSTALL_ARGS = "--root=${D} \
     --install-data=${datadir}"
 
 python __anonymous () {
-    pkgconfig = d.getVar('PACKAGECONFIG', True)
+    pkgconfig = d.getVar('PACKAGECONFIG')
     if ('python') in pkgconfig.split():
         d.setVar('LIBVIRT_PYTHON_ENABLE', '1')
     else:
diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended/xen/xen-arch.inc
index 844d47d..fb0093e 100644
--- a/recipes-extended/xen/xen-arch.inc
+++ b/recipes-extended/xen/xen-arch.inc
@@ -6,7 +6,7 @@ valid_xen_archs = " \
 
 def map_xen_arch(a, d):
     import re
-    valid_archs = d.getVar('valid_xen_archs', True).split()
+    valid_archs = d.getVar('valid_xen_archs').split()
 
     if   re.match("i.86", a):        return "x86_32"
     elif re.match("x86.64", a):      return "x86_64"
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 429a05a..bc62a5a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -739,12 +739,12 @@ export STAGING_INCDIR
 export STAGING_LIBDIR
 
 # specify xen hypervisor to build/target
-export XEN_TARGET_ARCH = "${@map_xen_arch(d.getVar('TARGET_ARCH', True), d)}"
-export XEN_COMPILE_ARCH = "${@map_xen_arch(d.getVar('BUILD_ARCH', True), d)}"
+export XEN_TARGET_ARCH = "${@map_xen_arch(d.getVar('TARGET_ARCH'), d)}"
+export XEN_COMPILE_ARCH = "${@map_xen_arch(d.getVar('BUILD_ARCH'), d)}"
 
 python () {
-    if d.getVar('XEN_TARGET_ARCH', True) == 'INVALID':
-        raise bb.parse.SkipPackage('Cannot map `%s` to a xen architecture' % d.getVar('TARGET_ARCH', True))
+    if d.getVar('XEN_TARGET_ARCH') == 'INVALID':
+        raise bb.parse.SkipPackage('Cannot map `%s` to a xen architecture' % d.getVar('TARGET_ARCH'))
 }
 
 # Yocto appends ${PN} to libexecdir by default and Xen appends 'xen' as well
@@ -804,7 +804,7 @@ EXTRA_OEMAKE += "GIT=/bin/false"
 
 # check for XSM in package config to allow XSM_ENABLE to be set
 python () {
-    pkgconfig = d.getVar('PACKAGECONFIG', True)
+    pkgconfig = d.getVar('PACKAGECONFIG')
     if ('xsm') in pkgconfig.split():
         d.setVar('XSM_ENABLED', '1')
     else:
-- 
2.1.4


