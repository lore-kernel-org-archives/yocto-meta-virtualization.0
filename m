Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66FBAE00939; Wed,  8 Feb 2017 09:53:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05B3AE00655
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 09:53:38 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v18HrbYF010086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 8 Feb 2017 09:53:37 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 09:53:36 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 8 Feb 2017 12:53:27 -0500
Message-ID: <1486576408-24433-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486576408-24433-1-git-send-email-mark.asselstine@windriver.com>
References: <1486576408-24433-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 2/3] go-cross: add ${TARGET_ARCH} to PN
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
X-List-Received-Date: Wed, 08 Feb 2017 17:53:41 -0000
Content-Type: text/plain

Since we are building a cross tool which produces something which is
ARCH specific we should stick to the <toolname>-cross-<arch> naming
convention. A variant of this patch has been floating around for a
while but with the changes around per recipe sysroots, distributed
builds, shared builds... we are best served to adopt this convention
now.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/containerd/containerd_git.bb               | 2 +-
 recipes-containers/docker/docker_git.bb                       | 2 +-
 recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb | 2 +-
 recipes-containers/riddler/riddler_git.bb                     | 2 +-
 recipes-containers/runc/runc_git.bb                           | 2 +-
 recipes-devtools/go-cross/go-cross.inc                        | 3 +++
 recipes-networking/netns/netns_git.bb                         | 2 +-
 7 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 096a164..f5d5cd7 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 CONTAINERD_VERSION = "0.2.2"
 PV = "${CONTAINERD_VERSION}+git${SRCREV}"
 
-DEPENDS = "go-cross \
+DEPENDS = "go-cross-${TARGET_ARCH} \
     "
 
 RRECOMMENDS_${PN} = "lxc docker"
diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index c208a02..d264166 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -37,7 +37,7 @@ DOCKER_VERSION = "1.13.0"
 PV = "${DOCKER_VERSION}+git${SRCREV}"
 
 DEPENDS = " \
-    go-cross \
+    go-cross-${TARGET_ARCH} \
     go-cli \
     go-pty \
     go-context \
diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
index dac2d13..7e5af38 100644
--- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
+++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
@@ -2,7 +2,7 @@ HOMEPAGE = "https://github.com/opencontainers/runtime-tools"
 SUMMARY = "oci-runtime-tool is a collection of tools for working with the OCI runtime specification"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b355a61a394a504dacde901c958f662c"
-DEPENDS = "go-cross"
+DEPENDS = "go-cross-${TARGET_ARCH}"
 
 SRC_URI = "git://github.com/opencontainers/runtime-tools.git"
 
diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
index 361e9d2..49e8aa0 100644
--- a/recipes-containers/riddler/riddler_git.bb
+++ b/recipes-containers/riddler/riddler_git.bb
@@ -2,7 +2,7 @@ HOMEPAGE = "https://github.com/jfrazelle/riddler"
 SUMMARY = "Convert `docker inspect` to opencontainers (OCI compatible) runc spec."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
-DEPENDS = "go-cross"
+DEPENDS = "go-cross-${TARGET_ARCH}"
 
 SRC_URI = "git://github.com/jfrazelle/riddler;branch=master"
 SRCREV = "23befa0b232877b5b502b828e24161d801bd67f6"
diff --git a/recipes-containers/runc/runc_git.bb b/recipes-containers/runc/runc_git.bb
index ed9a32e..23c0094 100644
--- a/recipes-containers/runc/runc_git.bb
+++ b/recipes-containers/runc/runc_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 RUNC_VERSION = "1.0.0-rc1"
 PV = "${RUNC_VERSION}+git${SRCREV}"
 
-DEPENDS = "go-cross \
+DEPENDS = "go-cross-${TARGET_ARCH} \
     "
 RRECOMMENDS_${PN} = "lxc docker"
 
diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go-cross/go-cross.inc
index 857fbd5..a7117bc 100644
--- a/recipes-devtools/go-cross/go-cross.inc
+++ b/recipes-devtools/go-cross/go-cross.inc
@@ -1,5 +1,8 @@
 inherit cross
 
+# Produces target arch specific code so we should reflect this in the PN
+PN = "go-cross-${TARGET_ARCH}"
+
 # libgcc is required for the target specific libraries to build properly
 DEPENDS += "go-initial-native libgcc virtual/${TARGET_PREFIX}gcc"
 
diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index 073022e..247b37d 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -2,7 +2,7 @@ HOMEPAGE = "https://github.com/jfrazelle/netns"
 SUMMARY = "Runc hook for setting up default bridge networking."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
-DEPENDS = "go-cross"
+DEPENDS = "go-cross-${TARGET_ARCH}"
 
 SRC_URI = "git://github.com/jfrazelle/netns;branch=master"
 SRCREV = "2804050eeab661bfa75c3aa06bdcf60273b02ca7"
-- 
2.7.4


