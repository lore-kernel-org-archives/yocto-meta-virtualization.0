Return-Path: <venkat.mandela@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 617BCE011AF; Wed,  7 Sep 2016 19:33:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DF8EE011AB
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 19:33:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u882WvpK021103;
	Wed, 7 Sep 2016 21:32:57 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u882WvkV027380;
	Wed, 7 Sep 2016 21:32:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 7 Sep 2016 21:32:57 -0500
Received: from uda0393778.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u882WqBw030483;	Wed, 7 Sep 2016 21:32:56 -0500
From: Venkateswara Rao Mandela <venkat.mandela@ti.com>
To: <meta-virtualization@yoctoproject.org>, <jianchuan.wang@windriver.com>
Date: Thu, 8 Sep 2016 08:02:34 +0530
Message-ID: <20160908023234.15453-3-venkat.mandela@ti.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160908023234.15453-1-venkat.mandela@ti.com>
References: <20160908023234.15453-1-venkat.mandela@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] protobuf-c: update 0.15 -> 1.2.1
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
X-List-Received-Date: Thu, 08 Sep 2016 02:33:03 -0000
Content-Type: text/plain

Following the same recipe organization as protobuf

1. Description, SRC URI and license checksum go into protobuf-c.inc
2. version specific checksums go into protobuf-c_1.2.1.inc
3. recipe for cross compilation goes into protobuf-c_1.2.1.bb

Signed-off-by: Venkateswara Rao Mandela <venkat.mandela@ti.com>
---
 recipes-devtools/protobuf/protobuf-c-1.2.1.inc |  4 ++++
 recipes-devtools/protobuf/protobuf-c.inc       | 11 +++++++++++
 recipes-devtools/protobuf/protobuf-c_1.2.1.bb  | 10 ++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 recipes-devtools/protobuf/protobuf-c-1.2.1.inc
 create mode 100644 recipes-devtools/protobuf/protobuf-c.inc
 create mode 100644 recipes-devtools/protobuf/protobuf-c_1.2.1.bb

diff --git a/recipes-devtools/protobuf/protobuf-c-1.2.1.inc b/recipes-devtools/protobuf/protobuf-c-1.2.1.inc
new file mode 100644
index 0000000..25e6be3
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf-c-1.2.1.inc
@@ -0,0 +1,4 @@
+require protobuf-c.inc
+
+SRC_URI[md5sum] = "b884aeba4283309445a8e3b6e7322dd6"
+SRC_URI[sha256sum] = "2d708fb3c024b9e6e86df141faff802194f5db90a4b79e6d4aa6bd61dd983dd6"
diff --git a/recipes-devtools/protobuf/protobuf-c.inc b/recipes-devtools/protobuf/protobuf-c.inc
new file mode 100644
index 0000000..15d1393
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf-c.inc
@@ -0,0 +1,11 @@
+SUMMARY = "protobuf-c"
+DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
+HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
+SECTION = "console/tools"
+LICENSE = "BSD-2-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
+
+SRC_URI = "https://github.com/protobuf-c/protobuf-c/archive/v${PV}.tar.gz \
+        "
+inherit autotools
diff --git a/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
new file mode 100644
index 0000000..a8c4628
--- /dev/null
+++ b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
@@ -0,0 +1,10 @@
+require protobuf-c-${PV}.inc
+
+DEPENDS = "protobuf"
+
+#SRC_URI += "file://disable_tests.patch \
+#        "
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.9.3


