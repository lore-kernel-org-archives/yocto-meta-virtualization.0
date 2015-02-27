Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C549E00404; Fri, 27 Feb 2015 13:40:45 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30B88E00321
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Feb 2015 13:40:44 -0800 (PST)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1RLehik021606
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Feb 2015 13:40:43 -0800 (PST)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>) id 1YRSe9-0000am-38
	for meta-virtualization@yoctoproject.org;
	Fri, 27 Feb 2015 16:40:33 -0500
Date: Fri, 27 Feb 2015 16:40:33 -0500
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150227214033.GA2255@windriver.com>
References: <20150227214013.GA2160@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20150227214013.GA2160@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH 1/5] Add golang-cross
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: amy.fong@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 21:40:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From a3a4b6a7595215b69f6e7f30cd010ab19b1ab54c Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Fri, 27 Feb 2015 15:58:44 -0500
Subject: [PATCH 1/5] Add golang-cross

This package is derived from meta-golang:
https://github.com/digitallumens/meta-golang.git
commit 3fa6c8af6b4762de2f4e6740e327a5a71c29e6e1

In the meta-golang version, golang depends on a gcc-cross that causes
conflicts with our toolchain. So the golang-cross recipe was extracted
and then the following changes were made to work in wrlinux:

- our TARGET_ARCH is x86-64, golang-cross wants amd64

- in the former recipe, compile fails because it can't find header files
  and libraries because --sysroot is dropped. So I redefined the target
  cc and target cxx as cc and cxx at the start of the compile rule since
  cc gets redefined in there somewhere.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-devtools/go/golang-1.3.inc      |  4 +++
 recipes-devtools/go/golang-cross.inc    | 56 +++++++++++++++++++++++++++++++++
 recipes-devtools/go/golang-cross_1.3.bb |  3 ++
 3 files changed, 63 insertions(+)
 create mode 100644 recipes-devtools/go/golang-1.3.inc
 create mode 100644 recipes-devtools/go/golang-cross.inc
 create mode 100644 recipes-devtools/go/golang-cross_1.3.bb

diff --git a/recipes-devtools/go/golang-1.3.inc b/recipes-devtools/go/golang-1.3.inc
new file mode 100644
index 0000000..5c507b4
--- /dev/null
+++ b/recipes-devtools/go/golang-1.3.inc
@@ -0,0 +1,4 @@
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
+SRC_URI[md5sum] = "4b66d7249554181c314f139ea78920b1"
+SRC_URI[sha256sum] = "eb983e6c5b2b9838f482c5442b1ac1856f610f2b21f3c123b3fedb48ffc35382"
diff --git a/recipes-devtools/go/golang-cross.inc b/recipes-devtools/go/golang-cross.inc
new file mode 100644
index 0000000..9330572
--- /dev/null
+++ b/recipes-devtools/go/golang-cross.inc
@@ -0,0 +1,56 @@
+DESCRIPTION = "Go Programming Language Cross Compiler."
+HOMEPAGE = "golang.org"
+# DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc"
+DEPENDS = "libgcc"
+PROVIDES = "virtual/${TARGET_PREFIX}golang"
+SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz"
+S="${WORKDIR}/go"
+
+do_compile () {
+	export CC_FOR_TARGET="${CC}"
+	export CXX_FOR_TARGET="${CXX}"
+	# the above should set the right sysroot option, else...:
+	# export CGO_CFLAGS="--sysroot=${STAGING_DIR_HOST}"
+	# export CGO_LDFLAGS="--sysroot=${STAGING_DIR_HOST}"
+
+	export CC="${BUILD_CC}"
+	export GOROOT_FINAL="${libdir}/go"
+	export GOARCH="${TARGET_ARCH}"
+
+	# supported amd64, 386, arm
+	if [ "${TARGET_ARCH}" = "x86_64" ]; then
+		export GOARCH="amd64"
+	fi
+
+	if [ "${TARGET_ARCH}" = "arm" ]
+	then
+		if [ `echo ${TUNE_PKGARCH} | cut -c 1-7` = "cortexa" ]
+		then
+			echo GOARM 7
+			export GOARM="7"
+		fi
+	fi
+	export GOOS="linux"
+	export GO_GCFLAGS=""
+	export GO_LDFLAGS=""
+	export GO_CCFLAGS=""
+	export CGO_ENABLED="1"
+	#export CC_FOR_TARGET="${TARGET_SYS}-gcc"
+	#export CXX_FOR_TARGET="${TARGET_SYS}-g++"
+	echo GOARCH ${GOARCH}
+	echo CC_FOR_TARGET ${CC_FOR_TARGET}
+
+	cd src
+	sh -x ./make.bash
+}
+
+do_install () {
+	# Install the executables into build system
+	mkdir -p ${D}${bindir}
+	cp -a bin/go ${D}${bindir}/
+	mkdir -p ${D}${libdir}/go
+	cp -a pkg ${D}${libdir}/go/
+	cp -a include ${D}${libdir}/go/
+	cp -a api ${D}${libdir}/go/
+	cp -a src ${D}${libdir}/go/
+}
diff --git a/recipes-devtools/go/golang-cross_1.3.bb b/recipes-devtools/go/golang-cross_1.3.bb
new file mode 100644
index 0000000..8813298
--- /dev/null
+++ b/recipes-devtools/go/golang-cross_1.3.bb
@@ -0,0 +1,3 @@
+inherit cross
+require golang-cross.inc
+require golang-${PV}.inc
-- 
2.1.4


