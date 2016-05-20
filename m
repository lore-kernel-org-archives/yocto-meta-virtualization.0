Return-Path: <Zumeng.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9634EE00ED2; Thu, 19 May 2016 23:57:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B05AE00ECC
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:57:32 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4K6vV8g017740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 23:57:32 -0700 (PDT)
Received: from ala-git.wrs.com (147.11.178.22) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 23:57:31 -0700
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Thu, 19 May 2016 23:57:28 -0700
Message-ID: <1463727448-32195-3-git-send-email-zumeng.chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1463727448-32195-1-git-send-email-zumeng.chen@windriver.com>
References: <1463727448-32195-1-git-send-email-zumeng.chen@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 2/2] protobuf: add protobuf-2.5.0 into devtool
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

Protocol Buffers(a.k.a., protobuf) are language-neutral, platform-neutral,
extensible mechanism for serializing structured data, so it is reasonable
to be a part of development tool recipe.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---
 .../protobuf/files/disable_tests.patch             | 19 +++++
 ...llow-running-python-scripts-from-anywhere.patch | 38 +++++++++
 recipes-devtools/protobuf/files/run-ptest          | 32 ++++++++
 recipes-devtools/protobuf/protobuf-c_0.15.bb       | 20 +++++
 recipes-devtools/protobuf/protobuf-native_2.5.0.bb | 20 +++++
 recipes-devtools/protobuf/protobuf_2.5.0.bb        | 95 ++++++++++++++++++++++
 6 files changed, 224 insertions(+)
 create mode 100644 recipes-devtools/protobuf/files/disable_tests.patch
 create mode 100644 recipes-devtools/protobuf/files/protobuf-allow-running-python-scripts-from-anywhere.patch
 create mode 100755 recipes-devtools/protobuf/files/run-ptest
 create mode 100644 recipes-devtools/protobuf/protobuf-c_0.15.bb
 create mode 100644 recipes-devtools/protobuf/protobuf-native_2.5.0.bb
 create mode 100644 recipes-devtools/protobuf/protobuf_2.5.0.bb

