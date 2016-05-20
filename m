Return-Path: <Zumeng.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4CA7E00ED3; Thu, 19 May 2016 23:57:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73A69E00EC4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:57:31 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4K6vVkr031532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:57:31 -0700
Received: from ala-git.wrs.com (147.11.178.22) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 23:57:30 -0700
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Thu, 19 May 2016 23:57:27 -0700
Message-ID: <1463727448-32195-2-git-send-email-zumeng.chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1463727448-32195-1-git-send-email-zumeng.chen@windriver.com>
References: <1463727448-32195-1-git-send-email-zumeng.chen@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 1/2] criu: remove protobuf-2.6.1 and the related
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
X-List-Received-Date: Fri, 20 May 2016 06:57:36 -0000
Content-Type: text/plain

Since CRIU does not explicitly nominate the version of protobuf as 2.6.1, which
should not be included just here. And it seems protobuf-2.5.0 is doable or this
CRIU version based on a basic testing according to criu.org/Simple_loop as well,
so remove it from criu.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---
 ...Remove-the-rules-which-depend-on-the-nati.patch | 46 ----------
 .../files/Omit-google-apputils-dependency.patch    | 25 ------
 recipes-containers/criu/files/disable_tests.patch  | 19 -----
 ...llow-running-python-scripts-from-anywhere.patch | 38 ---------
 recipes-containers/criu/files/run-ptest            | 32 -------
 recipes-containers/criu/protobuf-c_1.1.1.bb        | 28 -------
 recipes-containers/criu/protobuf-native_2.6.1.bb   | 21 -----
 recipes-containers/criu/protobuf_2.6.1.bb          | 97 ----------------------
 8 files changed, 306 deletions(-)
 delete mode 100644 recipes-containers/criu/files/0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch
 delete mode 100644 recipes-containers/criu/files/Omit-google-apputils-dependency.patch
 delete mode 100644 recipes-containers/criu/files/disable_tests.patch
 delete mode 100644 recipes-containers/criu/files/protobuf-allow-running-python-scripts-from-anywhere.patch
 delete mode 100755 recipes-containers/criu/files/run-ptest
 delete mode 100644 recipes-containers/criu/protobuf-c_1.1.1.bb
 delete mode 100644 recipes-containers/criu/protobuf-native_2.6.1.bb
 delete mode 100644 recipes-containers/criu/protobuf_2.6.1.bb

