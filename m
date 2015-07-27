Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 018AEE009B8; Mon, 27 Jul 2015 11:14:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FA96E009B8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jul 2015 11:14:38 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6RIEaDP029107
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 27 Jul 2015 11:14:37 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.85)
	(envelope-from <amy.fong@windriver.com>)
	id 1ZJmum-0006Po-AQ; Mon, 27 Jul 2015 14:14:16 -0400
Date: Mon, 27 Jul 2015 14:14:16 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org, amy.fong@windriver.com
Message-ID: <20150727181416.GA24617@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] golang: use oe-meta-go
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
X-List-Received-Date: Mon, 27 Jul 2015 18:14:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From b101a0c7ce6ef1eb41bef786831e58fa4d1b069f Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Mon, 27 Jul 2015 14:10:20 -0400
Subject: [PATCH] golang: use oe-meta-go

Update meta-virtualization to use go package from oe-meta-go.
The package golang-cross is go-cross in the oe-meta-go.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 README                                          |   1 +
 recipes-containers/docker/docker_git.bb         |   2 +-
 recipes-devtools/go/files/bsd_svid_source.patch |  37 ------
 recipes-devtools/go/files/ccache.patch          | 147 ------------------------
 recipes-devtools/go/golang-1.3.inc              |   4 -
 recipes-devtools/go/golang-cross.inc            |  61 ----------
 recipes-devtools/go/golang-cross_1.3.bb         |   4 -
 7 files changed, 2 insertions(+), 254 deletions(-)
 delete mode 100644 recipes-devtools/go/files/bsd_svid_source.patch
 delete mode 100644 recipes-devtools/go/files/ccache.patch
 delete mode 100644 recipes-devtools/go/golang-1.3.inc
 delete mode 100644 recipes-devtools/go/golang-cross.inc
 delete mode 100644 recipes-devtools/go/golang-cross_1.3.bb

diff --git a/README b/README
index ae5406d..beb3760 100644
--- a/README
+++ b/README
@@ -20,6 +20,7 @@ layers: meta-oe
 	meta-networking
         meta-filesystems
         meta-python
+        oe-meta-go
 
 BBFILE_PRIORITY_openembedded-layer = "4"
 
diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index ab32235..aa125a3 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -36,7 +36,7 @@ S = "${WORKDIR}/git"
 DOCKER_VERSION = "1.6.2"
 PV = "${DOCKER_VERSION}+git${SRCREV}"
 
-DEPENDS = "golang-cross \
+DEPENDS = "go-cross \
     go-cli \
     go-pty \
     go-context \
