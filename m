Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5848E00B93; Mon, 26 Jun 2017 02:15:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C56FE00B63
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Jun 2017 02:15:32 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5Q9FRCS016651
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Jun 2017 02:15:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Jun 2017 02:15:27 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Jun 2017 17:08:26 +0800
Message-ID: <1498468106-8846-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] protobuf protobuf-c: Remove COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 26 Jun 2017 09:15:35 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

protobuf and protobuf-c can actually work with all arches but they were
limited and merged upstream by 5e5e09a18199108de29bfee101c7b311ef094d94

This patch removes the COMPATIBLE_HOST to re-enable them to work with
other architectures.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-devtools/protobuf/protobuf-c_1.2.1.bb | 2 --
 recipes-devtools/protobuf/protobuf_3.1.0.bb   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
index ff2499e..daba0ed 100644
--- a/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
+++ b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
@@ -6,8 +6,6 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
 
-COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
-
 DEPENDS = "protobuf protobuf-c-native"
 
 SRC_URI[md5sum] = "e544249c329391fff512c3874895cfbe"
diff --git a/recipes-devtools/protobuf/protobuf_3.1.0.bb b/recipes-devtools/protobuf/protobuf_3.1.0.bb
index 78b0d60..7d6698d 100644
--- a/recipes-devtools/protobuf/protobuf_3.1.0.bb
+++ b/recipes-devtools/protobuf/protobuf_3.1.0.bb
@@ -19,8 +19,6 @@ SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.gz;downloadfile
 	        file://run-ptest \
             "
 
-COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
-
 EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
 inherit autotools setuptools ptest
 
-- 
2.8.1


