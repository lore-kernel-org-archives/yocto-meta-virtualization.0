Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99E48E00A45; Fri, 19 Jun 2015 09:01:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B143E009EF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jun 2015 09:01:54 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5JG1rVr008908
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Fri, 19 Jun 2015 09:01:53 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.85)
	(envelope-from <amy.fong@windriver.com>)
	id 1Z5yjU-00010Y-PF; Fri, 19 Jun 2015 12:01:32 -0400
Date: Fri, 19 Jun 2015 12:01:32 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org, amy.fong@windriver.com
Message-ID: <20150619160132.GA3855@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] golang-cross: add ccache support
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
X-List-Received-Date: Fri, 19 Jun 2015 16:01:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From a6cb7ce2d69d59e10d273a1a1011d6c703d3ee13 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Fri, 19 Jun 2015 11:47:57 -0400
Subject: [PATCH] golang-cross: add ccache support

golang doesn't work with ccache. In the current state, a lot of parsing
happens where it'll grab the first string in CC or LD and uses that for
its builds. When ccache is enabled, it results in trying to do builds
with just ccache.

The brokeness is seen when building with apps that uses cgo, like docker.
To enable ccache to work, some string comparisons and changes to parsing
had to be made.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/docker/docker_git.bb |   5 --
 recipes-devtools/go/files/ccache.patch  | 147 ++++++++++++++++++++++++++++++++
 recipes-devtools/go/golang-cross.inc    |   1 +
 recipes-devtools/go/golang-cross_1.3.bb |   3 -
 4 files changed, 148 insertions(+), 8 deletions(-)
 create mode 100644 recipes-devtools/go/files/ccache.patch

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 8bcaee9..f3c4007 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -27,11 +27,6 @@ SRC_URI = "\
 	file://disable_sha1sum_startup.patch \
 	"
 
-# The golang-cross embeds a compiler invocation for the pre-parser
-# that is incompatible with the $CC definition used by the compiler
-# templates so disable CCACHE
-CCACHE = ""
-
 # Apache-2.0 for docker
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1cc0497778922bfd6cb48721deb80dc7"
diff --git a/recipes-devtools/go/files/ccache.patch b/recipes-devtools/go/files/ccache.patch
new file mode 100644
index 0000000..b7a64bf
--- /dev/null
+++ b/recipes-devtools/go/files/ccache.patch
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
diff --git a/recipes-devtools/go/golang-cross.inc b/recipes-devtools/go/golang-cross.inc
index ce4ee0e..be2c1eb 100644
--- a/recipes-devtools/go/golang-cross.inc
+++ b/recipes-devtools/go/golang-cross.inc
@@ -6,6 +6,7 @@ PROVIDES = "virtual/${TARGET_PREFIX}golang"
 SRC_URI = "\
 	http://golang.org/dl/go${PV}.src.tar.gz \
 	file://bsd_svid_source.patch \
+	file://ccache.patch \
 	"
 
 S="${WORKDIR}/go"
diff --git a/recipes-devtools/go/golang-cross_1.3.bb b/recipes-devtools/go/golang-cross_1.3.bb
index 6d538f9..fcb0e7a 100644
--- a/recipes-devtools/go/golang-cross_1.3.bb
+++ b/recipes-devtools/go/golang-cross_1.3.bb
@@ -1,7 +1,4 @@
 inherit cross
 
-# CCACHE does not work properly with GO
-CCACHE = ""
-
 require golang-cross.inc
 require golang-${PV}.inc
-- 
2.1.4


