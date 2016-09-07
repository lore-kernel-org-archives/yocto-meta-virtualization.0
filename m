Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5EA61E00FFC; Wed,  7 Sep 2016 01:10:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE833E00FFC
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 01:10:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u878A3YZ025711
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 7 Sep 2016 01:10:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 01:10:01 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 7 Sep 2016 04:09:57 -0400
Message-ID: <1473235798-3525-2-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
References: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] protobuf-c: uprev to 1.2.1 from 1.1.1
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
X-List-Received-Date: Wed, 07 Sep 2016 08:10:08 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 .../files/Omit-google-apputils-dependency.patch    | 25 -------------------
 .../recipes-containers/criu/protobuf-c_1.1.1.bb    | 28 ----------------------
 .../recipes-containers/criu/protobuf-c_1.2.1.bb    | 28 ++++++++++++++++++++++
 3 files changed, 28 insertions(+), 53 deletions(-)
 delete mode 100644 meta-virtualization/recipes-containers/criu/files/Omit-google-apputils-dependency.patch
 delete mode 100644 meta-virtualization/recipes-containers/criu/protobuf-c_1.1.1.bb
 create mode 100644 meta-virtualization/recipes-containers/criu/protobuf-c_1.2.1.bb

diff --git a/meta-virtualization/recipes-containers/criu/files/Omit-google-apputils-dependency.patch b/meta-virtualization/recipes-containers/criu/files/Omit-google-apputils-dependency.patch
deleted file mode 100644
index ef60fc0..0000000
--- a/meta-virtualization/recipes-containers/criu/files/Omit-google-apputils-dependency.patch
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
diff --git a/meta-virtualization/recipes-containers/criu/protobuf-c_1.1.1.bb b/meta-virtualization/recipes-containers/criu/protobuf-c_1.1.1.bb
deleted file mode 100644
index 0d03ebe..0000000
--- a/meta-virtualization/recipes-containers/criu/protobuf-c_1.1.1.bb
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
diff --git a/meta-virtualization/recipes-containers/criu/protobuf-c_1.2.1.bb b/meta-virtualization/recipes-containers/criu/protobuf-c_1.2.1.bb
new file mode 100644
index 0000000..ff2499e
--- /dev/null
+++ b/meta-virtualization/recipes-containers/criu/protobuf-c_1.2.1.bb
@@ -0,0 +1,28 @@
+SUMMARY = "protobuf-c"
+DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
+HOMEPAGE = "http://code.google.com/p/protobuf-c/"
+SECTION = "console/tools"
+LICENSE = "Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
+
+COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
+
+DEPENDS = "protobuf protobuf-c-native"
+
+SRC_URI[md5sum] = "e544249c329391fff512c3874895cfbe"
+SRC_URI[sha256sum] = "846eb4846f19598affdc349d817a8c4c0c68fd940303e6934725c889f16f00bd"
+SRC_URI = "https://github.com/protobuf-c/protobuf-c/releases/download/v1.2.1/protobuf-c-1.2.1.tar.gz "
+#SRC_URI_append_class-target ="file://0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_configure_prepend_class-target() {
+    export PKG_CONFIG_PATH="${STAGING_LIBDIR_NATIVE}/pkgconfig:${PKG_CONFIG_PATH}"
+}
+
+do_install_append_class-native() {
+    install -m 755 ${B}/t/generated-code2/cxx-generate-packed-data ${D}/${bindir}
+}
-- 
2.8.1


