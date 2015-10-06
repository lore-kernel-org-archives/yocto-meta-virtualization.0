Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EB4FE00CA1; Tue,  6 Oct 2015 11:34:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 163F2E00ACD
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Oct 2015 11:34:22 -0700 (PDT)
Received: from yow-dellw-af.wrs.com (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTP id t96IYJLW016263;
	Tue, 6 Oct 2015 11:34:20 -0700 (PDT)
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  6 Oct 2015 14:34:03 -0400
Message-Id: <1444156449-19847-2-git-send-email-amy.fong@windriver.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
References: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
Subject: [PATCH 1/7] docker: needs go 1.3
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
X-List-Received-Date: Tue, 06 Oct 2015 18:34:26 -0000

The current version of docker (1.6.2) requires go 1.3

See go 1.4 sqlite issue:
https://github.com/docker/docker/issues/9649

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 .../go-cross/files/bsd_svid_source.patch           |  37 ++++++
 recipes-devtools/go-cross/files/ccache.patch       | 147 +++++++++++++++++++++
 recipes-devtools/go-cross/go-cross_1.3.bb          |  65 +++++++++
 3 files changed, 249 insertions(+)
 create mode 100644 recipes-devtools/go-cross/files/bsd_svid_source.patch
 create mode 100644 recipes-devtools/go-cross/files/ccache.patch
 create mode 100644 recipes-devtools/go-cross/go-cross_1.3.bb

diff --git a/recipes-devtools/go-cross/files/bsd_svid_source.patch b/recipes-devtools/go-cross/files/bsd_svid_source.patch
new file mode 100644
index 0000000..21e1d4c
--- /dev/null
+++ b/recipes-devtools/go-cross/files/bsd_svid_source.patch
@@ -0,0 +1,37 @@
+golang-cross: do_compile fails cc1: all warnings being treated as errors
+
+glibc 2.20 deprecates _BSD_SOURCE and _SVID_SOURCE and emits an error
+message.  From patch 16632:
+	libc [PATCH] BZ #16632: Disable _SVID_SOURCE/_BSD_SOURCE warning
+	if _DEFAULT_SOURCE is defined
+
+Since we also need to support glibc before 2.20, from the release notes
+for glibc 2.20, the recommended fix is to define _DEFAULT_SOURCE
+
+(fixed upstream)
+https://groups.google.com/forum/#!topic/golang-codereviews/S4TARFCxu2k
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ include/u.h |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+--- a/include/u.h
++++ b/include/u.h
+@@ -38,6 +38,16 @@
+ #		define __MAKECONTEXT_V2_SOURCE 1
+ #	endif
+ #endif
++/**
++ * in glibc >= 2.20, _BSD_SOURCE and _SVID_SOURCE causes warning
++ * messages if _DEFAULT_SOURCE is not defined.
++ *
++ * From glibc 2.20 release notes, since this application needs _BSD_SOURCE
++ * and/or _SVID_SOURCE and we must support glibc < 2.19 and
++ * glibc >= 2.20, then define all 3 (_DEFAULT_SOURCE, _BSD_SOURCE,
++ * and _SVID_SOURCE) unconditionally
++ */
++#define _DEFAULT_SOURCE 1
+ #define _BSD_SOURCE 1
+ #define _NETBSD_SOURCE 1	/* NetBSD */
+ #define _SVID_SOURCE 1
diff --git a/recipes-devtools/go-cross/files/ccache.patch b/recipes-devtools/go-cross/files/ccache.patch
new file mode 100644
index 0000000..b7a64bf
--- /dev/null
+++ b/recipes-devtools/go-cross/files/ccache.patch
@@ -0,0 +1,147 @@
+golang doesn't work with ccache. In the current state, a lot of parsing
+happens where it'll grab the first string in CC or LD and uses that for
+its builds. When ccache is enabled, it results in trying to do builds
+with just ccache. 
+
+The brokeness is seen when building with apps that uses cgo, like docker.
+To enable ccache to work, some string comparisons and changes to parsing
+had to be made.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+
+Index: go/src/cmd/cgo/gcc.go
+===================================================================
+--- go.orig/src/cmd/cgo/gcc.go	2014-06-18 17:26:26.000000000 -0700
++++ go/src/cmd/cgo/gcc.go	2015-06-18 13:19:08.908877160 -0700
+@@ -712,6 +712,12 @@
+ func (p *Package) gccBaseCmd() []string {
+ 	// Use $CC if set, since that's what the build uses.
+ 	if ret := strings.Fields(os.Getenv("CC")); len(ret) > 0 {
++		if strings.Contains(ret[0], "ccache") {
++			base_cc := ret[0] + " " + ret[1]
++			os.Setenv("CCACHE_CC", ret[1])
++			ret[1] = base_cc
++			return ret[1:]
++		}
+ 		return ret
+ 	}
+ 	// Try $GCC if set, since that's what we used to use.
+Index: go/src/pkg/os/exec/lp_unix.go
+===================================================================
+--- go.orig/src/pkg/os/exec/lp_unix.go	2014-06-18 17:26:25.000000000 -0700
++++ go/src/pkg/os/exec/lp_unix.go	2015-06-18 13:19:29.464876331 -0700
+@@ -35,8 +35,14 @@
+ 	// (only bypass the path if file begins with / or ./ or ../)
+ 	// but that would not match all the Unix shells.
+ 
+-	if strings.Contains(file, "/") {
+-		err := findExecutable(file)
++	tmp := file
++	if strings.Contains(file, " ") {
++		exec_part := strings.Split(file, " ")[0]
++		tmp = exec_part
++	}
++
++	if strings.Contains(tmp, "/") {
++		err := findExecutable(tmp)
+ 		if err == nil {
+ 			return file, nil
+ 		}
+@@ -51,7 +57,7 @@
+ 			// Unix shell semantics: path element "" means "."
+ 			dir = "."
+ 		}
+-		path := dir + "/" + file
++		path := dir + "/" + tmp
+ 		if err := findExecutable(path); err == nil {
+ 			return path, nil
+ 		}
+Index: go/src/cmd/go/build.go
+===================================================================
+--- go.orig/src/cmd/go/build.go	2014-06-18 17:26:26.000000000 -0700
++++ go/src/cmd/go/build.go	2015-06-18 13:20:08.724874749 -0700
+@@ -2005,8 +2005,15 @@
+ 	// strings returned are "gcc", "-I", objdir (and cuts them off).
+ 
+ 	compiler := envList(envvar, defcmd)
+-	a := []string{compiler[0], "-I", objdir}
+-	a = append(a, compiler[1:]...)
++
++	a := []string{compiler[0]}
++	if strings.Contains(compiler[0], "ccache") {
++		a = append(a, compiler[1], "-I", objdir)
++		a = append(a, compiler[2:]...)
++	} else {
++		a = append(a, "-I", objdir)
++		a = append(a, compiler[1:]...)
++	}
+ 
+ 	// Definitely want -fPIC but on Windows gcc complains
+ 	// "-fPIC ignored for target (all code is position independent)"
+Index: go/src/cmd/ld/lib.c
+===================================================================
+--- go.orig/src/cmd/ld/lib.c	2014-06-18 17:26:27.000000000 -0700
++++ go/src/cmd/ld/lib.c	2015-06-18 13:18:39.564878343 -0700
+@@ -552,7 +552,7 @@
+ void
+ hostlink(void)
+ {
+-	char *p, **argv;
++	char *p, *q, **argv;
+ 	int c, i, w, n, argc, len;
+ 	Hostobj *h;
+ 	Biobuf *f;
+@@ -577,6 +577,19 @@
+ 	if(extld == nil)
+ 		extld = "gcc";
+ 	argv[argc++] = extld;
++
++	p = extldflags;
++	if (strstr(argv[0], "ccache") != NULL) {
++		while(p != nil) {
++			while(*p == ' ')
++				*p++ = '\0';
++			if(*p == '\0')
++				break;
++			argv[argc++] = p;
++			p = strchr(p + 1, ' ');
++			break;
++		}
++	}
+ 	switch(thechar){
+ 	case '8':
+ 		argv[argc++] = "-m32";
+@@ -629,12 +642,12 @@
+ 			errorexit();
+ 		}
+ 		Bseek(f, h->off, 0);
+-		p = smprint("%s/%06d.o", tmpdir, i);
+-		argv[argc++] = p;
+-		w = create(p, 1, 0775);
++		q = smprint("%s/%06d.o", tmpdir, i);
++		argv[argc++] = q;
++		w = create(q, 1, 0775);
+ 		if(w < 0) {
+ 			ctxt->cursym = S;
+-			diag("cannot create %s: %r", p);
++			diag("cannot create %s: %r", q);
+ 			errorexit();
+ 		}
+ 		len = h->len;
+@@ -646,7 +659,7 @@
+ 		}
+ 		if(close(w) < 0) {
+ 			ctxt->cursym = S;
+-			diag("cannot write %s: %r", p);
++			diag("cannot write %s: %r", q);
+ 			errorexit();
+ 		}
+ 		Bterm(f);
+@@ -656,7 +669,6 @@
+ 	for(i=0; i<nldflag; i++)
+ 		argv[argc++] = ldflag[i];
+ 
+-	p = extldflags;
+ 	while(p != nil) {
+ 		while(*p == ' ')
+ 			*p++ = '\0';
diff --git a/recipes-devtools/go-cross/go-cross_1.3.bb b/recipes-devtools/go-cross/go-cross_1.3.bb
new file mode 100644
index 0000000..8723142
--- /dev/null
+++ b/recipes-devtools/go-cross/go-cross_1.3.bb
@@ -0,0 +1,65 @@
+DESCRIPTION = "\
+  Go is an open source programming language that makes it easy to build simple, \
+  reliable, and efficient software. \
+  "
+HOMEPAGE = "https://golang.org/"
+LICENSE = "BSD-3-Clause"
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
+        "
+
+do_compile() {
+	## Setting `$GOBIN` doesn't do any good, looks like it ends up copying binaries there.
+	export GOROOT_FINAL="${SYSROOT}${libdir}/go"
+
+	export GOHOSTOS="linux"
+	export GOOS="linux"
+
+	export GOARCH="${TARGET_ARCH}"
+	if [ "${TARGET_ARCH}" = "x86_64" ]; then
+		export GOARCH="amd64"
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
+	export CC_FOR_TARGET="${CC}"
+	export CXX_FOR_TARGET="${CXX}"
+	export GO_CCFLAGS="${HOST_CFLAGS}"
+	export GO_LDFLAGS="${HOST_LDFLAGS}"
+
+	cd src && ./make.bash
+}
+
+do_install() {
+	## It should be okay to ignore `${WORKDIR}/go/bin/linux_arm`...
+	## Also `gofmt` is not needed right now.
+	install -d "${D}${bindir}"
+	install -m 0755 "${WORKDIR}/go/bin/go" "${D}${bindir}"
+	install -d "${D}${libdir}/go"
+	## TODO: use `install` instead of `cp`
+	for dir in include lib pkg src test
+	do cp -a "${WORKDIR}/go/${dir}" "${D}${libdir}/go/"
+	done
+}
-- 
2.5.3


