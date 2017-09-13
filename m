Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57BF0E00CB7; Wed, 13 Sep 2017 12:39:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45B3AE00CAF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Sep 2017 12:39:48 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8DJdlCY004925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Sep 2017 12:39:47 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Sep 2017 12:39:46 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 13 Sep 2017 12:39:46 -0700
Message-ID: <20170913193946.98950-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] nets, docker, runc, oci-*tools: go.bbclass compile fixes
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
X-List-Received-Date: Wed, 13 Sep 2017 19:39:53 -0000
Content-Type: text/plain

Recently in the oe-core the go.bbclass changed and requires the
defition of the GO_IMPORT variable.  This was intended to simplify how
the compilation works with go packages and it is still a work in
progress.

This patch set makes the recipes compatible to generate the same end
result as before using the new go.bbclass from oe-core.

Any patches that were included in the recipes had to have the paths
adjusted because the new go.bbclass manipulates the notion of S to be
S + "src" + "$GO_IMPORT" internally for the purpose of unpack, patch
and compile.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-containers/docker/docker_git.bb            | 29 +++++++++++-----------
 ...-golang.org-x-net-pkg-until-we-move-to-go.patch | 20 +++++++--------
 ...est-Recursively-remove-pre-existing-entri.patch |  4 +--
 ...est-Split-unpackLayerEntry-into-its-own-f.patch |  4 +--
 .../oci-image-tools/oci-image-tools_git.bb         | 16 ++++++------
 .../oci-runtime-tools/oci-runtime-tools_git.bb     | 22 ++++++++--------
 recipes-containers/riddler/riddler_git.bb          | 14 ++++++-----
 ...untime-spec-198f23f827eea397d4331d7eb048d.patch |  8 +++---
 .../0001-runc-Add-console-socket-dev-null.patch    |  4 +--
 ...-Remove-Platform-as-no-longer-in-OCI-spec.patch |  8 +++---
 ...date-memory-specs-to-use-int64-not-uint64.patch | 12 ++++-----
 recipes-containers/runc/runc-docker_git.bb         |  2 ++
 recipes-containers/runc/runc.inc                   | 13 +++++-----
 recipes-networking/netns/netns_git.bb              | 14 ++++++-----
 14 files changed, 88 insertions(+), 82 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 1ced8f4..4d6c17c 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -32,7 +32,9 @@ SRC_URI = "\
 
 # Apache-2.0 for docker
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
+
+GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
@@ -81,18 +83,17 @@ do_compile() {
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
 	# use dependencies packaged independently.
-	cd ${S}
+	cd ${S}/src/import
 	rm -rf .gopath
 	mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
 	ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
 
 	mkdir -p .gopath/src/github.com/docker
-	ln -sf ../../../../../libnetwork .gopath/src/github.com/docker/libnetwork
-	ln -sf ../../../../../cli .gopath/src/github.com/docker/cli
+	ln -sf ${WORKDIR}/libnetwork .gopath/src/github.com/docker/libnetwork
+	ln -sf ${WORKDIR}/cli .gopath/src/github.com/docker/cli
 
-	export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
 	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
-	cd -
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -109,10 +110,10 @@ do_compile() {
 	  ./hack/make.sh dynbinary
 
 	# build the proxy
-	go build -o ${S}/docker-proxy github.com/docker/libnetwork/cmd/proxy
+	go build -o ${S}/src/import/docker-proxy github.com/docker/libnetwork/cmd/proxy
 
         # build the cli
-	go build -o ${S}/bundles/latest/dynbinary-client/docker github.com/docker/cli/cmd/docker
+	go build -o ${S}/src/import/bundles/latest/dynbinary-client/docker github.com/docker/cli/cmd/docker
 }
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
@@ -126,15 +127,15 @@ INITSCRIPT_PARAMS_${PN} = "defaults"
 
 do_install() {
 	mkdir -p ${D}/${bindir}
-	cp ${S}/bundles/latest/dynbinary-client/docker ${D}/${bindir}/docker
-	cp ${S}/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
-	cp ${S}/docker-proxy ${D}/${bindir}/docker-proxy
+	cp ${S}/src/import/bundles/latest/dynbinary-client/docker ${D}/${bindir}/docker
+	cp ${S}/src/import/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
+	cp ${S}/src/import/docker-proxy ${D}/${bindir}/docker-proxy
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}${systemd_unitdir}/system
-		install -m 644 ${S}/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
+		install -m 644 ${S}/src/import/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
 		# replaces one copied from above with one that uses the local registry for a mirror
-		install -m 644 ${S}/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
+		install -m 644 ${S}/src/import/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
 	else
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
@@ -142,7 +143,7 @@ do_install() {
 
 	mkdir -p ${D}${datadir}/docker/
 	cp ${WORKDIR}/hi.Dockerfile ${D}${datadir}/docker/
-	install -m 0755 ${S}/contrib/check-config.sh ${D}${datadir}/docker/
+	install -m 0755 ${S}/src/import/contrib/check-config.sh ${D}${datadir}/docker/
 }
 
 inherit useradd
diff --git a/recipes-containers/docker/files/context-use-golang.org-x-net-pkg-until-we-move-to-go.patch b/recipes-containers/docker/files/context-use-golang.org-x-net-pkg-until-we-move-to-go.patch
index c43a7e7..7ed606f 100644
--- a/recipes-containers/docker/files/context-use-golang.org-x-net-pkg-until-we-move-to-go.patch
+++ b/recipes-containers/docker/files/context-use-golang.org-x-net-pkg-until-we-move-to-go.patch
@@ -18,8 +18,8 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  integration-cli/docker_cli_save_load_unix_test.go |    2 +-
  5 files changed, 5 insertions(+), 5 deletions(-)
 
---- a/client/README.md
-+++ b/client/README.md
+--- a/src/import/client/README.md
++++ b/src/import/client/README.md
 @@ -8,7 +8,7 @@ For example, to list running containers
  package main
  
@@ -29,8 +29,8 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  	"fmt"
  
  	"github.com/docker/docker/api/types"
---- a/client/client.go
-+++ b/client/client.go
+--- a/src/import/client/client.go
++++ b/src/import/client/client.go
 @@ -19,7 +19,7 @@ For example, to list running containers
  	package main
  
@@ -40,8 +40,8 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  		"fmt"
  
  		"github.com/docker/docker/api/types"
---- a/daemon/info_unix.go
-+++ b/daemon/info_unix.go
+--- a/src/import/daemon/info_unix.go
++++ b/src/import/daemon/info_unix.go
 @@ -3,7 +3,7 @@
  package daemon
  
@@ -51,8 +51,8 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  	"os/exec"
  	"strings"
  
---- a/integration-cli/docker_api_attach_test.go
-+++ b/integration-cli/docker_api_attach_test.go
+--- a/src/import/integration-cli/docker_api_attach_test.go
++++ b/src/import/integration-cli/docker_api_attach_test.go
 @@ -3,7 +3,7 @@ package main
  import (
  	"bufio"
@@ -62,8 +62,8 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  	"io"
  	"net"
  	"net/http"
---- a/integration-cli/docker_cli_save_load_unix_test.go
-+++ b/integration-cli/docker_cli_save_load_unix_test.go
+--- a/src/import/integration-cli/docker_cli_save_load_unix_test.go
++++ b/src/import/integration-cli/docker_cli_save_load_unix_test.go
 @@ -3,7 +3,7 @@
  package main
  
diff --git a/recipes-containers/oci-image-tools/files/0001-image-manifest-Recursively-remove-pre-existing-entri.patch b/recipes-containers/oci-image-tools/files/0001-image-manifest-Recursively-remove-pre-existing-entri.patch
index d2cacc2..5594f97 100644
--- a/recipes-containers/oci-image-tools/files/0001-image-manifest-Recursively-remove-pre-existing-entri.patch
+++ b/recipes-containers/oci-image-tools/files/0001-image-manifest-Recursively-remove-pre-existing-entri.patch
@@ -40,8 +40,8 @@ Signed-off-by: W. Trevor King <wking@tremily.us>
 
 diff --git a/image/manifest.go b/image/manifest.go
 index 8834c1e5f2f0..144bd4f62219 100644
---- a/image/manifest.go
-+++ b/image/manifest.go
+--- a/src/import/image/manifest.go
++++ b/src/import/image/manifest.go
 @@ -253,11 +253,27 @@ loop:
  			continue loop
  		}
diff --git a/recipes-containers/oci-image-tools/files/0002-image-manifest-Split-unpackLayerEntry-into-its-own-f.patch b/recipes-containers/oci-image-tools/files/0002-image-manifest-Split-unpackLayerEntry-into-its-own-f.patch
index 9cf513e..69bdcdb 100644
--- a/recipes-containers/oci-image-tools/files/0002-image-manifest-Split-unpackLayerEntry-into-its-own-f.patch
+++ b/recipes-containers/oci-image-tools/files/0002-image-manifest-Split-unpackLayerEntry-into-its-own-f.patch
@@ -18,8 +18,8 @@ Signed-off-by: W. Trevor King <wking@tremily.us>
 
 diff --git a/image/manifest.go b/image/manifest.go
 index 144bd4f62219..dfd5a83f70e4 100644
---- a/image/manifest.go
-+++ b/image/manifest.go
+--- a/src/import/image/manifest.go
++++ b/src/import/image/manifest.go
 @@ -218,116 +218,131 @@ loop:
  			return errors.Wrapf(err, "error advancing tar stream")
  		}
diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 393bd7b..37ac087 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -18,8 +18,7 @@ SRC_URI = "git://github.com/opencontainers/image-tools.git \
 
 SRCREV = "d0c8533b0a2c68344ff2c8aff03d7fc2dff3a108"
 PV = "0.1.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
+GO_IMPORT = "import"
 
 inherit goarch
 inherit go
@@ -38,11 +37,11 @@ do_compile() {
 	#
 	# We also need to link in the ipallocator directory as that is not under
 	# a src directory.
-	ln -sfn . "${S}/vendor/src"
-	mkdir -p "${S}/vendor/src/github.com/opencontainers/image-tools/"
-	ln -sfn "${S}/image" "${S}/vendor/src/github.com/opencontainers/image-tools/image"
-	ln -sfn "${S}/version" "${S}/vendor/src/github.com/opencontainers/image-tools/version"
-	export GOPATH="${S}/vendor"
+	ln -sfn . "${S}/src/import/vendor/src"
+	mkdir -p "${S}/src/import/vendor/src/github.com/opencontainers/image-tools/"
+	ln -sfn "${S}/src/import/image" "${S}/src/import/vendor/src/github.com/opencontainers/image-tools/image"
+	ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/opencontainers/image-tools/version"
+	export GOPATH="${S}/src/import/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -51,13 +50,14 @@ do_compile() {
 	export LDFLAGS=""
 	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	cd ${S}/src/import
 
 	oe_runmake tool
 }
 
 do_install() {
 	install -d ${D}/${sbindir}
-	install ${S}/oci-image-tool ${D}/${sbindir}/
+	install ${S}/src/import/oci-image-tool ${D}/${sbindir}/
 }
 
 INSANE_SKIP_${PN} += "ldflags"
diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
index d73edfe..0d9c6e6 100644
--- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
+++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
@@ -1,14 +1,13 @@
 HOMEPAGE = "https://github.com/opencontainers/runtime-tools"
 SUMMARY = "oci-runtime-tool is a collection of tools for working with the OCI runtime specification"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b355a61a394a504dacde901c958f662c"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=b355a61a394a504dacde901c958f662c"
 
 SRC_URI = "git://github.com/opencontainers/runtime-tools.git"
 
 SRCREV = "15ec1df3f6607f4223ab3915547c184cf60a30dd"
 PV = "0.0.1+git${SRCPV}"
-
-S = "${WORKDIR}/git"
+GO_IMPORT = "import"
 
 INSANE_SKIP_${PN} += "ldflags"
 
@@ -18,7 +17,7 @@ inherit go
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
 	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
-	export GOPATH="${S}:${S}/vendor"
+	export GOPATH="${S}/src/import:${S}/src/import/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -29,17 +28,18 @@ do_compile() {
 	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
 	# link fixups for compilation
-	rm -f ${S}/vendor/src
-	ln -sf ./ ${S}/vendor/src
-	mkdir -p ${S}/vendor/github.com/opencontainers/runtime-tools
-	ln -sf ../../../../generate ${S}/vendor/github.com/opencontainers/runtime-tools/generate
-	ln -sf ../../../../validate ${S}/vendor/github.com/opencontainers/runtime-tools/validate
-	ln -sf ../../../../cmd ${S}/vendor/github.com/opencontainers/runtime-tools/cmd
+	rm -f ${S}/src/import/vendor/src
+	ln -sf ./ ${S}/src/import/vendor/src
+	mkdir -p ${S}/src/import/vendor/github.com/opencontainers/runtime-tools
+	ln -sf ../../../../generate ${S}/src/import/vendor/github.com/opencontainers/runtime-tools/generate
+	ln -sf ../../../../validate ${S}/src/import/vendor/github.com/opencontainers/runtime-tools/validate
+	ln -sf ../../../../cmd ${S}/src/import/vendor/github.com/opencontainers/runtime-tools/cmd
+	cd ${S}/src/import
 
 	oe_runmake
 }
 
 do_install() {
 	install -d ${D}/${sbindir}
-	install ${S}/oci-runtime-tool ${D}/${sbindir}/oci-runtime-tool
+	install ${S}/src/import/oci-runtime-tool ${D}/${sbindir}/oci-runtime-tool
 }
diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
index ae6c5ec..9f7fe6b 100644
--- a/recipes-containers/riddler/riddler_git.bb
+++ b/recipes-containers/riddler/riddler_git.bb
@@ -1,11 +1,12 @@
 HOMEPAGE = "https://github.com/jfrazelle/riddler"
 SUMMARY = "Convert `docker inspect` to opencontainers (OCI compatible) runc spec."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
 
 SRC_URI = "git://github.com/jfrazelle/riddler;branch=master"
 SRCREV = "23befa0b232877b5b502b828e24161d801bd67f6"
 PV = "0.1.0+git${SRCPV}"
+GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
@@ -26,10 +27,10 @@ do_compile() {
 	#
 	# We also need to link in the ipallocator directory as that is not under
 	# a src directory.
-	ln -sfn . "${S}/vendor/src"
-	mkdir -p "${S}/vendor/src/github.com/jessfraz/riddler"
-	ln -sfn "${S}/parse" "${S}/vendor/src/github.com/jessfraz/riddler/parse"
-	export GOPATH="${S}/vendor"
+	ln -sfn . "${S}/src/import/vendor/src"
+	mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/riddler"
+	ln -sfn "${S}/src/import/parse" "${S}/src/import/vendor/src/github.com/jessfraz/riddler/parse"
+	export GOPATH="${S}/src/import/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -38,11 +39,12 @@ do_compile() {
 	export LDFLAGS=""
 	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	cd ${S}/src/import
 
 	oe_runmake static
 }
 
 do_install() {
 	install -d ${D}/${sbindir}
-	install ${S}/riddler ${D}/${sbindir}/riddler
+	install ${S}/src/import/riddler ${D}/${sbindir}/riddler
 }
