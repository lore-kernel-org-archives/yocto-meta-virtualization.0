Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D275CE00E8B; Thu, 14 Jul 2016 02:07:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C374E00CFE
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jul 2016 02:06:59 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6E96uxW002480
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jul 2016 02:06:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 02:06:55 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 14 Jul 2016 17:04:52 +0800
Message-ID: <1468487092-1577-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] iasl: Upgrade to 20160527 from 20120215
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
X-List-Received-Date: Thu, 14 Jul 2016 09:07:03 -0000
Content-Type: text/plain

* Upgrade iasl from 20120215 to 20160527
* Fix the dependency as it actually depends on
  bison-native and flex-native
* Remove hardcode PR to let PR server handle
  the version
* Add patch Make-CC-definition-conditional.patch
  to make CC definition conditional as it makes
  the package unable to cross-compile when hardcode
  CC's definition previously.
* Add iasl command manual file as iasl.1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../iasl/iasl/Make-CC-definition-conditional.patch |  29 +++++
 recipes-extended/iasl/iasl/iasl.1                  | 135 +++++++++++++++++++++
 recipes-extended/iasl/iasl_20120215.bb             |  29 -----
 recipes-extended/iasl/iasl_20160527.bb             |  39 ++++++
 4 files changed, 203 insertions(+), 29 deletions(-)
 create mode 100644 recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
 create mode 100644 recipes-extended/iasl/iasl/iasl.1
 delete mode 100644 recipes-extended/iasl/iasl_20120215.bb
 create mode 100644 recipes-extended/iasl/iasl_20160527.bb

