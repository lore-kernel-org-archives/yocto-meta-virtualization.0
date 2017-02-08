Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B65AE009A5; Wed,  8 Feb 2017 09:53:42 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1447E006C6
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 09:53:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v18Hrc1T004925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 8 Feb 2017 09:53:38 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 09:53:38 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 8 Feb 2017 12:53:28 -0500
Message-ID: <1486576408-24433-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486576408-24433-1-git-send-email-mark.asselstine@windriver.com>
References: <1486576408-24433-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 3/3] docker: fixup failing build
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
X-List-Received-Date: Wed, 08 Feb 2017 17:53:42 -0000
Content-Type: text/plain

Docker is failing to build because it is attempting to download
missing go dependencies. Add new recipes for missing dependencies and
update existing recipes to ensure the version defined in docker's
vendor.conf is available.

Note that this fixes the build only. At this time many docker
functions are working, such as 'docker image', 'docker pull' and more,
but 'docker run' is currently failing.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/docker/docker_git.bb            |  6 +++-
 recipes-devtools/go/compose-file_git.bb            | 41 ++++++++++++++++++++++
 recipes-devtools/go/go-capability_git.bb           |  3 +-
 recipes-devtools/go/go-connections_git.bb          | 39 ++++++++++++++++++++
 recipes-devtools/go/go-dbus_git.bb                 |  6 ++--
 ...bution-digest_git.bb => go-distribution_git.bb} | 15 +++++---
 recipes-devtools/go/go-fsnotify_git.bb             |  4 +--
 recipes-devtools/go/go-libtrust_git.bb             |  3 +-
 recipes-devtools/go/go-logrus_git.bb               |  4 +--
 recipes-devtools/go/go-patricia_git.bb             |  4 +--
 recipes-devtools/go/go-systemd_git.bb              |  8 +++--
 recipes-devtools/go/grpc-go_git.bb                 | 41 ++++++++++++++++++++++
 recipes-devtools/go/notary_git.bb                  | 39 ++++++++++++++++++++
 13 files changed, 195 insertions(+), 18 deletions(-)
 create mode 100644 recipes-devtools/go/compose-file_git.bb
 create mode 100644 recipes-devtools/go/go-connections_git.bb
 rename recipes-devtools/go/{go-distribution-digest_git.bb => go-distribution_git.bb} (58%)
 create mode 100644 recipes-devtools/go/grpc-go_git.bb
 create mode 100644 recipes-devtools/go/notary_git.bb

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index d264166..75f95f1 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -51,7 +51,11 @@ DEPENDS = " \
     go-systemd \
     btrfs-tools \
     sqlite3 \
-    go-distribution-digest \
+    go-distribution \
+    compose-file \
+    go-connections \
+    notary \
+    grpc-go \
     "
 
 PACKAGES =+ "${PN}-contrib"
diff --git a/recipes-devtools/go/compose-file_git.bb b/recipes-devtools/go/compose-file_git.bb
new file mode 100644
index 0000000..bcf8c3d
--- /dev/null
+++ b/recipes-devtools/go/compose-file_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Parser for the Compose file format (version 3)"
+HOMEPAGE = "https://github.com/aanand/compose-file"
+SECTION = "devel/go"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=9cd86830b557232ce55e2a6b47387471"
+
+SRCNAME = "compose-file"
+
+PKG_NAME = "github.com/aanand/${SRCNAME}"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
+
+SRCREV = "a3e58764f50597b6217fec07e9bff7225c4a1719"
+PV = "3.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+# NO-OP the do compile rule because this recipe is source only.
+do_compile() {
+}
+
+do_install() {
+	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    fi
+	    cp $j ${D}${prefix}/local/go/$j
+	done
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+}
+
+SYSROOT_PREPROCESS_FUNCS += "go_compose_file_sysroot_preprocess"
+
+go_compose_file_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+}
+
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+CLEANBROKEN = "1"
\ No newline at end of file
diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-devtools/go/go-capability_git.bb
index 4f8f431..8524af6 100644
--- a/recipes-devtools/go/go-capability_git.bb
+++ b/recipes-devtools/go/go-capability_git.bb
@@ -9,7 +9,8 @@ SRCNAME = "gocapability"
 PKG_NAME = "github.com/syndtr/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "8e4cdcb3c22b40d5e330ade0b68cb2e2a3cf6f98"
