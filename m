Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93558E00A9B; Tue, 11 Apr 2017 10:43:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CD18E0094C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Apr 2017 10:43:42 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3BHhfpt024618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Apr 2017 10:43:41 -0700
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Apr 2017 10:43:40 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 11 Apr 2017 13:43:34 -0400
Message-ID: <1491932614-13835-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] housekeeping: swap out go-osarchmap in favor of goarch
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
X-List-Received-Date: Tue, 11 Apr 2017 17:43:44 -0000
Content-Type: text/plain

Continue work to use go infra in oe-core instead of the support for go
previously found in meta-virt. This is a 1:1 drop in replacement and
removes one more go piece from meta-virt in favor of the common
support found in oe-core.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 classes/go-osarchmap.bbclass                       | 43 ----------------------
 .../docker-distribution/docker-distribution_git.bb |  2 +-
 recipes-containers/docker/docker_git.bb            |  2 +-
 .../oci-image-tools/oci-image-tools_git.bb         |  2 +-
 .../oci-runtime-tools/oci-runtime-tools_git.bb     |  2 +-
 recipes-containers/riddler/riddler_git.bb          |  2 +-
 recipes-containers/runc/runc.inc                   |  2 +-
 recipes-networking/netns/netns_git.bb              |  2 +-
 8 files changed, 7 insertions(+), 50 deletions(-)
 delete mode 100644 classes/go-osarchmap.bbclass

diff --git a/classes/go-osarchmap.bbclass b/classes/go-osarchmap.bbclass
deleted file mode 100644
index 058bf64..0000000
--- a/classes/go-osarchmap.bbclass
+++ /dev/null
@@ -1,43 +0,0 @@
-BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS'), d)}"
-BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH'), d)}"
-BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
-HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
-HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
-HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
-HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
-TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
-TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
-TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
-TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
-GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
-
-python() {
-    if d.getVar('TARGET_GOARCH') == 'INVALID':
-        raise bb.parse.SkipPackage('Cannot map `%s` to a go architecture' % d.getVar('TARGET_ARCH'))
-}
-
-def go_map_arch(a, d):
-    import re
-    if re.match('i.86', a):
-        return '386'
-    elif a == 'x86_64':
-        return 'amd64'
-    elif re.match('arm.*', a):
-        return 'arm'
-    elif re.match('aarch64.*', a):
-        return 'arm64'
-    elif re.match('p(pc|owerpc)(|64)', a):
-        return 'powerpc'
-    else:
-        return 'INVALID'
-
-def go_map_arm(a, f, d):
-    import re
-    if re.match('arm.*', a) and re.match('arm.*7.*', f):
-        return '7'
-    return ''
-
-def go_map_os(o, d):
-    if o.startswith('linux'):
-        return 'linux'
-    return o
diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 07920b9..08b6d70 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -13,7 +13,7 @@ PACKAGES =+ "docker-registry"
 PV = "v2.6.0-rc+git${SRCPV}"
 S = "${WORKDIR}/git/src/github.com/docker/distribution"
 
-inherit go-osarchmap
+inherit goarch
 inherit go
 
 # This disables seccomp and apparmor, which are on by default in the
diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 6b73cf3..74170cb 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -72,7 +72,7 @@ DOCKER_PKG="github.com/docker/docker"
 
 inherit systemd update-rc.d
 inherit go
-inherit go-osarchmap
+inherit goarch
 
 do_configure[noexec] = "1"
 
diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 125362b..29a8926 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -18,7 +18,7 @@ PV = "0.1.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit go-osarchmap
+inherit goarch
 inherit go
 
 # This disables seccomp and apparmor, which are on by default in the
diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
index 176860e..4f77dce 100644
--- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
+++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
@@ -10,7 +10,7 @@ PV = "0.0.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit go-osarchmap
+inherit goarch
 inherit go
 
 do_compile() {
diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
index 5159980..ae6c5ec 100644
--- a/recipes-containers/riddler/riddler_git.bb
+++ b/recipes-containers/riddler/riddler_git.bb
@@ -9,7 +9,7 @@ PV = "0.1.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit go-osarchmap
+inherit goarch
 inherit go
 
 # This disables seccomp and apparmor, which are on by default in the
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index 64cf3f8..ceed5a4 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -19,7 +19,7 @@ LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
 do_configure[noexec] = "1"
 EXTRA_OEMAKE="BUILDTAGS=''"
 
-inherit go-osarchmap
+inherit goarch
 
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index f41ff70..641d55f 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -9,7 +9,7 @@ PV = "0.1.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit go-osarchmap
+inherit goarch
 inherit go
 
 do_compile() {
-- 
2.7.4