diff --git a/recipes-devtools/go/files/bsd_svid_source.patch b/recipes-devtools/go/files/bsd_svid_source.patch
deleted file mode 100644
index 21e1d4c..0000000
--- a/recipes-devtools/go/files/bsd_svid_source.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-golang-cross: do_compile fails cc1: all warnings being treated as errors
-
-glibc 2.20 deprecates _BSD_SOURCE and _SVID_SOURCE and emits an error
-message.  From patch 16632:
-	libc [PATCH] BZ #16632: Disable _SVID_SOURCE/_BSD_SOURCE warning
-	if _DEFAULT_SOURCE is defined
-
-Since we also need to support glibc before 2.20, from the release notes
-for glibc 2.20, the recommended fix is to define _DEFAULT_SOURCE
-
-(fixed upstream)
-https://groups.google.com/forum/#!topic/golang-codereviews/S4TARFCxu2k
-
-Signed-off-by: Amy Fong <amy.fong@windriver.com>
----
- include/u.h |   10 ++++++++++
- 1 file changed, 10 insertions(+)
-
---- a/include/u.h
-+++ b/include/u.h
-@@ -38,6 +38,16 @@
- #		define __MAKECONTEXT_V2_SOURCE 1
- #	endif
- #endif
-+/**
-+ * in glibc >= 2.20, _BSD_SOURCE and _SVID_SOURCE causes warning
-+ * messages if _DEFAULT_SOURCE is not defined.
-+ *
-+ * From glibc 2.20 release notes, since this application needs _BSD_SOURCE
-+ * and/or _SVID_SOURCE and we must support glibc < 2.19 and
-+ * glibc >= 2.20, then define all 3 (_DEFAULT_SOURCE, _BSD_SOURCE,
-+ * and _SVID_SOURCE) unconditionally
-+ */
-+#define _DEFAULT_SOURCE 1
- #define _BSD_SOURCE 1
- #define _NETBSD_SOURCE 1	/* NetBSD */
- #define _SVID_SOURCE 1
diff --git a/recipes-devtools/go/files/ccache.patch b/recipes-devtools/go/files/ccache.patch
deleted file mode 100644
index b7a64bf..0000000
--- a/recipes-devtools/go/files/ccache.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-golang doesn't work with ccache. In the current state, a lot of parsing
-happens where it'll grab the first string in CC or LD and uses that for
-its builds. When ccache is enabled, it results in trying to do builds
-with just ccache. 
-
-The brokeness is seen when building with apps that uses cgo, like docker.
-To enable ccache to work, some string comparisons and changes to parsing
-had to be made.
-
-Signed-off-by: Amy Fong <amy.fong@windriver.com>
-
-Index: go/src/cmd/cgo/gcc.go
-===================================================================
---- go.orig/src/cmd/cgo/gcc.go	2014-06-18 17:26:26.000000000 -0700
-+++ go/src/cmd/cgo/gcc.go	2015-06-18 13:19:08.908877160 -0700
-@@ -712,6 +712,12 @@
- func (p *Package) gccBaseCmd() []string {
- 	// Use $CC if set, since that's what the build uses.
- 	if ret := strings.Fields(os.Getenv("CC")); len(ret) > 0 {
-+		if strings.Contains(ret[0], "ccache") {
-+			base_cc := ret[0] + " " + ret[1]
-+			os.Setenv("CCACHE_CC", ret[1])
-+			ret[1] = base_cc
-+			return ret[1:]
-+		}
- 		return ret
- 	}
- 	// Try $GCC if set, since that's what we used to use.
-Index: go/src/pkg/os/exec/lp_unix.go
-===================================================================
---- go.orig/src/pkg/os/exec/lp_unix.go	2014-06-18 17:26:25.000000000 -0700
-+++ go/src/pkg/os/exec/lp_unix.go	2015-06-18 13:19:29.464876331 -0700
-@@ -35,8 +35,14 @@
- 	// (only bypass the path if file begins with / or ./ or ../)
- 	// but that would not match all the Unix shells.
- 
--	if strings.Contains(file, "/") {
--		err := findExecutable(file)
-+	tmp := file
-+	if strings.Contains(file, " ") {
-+		exec_part := strings.Split(file, " ")[0]
-+		tmp = exec_part
-+	}
-+
-+	if strings.Contains(tmp, "/") {
-+		err := findExecutable(tmp)
- 		if err == nil {
- 			return file, nil
- 		}
-@@ -51,7 +57,7 @@
- 			// Unix shell semantics: path element "" means "."
- 			dir = "."
- 		}
--		path := dir + "/" + file
-+		path := dir + "/" + tmp
- 		if err := findExecutable(path); err == nil {
- 			return path, nil
- 		}
-Index: go/src/cmd/go/build.go
-===================================================================
---- go.orig/src/cmd/go/build.go	2014-06-18 17:26:26.000000000 -0700
-+++ go/src/cmd/go/build.go	2015-06-18 13:20:08.724874749 -0700
-@@ -2005,8 +2005,15 @@
- 	// strings returned are "gcc", "-I", objdir (and cuts them off).
- 
- 	compiler := envList(envvar, defcmd)
--	a := []string{compiler[0], "-I", objdir}
--	a = append(a, compiler[1:]...)
-+
-+	a := []string{compiler[0]}
-+	if strings.Contains(compiler[0], "ccache") {
-+		a = append(a, compiler[1], "-I", objdir)
-+		a = append(a, compiler[2:]...)
-+	} else {
-+		a = append(a, "-I", objdir)
-+		a = append(a, compiler[1:]...)
-+	}
- 
- 	// Definitely want -fPIC but on Windows gcc complains
- 	// "-fPIC ignored for target (all code is position independent)"
-Index: go/src/cmd/ld/lib.c
-===================================================================
---- go.orig/src/cmd/ld/lib.c	2014-06-18 17:26:27.000000000 -0700
-+++ go/src/cmd/ld/lib.c	2015-06-18 13:18:39.564878343 -0700
-@@ -552,7 +552,7 @@
- void
- hostlink(void)
- {
--	char *p, **argv;
-+	char *p, *q, **argv;
- 	int c, i, w, n, argc, len;
- 	Hostobj *h;
- 	Biobuf *f;
-@@ -577,6 +577,19 @@
- 	if(extld == nil)
- 		extld = "gcc";
- 	argv[argc++] = extld;
-+
-+	p = extldflags;
-+	if (strstr(argv[0], "ccache") != NULL) {
-+		while(p != nil) {
-+			while(*p == ' ')
-+				*p++ = '\0';
-+			if(*p == '\0')
-+				break;
-+			argv[argc++] = p;
-+			p = strchr(p + 1, ' ');
-+			break;
-+		}
-+	}
- 	switch(thechar){
- 	case '8':
- 		argv[argc++] = "-m32";
-@@ -629,12 +642,12 @@
- 			errorexit();
- 		}
- 		Bseek(f, h->off, 0);
--		p = smprint("%s/%06d.o", tmpdir, i);
--		argv[argc++] = p;
--		w = create(p, 1, 0775);
-+		q = smprint("%s/%06d.o", tmpdir, i);
-+		argv[argc++] = q;
-+		w = create(q, 1, 0775);
- 		if(w < 0) {
- 			ctxt->cursym = S;
--			diag("cannot create %s: %r", p);
-+			diag("cannot create %s: %r", q);
- 			errorexit();
- 		}
- 		len = h->len;
-@@ -646,7 +659,7 @@
- 		}
- 		if(close(w) < 0) {
- 			ctxt->cursym = S;
--			diag("cannot write %s: %r", p);
-+			diag("cannot write %s: %r", q);
- 			errorexit();
- 		}
- 		Bterm(f);
-@@ -656,7 +669,6 @@
- 	for(i=0; i<nldflag; i++)
- 		argv[argc++] = ldflag[i];
- 
--	p = extldflags;
- 	while(p != nil) {
- 		while(*p == ' ')
- 			*p++ = '\0';
diff --git a/recipes-devtools/go/golang-1.3.inc b/recipes-devtools/go/golang-1.3.inc
deleted file mode 100644
index 5c507b4..0000000
--- a/recipes-devtools/go/golang-1.3.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
-SRC_URI[md5sum] = "4b66d7249554181c314f139ea78920b1"
-SRC_URI[sha256sum] = "eb983e6c5b2b9838f482c5442b1ac1856f610f2b21f3c123b3fedb48ffc35382"
diff --git a/recipes-devtools/go/golang-cross.inc b/recipes-devtools/go/golang-cross.inc
deleted file mode 100644
index be2c1eb..0000000
--- a/recipes-devtools/go/golang-cross.inc
+++ /dev/null
@@ -1,61 +0,0 @@
-DESCRIPTION = "Go Programming Language Cross Compiler."
-HOMEPAGE = "golang.org"
-# DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc"
-DEPENDS = "libgcc"
-PROVIDES = "virtual/${TARGET_PREFIX}golang"
-SRC_URI = "\
-	http://golang.org/dl/go${PV}.src.tar.gz \
-	file://bsd_svid_source.patch \
-	file://ccache.patch \
-	"
-
-S="${WORKDIR}/go"
-
-do_compile () {
-	export CC_FOR_TARGET="${CC}"
-	export CXX_FOR_TARGET="${CXX}"
-	# the above should set the right sysroot option, else...:
-	# export CGO_CFLAGS="--sysroot=${STAGING_DIR_HOST}"
-	# export CGO_LDFLAGS="--sysroot=${STAGING_DIR_HOST}"
-
-	export CC="${BUILD_CC}"
-	export GOROOT_FINAL="${libdir}/go"
-	export GOARCH="${TARGET_ARCH}"
-
-	# supported amd64, 386, arm
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		export GOARCH="amd64"
-	fi
-
-	if [ "${TARGET_ARCH}" = "arm" ]
-	then
-		if [ `echo ${TUNE_PKGARCH} | cut -c 1-7` = "cortexa" ]
-		then
-			echo GOARM 7
-			export GOARM="7"
-		fi
-	fi
-	export GOOS="linux"
-	export GO_GCFLAGS=""
-	export GO_LDFLAGS=""
-	export GO_CCFLAGS=""
-	export CGO_ENABLED="1"
-	#export CC_FOR_TARGET="${TARGET_SYS}-gcc"
-	#export CXX_FOR_TARGET="${TARGET_SYS}-g++"
-	echo GOARCH ${GOARCH}
-	echo CC_FOR_TARGET ${CC_FOR_TARGET}
-
-	cd src
-	sh -x ./make.bash
-}
-
-do_install () {
-	# Install the executables into build system
-	mkdir -p ${D}${bindir}
-	cp -a bin/go ${D}${bindir}/
-	mkdir -p ${D}${libdir}/go
-	cp -a pkg ${D}${libdir}/go/
-	cp -a include ${D}${libdir}/go/
-	cp -a api ${D}${libdir}/go/
-	cp -a src ${D}${libdir}/go/
-}
diff --git a/recipes-devtools/go/golang-cross_1.3.bb b/recipes-devtools/go/golang-cross_1.3.bb
deleted file mode 100644
index fcb0e7a..0000000
--- a/recipes-devtools/go/golang-cross_1.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit cross
-
-require golang-cross.inc
-require golang-${PV}.inc
-- 
2.1.4


