Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A83BE00C81; Wed,  7 Sep 2016 22:36:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF273E00C7C
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 22:36:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u885a4vp007397
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 7 Sep 2016 22:36:04 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 22:36:03 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 8 Sep 2016 01:35:59 -0400
Message-ID: <1473312960-115788-2-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1473312960-115788-1-git-send-email-jianchuan.wang@windriver.com>
References: <1473312960-115788-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] protobuf-c: uprev to 1.2.1 from 0.15
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
 recipes-devtools/protobuf/protobuf-c_0.15.bb  | 20 -------------------
 recipes-devtools/protobuf/protobuf-c_1.2.1.bb | 28 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 20 deletions(-)
 delete mode 100644 recipes-devtools/protobuf/protobuf-c_0.15.bb
 create mode 100644 recipes-devtools/protobuf/protobuf-c_1.2.1.bb

diff --git a/recipes-devtools/protobuf/protobuf-c_0.15.bb b/recipes-devtools/protobuf/protobuf-c_0.15.bb
deleted file mode 100644
index 4876d33..0000000
--- a/recipes-devtools/protobuf/protobuf-c_0.15.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "protobuf-c"
-DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
-HOMEPAGE = "http://code.google.com/p/protobuf-c/"
-SECTION = "console/tools"
-LICENSE = "Apache-2.0"
-
-LIC_FILES_CHKSUM = "file://src/google/protobuf-c/protobuf-c.c;endline=33;md5=333140fae7cf8a38dc5f980ddb63704b"
-
-PR = "r1"
-
-DEPENDS = "protobuf"
-
-SRC_URI[md5sum] = "73ff0c8df50d2eee75269ad8f8c07dc8"
-SRC_URI[sha256sum] = "8fcb538e13a5431c46168fc8f2e6ad2574e2db9b684c0c72b066e24f010a0036"
-SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/protobuf-c/protobuf-c-${PV}.tar.gz \
-        file://disable_tests.patch"
-
-inherit autotools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
new file mode 100644
index 0000000..ff2499e
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
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