diff --git a/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch b/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch
index bc1e9a2..bcc76fc 100644
--- a/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch
+++ b/recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch
@@ -14,8 +14,8 @@ Signed-off-by: Justin Cormack <justin.cormack@docker.com>
 
 diff --git a/vendor.conf b/vendor.conf
 index e23e7ea7..09a8a924 100644
---- a/vendor.conf
-+++ b/vendor.conf
+--- a/src/import/vendor.conf
++++ b/src/import/vendor.conf
 @@ -1,7 +1,7 @@
  # OCI runtime-spec. When updating this, make sure you use a version tag rather
  # than a commit ID so it's much more obvious what version of the spec we are
@@ -27,8 +27,8 @@ index e23e7ea7..09a8a924 100644
  github.com/opencontainers/selinux v1.0.0-rc1
 diff --git a/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go b/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
 index 8bf8d924..68ab112e 100644
---- a/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
-+++ b/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
+--- a/src/import/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
++++ b/src/import/vendor/github.com/opencontainers/runtime-spec/specs-go/config.go
 @@ -6,8 +6,6 @@ import "os"
  type Spec struct {
  	// Version of the Open Container Runtime Specification with which the bundle complies.
diff --git a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
index f49adfb..48c1250 100644
--- a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
+++ b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
@@ -14,8 +14,8 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
 diff --git a/utils_linux.go b/utils_linux.go
 index 8085f7fe..e6d31b35 100644
---- a/utils_linux.go
-+++ b/utils_linux.go
+--- a/src/import/utils_linux.go
++++ b/src/import/utils_linux.go
 @@ -227,6 +227,11 @@ type runner struct {
  }
  
diff --git a/recipes-containers/runc/runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch b/recipes-containers/runc/runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch
index 6ec286a..7970dec 100644
--- a/recipes-containers/runc/runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch
+++ b/recipes-containers/runc/runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch
@@ -13,8 +13,8 @@ Signed-off-by: Justin Cormack <justin.cormack@docker.com>
 
 diff --git a/libcontainer/specconv/example.go b/libcontainer/specconv/example.go
 index 33134116..d6621194 100644
---- a/libcontainer/specconv/example.go
-+++ b/libcontainer/specconv/example.go
+--- a/src/import/libcontainer/specconv/example.go
++++ b/src/import/libcontainer/specconv/example.go
 @@ -2,7 +2,6 @@ package specconv
  
  import (
@@ -36,8 +36,8 @@ index 33134116..d6621194 100644
  			Readonly: true,
 diff --git a/spec.go b/spec.go
 index 92d38f57..876937d2 100644
---- a/spec.go
-+++ b/spec.go
+--- a/src/import/spec.go
++++ b/src/import/spec.go
 @@ -7,7 +7,6 @@ import (
  	"fmt"
  	"io/ioutil"
diff --git a/recipes-containers/runc/runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch b/recipes-containers/runc/runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch
index 9cb3492..50a9b7f 100644
--- a/recipes-containers/runc/runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch
+++ b/recipes-containers/runc/runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch
@@ -20,8 +20,8 @@ Signed-off-by: Justin Cormack <justin.cormack@docker.com>
 
 diff --git a/libcontainer/cgroups/fs/memory.go b/libcontainer/cgroups/fs/memory.go
 index da2cc9f8..b739c631 100644
---- a/libcontainer/cgroups/fs/memory.go
-+++ b/libcontainer/cgroups/fs/memory.go
+--- a/src/import/libcontainer/cgroups/fs/memory.go
++++ b/src/import/libcontainer/cgroups/fs/memory.go
 @@ -73,14 +73,14 @@ func EnableKernelMemoryAccounting(path string) error {
  	// until a limit is set on the cgroup and limit cannot be set once the
  	// cgroup has children, or if there are already tasks in the cgroup.
@@ -123,8 +123,8 @@ index da2cc9f8..b739c631 100644
  	}
 diff --git a/libcontainer/configs/cgroup_linux.go b/libcontainer/configs/cgroup_linux.go
 index 3e0509de..e15a662f 100644
---- a/libcontainer/configs/cgroup_linux.go
-+++ b/libcontainer/configs/cgroup_linux.go
+--- a/src/import/libcontainer/configs/cgroup_linux.go
++++ b/src/import/libcontainer/configs/cgroup_linux.go
 @@ -43,19 +43,19 @@ type Resources struct {
  	Devices []*Device `json:"devices"`
  
@@ -152,8 +152,8 @@ index 3e0509de..e15a662f 100644
  	CpuShares uint64 `json:"cpu_shares"`
 diff --git a/update.go b/update.go
 index 0ea90d60..133be999 100644
---- a/update.go
-+++ b/update.go
+--- a/src/import/update.go
++++ b/src/import/update.go
 @@ -124,11 +124,11 @@ other options are ignored.
  
  		r := specs.LinuxResources{
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index f412c84..9735325 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
            file://0001-runc-Add-console-socket-dev-null.patch \
           "
 
+GO_IMPORT = "import"
+
 RUNC_VERSION = "1.0.0-rc3"
 PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index dbc83c2..83d5f86 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -4,7 +4,7 @@ DESCRIPTION = "runc is a CLI tool for spawning and running containers according
 
 # Apache-2.0 for containerd
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
 S = "${WORKDIR}/git"
 
@@ -26,20 +26,19 @@ do_compile() {
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
 	# use dependencies packaged independently.
-	cd ${S}
+	cd ${S}/src/import
 	rm -rf .gopath
 	dname=`dirname "${LIBCONTAINER_PACKAGE}"`
 	bname=`basename "${LIBCONTAINER_PACKAGE}"`
 	mkdir -p .gopath/src/${dname}
 
 	(cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname})
-	export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
 	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
-	cd -
 
 	# Fix up symlink for go-cross compiler
-	rm -f ${S}/vendor/src
-	ln -sf ./ ${S}/vendor/src
+	rm -f ${S}/src/import/vendor/src
+	ln -sf ./ ${S}/src/import/vendor/src
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -55,7 +54,7 @@ do_compile() {
 do_install() {
 	mkdir -p ${D}/${bindir}
 
-	cp ${S}/runc ${D}/${bindir}/runc
+	cp ${S}/src/import/runc ${D}/${bindir}/runc
 	ln -sf runc ${D}/${bindir}/docker-runc
 }
 
diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index 641d55f..8e771f5 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -1,11 +1,12 @@
 HOMEPAGE = "https://github.com/jfrazelle/netns"
 SUMMARY = "Runc hook for setting up default bridge networking."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
+LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
 
 SRC_URI = "git://github.com/jessfraz/netns;branch=master"
 SRCREV = "85b1ab9fcccbaa404a2636b52a48bbde02437cf7"
 PV = "0.1.0+git${SRCPV}"
+GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
@@ -22,10 +23,10 @@ do_compile() {
 	#
 	# We also need to link in the ipallocator directory as that is not under
 	# a src directory.
-	ln -sfn . "${S}/vendor/src"
-	mkdir -p "${S}/vendor/src/github.com/jessfraz/netns"
-	ln -sfn "${S}/ipallocator" "${S}/vendor/src/github.com/jessfraz/netns/ipallocator"
-	export GOPATH="${S}/vendor"
+	ln -sfn . "${S}/src/import/vendor/src"
+	mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/netns"
+	ln -sfn "${S}/src/import/ipallocator" "${S}/src/import/vendor/src/github.com/jessfraz/netns/ipallocator"
+	export GOPATH="${S}/src/import/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -35,10 +36,11 @@ do_compile() {
 	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
+	cd ${S}/src/import
 	oe_runmake static
 }
 
 do_install() {
 	install -d ${D}/${sbindir}
-	install ${S}/netns ${D}/${sbindir}/netns
+	install ${S}/src/import/netns ${D}/${sbindir}/netns
 }
-- 
2.11.0


