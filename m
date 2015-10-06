Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DC8EE00F22; Tue,  6 Oct 2015 11:34:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49682E00B3D
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Oct 2015 11:34:23 -0700 (PDT)
Received: from yow-dellw-af.wrs.com (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTP id t96IYJLa016263;
	Tue, 6 Oct 2015 11:34:22 -0700 (PDT)
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  6 Oct 2015 14:34:07 -0400
Message-Id: <1444156449-19847-6-git-send-email-amy.fong@windriver.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
References: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
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
X-List-Received-Date: Tue, 06 Oct 2015 18:34:27 -0000

Since we need go 1.3 to co-exist with later versions (ie 1.4),
package go-cross_1.3 as go-cross-1.3_1.3.

go 1.3 will be installed to a different path than go-cross, this requires
go packages needing go 1.3 to set its PATH to:
        export PATH=${STAGING_BINDIR_NATIVE}/${HOST_SYS}/go-1.3:$PATH

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/docker/docker_git.bb                       |  4 +++-
 .../go-cross/{go-cross_1.3.bb => go-cross-1.3_1.3.bb}         | 11 ++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)
 rename recipes-devtools/go-cross/{go-cross_1.3.bb => go-cross-1.3_1.3.bb} (88%)

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
diff --git a/recipes-devtools/go-cross/go-cross_1.3.bb b/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
similarity index 88%
rename from recipes-devtools/go-cross/go-cross_1.3.bb
rename to recipes-devtools/go-cross/go-cross-1.3_1.3.bb
index 1fb4870..775e28f 100644
--- a/recipes-devtools/go-cross/go-cross_1.3.bb
+++ b/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
@@ -25,7 +25,7 @@ SRC_URI += "\
 
 do_compile() {
 	## Setting `$GOBIN` doesn't do any good, looks like it ends up copying binaries there.
-	export GOROOT_FINAL="${SYSROOT}${libdir}/go"
+	export GOROOT_FINAL="${SYSROOT}${libdir}/go-1.3"
 
 	export GOHOSTOS="linux"
 	export GOOS="linux"
@@ -61,11 +61,12 @@ do_compile() {
 do_install() {
 	## It should be okay to ignore `${WORKDIR}/go/bin/linux_arm`...
 	## Also `gofmt` is not needed right now.
-	install -d "${D}${bindir}"
-	install -m 0755 "${WORKDIR}/go/bin/go" "${D}${bindir}"
-	install -d "${D}${libdir}/go"
+	install -d "${D}${bindir}/go-1.3"
+	install -m 0755 "${WORKDIR}/go/bin/go" "${D}${bindir}/go-1.3/"
+	install -d "${D}${libdir}/go-1.3"
+
 	## TODO: use `install` instead of `cp`
 	for dir in include lib pkg src test
-	do cp -a "${WORKDIR}/go/${dir}" "${D}${libdir}/go/"
+	do cp -a "${WORKDIR}/go/${dir}" "${D}${libdir}/go-1.3/"
 	done
 }
-- 
2.5.3


