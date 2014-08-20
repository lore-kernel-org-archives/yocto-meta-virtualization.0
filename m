Return-Path: <Keith.Holman@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66F54E00814; Wed, 20 Aug 2014 13:46:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F97AE0080C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Aug 2014 13:46:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7KKkKbC016095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Aug 2014 13:46:20 -0700 (PDT)
Received: from yow-kholman-lx1.wrs.com (128.224.56.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 20 Aug 2014 13:46:17 -0700
From: Keith Holman <Keith.Holman@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 20 Aug 2014 16:46:10 -0400
Message-ID: <1408567571-27481-4-git-send-email-Keith.Holman@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
References: <1408567571-27481-1-git-send-email-Keith.Holman@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.110]
Cc: keith.holman@windriver.com
Subject: [PATCH 4/5] protobuf: add examples when test feature enabled
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
X-List-Received-Date: Wed, 20 Aug 2014 20:46:25 -0000
Content-Type: text/plain

Google Protocol Buffers includes some basic example applications to
show its functionality.  This fix installs these examples to the
target system when the "test" feature is enabled in the configuration.

Signed-off-by: Keith Holman <Keith.Holman@windriver.com>
---
 ...llow-running-python-scripts-from-anywhere.patch | 38 +++++++++++++
 recipes-containers/criu/files/run-ptest            | 32 +++++++++++
 recipes-containers/criu/protobuf_2.5.0.bb          | 62 ++++++++++++++++++++--
 3 files changed, 128 insertions(+), 4 deletions(-)
 create mode 100644 recipes-containers/criu/files/protobuf-allow-running-python-scripts-from-anywhere.patch
 create mode 100755 recipes-containers/criu/files/run-ptest

diff --git a/recipes-containers/criu/files/protobuf-allow-running-python-scripts-from-anywhere.patch b/recipes-containers/criu/files/protobuf-allow-running-python-scripts-from-anywhere.patch
new file mode 100644
index 0000000..13d4e84
--- /dev/null
+++ b/recipes-containers/criu/files/protobuf-allow-running-python-scripts-from-anywhere.patch
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
diff --git a/recipes-containers/criu/files/run-ptest b/recipes-containers/criu/files/run-ptest
new file mode 100755
index 0000000..a5a7b0f
--- /dev/null
+++ b/recipes-containers/criu/files/run-ptest
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
diff --git a/recipes-containers/criu/protobuf_2.5.0.bb b/recipes-containers/criu/protobuf_2.5.0.bb
index 5cf6cc9..851fbf0 100644
--- a/recipes-containers/criu/protobuf_2.5.0.bb
+++ b/recipes-containers/criu/protobuf_2.5.0.bb
@@ -12,23 +12,77 @@ PR = "r0"
 
 SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
 SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
-SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
-PYTHON_SRC_DIR="python"
+SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
+	file://protobuf-allow-running-python-scripts-from-anywhere.patch \
+	file://run-ptest"
 
 EXTRA_OECONF += " --with-protoc=echo"
-inherit autotools setuptools
+inherit autotools setuptools ptest
+
+RDEPENDS_${PN}-ptest += "make"
+
+PYTHON_SRC_DIR="python"
+TEST_SRC_DIR="examples"
+LANG_SUPPORT="cpp python"
 
 do_compile() {
 	# Compile protoc compiler
 	base_do_compile
 }
 
+do_compile_ptest() {
+	# Modify makefile to use the cross-compiler
+	sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
+
+	# Add the location of the cross-compiled header and library files
+	# which haven't been installed yet.
+	cp "${S}/protobuf.pc" "${S}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${S}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -L${S}/src/.libs|' -i "${S}/${TEST_SRC_DIR}/protobuf.pc"
+	export PKG_CONFIG_PATH="${S}/${TEST_SRC_DIR}"
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
 do_install() {
+	local olddir=`pwd`
+
 	# Install protoc compiler
 	autotools_do_install
+
 	# Install header files
-	cd "${PYTHON_SRC_DIR}"
+	cd "${S}/${PYTHON_SRC_DIR}"
 	distutils_do_install
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
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.3


