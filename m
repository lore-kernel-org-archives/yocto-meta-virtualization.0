Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24E1DE00C6A; Wed, 30 May 2018 02:18:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.14 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA90EE00A26
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 May 2018 02:18:12 -0700 (PDT)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w4U9IBes009412
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 May 2018 11:18:11 +0200
Received: from dev.vm6.ccp.siemens.com ([139.22.39.171])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w4U9IBCa015274;
	Wed, 30 May 2018 11:18:11 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0E3D310D4969;
	Wed, 30 May 2018 11:18:11 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 30 May 2018 11:17:59 +0200
Message-Id: <20180530091759.23186-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] tini: add version 0.18.0 as docker-init provider
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
X-List-Received-Date: Wed, 30 May 2018 09:18:15 -0000

This removes the warning that docker can't find docker-init
in PATH.

This recipe is based on the recipe from meta-resin.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-containers/docker/docker_git.bb            |  2 +-
 ...p-the-output-binary-allow-yocto-to-do-thi.patch | 28 +++++++++++++++++++
 recipes-containers/tini/tini_0.18.0.bb             | 32 ++++++++++++++++++++++
 3 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/tini/tini/0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch
 create mode 100644 recipes-containers/tini/tini_0.18.0.bb

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 790170e..73e0120 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -74,7 +74,7 @@ RDEPENDS_${PN} = "util-linux iptables \
                  "
 RDEPENDS_${PN} += "virtual/containerd virtual/runc"
 
-RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
+RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat docker-init"
 RSUGGESTS_${PN} = "lxc rt-tests"
 DOCKER_PKG="github.com/docker/docker"
 
diff --git a/recipes-containers/tini/tini/0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch b/recipes-containers/tini/tini/0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch
new file mode 100644
index 0000000..6797720
--- /dev/null
+++ b/recipes-containers/tini/tini/0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch
@@ -0,0 +1,28 @@
+From b99ef9954a34cffd85a5cc09922b201ae11b494d Mon Sep 17 00:00:00 2001
+From: Theodor Gherzan <theodor@resin.io>
+Date: Mon, 5 Jun 2017 18:16:56 +0200
+Subject: [PATCH] Do not strip the output binary, allow yocto to do this
+
+Upstream-Status: Inappropriate [configuration specific]
+
+Signed-off-by: Theodor Gherzan <theodor@resin.io>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b5b93ba..c2907e2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -54,7 +54,7 @@ if(NOT HAS_BUILTIN_FORTIFY)
+ endif()
+ 
+ set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99 -Werror -Wextra -Wall -pedantic-errors -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat")
+-set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-s")
++set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-Bsymbolic-functions -Wl,-z,relro")
+ 
+ # Build
+ 
+-- 
+2.7.4
+
diff --git a/recipes-containers/tini/tini_0.18.0.bb b/recipes-containers/tini/tini_0.18.0.bb
new file mode 100644
index 0000000..7c124a8
--- /dev/null
+++ b/recipes-containers/tini/tini_0.18.0.bb
@@ -0,0 +1,32 @@
+HOMEPAGE = "http://github.com/krallin/tini"
+SUMMARY = "Minimal init for containers"
+DESCRIPTION = "Tini is the simplest init you could think of. All Tini does is \
+spawn a single child (Tini is meant to be run in a container), and wait for \
+it to exit all the while reaping zombies and performing signal forwarding. "
+
+SRCREV = "fec3683b971d9c3ef73f284f176672c44b448662"
+SRC_URI = " \
+  git://github.com/krallin/tini.git \
+  file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch \
+  "
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ffc9091894702bc5dcf4cc0085561ef5"
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
+
+# tini links with -static, so no PIE for us
+SECURITY_CFLAGS_pn-${PN} = "${SECURITY_NO_PIE_CFLAGS}"
+
+inherit cmake
+
+do_install() {
+  mkdir -p ${D}/${bindir}
+  install -m 0755 ${B}/tini-static ${D}/${bindir}/docker-init
+}
+
+# Tini is the currently the provider for docker-init
+PROVIDES += "docker-init"
+RPROVIDES_${PN} = "docker-init"
-- 
2.11.0


