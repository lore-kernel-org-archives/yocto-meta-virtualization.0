Return-Path: <venkat.mandela@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E643E00C05; Fri,  2 Sep 2016 20:20:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8E20E00BEB
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Sep 2016 20:20:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u833K1ms005602
	for <meta-virtualization@yoctoproject.org>;
	Fri, 2 Sep 2016 22:20:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u833K1c0031055
	for <meta-virtualization@yoctoproject.org>;
	Fri, 2 Sep 2016 22:20:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 2 Sep 2016 22:20:00 -0500
Received: from uda0393778.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u833JxYF024734;	Fri, 2 Sep 2016 22:20:00 -0500
From: Venkateswara Rao Mandela <venkat.mandela@ti.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sat, 3 Sep 2016 08:49:36 +0530
Message-ID: <20160903031936.7436-1-venkat.mandela@ti.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] protobuf: fix source location
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
X-List-Received-Date: Sat, 03 Sep 2016 03:20:06 -0000
Content-Type: text/plain

The file locations listed in the recipes for protobuf, protobuf-c
are not currently available. Updating the recipe to

1. Point URI's to valid locations.
2. Update checksums and increment version numbers.

Signed-off-by: Venkateswara Rao Mandela <venkat.mandela@ti.com>
---
 recipes-devtools/protobuf/protobuf-c_0.15.bb       | 6 +++---
 recipes-devtools/protobuf/protobuf-native_2.5.0.bb | 8 ++++----
 recipes-devtools/protobuf/protobuf_2.5.0.bb        | 9 ++++-----
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/recipes-devtools/protobuf/protobuf-c_0.15.bb b/recipes-devtools/protobuf/protobuf-c_0.15.bb
index 91dcb3b..4876d33 100644
--- a/recipes-devtools/protobuf/protobuf-c_0.15.bb
+++ b/recipes-devtools/protobuf/protobuf-c_0.15.bb
@@ -6,14 +6,14 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://src/google/protobuf-c/protobuf-c.c;endline=33;md5=333140fae7cf8a38dc5f980ddb63704b"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "protobuf"
 
 SRC_URI[md5sum] = "73ff0c8df50d2eee75269ad8f8c07dc8"
 SRC_URI[sha256sum] = "8fcb538e13a5431c46168fc8f2e6ad2574e2db9b684c0c72b066e24f010a0036"
-SRC_URI = "http://protobuf-c.googlecode.com/files/protobuf-c-${PV}.tar.gz \
-	file://disable_tests.patch"
+SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/protobuf-c/protobuf-c-${PV}.tar.gz \
+        file://disable_tests.patch"
 
 inherit autotools
 
diff --git a/recipes-devtools/protobuf/protobuf-native_2.5.0.bb b/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
index 61b18a7..47acdae 100644
--- a/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
+++ b/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
@@ -8,11 +8,11 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
-SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
-SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
+SRC_URI[md5sum] = "9c21577a03adc1879aba5b52d06e25cf"
+SRC_URI[sha256sum] = "c2665a7aa2ac1a206e61b28e014486e3de59009ea2be2bde9182e0847f38b62f"
+SRC_URI = "https://github.com/google/protobuf/archive/v${PV}.tar.gz \
 	"
 
 EXTRA_OECONF += " --with-protoc=echo --disable-shared"
diff --git a/recipes-devtools/protobuf/protobuf_2.5.0.bb b/recipes-devtools/protobuf/protobuf_2.5.0.bb
index 23b74a7..b503a35 100644
--- a/recipes-devtools/protobuf/protobuf_2.5.0.bb
+++ b/recipes-devtools/protobuf/protobuf_2.5.0.bb
@@ -8,16 +8,15 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
 
-PR = "r0"
+PR = "r1"
 EXCLUDE_FROM_WORLD = "1"
 
-SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
-SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
-SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
+SRC_URI[md5sum] = "9c21577a03adc1879aba5b52d06e25cf"
+SRC_URI[sha256sum] = "c2665a7aa2ac1a206e61b28e014486e3de59009ea2be2bde9182e0847f38b62f"
+SRC_URI = "https://github.com/google/protobuf/archive/v${PV}.tar.gz \
 	file://protobuf-allow-running-python-scripts-from-anywhere.patch \
 	file://run-ptest"
 
-
 EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
 inherit autotools setuptools ptest
 
-- 
2.9.3


