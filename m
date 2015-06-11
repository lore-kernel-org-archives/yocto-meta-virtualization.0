Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40A97E00BC6; Thu, 11 Jun 2015 07:47:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D0FBE00B9D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jun 2015 07:46:53 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5BEkptl001638
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 11 Jun 2015 07:46:51 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>)
	id 1Z33kU-0005sZ-UJ; Thu, 11 Jun 2015 10:46:31 -0400
Date: Thu, 11 Jun 2015 10:46:30 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org, amy.fong@windriver.com
Message-ID: <20150611144630.GA22550@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] docker uprev 1.6.2
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
X-List-Received-Date: Thu, 11 Jun 2015 14:47:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From c129f2fc5442f77221f669baf6743f71a785b6a8 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Mon, 8 Jun 2015 13:26:01 -0400
Subject: [PATCH] docker uprev 1.6.2

Uprev docker to 1.6.2

go-capability is upreved to a later git commit
go-dbus is upreved to version 2
go-distribution-digest is added as a new dependency. Only the
   digest part of go-distribution is needed/kept here,
   hence go-distribution-digest
go-logrus is upreved to 0.7.1

Remove PR since it's no longer used

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/docker/docker_git.bb            | 11 +++----
 .../docker/files/disable_sha1sum_startup.patch     |  8 ++---
 recipes-devtools/go/go-capability_git.bb           |  7 ++---
 recipes-devtools/go/go-cli_git.bb                  |  1 -
 recipes-devtools/go/go-context_git.bb              |  1 -
 recipes-devtools/go/go-dbus_git.bb                 |  5 ++--
 recipes-devtools/go/go-distribution-digest_git.bb  | 34 ++++++++++++++++++++++
 recipes-devtools/go/go-fsnotify_git.bb             |  1 -
 recipes-devtools/go/go-libtrust_git.bb             |  1 -
 recipes-devtools/go/go-logrus_git.bb               |  5 ++--
 recipes-devtools/go/go-mux_git.bb                  |  1 -
 recipes-devtools/go/go-net_hg.bb                   |  1 -
 recipes-devtools/go/go-patricia_git.bb             |  1 -
 recipes-devtools/go/go-pty_git.bb                  |  1 -
 recipes-devtools/go/go-sqlite_hg.bb                |  1 -
 recipes-devtools/go/go-systemd_git.bb              |  1 -
 16 files changed, 51 insertions(+), 29 deletions(-)
 create mode 100644 recipes-devtools/go/go-distribution-digest_git.bb

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index cb54616..8bcaee9 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -18,9 +18,9 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV = "2243e32cbbf1c9809c262a7376d34ca43a7a36dc"
+SRCREV = "7c8fca2ddb58c8d2c4fb4df31c242886df7dd257"
 SRC_URI = "\
-	git://github.com/docker/docker.git \
+	git://github.com/docker/docker.git;branch=release \
 	file://docker.service \
 	file://docker.init \
 	file://hi.Dockerfile \
@@ -38,7 +38,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1cc0497778922bfd6cb48721deb80dc7"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "1.5.0"
+DOCKER_VERSION = "1.6.2"
 PV = "${DOCKER_VERSION}+git${SRCREV}"
 
 DEPENDS = "golang-cross \
@@ -57,6 +57,7 @@ DEPENDS = "golang-cross \
     go-systemd \
     btrfs-tools \
     sqlite3 \
+    go-distribution-digest \
     "
 
 DEPENDS_append_class-target = "lvm2"
