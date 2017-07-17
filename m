Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B476E00C74; Mon, 17 Jul 2017 13:05:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49D7EE00C62
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:24 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6HK4NuX001715
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:23 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:11 -0400
Message-ID: <1500321853-984-11-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
In-Reply-To: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
References: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] containerd: uprev to latest 0.2.x
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
X-List-Received-Date: Mon, 17 Jul 2017 20:05:14 -0000
Content-Type: text/plain

To match the docker (moby) and runc updates, we need the latest containerd
from the 0.2.x branch to work in cooperation with the other components.

Note: containerd master won't currently work with docker master, but is
very similar to 0.2.x. The build target varies slightly in master, but
otherwise with these changes to the recipe and build steps we can switch
easily when the time comes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../containerd/containerd-docker_git.bb            | 14 ++++++----
 recipes-containers/containerd/containerd.inc       | 30 +++++++++-------------
 .../containerd/files/containerd.service            | 11 ++++++++
 3 files changed, 32 insertions(+), 23 deletions(-)
 create mode 100644 recipes-containers/containerd/files/containerd.service

diff --git a/recipes-containers/containerd/containerd-docker_git.bb b/recipes-containers/containerd/containerd-docker_git.bb
index f6dcaeca9e97..b18a9bb29d22 100644
--- a/recipes-containers/containerd/containerd-docker_git.bb
+++ b/recipes-containers/containerd/containerd-docker_git.bb
@@ -1,10 +1,14 @@
-include containerd.inc
-
-SRCREV = "03e5862ec0d8d3b3f750e19fca3ee367e13c090e"
+SRCREV = "3addd840653146c90a254301d6c3a663c7fd6429"
 SRC_URI = "\
-	git://github.com/docker/containerd.git;branch=docker-1.13.x \
+	git://github.com/docker/containerd.git;branch=v0.2.x;destsuffix=git/src/github.com/containerd/containerd \
 	"
-CONTAINERD_VERSION = "0.2.3"
+
+include containerd.inc
+
+CONTAINERD_VERSION = "v0.2.x"
+S = "${WORKDIR}/git/src/github.com/containerd/containerd"
 
 PROVIDES += "virtual/containerd"
 RPROVIDES_${PN} = "virtual/containerd"
+
+DEPENDS += "btrfs-tools"
diff --git a/recipes-containers/containerd/containerd.inc b/recipes-containers/containerd/containerd.inc
index b14397957edb..18d9188e0acf 100644
--- a/recipes-containers/containerd/containerd.inc
+++ b/recipes-containers/containerd/containerd.inc
@@ -8,30 +8,23 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.code;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
 
+SRC_URI += "file://containerd.service"
+
 S = "${WORKDIR}/git"
 
 PV = "${CONTAINERD_VERSION}+git${SRCREV}"
 
 inherit go
+inherit goarch
 
 RRECOMMENDS_${PN} = "lxc docker"
-CONTAINERD_PKG="github.com/docker/containerd"
+CONTAINERD_PKG="github.com/containerd/containerd"
+
+INSANE_SKIP_${PN} += "ldflags"
 
 do_configure[noexec] = "1"
 
 do_compile() {
-	export GOARCH="${TARGET_ARCH}"
-	# supported amd64, 386, arm arm64
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		export GOARCH="amd64"
-	fi
-	if [ "${TARGET_ARCH}" = "aarch64" ]; then
-		export GOARCH="arm64"
-	fi
-	if [ "${TARGET_ARCH}" = "i586" ]; then
-		export GOARCH="386"
-	fi
-
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
 	# use dependencies packaged independently.
@@ -39,9 +32,9 @@ do_compile() {
 	rm -rf .gopath
 	mkdir -p .gopath/src/"$(dirname "${CONTAINERD_PKG}")"
 	ln -sf ../../../.. .gopath/src/"${CONTAINERD_PKG}"
-	export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
-	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
-	cd -
+
+        export GOPATH="${WORKDIR}/git/"
+        export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -50,6 +43,7 @@ do_compile() {
 	export LDFLAGS=""
 	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+        export GO_GCFLAGS=""
 	export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
 	export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
 
@@ -74,9 +68,9 @@ do_install() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}${systemd_unitdir}/system
-		install -m 644 ${S}/hack/containerd.service ${D}/${systemd_unitdir}/system
+		install -m 644 ${WORKDIR}/containerd.service ${D}/${systemd_unitdir}/system
 	        # adjust from /usr/local/bin to /usr/bin/
-		sed -e "s:/usr/local/bin/containerd:${bindir}/docker-containerd -l \"unix\:///var/run/docker/libcontainerd/docker-containerd.sock\":g" -i ${D}/${systemd_unitdir}/system/containerd.service
+		sed -e "s:/usr/local/bin/containerd:${bindir}/docker-containerd:g" -i ${D}/${systemd_unitdir}/system/containerd.service
 	fi
 }
 
diff --git a/recipes-containers/containerd/files/containerd.service b/recipes-containers/containerd/files/containerd.service
new file mode 100644
index 000000000000..23633b02bcc6
--- /dev/null
+++ b/recipes-containers/containerd/files/containerd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=containerd
+Documentation=https://containerd.tools
+After=network.target
+
+[Service]
+ExecStart=/usr/local/bin/containerd
+Delegate=yes
+
+[Install]
+WantedBy=multi-user.target
-- 
2.4.0.53.g8440f74


