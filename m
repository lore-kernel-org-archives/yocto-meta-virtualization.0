Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 028BBE00C44; Mon, 17 Jul 2017 13:05:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DBEEE00C49
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:21 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6HK4Lgh001712
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:21 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:20 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:08 -0400
Message-ID: <1500321853-984-8-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
In-Reply-To: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
References: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] oci-runtime-tools, oci-runtime-spec: Uprev to runc 1.0-rc3 versions
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
X-List-Received-Date: Mon, 17 Jul 2017 20:05:08 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

The config.json has elements which have changed in the latest runc.
These changes are not backward compatible with older versions of runc.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb  |  6 +++---
 .../oci-runtime-tools/oci-runtime-tools_git.bb               | 12 ++++++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
index 82f852f97583..deba7b3e19f3 100644
--- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
+++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
@@ -9,8 +9,8 @@ SRCNAME = "runtime-spec"
 PKG_NAME = "github.com/opencontainers/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME}"
 
-SRCREV = "4af0c72f92aacf1b43618d7986197d8209fadf0b"
-PV = "v1.0.0-rc4+git${SRCPV}"
+SRCREV = "a39b1cd4fdf7743ab721cc9da58abbee2f8624d1"
+PV = "v1.0.0-rc6+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -38,4 +38,4 @@ runtime_spec_file_sysroot_preprocess () {
 
 FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
 
-CLEANBROKEN = "1"
\ No newline at end of file
+CLEANBROKEN = "1"
diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
index 4f77dced2ad5..a3f8e6656854 100644
--- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
+++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b355a61a394a504dacde901c958f662c"
 
 SRC_URI = "git://github.com/opencontainers/runtime-tools.git"
 
-SRCREV = "038b0c99b82f3c08de31f6b09e693eb24644affd"
+SRCREV = "15ec1df3f6607f4223ab3915547c184cf60a30dd"
 PV = "0.0.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
@@ -16,7 +16,7 @@ inherit go
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
 	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
-	export GOPATH="${S}"
+	export GOPATH="${S}:${S}/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
@@ -26,6 +26,14 @@ do_compile() {
 	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
+	# link fixups for compilation
+	rm -f ${S}/vendor/src
+	ln -sf ./ ${S}/vendor/src
+	mkdir -p ${S}/vendor/github.com/opencontainers/runtime-tools
+	ln -sf ../../../../generate ${S}/vendor/github.com/opencontainers/runtime-tools/generate
+	ln -sf ../../../../validate ${S}/vendor/github.com/opencontainers/runtime-tools/validate
+	ln -sf ../../../../cmd ${S}/vendor/github.com/opencontainers/runtime-tools/cmd
+
 	oe_runmake
 }
 
-- 
2.4.0.53.g8440f74


