Return-Path: <venkat.mandela@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14FDEE011AC; Wed,  7 Sep 2016 19:33:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E516DE011A9
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 19:32:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u882Wuae021098;
	Wed, 7 Sep 2016 21:32:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u882WtdX000703;
	Wed, 7 Sep 2016 21:32:56 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 7 Sep 2016 21:32:55 -0500
Received: from uda0393778.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u882WqBv030483;	Wed, 7 Sep 2016 21:32:54 -0500
From: Venkateswara Rao Mandela <venkat.mandela@ti.com>
To: <meta-virtualization@yoctoproject.org>, <jianchuan.wang@windriver.com>
Date: Thu, 8 Sep 2016 08:02:33 +0530
Message-ID: <20160908023234.15453-2-venkat.mandela@ti.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160908023234.15453-1-venkat.mandela@ti.com>
References: <20160908023234.15453-1-venkat.mandela@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] protobuf: update 2.5.0 -> 3.0.2
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
X-List-Received-Date: Thu, 08 Sep 2016 02:33:02 -0000
Content-Type: text/plain

- Create a separate file for 3.0.2 protobuf. This is the latest version
as on Sep 8 2016.

Mimic the recipe organization used by m4 (oe-core/meta/recipes-devtools/m4)

- Move the description,source URI and license checksum to protobuf.inc
- Move tar ball checksum into protobuf-3.0.2.inc
- Create a separate recipes for native and cross compilation

Signed-off-by: Venkateswara Rao Mandela <venkat.mandela@ti.com>
---
 recipes-devtools/protobuf/protobuf-3.0.2.inc       |  4 ++
 recipes-devtools/protobuf/protobuf-native_3.0.2.bb |  5 ++
 recipes-devtools/protobuf/protobuf.inc             | 14 ++++
 recipes-devtools/protobuf/protobuf_3.0.2.bb        | 82 ++++++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 recipes-devtools/protobuf/protobuf-3.0.2.inc
 create mode 100644 recipes-devtools/protobuf/protobuf-native_3.0.2.bb
 create mode 100644 recipes-devtools/protobuf/protobuf.inc
 create mode 100644 recipes-devtools/protobuf/protobuf_3.0.2.bb

diff --git a/recipes-devtools/protobuf/protobuf-3.0.2.inc b/recipes-devtools/protobuf/protobuf-3.0.2.inc
new file mode 100644
index 0000000..d64b1ff
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf-3.0.2.inc
@@ -0,0 +1,4 @@
+require protobuf.inc
+
+SRC_URI[md5sum] = "845b39e4b7681a2ddfd8c7f528299fbb"
+SRC_URI[sha256sum] = "b700647e11556b643ccddffd1f41d8cb7704ed02090af54cc517d44d912d11c1"
diff --git a/recipes-devtools/protobuf/protobuf-native_3.0.2.bb b/recipes-devtools/protobuf/protobuf-native_3.0.2.bb
new file mode 100644
index 0000000..1104d94
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf-native_3.0.2.bb
@@ -0,0 +1,5 @@
+require protobuf-${PV}.inc
+
+EXTRA_OECONF += " --with-protoc=echo --disable-shared"
+
+inherit native autotools
diff --git a/recipes-devtools/protobuf/protobuf.inc b/recipes-devtools/protobuf/protobuf.inc
new file mode 100644
index 0000000..2778037
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf.inc
@@ -0,0 +1,14 @@
+SUMMARY = "protobuf"
+DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
+an efficient yet extensible format. Google uses Protocol Buffers for \
+almost all of its internal RPC protocols and file formats."
+HOMEPAGE = "https://github.com/google/protobuf/"
+SECTION = "console/tools"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
+
+inherit autotools
+
+SRC_URI = "https://github.com/google/protobuf/archive/v${PV}.tar.gz \
+        "
diff --git a/recipes-devtools/protobuf/protobuf_3.0.2.bb b/recipes-devtools/protobuf/protobuf_3.0.2.bb
new file mode 100644
index 0000000..779ce6e
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf_3.0.2.bb
@@ -0,0 +1,82 @@
+require protobuf-${PV}.inc
+
+EXCLUDE_FROM_WORLD = "1"
+
+SRC_URI += "file://protobuf-allow-running-python-scripts-from-anywhere.patch \
+        file://run-ptest"
+
+EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
+inherit autotools setuptools ptest
+
+DEPENDS += "protobuf-native"
+RDEPENDS_${PN}-ptest = "bash python"
+
+PYTHON_SRC_DIR="python"
+TEST_SRC_DIR="examples"
+LANG_SUPPORT="python"
+
+do_compile() {
+        # Compile protoc compiler
+        base_do_compile
+}
+
+do_compile_ptest() {
+        # Modify makefile to use the cross-compiler
+        sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
+
+        mkdir -p "${B}/${TEST_SRC_DIR}"
+
+        # Add the location of the cross-compiled header and library files
+        # which haven't been installed yet.
+        cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
+        sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+        sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+        sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+        export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
+
+        # Save the pkgcfg sysroot variable, and update it to nothing so
+        # that it doesn't append the sysroot to the beginning of paths.
+        # The header and library files aren't installed to the target
+        # system yet.  So the absolute paths were specified above.
+        save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
+        export PKG_CONFIG_SYSROOT_DIR=
+
+        # Compile the tests
+        for lang in ${LANG_SUPPORT}; do
+                oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
+        done
+
+        # Restore the pkgconfig sysroot variable
+        export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
+}
+
+do_install() {
+        local olddir=`pwd`
+
+        # Install protoc compiler
+        autotools_do_install
+
+        # Install header files
+        export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
+        cd "${S}/${PYTHON_SRC_DIR}"
+        distutils_do_install
+
+        cd "$olddir"
+}
+
+do_install_ptest() {
+        local olddir=`pwd`
+
+        cd "${S}/${TEST_SRC_DIR}"
+        install -d "${D}/${PTEST_PATH}"
+        for i in add_person* list_people*; do
+                if [ -x "$i" ]; then
+                        install "$i" "${D}/${PTEST_PATH}"
+                fi
+        done
+        cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
+
+        cd "$olddir"
+}
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.9.3