@@ -110,9 +111,9 @@ INITSCRIPT_PARAMS_${PN} = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
 
 do_install() {
 	mkdir -p ${D}/${bindir}
-	cp ${S}/bundles/${DOCKER_VERSION}-dev/dynbinary/docker-${DOCKER_VERSION}-dev \
+	cp ${S}/bundles/${DOCKER_VERSION}/dynbinary/docker-${DOCKER_VERSION} \
 	  ${D}/${bindir}/docker
-	cp ${S}/bundles/${DOCKER_VERSION}-dev/dynbinary/dockerinit-${DOCKER_VERSION}-dev \
+	cp ${S}/bundles/${DOCKER_VERSION}/dynbinary/dockerinit-${DOCKER_VERSION} \
 	  ${D}/${bindir}/dockerinit
 
 	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
diff --git a/recipes-containers/docker/files/disable_sha1sum_startup.patch b/recipes-containers/docker/files/disable_sha1sum_startup.patch
index cc6819b..580ca23 100644
--- a/recipes-containers/docker/files/disable_sha1sum_startup.patch
+++ b/recipes-containers/docker/files/disable_sha1sum_startup.patch
@@ -17,15 +17,15 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
 
 --- a/utils/utils.go
 +++ b/utils/utils.go
-@@ -4,7 +4,6 @@
+@@ -3,7 +3,6 @@
+ import (
  	"bufio"
  	"bytes"
- 	"crypto/rand"
 -	"crypto/sha1"
  	"crypto/sha256"
  	"encoding/hex"
  	"fmt"
-@@ -76,20 +75,6 @@
+@@ -75,20 +74,6 @@
  	return path
  }
  
@@ -46,7 +46,7 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
  func isValidDockerInitPath(target string, selfPath string) bool { // target and selfPath should be absolute (InitPath and SelfPath already do this)
  	if target == "" {
  		return false
-@@ -111,7 +96,7 @@
+@@ -110,7 +95,7 @@
  		}
  		return os.SameFile(targetFileInfo, selfPathFileInfo)
  	}
diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-devtools/go/go-capability_git.bb
index 6f5b833..4f8f431 100644
--- a/recipes-devtools/go/go-capability_git.bb
+++ b/recipes-devtools/go/go-capability_git.bb
@@ -4,13 +4,12 @@ SECTION = "devel/go"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a7304f5073e7be4ba7bffabbf9f2bbca"
 
-PR = "r0"
 SRCNAME = "gocapability"
 
 PKG_NAME = "github.com/syndtr/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "3c85049eaeb429febe7788d9c7aac42322a377fe"
+SRCREV = "8e4cdcb3c22b40d5e330ade0b68cb2e2a3cf6f98"
 
 S = "${WORKDIR}/git"
 
@@ -19,9 +18,9 @@ do_install() {
 	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
 }
 
-SYSROOT_PREPROCESS_FUNCS += "go_mux_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS += "go_capability_sysroot_preprocess"
 
-go_mux_sysroot_preprocess () {
+go_capability_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
     cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
 }
diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-cli_git.bb
index ef37357..21d01ac 100644
--- a/recipes-devtools/go/go-cli_git.bb
+++ b/recipes-devtools/go/go-cli_git.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9b539ed65d73926f30ff1f1587dc44"
 
-PR = "r0"
 SRCNAME = "cli"
 
 PKG_NAME = "github.com/codegangsta/${SRCNAME}"
diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/go-context_git.bb
index a4b832e..15f6a8d 100644
--- a/recipes-devtools/go/go-context_git.bb
+++ b/recipes-devtools/go/go-context_git.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
 
-PR = "r0"
 SRCNAME = "context"
 
 PKG_NAME = "github.com/gorilla/${SRCNAME}"
diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-dbus_git.bb
index 8edbd1e..092bd50 100644
--- a/recipes-devtools/go/go-dbus_git.bb
+++ b/recipes-devtools/go/go-dbus_git.bb
@@ -4,14 +4,13 @@ SECTION = "devel/go"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5ac622301483800715d770434e27e5b"
 
-PR = "r0"
 SRCNAME = "dbus"
 
 PKG_NAME = "github.com/godbus/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "cb98efbb933d8389ab549a060e880ea3c375d213"
-PV = "1+git${SRCREV}"
+SRCREV = "88765d85c0fdadcd98a54e30694fa4e4f5b51133"
+PV = "2+git${SRCREV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-distribution-digest_git.bb b/recipes-devtools/go/go-distribution-digest_git.bb
new file mode 100644
index 0000000..31d724c
--- /dev/null
+++ b/recipes-devtools/go/go-distribution-digest_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "The Docker toolset to pack, ship, store, and deliver content"
+HOMEPAGE = "https://github.com/docker/distribution"
+SECTION = "devel/go"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRCNAME = "distribution"
+
+PKG_NAME = "github.com/docker/${SRCNAME}"
+SRC_URI = "git://${PKG_NAME}.git"
+
+SRCREV = "d957768537c5af40e4f4cd96871f7b2bde9e2923"
+
+S = "${WORKDIR}/git"
+
+do_unpackpost() {
+	rm -rf ${S}/[A-KM-Za-ce-z]* ${S}/doc*
+}
+
+addtask unpackpost after do_unpack before do_patch
+
+do_install() {
+	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+}
+
+SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
+
+go_distribution_digeset_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+}
+
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
index cb4a974..e18f574 100644
--- a/recipes-devtools/go/go-fsnotify_git.bb
+++ b/recipes-devtools/go/go-fsnotify_git.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
 
