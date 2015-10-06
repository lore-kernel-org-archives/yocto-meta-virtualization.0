Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 518BBE00D5F; Tue,  6 Oct 2015 11:41:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFCB0E00A81
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Oct 2015 11:41:26 -0700 (PDT)
Received: from yow-dellw-af.wrs.com (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTP id t96IfNeE017950;
	Tue, 6 Oct 2015 11:41:26 -0700 (PDT)
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  6 Oct 2015 14:41:13 -0400
Message-Id: <1444156875-21115-6-git-send-email-amy.fong@windriver.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1444156875-21115-1-git-send-email-amy.fong@windriver.com>
References: <1444156875-21115-1-git-send-email-amy.fong@windriver.com>
Subject: [PATCH 5/7] Enable go-cross 1.3 to coexist with later versions
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
X-List-Received-Date: Tue, 06 Oct 2015 18:41:33 -0000

Since we need go 1.3 to co-exist with later versions (ie 1.4),
package go-cross_1.3 as go-cross-1.3_1.3.

go 1.3 will be installed to a different path than go-cross, this requires
go packages needing go 1.3 to set its PATH to:
        export PATH=${STAGING_BINDIR_NATIVE}/${HOST_SYS}/go-1.3:$PATH

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/docker/docker_git.bb       |  4 +-
 recipes-devtools/go-cross/go-cross-1.3_1.3.bb | 72 +++++++++++++++++++++++++++
 recipes-devtools/go-cross/go-cross_1.3.bb     | 71 --------------------------
 3 files changed, 75 insertions(+), 72 deletions(-)
 create mode 100644 recipes-devtools/go-cross/go-cross-1.3_1.3.bb
 delete mode 100644 recipes-devtools/go-cross/go-cross_1.3.bb

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index aa125a3..165b319 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -36,7 +36,7 @@ S = "${WORKDIR}/git"
 DOCKER_VERSION = "1.6.2"
 PV = "${DOCKER_VERSION}+git${SRCREV}"
 
-DEPENDS = "go-cross \
+DEPENDS = "go-cross-1.3 \
     go-cli \
     go-pty \
     go-context \
@@ -65,6 +65,8 @@ do_configure() {
 }
 
 do_compile() {
+	export PATH=${STAGING_BINDIR_NATIVE}/${HOST_SYS}/go-1.3:$PATH
+
 	export GOARCH="${TARGET_ARCH}"
 	# supported amd64, 386, arm
 	if [ "${TARGET_ARCH}" = "x86_64" ]; then
diff --git a/recipes-devtools/go-cross/go-cross-1.3_1.3.bb b/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
new file mode 100644
index 0000000..775e28f
--- /dev/null
+++ b/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
@@ -0,0 +1,72 @@
+DESCRIPTION = "\
+  Go is an open source programming language that makes it easy to build simple, \
+  reliable, and efficient software. \
+  "
+HOMEPAGE = "https://golang.org/"
+LICENSE = "BSD-3-Clause"
+
+DEPENDS = "virtual/${TARGET_PREFIX}gcc"
+
+SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz"
+
+S = "${WORKDIR}/go/"
+
+inherit cross
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
+SRC_URI[md5sum] = "4b66d7249554181c314f139ea78920b1"
+SRC_URI[sha256sum] = "eb983e6c5b2b9838f482c5442b1ac1856f610f2b21f3c123b3fedb48ffc35382"
+
+SRC_URI += "\
+        file://bsd_svid_source.patch \
+        file://ccache.patch \
+        file://0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch \
+        "
+
+do_compile() {
+	## Setting `$GOBIN` doesn't do any good, looks like it ends up copying binaries there.
+	export GOROOT_FINAL="${SYSROOT}${libdir}/go-1.3"
+
+	export GOHOSTOS="linux"
+	export GOOS="linux"
+
+	export GOARCH="${TARGET_ARCH}"
+	# golang only support 386, amd64 and arm architecture.
+	if [ "${TARGET_ARCH}" = "x86_64" ]; then
+		export GOARCH="amd64"
+	elif [ "${TARGET_ARCH}" = "i586" ]; then
+		export GOARCH="386"
+	fi
+	if [ "${TARGET_ARCH}" = "arm" ]
+	then
+		if [ `echo ${TUNE_PKGARCH} | cut -c 1-7` = "cortexa" ]
+		then
+			echo GOARM 7
+			export GOARM="7"
+		fi
+	fi
+
+	export CGO_ENABLED="1"
+	## TODO: consider setting GO_EXTLINK_ENABLED
+
+	export CC="${BUILD_CC}"
+	export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+	export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+	export GO_CCFLAGS="${HOST_CFLAGS}"
+	export GO_LDFLAGS="${HOST_LDFLAGS}"
+
+	cd src && ./make.bash
+}
+
+do_install() {
+	## It should be okay to ignore `${WORKDIR}/go/bin/linux_arm`...
+	## Also `gofmt` is not needed right now.
+	install -d "${D}${bindir}/go-1.3"
+	install -m 0755 "${WORKDIR}/go/bin/go" "${D}${bindir}/go-1.3/"
+	install -d "${D}${libdir}/go-1.3"
+
+	## TODO: use `install` instead of `cp`
+	for dir in include lib pkg src test
+	do cp -a "${WORKDIR}/go/${dir}" "${D}${libdir}/go-1.3/"
+	done
+}
diff --git a/recipes-devtools/go-cross/go-cross_1.3.bb b/recipes-devtools/go-cross/go-cross_1.3.bb
deleted file mode 100644
index 1fb4870..0000000
--- a/recipes-devtools/go-cross/go-cross_1.3.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-DESCRIPTION = "\
-  Go is an open source programming language that makes it easy to build simple, \
-  reliable, and efficient software. \
-  "
-HOMEPAGE = "https://golang.org/"
-LICENSE = "BSD-3-Clause"
-
-DEPENDS = "virtual/${TARGET_PREFIX}gcc"
-
-SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz"
-
-S = "${WORKDIR}/go/"
-
-inherit cross
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
-SRC_URI[md5sum] = "4b66d7249554181c314f139ea78920b1"
-SRC_URI[sha256sum] = "eb983e6c5b2b9838f482c5442b1ac1856f610f2b21f3c123b3fedb48ffc35382"
-
-SRC_URI += "\
-        file://bsd_svid_source.patch \
-        file://ccache.patch \
-        file://0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch \
-        "
-
-do_compile() {
-	## Setting `$GOBIN` doesn't do any good, looks like it ends up copying binaries there.
-	export GOROOT_FINAL="${SYSROOT}${libdir}/go"
-
-	export GOHOSTOS="linux"
-	export GOOS="linux"
-
-	export GOARCH="${TARGET_ARCH}"
-	# golang only support 386, amd64 and arm architecture.
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		export GOARCH="amd64"
-	elif [ "${TARGET_ARCH}" = "i586" ]; then
-		export GOARCH="386"
-	fi
-	if [ "${TARGET_ARCH}" = "arm" ]
-	then
-		if [ `echo ${TUNE_PKGARCH} | cut -c 1-7` = "cortexa" ]
-		then
-			echo GOARM 7
-			export GOARM="7"
-		fi
-	fi
-
-	export CGO_ENABLED="1"
-	## TODO: consider setting GO_EXTLINK_ENABLED
-
-	export CC="${BUILD_CC}"
-	export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-	export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-	export GO_CCFLAGS="${HOST_CFLAGS}"
-	export GO_LDFLAGS="${HOST_LDFLAGS}"
-
-	cd src && ./make.bash
-}
-
-do_install() {
-	## It should be okay to ignore `${WORKDIR}/go/bin/linux_arm`...
-	## Also `gofmt` is not needed right now.
-	install -d "${D}${bindir}"
-	install -m 0755 "${WORKDIR}/go/bin/go" "${D}${bindir}"
-	install -d "${D}${libdir}/go"
-	## TODO: use `install` instead of `cp`
-	for dir in include lib pkg src test
-	do cp -a "${WORKDIR}/go/${dir}" "${D}${libdir}/go/"
-	done
-}
-- 
2.5.3