diff --git a/recipes-containers/criu/files/0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch b/recipes-containers/criu/files/0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch
deleted file mode 100644
index b6fbf01..0000000
--- a/recipes-containers/criu/files/0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 81bc5928cdc1b432656eb6590967306d8cf3ac9d Mon Sep 17 00:00:00 2001
-From: Jianchuan Wang <jianchuan.wang@windriver.com>
-Date: Tue, 4 Aug 2015 10:22:21 +0800
-Subject: [PATCH] protobuf-c: Remove the rules which depend on the native
- command
-
-Those rules are not for cross-compile since the command protoc-c/cxx-generate-packed-data
-need be executed to generate some local files in the compiling processing.
-
-Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
----
- Makefile.am | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 310aa09..0602e96 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -148,17 +148,18 @@ t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
- t_generated_code2_cxx_generate_packed_data_LDADD = \
- 	$(protobuf_LIBS)
- 
--t/test.pb-c.c t/test.pb-c.h: $(top_builddir)/protoc-c/protoc-c$(EXEEXT) $(top_srcdir)/t/test.proto
--	$(AM_V_GEN)$(top_builddir)/protoc-c/protoc-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test.proto
-+t/test.pb-c.c t/test.pb-c.h: $(top_srcdir)/t/test.proto
-+	$(AM_V_GEN)protoc-c -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test.proto
- 
--t/test-full.pb-c.c t/test-full.pb-c.h: $(top_builddir)/protoc-c/protoc-c$(EXEEXT) $(top_srcdir)/t/test-full.proto
--	$(AM_V_GEN)$(top_builddir)/protoc-c/protoc-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
-+t/test-full.pb-c.c t/test-full.pb-c.h: $(top_srcdir)/t/test-full.proto
-+	$(AM_V_GEN)protoc-c -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
- 
- t/test-full.pb.cc t/test-full.pb.h: @PROTOC@ $(top_srcdir)/t/test-full.proto
- 	$(AM_V_GEN)@PROTOC@ -I$(top_srcdir) --cpp_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
- 
--t/generated-code2/test-full-cxx-output.inc: t/generated-code2/cxx-generate-packed-data$(EXEEXT)
--	$(AM_V_GEN)$(top_builddir)/t/generated-code2/cxx-generate-packed-data$(EXEEXT) > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
-+t/generated-code2/test-full-cxx-output.inc: 
-+	mkdir -p $(top_builddir)/t/generated-code2
-+	$(AM_V_GEN)cxx-generate-packed-data > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
- 
- BUILT_SOURCES += \
- 	t/test.pb-c.c t/test.pb-c.h \
--- 
-1.9.1
-
diff --git a/recipes-containers/criu/files/Omit-google-apputils-dependency.patch b/recipes-containers/criu/files/Omit-google-apputils-dependency.patch
deleted file mode 100644
index ef60fc0..0000000
--- a/recipes-containers/criu/files/Omit-google-apputils-dependency.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f8b7c90f6da90b67bdd7d5301894c5c28bd9d076 Mon Sep 17 00:00:00 2001
-From: Jianchuan Wang <jianchuan.wang@windriver.com>
-Date: Mon, 10 Aug 2015 11:23:31 +0800
-Subject: [PATCH] Omit google-apputils dependency
-
-Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
----
- python/setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/python/setup.py b/python/setup.py
-index 2450a77..6f6bffb 100755
---- a/python/setup.py
-+++ b/python/setup.py
-@@ -189,7 +189,6 @@ if __name__ == '__main__':
-           'google.protobuf.text_format'],
-         cmdclass = { 'clean': clean, 'build_py': build_py },
-         install_requires = ['setuptools'],
--        setup_requires = ['google-apputils'],
-         ext_modules = ext_module_list,
-         url = 'https://developers.google.com/protocol-buffers/',
-         maintainer = maintainer_email,
--- 
-1.9.1
-
diff --git a/recipes-containers/criu/files/disable_tests.patch b/recipes-containers/criu/files/disable_tests.patch
deleted file mode 100644
index dac8942..0000000
--- a/recipes-containers/criu/files/disable_tests.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-diff -Naur protobuf-c-0.15.old/src/Makefile.am protobuf-c-0.15/src/Makefile.am
---- protobuf-c-0.15.old/src/Makefile.am	2012-11-28 14:59:57.845251943 +0100
-+++ protobuf-c-0.15/src/Makefile.am	2012-11-28 15:00:23.549252632 +0100
-@@ -1,5 +1,5 @@
- if BUILD_PROTOC_C
--SUBDIRS = . test
-+
- bin_PROGRAMS = protoc-c
- protoc_c_SOURCES = \
- google/protobuf/compiler/c/c_service.cc \
-@@ -23,7 +23,7 @@
- lib_LTLIBRARIES = libprotobuf-c.la
- protobufcincludedir = $(includedir)/google/protobuf-c
- 
--EXTRA_DIST = CMakeLists.txt test/CMakeLists.txt
-+EXTRA_DIST = CMakeLists.txt 
- 
- libprotobuf_c_la_SOURCES = \
- google/protobuf-c/protobuf-c-dispatch.c \
diff --git a/recipes-containers/criu/files/protobuf-allow-running-python-scripts-from-anywhere.patch b/recipes-containers/criu/files/protobuf-allow-running-python-scripts-from-anywhere.patch
deleted file mode 100644
index 13d4e84..0000000
--- a/recipes-containers/criu/files/protobuf-allow-running-python-scripts-from-anywhere.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 46e331263eb92e47510e88478b255f226d30245c Mon Sep 17 00:00:00 2001
-From: Keith Holman <Keith.Holman@windriver.com>
-Date: Mon, 18 Aug 2014 15:19:35 -0400
-Subject: [PATCH] protobuf: allow running python scripts from anywhere
-
-The Makefile to generate the examples with Google Protocol Buffers
-generates some scripts for python.  However, these generated scripts
-only work if they are ran in the same directory as the source files.
-This fix generates scripts to execute from anywhere on the system.
-
-Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
----
- examples/Makefile | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/examples/Makefile b/examples/Makefile
-index 8dc9083..a993d63 100644
---- a/examples/Makefile
-+++ b/examples/Makefile
-@@ -48,11 +48,13 @@ list_people_java: javac_middleman
- add_person_python: add_person.py protoc_middleman
- 	@echo "Writing shortcut script add_person_python..."
- 	@echo '#! /bin/sh' > add_person_python
--	@echo './add_person.py "$$@"' >> add_person_python
-+	@echo 'SCRIPT_DIR=$$(dirname $$0)' >> add_person_python
-+	@echo '$$SCRIPT_DIR/add_person.py "$$@"' >> add_person_python
- 	@chmod +x add_person_python
- 
- list_people_python: list_people.py protoc_middleman
- 	@echo "Writing shortcut script list_people_python..."
- 	@echo '#! /bin/sh' > list_people_python
--	@echo './list_people.py "$$@"' >> list_people_python
-+	@echo 'SCRIPT_DIR=$$(dirname $$0)' >> list_people_python
-+	@echo '$$SCRIPT_DIR/list_people.py "$$@"' >> list_people_python
- 	@chmod +x list_people_python
--- 
-1.9.3
-
diff --git a/recipes-containers/criu/files/run-ptest b/recipes-containers/criu/files/run-ptest
deleted file mode 100755
index a5a7b0f..0000000
--- a/recipes-containers/criu/files/run-ptest
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/bash
-DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
-TEST_FILE="/tmp/test.data"
-
-RETVAL=0
-# Test every writing test application
-for write_exe_full_path in ${DIR}/add_person_*; do
-	if [ -x "${write_exe_full_path}" ]; then
-		write_exe=`basename ${write_exe_full_path}`
-		echo "Generating new test file using ${write_exe}..."
-		${write_exe_full_path} "${TEST_FILE}"
-		RETVAL=$?
-
-		# Test every reading test application
-		for read_exe_full_path in ${DIR}/list_people_*; do
-			read_exe=`basename ${read_exe_full_path}`
-			echo "Test: Write with ${write_exe}; Read with ${read_exe}..."
-			if [ -x "${read_exe_full_path}" ]; then
-				${read_exe_full_path} "${TEST_FILE}"
-				RETVAL=$?
-			fi
-		done
-
-		# Cleanup...
-		if [ -e "${TEST_FILE}" ]; then
-			rm "${TEST_FILE}"
-		fi
-	fi
-done
-
-exit $RETVAL
-
diff --git a/recipes-containers/criu/protobuf-c_1.1.1.bb b/recipes-containers/criu/protobuf-c_1.1.1.bb
deleted file mode 100644
index 0d03ebe..0000000
--- a/recipes-containers/criu/protobuf-c_1.1.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "protobuf-c"
-DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
-HOMEPAGE = "http://code.google.com/p/protobuf-c/"
-SECTION = "console/tools"
-LICENSE = "Apache-2.0"
-
-LIC_FILES_CHKSUM = "file://protobuf-c/protobuf-c.c;endline=28;md5=0feb44cc63eacef97219b0174967492f"
-
-COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
-
-DEPENDS = "protobuf protobuf-c-native"
-
-SRC_URI[md5sum] = "41d437677ea16f9d3611d98841c4af3b"
-SRC_URI[sha256sum] = "09c5bb187b7a8e86bc0ff860f7df86370be9e8661cdb99c1072dcdab0763562c"
-SRC_URI = "https://github.com/protobuf-c/protobuf-c/releases/download/v1.1.1/protobuf-c-1.1.1.tar.gz "
-SRC_URI_append_class-target ="file://0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch"
-
-inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
-
-do_configure_prepend_class-target() {
-    export PKG_CONFIG_PATH="${STAGING_LIBDIR_NATIVE}/pkgconfig:${PKG_CONFIG_PATH}"
-}
-
-do_install_append_class-native() {
-    install -m 755 ${B}/t/generated-code2/cxx-generate-packed-data ${D}/${bindir}
-}
diff --git a/recipes-containers/criu/protobuf-native_2.6.1.bb b/recipes-containers/criu/protobuf-native_2.6.1.bb
deleted file mode 100644
index e88c9e7..0000000
--- a/recipes-containers/criu/protobuf-native_2.6.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "protobuf"
-DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
-an efficient yet extensible format. Google uses Protocol Buffers for \
-almost all of its internal RPC protocols and file formats."
-HOMEPAGE = "http://code.google.com/p/protobuf/"
-SECTION = "console/tools"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
-
-PR = "r0"
-
-SRC_URI[md5sum] = "af05b2cca289f7b86eef2734a0cdc8b9"
-SRC_URI[sha256sum] = "2667b7cda4a6bc8a09e5463adf3b5984e08d94e72338277affa8594d8b6e5cd1"
-SRC_URI = "https://github.com/google/protobuf/archive/v2.6.1.tar.gz;downloadfilename=protobuf-2.6.1.tar.gz \
-	"
-
-EXTRA_OECONF += " --with-protoc=echo --disable-shared"
-
-inherit native autotools
-
diff --git a/recipes-containers/criu/protobuf_2.6.1.bb b/recipes-containers/criu/protobuf_2.6.1.bb
deleted file mode 100644
index 1b7ab20..0000000
--- a/recipes-containers/criu/protobuf_2.6.1.bb
+++ /dev/null
@@ -1,97 +0,0 @@
-SUMMARY = "protobuf"
-DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
-an efficient yet extensible format. Google uses Protocol Buffers for \
-almost all of its internal RPC protocols and file formats."
-HOMEPAGE = "http://code.google.com/p/protobuf/"
-SECTION = "console/tools"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
-
-PR = "r0"
-EXCLUDE_FROM_WORLD = "1"
-
-SRC_URI[md5sum] = "af05b2cca289f7b86eef2734a0cdc8b9"
-SRC_URI[sha256sum] = "2667b7cda4a6bc8a09e5463adf3b5984e08d94e72338277affa8594d8b6e5cd1"
-SRC_URI = "https://github.com/google/protobuf/archive/v2.6.1.tar.gz;downloadfilename=protobuf-2.6.1.tar.gz\
-	file://protobuf-allow-running-python-scripts-from-anywhere.patch \
-	file://Omit-google-apputils-dependency.patch \
-	file://run-ptest"
-
-COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
-
-EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
-inherit autotools setuptools ptest
-
-DEPENDS += "protobuf-native"
-
-PYTHON_SRC_DIR="python"
-TEST_SRC_DIR="examples"
-LANG_SUPPORT="cpp python"
-
-do_compile() {
-	# Compile protoc compiler
-	base_do_compile
-}
-
-do_compile_ptest() {
-	# Modify makefile to use the cross-compiler
-	sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
-
-	mkdir -p "${B}/${TEST_SRC_DIR}"
-
-	# Add the location of the cross-compiled header and library files
-	# which haven't been installed yet.
-	cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
-
-	# Save the pkgcfg sysroot variable, and update it to nothing so
-	# that it doesn't append the sysroot to the beginning of paths.
-	# The header and library files aren't installed to the target
-	# system yet.  So the absolute paths were specified above.
-	save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
-	export PKG_CONFIG_SYSROOT_DIR=
-
-	# Compile the tests
-	for lang in ${LANG_SUPPORT}; do
-		oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
-	done
-
-	# Restore the pkgconfig sysroot variable
-	export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
-}
-
-do_install() {
-	local olddir=`pwd`
-
-	# Install protoc compiler
-	autotools_do_install
-
-	# Install header files
-	export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
-	cd "${S}/${PYTHON_SRC_DIR}"
-	distutils_do_install
-
-	cd "$olddir"
-}
-
-do_install_ptest() {
-	local olddir=`pwd`
-
-	cd "${S}/${TEST_SRC_DIR}"
-	install -d "${D}/${PTEST_PATH}"
-	for i in add_person* list_people*; do
-		if [ -x "$i" ]; then
-			install "$i" "${D}/${PTEST_PATH}"
-		fi
-	done
-	cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
-	
-	cd "$olddir"
-}
-
-BBCLASSEXTEND = "nativesdk"
-
-- 
2.7.4


