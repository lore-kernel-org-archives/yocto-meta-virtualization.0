Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72457E00D63; Sun,  4 Aug 2019 23:02:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 388CFE007AA
	for <meta-virtualization@yoctoproject.org>;
	Sun,  4 Aug 2019 23:02:17 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7561pd3028333
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 4 Aug 2019 23:02:07 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 4 Aug 2019 23:01:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 5 Aug 2019 14:01:40 +0800
Message-ID: <20190805060143.24108-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/4] kubernetes: clean up environment settings in do_compile
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
X-List-Received-Date: Mon, 05 Aug 2019 06:02:19 -0000
Content-Type: text/plain

There are unnessary and incorrect settings like GOOS and GOROOT.
There are also redundant settings like GOPATH, CGO_CFLAGS, etc,
whose latter setting will cover the previous one.

So clean all these up.

Also, remove the comment which suggests settings GOVERSION to "1.10%",
as it's no longer valid for current OE.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../kubernetes/kubernetes_git.bb              | 36 +++++++------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 5b4c3a9..0aa7c00 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,8 +5,6 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-# Note: 1.11+ requires go 1.10.2+, so the following must be set
-#       in your configuration: GOVERSION = "1.10%"
 PV = "v1.16.0-alpha+git${SRCREV_kubernetes}"
 SRCREV_kubernetes = "7054e3ead7e1a00ca6ac3ec47ea355b76061a35a"
 
@@ -31,39 +29,29 @@ inherit goarch
 COMPATIBLE_HOST = '(x86_64.*|arm.*|aarch64.*)-linux'
 
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
-	export GOOS="${TARGET_GOOS}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
-	export GOPATH="${S}/src/import:${S}/src/import/vendor"
-
-	# Pass the needed cflags/ldflags so that cgo
-	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
-	export CFLAGS=""
-	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-
 	# link fixups for compilation
 	rm -f ${S}/src/import/vendor/src
 	ln -sf ./ ${S}/src/import/vendor/src
 
 	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
-	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
-
-	# Pass the needed cflags/ldflags so that cgo
-	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-
 	cd ${S}/src/import
+
 	# Build the host tools first, using the host compiler
 	export GOARCH="${BUILD_GOARCH}"
+	# Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
+	export CGO_ENABLED="1"
+	export CFLAGS=""
+	export LDFLAGS=""
+	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	make generated_files KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
 
-	# Reset GOARCH to the target one
+	# Build the target binaries
 	export GOARCH="${TARGET_GOARCH}"
+	# Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
+	export CGO_ENABLED="1"
+	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	# to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
 	make cross KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH}
 }
-- 
2.17.1