diff --git a/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch b/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
new file mode 100644
index 0000000..f69a36c
--- /dev/null
+++ b/recipes-extended/iasl/iasl/Make-CC-definition-conditional.patch
@@ -0,0 +1,29 @@
+[PATCH] Make CC definition conditional
+
+Upstream-Status: pending
+
+By hardcoding CC's definition to gcc, make this packages unable to
+cross-compile. the -e options of make can not override the CC since
+it is not defined in Makefile, but in Makefile.config
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ generate/unix/Makefile.config | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/generate/unix/Makefile.config b/generate/unix/Makefile.config
+index 8d41399..72d597d 100644
+--- a/generate/unix/Makefile.config
++++ b/generate/unix/Makefile.config
+@@ -35,7 +35,7 @@
+ .SUFFIXES :
+ PROGS = acpibin acpidump acpiexamples acpiexec acpihelp acpinames acpisrc acpixtract iasl
+ HOST ?= _CYGWIN
+-CC =    gcc
++CC ?=    gcc
+ 
+ #
+ # Common defines
+-- 
+1.9.1
+
diff --git a/recipes-extended/iasl/iasl/iasl.1 b/recipes-extended/iasl/iasl/iasl.1
new file mode 100644
index 0000000..000a3b8
--- /dev/null
+++ b/recipes-extended/iasl/iasl/iasl.1
@@ -0,0 +1,135 @@
+.\" First parameter, NAME, should be all caps
+.\" Second parameter, SECTION, should be 1-8, maybe w/ subsection
+.\" other parameters are allowed: see man(7), man(1)
+.TH IASL 1 "October 14, 2005"
+.\" Please adjust this date whenever revising the manpage.
+.\"
+.\" Some roff macros, for reference:
+.\" .nh        disable hyphenation
+.\" .hy        enable hyphenation
+.\" .ad l      left justify
+.\" .ad b      justify to both left and right margins
+.\" .nf        disable filling
+.\" .fi        enable filling
+.\" .br        insert line break
+.\" .sp <n>    insert n+1 empty lines
+.\" for manpage-specific macros, see man(7)
+.SH NAME
+iasl \- ACPI Source Language compiler/decompiler
+.SH SYNOPSIS
+.B iasl
+.RI [ options ]
+.RI [ "input file" ]
+.SH DESCRIPTION
+This manual page documents briefly the
+.B iasl
+command. The option list is taken from the iasl interactive help.
+.PP
+.\" TeX users may be more comfortable with the \fB<whatever>\fP and
+.\" \fI<whatever>\fP escape sequences to invode bold face and italics, 
+.\" respectively.
+.B iasl
+is an ASL compiler and decompiler.
+
+.SH OPTIONS
+
+.PP
+.SS General Output
+.TP
+.B \-p <prefix>
+Specify filename prefix for all output files (including .aml)
+.TP
+.B \-vi
+Less verbose errors and warnings for use with IDEs
+.TP
+.B \-vo
+Enable optimization comments
+.TP
+.B \-vr
+Disable remarks
+.TP
+.B \-vs
+Disable signon
+
+.PP
+.SS AML Output Files
+.TP
+.B \-s<a|c>
+Create AML in assembler or C source file (*.asm or *.c)
+.TP
+.B \-i<a|c>
+Create assembler or C include file (*.inc or *.h)
+.TP
+.B \-t<a|c>
+Create AML in assembler or C hex table (*.hex)
+
+.PP
+.SS AML Code Generation
+.TP
+.B \-oa
+Disable all optimizations (compatibility mode)
+.TP
+.B \-of
+Disable constant folding
+.TP
+.B \-oi
+Disable integer optimization to Zero/One/Ones
+.TP
+.B \-on
+Disable named reference string optimization
+.TP
+.B \-r<Revision>
+Override table header Revision (1-255)
+
+.PP
+.SS Listings
+.TP
+.B \-l
+Create mixed listing file (ASL source and AML) (*.lst)
+.TP
+.B \-ln
+Create namespace file (*.nsp)
+.TP
+.B \-ls
+Create combined source file (expanded includes) (*.src)
+
+.PP
+.SS AML Disassembler
+.TP
+.B \-d  [file]
+Disassemble AML to ASL source code file (*.dsl)
+.TP
+.B \-dc [file]
+Disassemble AML and immediately compile it
+.br
+(Obtain DSDT from current system if no input file)
+.TP
+.B \-e
+Generate External() statements for unresolved symbols
+.TP
+.B \-g
+Get ACPI tables and write to files (*.dat)
+
+.PP
+.SS Miscellaneous
+.TP
+.B \-a
+Verify source file is entirely ASCII text (0x00-0x7F)
+
+.PP
+.SS Help
+.TP
+.B \-h
+Additional help and compiler debug options
+.TP
+.B \-hc
+Display operators allowed in constant expressions
+.TP
+.B \-hr
+Display ACPI reserved method names
+
+.SH AUTHOR
+iasl was written by Robert Moore <robert.moore@intel.com>.
+.PP
+This manual page was written by Mattia Dongili <malattia@debian.org>,
+for the Debian project (but may be used by others).
diff --git a/recipes-extended/iasl/iasl_20120215.bb b/recipes-extended/iasl/iasl_20120215.bb
deleted file mode 100644
index 5ce0930..0000000
--- a/recipes-extended/iasl/iasl_20120215.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
-HOMEPAGE = "http://www.acpica.org/"
-LICENSE = "Intel-ACPI"
-LIC_FILES_CHKSUM = "file://asldefine.h;endline=115;md5=d4d7cf809b8b5e03131327b3f718e8f0"
-SECTION = "console/tools"
-PR="r1"
-
-DEPENDS="flex bison"
-
-SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "324c89e5bb9002e2711e0494290ceacc"
-SRC_URI[sha256sum] = "b2b497415f29ddbefe7be8b9429b62c1f1f6e1ec11456928e4e7da86578e5b8d"
-
-S="${WORKDIR}/acpica-unix-${PV}/source/compiler"
-
-NATIVE_INSTALL_WORKS = "1"
-BBCLASSEXTEND = "native"
-
-do_compile() {
-	CFLAGS="-Wno-error=redundant-decls" $MAKE
-}
-
-do_install() {
-	mkdir -p ${D}${prefix}/bin
-	cp ${S}/iasl ${D}${prefix}/bin
-}
-
-
diff --git a/recipes-extended/iasl/iasl_20160527.bb b/recipes-extended/iasl/iasl_20160527.bb
new file mode 100644
index 0000000..f44f58d
--- /dev/null
+++ b/recipes-extended/iasl/iasl_20160527.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Intel ASL compiler/decompiler"
+DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
+HOMEPAGE = "http://www.acpica.org/"
+LICENSE = "Intel-ACPI"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompiler.h;beginline=7;endline=114;md5=09f82edcd148ab4c8aa554bc3e9d0676"
+SECTION = "console/tools"
+PR="r1"
+
+DEPENDS = "bison-native flex-native"
+
+SRC_URI = "https://www.acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz \
+           file://iasl.1 \
+           file://Make-CC-definition-conditional.patch \
+"
+
+SRC_URI[md5sum] = "be677fc358de9dadc036e1ea678a101b"
+SRC_URI[sha256sum] = "6b681732624de1eb58b2bcf1c7ef0744ba14ed35fcaa534d4421574782fbb848"
+
+S = "${WORKDIR}/acpica-unix-${PV}/"
+
+PARALLEL_MAKE = ""
+CFLAGS += "-D_LINUX -DACPI_ASL_COMPILER -I../include -I../compiler"
+
+COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
+
+# By setting NOOPT we suppress forcing -O2 and setting _FORTIFY_SOURCE=2.  Let the
+# optimization and security cflags set them.
+#
+do_compile() {
+        oe_runmake iasl NOOPT=TRUE NOFORTIFY=TRUE
+}
+
+do_install() {
+	install -d ${D}${bindir} ${D}${mandir}/man1
+	install -m 0755 ${S}/generate/unix/bin/iasl ${D}${bindir}
+	install -m 0644 ${WORKDIR}/iasl.1 ${D}${mandir}/man1
+}
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