+SRCREV = "2c00daeb6c3b45114c80ac44119e7b8801fdd852"
+PV = "0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-connections_git.bb b/recipes-devtools/go/go-connections_git.bb
new file mode 100644
index 0000000..5d071b0
--- /dev/null
+++ b/recipes-devtools/go/go-connections_git.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Utility package to work with network connections"
+HOMEPAGE = "https://github.com/docker/connections"
+SECTION = "devel/go"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=04424bc6f5a5be60691b9824d65c2ad8"
+
+SRCNAME = "go-connections"
+
+PKG_NAME = "github.com/docker/${SRCNAME}"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
+
+SRCREV = "4ccf312bf1d35e5dbda654e57a9be4c3f3cd0366"
+PV = "0.2.1+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+# NO-OP the do compile rule because this recipe is source only.
+do_compile() {
+}
+
+do_install() {
+	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    fi
+	    cp $j ${D}${prefix}/local/go/$j
+	done
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+}
+
+SYSROOT_PREPROCESS_FUNCS += "go_connections_sysroot_preprocess"
+
+go_connections_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+}
+
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-dbus_git.bb
index 092bd50..9b206a1 100644
--- a/recipes-devtools/go/go-dbus_git.bb
+++ b/recipes-devtools/go/go-dbus_git.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Native Go bindings for D-Bus"
 HOMEPAGE = "https://github.com/godbus/dbus"
 SECTION = "devel/go"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b5ac622301483800715d770434e27e5b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed"
 
 SRCNAME = "dbus"
 
 PKG_NAME = "github.com/godbus/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "88765d85c0fdadcd98a54e30694fa4e4f5b51133"
-PV = "2+git${SRCREV}"
+SRCREV = "5f6efc7ef2759c81b7ba876593971bfce311eab3"
+PV = "4.0.0+git${SRCREV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-distribution-digest_git.bb b/recipes-devtools/go/go-distribution_git.bb
similarity index 58%
rename from recipes-devtools/go/go-distribution-digest_git.bb
rename to recipes-devtools/go/go-distribution_git.bb
index 2a803da..9e3f209 100644
--- a/recipes-devtools/go/go-distribution-digest_git.bb
+++ b/recipes-devtools/go/go-distribution_git.bb
@@ -2,14 +2,15 @@ DESCRIPTION = "The Docker toolset to pack, ship, store, and deliver content"
 HOMEPAGE = "https://github.com/docker/distribution"
 SECTION = "devel/go"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
 SRCNAME = "distribution"
 
 PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
+SRC_URI = "git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME}"
 
-SRCREV = "d957768537c5af40e4f4cd96871f7b2bde9e2923"
+SRCREV = "28602af35aceda2f8d571bad7ca37a54cf0250bc"
+PV = "2.6.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -19,7 +20,13 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	cp -r ${S}/LICENSE ${S}/digest ${D}${prefix}/local/go/src/${PKG_NAME}/
+	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    fi
+	    cp $j ${D}${prefix}/local/go/$j
+	done
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
 }
 
 SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
index e18f574..e5bcf14 100644
--- a/recipes-devtools/go/go-fsnotify_git.bb
+++ b/recipes-devtools/go/go-fsnotify_git.bb
@@ -9,8 +9,8 @@ SRCNAME = "fsnotify"
 PKG_NAME = "github.com/go-fsnotify/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "ca50e738d35a862c379baf8fffbc3bfd080b3cff"
