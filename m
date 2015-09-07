Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9905EE00C57; Sun,  6 Sep 2015 22:39:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21806E00AFD
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Sep 2015 22:39:33 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t875dXLI007674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 6 Sep 2015 22:39:33 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sun, 6 Sep 2015 22:39:32 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 7 Sep 2015 13:29:56 +0800
Message-ID: <1441603797-10160-2-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441603797-10160-1-git-send-email-jianchuan.wang@windriver.com>
References: <1441603797-10160-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] protobuf-c: upgrade 0.15 -> 1.1.1
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
X-List-Received-Date: Mon, 07 Sep 2015 05:39:36 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 ...Remove-the-rules-which-depend-on-the-nati.patch | 46 ++++++++++++++++++++++
 recipes-containers/criu/protobuf-c_0.15.bb         | 22 -----------
 recipes-containers/criu/protobuf-c_1.1.1.bb        | 24 +++++++++++
 3 files changed, 70 insertions(+), 22 deletions(-)
 create mode 100644 recipes-containers/criu/files/0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch
 delete mode 100644 recipes-containers/criu/protobuf-c_0.15.bb
 create mode 100644 recipes-containers/criu/protobuf-c_1.1.1.bb

diff --git a/recipes-containers/criu/files/0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch b/recipes-containers/criu/files/0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch
new file mode 100644
index 0000000..b6fbf01
--- /dev/null
+++ b/recipes-containers/criu/files/0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch
@@ -0,0 +1,46 @@
+From 81bc5928cdc1b432656eb6590967306d8cf3ac9d Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Tue, 4 Aug 2015 10:22:21 +0800
+Subject: [PATCH] protobuf-c: Remove the rules which depend on the native
+ command
+
+Those rules are not for cross-compile since the command protoc-c/cxx-generate-packed-data
+need be executed to generate some local files in the compiling processing.
+
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ Makefile.am | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 310aa09..0602e96 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -148,17 +148,18 @@ t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
+ t_generated_code2_cxx_generate_packed_data_LDADD = \
+ 	$(protobuf_LIBS)
+ 
+-t/test.pb-c.c t/test.pb-c.h: $(top_builddir)/protoc-c/protoc-c$(EXEEXT) $(top_srcdir)/t/test.proto
+-	$(AM_V_GEN)$(top_builddir)/protoc-c/protoc-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test.proto
++t/test.pb-c.c t/test.pb-c.h: $(top_srcdir)/t/test.proto
++	$(AM_V_GEN)protoc-c -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test.proto
+ 
+-t/test-full.pb-c.c t/test-full.pb-c.h: $(top_builddir)/protoc-c/protoc-c$(EXEEXT) $(top_srcdir)/t/test-full.proto
+-	$(AM_V_GEN)$(top_builddir)/protoc-c/protoc-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
++t/test-full.pb-c.c t/test-full.pb-c.h: $(top_srcdir)/t/test-full.proto
++	$(AM_V_GEN)protoc-c -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
+ 
+ t/test-full.pb.cc t/test-full.pb.h: @PROTOC@ $(top_srcdir)/t/test-full.proto
+ 	$(AM_V_GEN)@PROTOC@ -I$(top_srcdir) --cpp_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
+ 
+-t/generated-code2/test-full-cxx-output.inc: t/generated-code2/cxx-generate-packed-data$(EXEEXT)
+-	$(AM_V_GEN)$(top_builddir)/t/generated-code2/cxx-generate-packed-data$(EXEEXT) > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
++t/generated-code2/test-full-cxx-output.inc: 
++	mkdir -p $(top_builddir)/t/generated-code2
++	$(AM_V_GEN)cxx-generate-packed-data > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
+ 
+ BUILT_SOURCES += \
+ 	t/test.pb-c.c t/test.pb-c.h \
+-- 
+1.9.1
+
diff --git a/recipes-containers/criu/protobuf-c_0.15.bb b/recipes-containers/criu/protobuf-c_0.15.bb
deleted file mode 100644
index 5d65c69..0000000
--- a/recipes-containers/criu/protobuf-c_0.15.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "protobuf-c"
-DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
-HOMEPAGE = "http://code.google.com/p/protobuf-c/"
-SECTION = "console/tools"
-LICENSE = "Apache-2.0"
-
-LIC_FILES_CHKSUM = "file://src/google/protobuf-c/protobuf-c.c;endline=33;md5=333140fae7cf8a38dc5f980ddb63704b"
-
-PR = "r0"
-
-COMPATIBLE_HOST = "(x86_64|arm).*-linux"
-
-DEPENDS = "protobuf"
-
-SRC_URI[md5sum] = "73ff0c8df50d2eee75269ad8f8c07dc8"
-SRC_URI[sha256sum] = "8fcb538e13a5431c46168fc8f2e6ad2574e2db9b684c0c72b066e24f010a0036"
-SRC_URI = "http://protobuf-c.googlecode.com/files/protobuf-c-${PV}.tar.gz \
-	file://disable_tests.patch"
-
-inherit autotools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-containers/criu/protobuf-c_1.1.1.bb b/recipes-containers/criu/protobuf-c_1.1.1.bb
new file mode 100644
index 0000000..8c2d2b7
--- /dev/null
+++ b/recipes-containers/criu/protobuf-c_1.1.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "protobuf-c"
+DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
+HOMEPAGE = "http://code.google.com/p/protobuf-c/"
+SECTION = "console/tools"
+LICENSE = "Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://protobuf-c/protobuf-c.c;endline=28;md5=0feb44cc63eacef97219b0174967492f"
+
+COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
+
+DEPENDS = "protobuf protobuf-c-native"
+
+SRC_URI[md5sum] = "41d437677ea16f9d3611d98841c4af3b"
+SRC_URI[sha256sum] = "09c5bb187b7a8e86bc0ff860f7df86370be9e8661cdb99c1072dcdab0763562c"
+SRC_URI = "https://github.com/protobuf-c/protobuf-c/releases/download/v1.1.1/protobuf-c-1.1.1.tar.gz "
+SRC_URI_append_class-target ="file://0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install_append_class-native() {
+    install -m 755 ${B}/t/generated-code2/cxx-generate-packed-data ${D}/${bindir}
+}
-- 
1.9.1


