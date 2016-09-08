Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 364D7E011F4; Wed,  7 Sep 2016 22:36:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23781E00C6E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 22:36:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u885a2o4016428
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 7 Sep 2016 22:36:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 22:36:01 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 8 Sep 2016 01:35:58 -0400
Message-ID: <1473312960-115788-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/3] protobuf: uprev 3.0.0 from 2.6.1
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
X-List-Received-Date: Thu, 08 Sep 2016 05:36:07 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 recipes-devtools/protobuf/protobuf-native_2.5.0.bb | 20 -----
 recipes-devtools/protobuf/protobuf-native_3.0.0.bb | 21 +++++
 recipes-devtools/protobuf/protobuf_2.5.0.bb        | 95 ---------------------
 recipes-devtools/protobuf/protobuf_3.0.0.bb        | 97 ++++++++++++++++++++++
 4 files changed, 118 insertions(+), 115 deletions(-)
 delete mode 100644 recipes-devtools/protobuf/protobuf-native_2.5.0.bb
 create mode 100644 recipes-devtools/protobuf/protobuf-native_3.0.0.bb
 delete mode 100644 recipes-devtools/protobuf/protobuf_2.5.0.bb
 create mode 100644 recipes-devtools/protobuf/protobuf_3.0.0.bb

diff --git a/recipes-devtools/protobuf/protobuf-native_2.5.0.bb b/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
deleted file mode 100644
index 47acdae..0000000
--- a/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "protobuf"
-DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
-an efficient yet extensible format. Google uses Protocol Buffers for \
-almost all of its internal RPC protocols and file formats."
-HOMEPAGE = "http://code.google.com/p/protobuf/"
-SECTION = "console/tools"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
-
-PR = "r1"
-
-SRC_URI[md5sum] = "9c21577a03adc1879aba5b52d06e25cf"
-SRC_URI[sha256sum] = "c2665a7aa2ac1a206e61b28e014486e3de59009ea2be2bde9182e0847f38b62f"
-SRC_URI = "https://github.com/google/protobuf/archive/v${PV}.tar.gz \
-	"
-
-EXTRA_OECONF += " --with-protoc=echo --disable-shared"
-
-inherit native autotools
diff --git a/recipes-devtools/protobuf/protobuf-native_3.0.0.bb b/recipes-devtools/protobuf/protobuf-native_3.0.0.bb
new file mode 100644
index 0000000..33467b3
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf-native_3.0.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "protobuf"
+DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
+an efficient yet extensible format. Google uses Protocol Buffers for \
+almost all of its internal RPC protocols and file formats."
+HOMEPAGE = "http://code.google.com/p/protobuf/"
+SECTION = "console/tools"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
+SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146"
+SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.gz;downloadfilename=protobuf-3.0.0.tar.gz \
+	"
+
+EXTRA_OECONF += " --with-protoc=echo --disable-shared"
+
+inherit native autotools
+
diff --git a/recipes-devtools/protobuf/protobuf_2.5.0.bb b/recipes-devtools/protobuf/protobuf_2.5.0.bb
deleted file mode 100644
index b503a35..0000000
--- a/recipes-devtools/protobuf/protobuf_2.5.0.bb
+++ /dev/null
@@ -1,95 +0,0 @@
-SUMMARY = "protobuf"
-DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
-an efficient yet extensible format. Google uses Protocol Buffers for \
-almost all of its internal RPC protocols and file formats."
-HOMEPAGE = "http://code.google.com/p/protobuf/"
-SECTION = "console/tools"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
-
-PR = "r1"
-EXCLUDE_FROM_WORLD = "1"
-
-SRC_URI[md5sum] = "9c21577a03adc1879aba5b52d06e25cf"
-SRC_URI[sha256sum] = "c2665a7aa2ac1a206e61b28e014486e3de59009ea2be2bde9182e0847f38b62f"
-SRC_URI = "https://github.com/google/protobuf/archive/v${PV}.tar.gz \
-	file://protobuf-allow-running-python-scripts-from-anywhere.patch \
-	file://run-ptest"
-
-EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
-inherit autotools setuptools ptest
-
-DEPENDS += "protobuf-native"
-RDEPENDS_${PN}-ptest = "bash python"
-
-PYTHON_SRC_DIR="python"
-TEST_SRC_DIR="examples"
-LANG_SUPPORT="python"
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
diff --git a/recipes-devtools/protobuf/protobuf_3.0.0.bb b/recipes-devtools/protobuf/protobuf_3.0.0.bb
new file mode 100644
index 0000000..e1deeac
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf_3.0.0.bb
@@ -0,0 +1,97 @@
+SUMMARY = "protobuf"
+DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
+an efficient yet extensible format. Google uses Protocol Buffers for \
+almost all of its internal RPC protocols and file formats."
+HOMEPAGE = "http://code.google.com/p/protobuf/"
+SECTION = "console/tools"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
+
+PR = "r0"
+EXCLUDE_FROM_WORLD = "1"
+
+SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
+SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146"
+SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.gz;downloadfilename=protobuf-3.0.0.tar.gz\
+	        file://protobuf-allow-running-python-scripts-from-anywhere.patch \
+	        file://run-ptest \
+            "
+
+COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
+
+EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
+inherit autotools setuptools ptest
+
+DEPENDS += "protobuf-native"
+
+PYTHON_SRC_DIR="python"
+TEST_SRC_DIR="examples"
+LANG_SUPPORT="cpp python"
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
2.8.1