-PV = "1.0.4+git${SRCREV}"
+SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
+PV = "1.2.11+git${SRCREV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-devtools/go/go-libtrust_git.bb
index f2acfb4..5565946 100644
--- a/recipes-devtools/go/go-libtrust_git.bb
+++ b/recipes-devtools/go/go-libtrust_git.bb
@@ -9,7 +9,8 @@ SRCNAME = "libtrust"
 PKG_NAME = "github.com/docker/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "230dfd18c2326f1e9d08238710e67a1040187d07"
+SRCREV = "9cbd2a1374f46905c68a4eb3694a130610adc62a"
+PV = "0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
index 082c1a6..5c0c359 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -9,8 +9,8 @@ SRCNAME = "logrus"
 PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "3fc34d061b9c78a70db853c7cb6b0576b6d4f32d"
-PV = "0.7.1+git${SRCREV}"
+SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
+PV = "0.11.0+git${SRCREV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-devtools/go/go-patricia_git.bb
index 18c188d..8c1e10d 100644
--- a/recipes-devtools/go/go-patricia_git.bb
+++ b/recipes-devtools/go/go-patricia_git.bb
@@ -9,8 +9,8 @@ SRCNAME = "go-patricia"
 PKG_NAME = "github.com/tchap/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "f64d0a63cd3363481c898faa9339de04d12213f9"
-PV = "1.0.1+git${SRCPV}"
+SRCREV = "666120de432aea38ab06bd5c818f04f4129882c9"
+PV = "2.2.6+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
index 358e6bb..5cbab92 100644
--- a/recipes-devtools/go/go-systemd_git.bb
+++ b/recipes-devtools/go/go-systemd_git.bb
@@ -9,8 +9,12 @@ SRCNAME = "systemd"
 PKG_NAME = "github.com/coreos/go-${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
-SRCREV = "f743bc15d6bddd23662280b4ad20f7c874cdd5ad"
-PV = "2+git${SRCREV}"
+SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
+PV = "4+git${SRCREV}"
+
+DEPENDS += " \
+    bash \
+"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
new file mode 100644
index 0000000..48c4249
--- /dev/null
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "The Go language implementation of gRPC. HTTP/2 based RPC"
+HOMEPAGE = "https://github.com/grpc/grpc-go"
+SECTION = "devel/go"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=a4bad33881612090c6035d8393175996"
+
+SRCNAME = "grpc-go"
+
+PKG_NAME = "google.golang.org/grpc"
+SRC_URI = "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME}"
+
+SRCREV = "777daa17ff9b5daef1cfdf915088a2ada3332bf0"
+PV = "1.4.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+# NO-OP the do compile rule because this recipe is source only.
+do_compile() {
+}
+
+do_install() {
+	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    fi
+	    cp $j ${D}${prefix}/local/go/$j
+	done
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+}
+
+SYSROOT_PREPROCESS_FUNCS += "go_grpc_sysroot_preprocess"
+
+go_grpc_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+}
+
+FILES_${PN} += " \
+    ${prefix}/local/go/src/${PKG_NAME}/* \
+"
diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/notary_git.bb
new file mode 100644
index 0000000..d638dc1
--- /dev/null
+++ b/recipes-devtools/go/notary_git.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Notary is a Docker project that allows anyone to have trust over arbitrary collections of data"
+HOMEPAGE = "https://github.com/docker/notary"
+SECTION = "devel/go"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=771ddb425ba03c8fab49e5bd9854a4a2"
+
+SRCNAME = "notary"
+
+PKG_NAME = "github.com/docker/${SRCNAME}"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
+
+SRCREV = "c8aa8cf53cbcda2e92def0c9291e25d770493494"
+PV = "0.4.2+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+# NO-OP the do compile rule because this recipe is source only.
+do_compile() {
+}
+
+do_install() {
+	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
+	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
+	    fi
+	    cp $j ${D}${prefix}/local/go/$j
+	done
+	cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/${PKG_NAME}/
+}
+
+SYSROOT_PREPROCESS_FUNCS += "go_notary_sysroot_preprocess"
+
+go_notary_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
+    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
+}
+
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-- 
2.7.4


