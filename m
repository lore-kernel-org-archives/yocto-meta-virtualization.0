Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63C4AE00AD5; Thu, 11 Apr 2019 19:20:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78F55E00AA9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2019 19:20:34 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3C2KWRF019688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Apr 2019 19:20:33 -0700 (PDT)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 11 Apr 2019 19:20:32 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 11 Apr 2019 22:20:04 -0400
Message-ID: <1555035605-5127-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] cri-o: fixup build
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
X-List-Received-Date: Fri, 12 Apr 2019 02:20:36 -0000
Content-Type: text/plain

After oe-core commits

5f48939e2640 [goarch.bbclass: use MACHINEOVERRIDES and simplify go_map_arm()]
6300c4a83f7c [go.bbclass:Export more GO* environment variables]

we see a build failure with cri-o:
  | go build runtime/cgo: attempting to install package runtime/cgo into read-only GOROOT
  | Makefile:112: recipe for target 'conmon/config.h' failed
  | make: *** [conmon/config.h] Error 1

to avoid this we should not overwrite the GO* environment being setup
by the go.bbclass, so we drop most of our GO* exports here.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 2af3c12..cac5536 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -53,18 +53,8 @@ inherit pkgconfig
 EXTRA_OEMAKE="BUILDTAGS=''"
 
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	export GOPATH="${S}/src/import:${S}/src/import/vendor"
 
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
@@ -82,15 +72,6 @@ do_compile() {
 	ln -sf ../../../../version ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/version
 	ln -sf ../../../../lib ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/lib
 
-	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
-	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
-
-	# Pass the needed cflags/ldflags so that cgo
-	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-
 	cd ${S}/src/import
 
 	oe_runmake binaries
-- 
2.7.4


