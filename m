Return-Path: <Chris.Braga@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5F21E00A51; Fri, 24 Jul 2015 12:52:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EBFEE00A1F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Jul 2015 12:52:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6OJpwZv000018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Jul 2015 12:51:59 -0700 (PDT)
Received: from yow-ovp2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 24 Jul 2015 12:51:48 -0700
From: Christopher Braga <chris.braga@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1437767518-1829-1-git-send-email-chris.braga@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:40 -0800
Subject: [PATCH 1/2] golang uprev to 1.4
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
Date: Fri, 24 Jul 2015 19:52:07 -0000
X-Original-Date: Fri, 24 Jul 2015 15:51:57 -0400
X-List-Received-Date: Fri, 24 Jul 2015 19:52:07 -0000
Content-Type: text/plain

Uprev golang to version 1.4 in order to build packages which do not
build properly on earlier versions. In order for this uprev to succeed,
a go 1.4 compatable version of ccache (called ccache_1.4.bb) has also
been created. The original version is no longer needed and has been
removed.

Signed-off-by: Christopher Braga <chris.braga@windriver.com>
---
 recipes-devtools/go/files/ccache.patch     | 147 ---------------------------
 recipes-devtools/go/files/ccache_1.4.patch | 153 +++++++++++++++++++++++++++++
 recipes-devtools/go/golang-1.3.inc         |   4 -
 recipes-devtools/go/golang-1.4.inc         |   4 +
 recipes-devtools/go/golang-cross.inc       |   2 +-
 recipes-devtools/go/golang-cross_1.3.bb    |   4 -
 recipes-devtools/go/golang-cross_1.4.bb    |   4 +
 7 files changed, 162 insertions(+), 156 deletions(-)
 delete mode 100644 recipes-devtools/go/files/ccache.patch
 create mode 100644 recipes-devtools/go/files/ccache_1.4.patch
 delete mode 100644 recipes-devtools/go/golang-1.3.inc
 create mode 100644 recipes-devtools/go/golang-1.4.inc
 delete mode 100644 recipes-devtools/go/golang-cross_1.3.bb
 create mode 100644 recipes-devtools/go/golang-cross_1.4.bb

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
diff --git a/recipes-devtools/go/files/ccache_1.4.patch b/recipes-devtools/go/files/ccache_1.4.patch
new file mode 100644
index 0000000..51ed5fb
--- /dev/null
+++ b/recipes-devtools/go/files/ccache_1.4.patch
@@ -0,0 +1,153 @@
+golang doesn't work with ccache. In the current state, a lot of parsing
+happens where it'll grab the first string in CC or LD and uses that for
+its builds. When ccache is enabled, it results in trying to do builds
+with just ccache.
+
+The brokeness is seen when building with apps that uses cgo, like docker.
+To enable ccache to work, some string comparisons and changes to parsing
+had to be made.
+
+This version of ccache has been modified from Amy Fong's original version
+to work with Go 1.4.
+
+Signed-off-by: Christopher Braga <chris.braga@windriver.com>
+
+diff --git a/src/cmd/cgo/gcc.go b/src/cmd/cgo/gcc.go
+index abdd369..5145c08 100644
+--- a/src/cmd/cgo/gcc.go
++++ b/src/cmd/cgo/gcc.go
+@@ -728,6 +728,12 @@ func (p *Package) rewriteRef(f *File) {
+ func (p *Package) gccBaseCmd() []string {
+ 	// Use $CC if set, since that's what the build uses.
+ 	if ret := strings.Fields(os.Getenv("CC")); len(ret) > 0 {
++		if strings.Contains(ret[0], "ccache") {
++			base_cc := ret[0] + " " + ret[1]
++			os.Setenv("CCACHE_CC", ret[1])
++			ret[1] = base_cc
++			return ret[1:]
++        	}
+ 		return ret
+ 	}
+ 	// Try $GCC if set, since that's what we used to use.
+diff --git a/src/cmd/go/build.go b/src/cmd/go/build.go
+index 1dd4314..faf43b8 100644
+--- a/src/cmd/go/build.go
++++ b/src/cmd/go/build.go
+@@ -2081,8 +2081,15 @@ func (b *builder) ccompilerCmd(envvar, defcmd, objdir string) []string {
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
+diff --git a/src/cmd/ld/lib.c b/src/cmd/ld/lib.c
+index f889aba..f80e953 100644
+--- a/src/cmd/ld/lib.c
++++ b/src/cmd/ld/lib.c
+@@ -564,7 +564,7 @@ hostlinksetup(void)
+ void
+ hostlink(void)
+ {
+-	char *p, **argv;
++	char *p, *q, **argv;
+ 	int c, i, w, n, argc, len;
+ 	Hostobj *h;
+ 	Biobuf *f;
+@@ -589,6 +589,19 @@ hostlink(void)
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
+@@ -641,12 +654,12 @@ hostlink(void)
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
+@@ -658,7 +671,7 @@ hostlink(void)
+ 		}
+ 		if(close(w) < 0) {
+ 			ctxt->cursym = S;
+-			diag("cannot write %s: %r", p);
++			diag("cannot write %s: %r", q);
+ 			errorexit();
+ 		}
+ 		Bterm(f);
+@@ -668,7 +681,6 @@ hostlink(void)
+ 	for(i=0; i<nldflag; i++)
+ 		argv[argc++] = ldflag[i];
+ 
+-	p = extldflags;
+ 	while(p != nil) {
+ 		while(*p == ' ')
+ 			*p++ = '\0';
+diff --git a/src/os/exec/lp_unix.go b/src/os/exec/lp_unix.go
+index 3f895d5..08ae202 100644
+--- a/src/os/exec/lp_unix.go
++++ b/src/os/exec/lp_unix.go
+@@ -35,8 +35,14 @@ func LookPath(file string) (string, error) {
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
+@@ -51,7 +57,7 @@ func LookPath(file string) (string, error) {
+ 			// Unix shell semantics: path element "" means "."
+ 			dir = "."
+ 		}
+-		path := dir + "/" + file
++		path := dir + "/" + tmp
+ 		if err := findExecutable(path); err == nil {
+ 			return path, nil
+ 		}
+-- 
+2.1.0
+
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
diff --git a/recipes-devtools/go/golang-1.4.inc b/recipes-devtools/go/golang-1.4.inc
new file mode 100644
index 0000000..b0324a9
--- /dev/null
+++ b/recipes-devtools/go/golang-1.4.inc
@@ -0,0 +1,4 @@
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
+SRC_URI[md5sum] = "c0d732ef7181f98db4b93fbce4eef5a2"
+SRC_URI[sha256sum] = "3ae9f67e45a5ca7004b28808da8b1367d328a371d641ddbe636c0fb0ae0ffdae"
diff --git a/recipes-devtools/go/golang-cross.inc b/recipes-devtools/go/golang-cross.inc
index be2c1eb..e934038 100644
--- a/recipes-devtools/go/golang-cross.inc
+++ b/recipes-devtools/go/golang-cross.inc
@@ -6,7 +6,7 @@ PROVIDES = "virtual/${TARGET_PREFIX}golang"
 SRC_URI = "\
 	http://golang.org/dl/go${PV}.src.tar.gz \
 	file://bsd_svid_source.patch \
-	file://ccache.patch \
+	file://ccache_${PV}.patch \
 	"
 
 S="${WORKDIR}/go"
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
diff --git a/recipes-devtools/go/golang-cross_1.4.bb b/recipes-devtools/go/golang-cross_1.4.bb
new file mode 100644
index 0000000..fcb0e7a
--- /dev/null
+++ b/recipes-devtools/go/golang-cross_1.4.bb
@@ -0,0 +1,4 @@
+inherit cross
+
+require golang-cross.inc
+require golang-${PV}.inc
-- 
2.1.4