-PR = "r0"
 SRCNAME = "fsnotify"
 
 PKG_NAME = "github.com/go-fsnotify/${SRCNAME}"
diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-devtools/go/go-libtrust_git.bb
index d84cc34..f2acfb4 100644
--- a/recipes-devtools/go/go-libtrust_git.bb
+++ b/recipes-devtools/go/go-libtrust_git.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
-PR = "r0"
 SRCNAME = "libtrust"
 
 PKG_NAME = "github.com/docker/${SRCNAME}"
diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
index d1ae6e1..082c1a6 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -4,14 +4,13 @@ SECTION = "devel/go"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0"
 
-PR = "r0"
 SRCNAME = "logrus"
 
 PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "6ebb4e7b3c24b9fef150d7693e728cb1ebadf1f5"
-PV = "0.6.0+git${SRCREV}"
+SRCREV = "3fc34d061b9c78a70db853c7cb6b0576b6d4f32d"
+PV = "0.7.1+git${SRCREV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-mux_git.bb
index ddd9559..7a2025a 100644
--- a/recipes-devtools/go/go-mux_git.bb
+++ b/recipes-devtools/go/go-mux_git.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
 
-PR = "r0"
 SRCNAME = "mux"
 
 PKG_NAME = "github.com/gorilla/${SRCNAME}"
diff --git a/recipes-devtools/go/go-net_hg.bb b/recipes-devtools/go/go-net_hg.bb
index 4a159fa..9eff3ea 100644
--- a/recipes-devtools/go/go-net_hg.bb
+++ b/recipes-devtools/go/go-net_hg.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
-PR = "r0"
 SRCNAME = "go.net"
 
 PKG_NAME = "code.google.com/p/${SRCNAME}"
diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-devtools/go/go-patricia_git.bb
index 687677f..18c188d 100644
--- a/recipes-devtools/go/go-patricia_git.bb
+++ b/recipes-devtools/go/go-patricia_git.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9949b99212edd6b1e24ce702376c3baf"
 
-PR = "r0"
 SRCNAME = "go-patricia"
 
 PKG_NAME = "github.com/tchap/${SRCNAME}"
diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-pty_git.bb
index 8238540..bc94b31 100644
--- a/recipes-devtools/go/go-pty_git.bb
+++ b/recipes-devtools/go/go-pty_git.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://License;md5=93958070863d769117fa33b129020050"
 
-PR = "r0"
 SRCNAME = "pty"
 
 PKG_NAME = "github.com/kr/${SRCNAME}"
diff --git a/recipes-devtools/go/go-sqlite_hg.bb b/recipes-devtools/go/go-sqlite_hg.bb
index b4c1d0b..ddca920 100644
--- a/recipes-devtools/go/go-sqlite_hg.bb
+++ b/recipes-devtools/go/go-sqlite_hg.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
 
-PR = "r0"
 SRCNAME = "gosqlite"
 
 PKG_NAME = "code.google.com/p/${SRCNAME}"
diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
index 0a5ec24..358e6bb 100644
--- a/recipes-devtools/go/go-systemd_git.bb
+++ b/recipes-devtools/go/go-systemd_git.bb
@@ -4,7 +4,6 @@ SECTION = "devel/go"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
 
-PR = "r0"
 SRCNAME = "systemd"
 
 PKG_NAME = "github.com/coreos/go-${SRCNAME}"
-- 
2.1.4