diff --git a/recipes-devtools/protobuf/files/disable_tests.patch b/recipes-devtools/protobuf/files/disable_tests.patch
new file mode 100644
index 0000000..f5e71ca
--- /dev/null
+++ b/recipes-devtools/protobuf/files/disable_tests.patch
@@ -0,0 +1,19 @@
+diff -Naur protobuf-c-0.15.old/src/Makefile.am protobuf-c-0.15/src/Makefile.am
+--- protobuf-c-0.15.old/src/Makefile.am	2012-11-28 14:59:57.845251943 +0100
++++ protobuf-c-0.15/src/Makefile.am	2012-11-28 15:00:23.549252632 +0100
+@@ -1,5 +1,5 @@
+ if BUILD_PROTOC_C
+-SUBDIRS = . test
++
+ bin_PROGRAMS = protoc-c
+ protoc_c_SOURCES = \
+ google/protobuf/compiler/c/c_service.cc \
+@@ -23,7 +23,7 @@
+ lib_LTLIBRARIES = libprotobuf-c.la
+ protobufcincludedir = $(includedir)/google/protobuf-c
+
+-EXTRA_DIST = CMakeLists.txt test/CMakeLists.txt
++EXTRA_DIST = CMakeLists.txt
+
+ libprotobuf_c_la_SOURCES = \
+ google/protobuf-c/protobuf-c-dispatch.c \
diff --git a/recipes-devtools/protobuf/files/protobuf-allow-running-python-scripts-from-anywhere.patch b/recipes-devtools/protobuf/files/protobuf-allow-running-python-scripts-from-anywhere.patch
new file mode 100644
index 0000000..8b29342
--- /dev/null
+++ b/recipes-devtools/protobuf/files/protobuf-allow-running-python-scripts-from-anywhere.patch
@@ -0,0 +1,38 @@
+From 46e331263eb92e47510e88478b255f226d30245c Mon Sep 17 00:00:00 2001
+From: Keith Holman <Keith.Holman@windriver.com>
+Date: Mon, 18 Aug 2014 15:19:35 -0400
+Subject: [PATCH] protobuf: allow running python scripts from anywhere
+
+The Makefile to generate the examples with Google Protocol Buffers
+generates some scripts for python.  However, these generated scripts
+only work if they are ran in the same directory as the source files.
+This fix generates scripts to execute from anywhere on the system.
+
+Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
+---
+ examples/Makefile | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/examples/Makefile b/examples/Makefile
+index 8dc9083..a993d63 100644
+--- a/examples/Makefile
++++ b/examples/Makefile
+@@ -48,11 +48,13 @@ list_people_java: javac_middleman
+ add_person_python: add_person.py protoc_middleman
+ 	@echo "Writing shortcut script add_person_python..."
+ 	@echo '#! /bin/sh' > add_person_python
+-	@echo './add_person.py "$$@"' >> add_person_python
++	@echo 'SCRIPT_DIR=$$(dirname $$0)' >> add_person_python
++	@echo '$$SCRIPT_DIR/add_person.py "$$@"' >> add_person_python
+ 	@chmod +x add_person_python
+
+ list_people_python: list_people.py protoc_middleman
+ 	@echo "Writing shortcut script list_people_python..."
+ 	@echo '#! /bin/sh' > list_people_python
+-	@echo './list_people.py "$$@"' >> list_people_python
++	@echo 'SCRIPT_DIR=$$(dirname $$0)' >> list_people_python
++	@echo '$$SCRIPT_DIR/list_people.py "$$@"' >> list_people_python
+ 	@chmod +x list_people_python
+--
+1.9.3
+
diff --git a/recipes-devtools/protobuf/files/run-ptest b/recipes-devtools/protobuf/files/run-ptest
new file mode 100755
index 0000000..a5a7b0f
--- /dev/null
+++ b/recipes-devtools/protobuf/files/run-ptest
@@ -0,0 +1,32 @@
+#!/bin/bash
+DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
+TEST_FILE="/tmp/test.data"
+
+RETVAL=0
+# Test every writing test application
+for write_exe_full_path in ${DIR}/add_person_*; do
+	if [ -x "${write_exe_full_path}" ]; then
+		write_exe=`basename ${write_exe_full_path}`
+		echo "Generating new test file using ${write_exe}..."
+		${write_exe_full_path} "${TEST_FILE}"
+		RETVAL=$?
+
+		# Test every reading test application
+		for read_exe_full_path in ${DIR}/list_people_*; do
+			read_exe=`basename ${read_exe_full_path}`
+			echo "Test: Write with ${write_exe}; Read with ${read_exe}..."
+			if [ -x "${read_exe_full_path}" ]; then
+				${read_exe_full_path} "${TEST_FILE}"
+				RETVAL=$?
+			fi
+		done
+
+		# Cleanup...
+		if [ -e "${TEST_FILE}" ]; then
+			rm "${TEST_FILE}"
+		fi
+	fi
+done
+
+exit $RETVAL
+
diff --git a/recipes-devtools/protobuf/protobuf-c_0.15.bb b/recipes-devtools/protobuf/protobuf-c_0.15.bb
new file mode 100644
index 0000000..91dcb3b
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf-c_0.15.bb
@@ -0,0 +1,20 @@
+SUMMARY = "protobuf-c"
+DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
+HOMEPAGE = "http://code.google.com/p/protobuf-c/"
+SECTION = "console/tools"
+LICENSE = "Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://src/google/protobuf-c/protobuf-c.c;endline=33;md5=333140fae7cf8a38dc5f980ddb63704b"
+
+PR = "r0"
+
+DEPENDS = "protobuf"
+
+SRC_URI[md5sum] = "73ff0c8df50d2eee75269ad8f8c07dc8"
+SRC_URI[sha256sum] = "8fcb538e13a5431c46168fc8f2e6ad2574e2db9b684c0c72b066e24f010a0036"
+SRC_URI = "http://protobuf-c.googlecode.com/files/protobuf-c-${PV}.tar.gz \
+	file://disable_tests.patch"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-devtools/protobuf/protobuf-native_2.5.0.bb b/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
new file mode 100644
index 0000000..61b18a7
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "protobuf"
+DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
+an efficient yet extensible format. Google uses Protocol Buffers for \
+almost all of its internal RPC protocols and file formats."
+HOMEPAGE = "http://code.google.com/p/protobuf/"
+SECTION = "console/tools"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
+SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
+SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
+	"
+
+EXTRA_OECONF += " --with-protoc=echo --disable-shared"
+
+inherit native autotools
diff --git a/recipes-devtools/protobuf/protobuf_2.5.0.bb b/recipes-devtools/protobuf/protobuf_2.5.0.bb
new file mode 100644
index 0000000..e1c7254
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf_2.5.0.bb
@@ -0,0 +1,95 @@
+SUMMARY = "protobuf"
+DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
+an efficient yet extensible format. Google uses Protocol Buffers for \
+almost all of its internal RPC protocols and file formats."
+HOMEPAGE = "http://code.google.com/p/protobuf/"
+SECTION = "console/tools"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
+
+PR = "r0"
+EXCLUDE_FROM_WORLD = "1"
+
+SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
+SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
+SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
+	file://protobuf-allow-running-python-scripts-from-anywhere.patch \
+	file://run-ptest"
+
+
+EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
+inherit autotools setuptools ptest
+
+DEPENDS += "protobuf-native"
+
+PYTHON_SRC_DIR="python"
+TEST_SRC_DIR="examples"
+LANG_SUPPORT="python"
+
+do_compile() {
+	# Compile protoc compiler
+	base_do_compile
+}
+
+do_compile_ptest() {
+	# Modify makefile to use the cross-compiler
+	sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
+
+	mkdir -p "${B}/${TEST_SRC_DIR}"
+
+	# Add the location of the cross-compiled header and library files
+	# which haven't been installed yet.
+	cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
+
+	# Save the pkgcfg sysroot variable, and update it to nothing so
+	# that it doesn't append the sysroot to the beginning of paths.
+	# The header and library files aren't installed to the target
+	# system yet.  So the absolute paths were specified above.
+	save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
+	export PKG_CONFIG_SYSROOT_DIR=
+
+	# Compile the tests
+	for lang in ${LANG_SUPPORT}; do
+		oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
+	done
+
+	# Restore the pkgconfig sysroot variable
+	export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
+}
+
+do_install() {
+	local olddir=`pwd`
+
+	# Install protoc compiler
+	autotools_do_install
+
+	# Install header files
+	export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
+	cd "${S}/${PYTHON_SRC_DIR}"
+	distutils_do_install
+
+	cd "$olddir"
+}
+
+do_install_ptest() {
+	local olddir=`pwd`
+
+	cd "${S}/${TEST_SRC_DIR}"
+	install -d "${D}/${PTEST_PATH}"
+	for i in add_person* list_people*; do
+		if [ -x "$i" ]; then
+			install "$i" "${D}/${PTEST_PATH}"
+		fi
+	done
+	cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
+
+	cd "$olddir"
+}
+
+BBCLASSEXTEND = "nativesdk"
+
-- 
2.7.4


