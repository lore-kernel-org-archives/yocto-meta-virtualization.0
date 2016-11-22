Return-Path: <Wenzong.Fan@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35812E00AAB; Tue, 22 Nov 2016 00:41:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 046B3E0080D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 00:41:28 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAM8fQlO017505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 00:41:27 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 00:41:26 -0800
From: <wenzong.fan@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 22 Nov 2016 03:41:24 -0500
Message-ID: <1479804084-192343-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] protobuf: uprev 3.1.0 from 3.0.0
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
X-List-Received-Date: Tue, 22 Nov 2016 08:41:33 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../protobuf/{protobuf-native_3.0.0.bb => protobuf-native_3.1.0.bb} | 6 +++---
 recipes-devtools/protobuf/{protobuf_3.0.0.bb => protobuf_3.1.0.bb}  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename recipes-devtools/protobuf/{protobuf-native_3.0.0.bb => protobuf-native_3.1.0.bb} (66%)
 rename recipes-devtools/protobuf/{protobuf_3.0.0.bb => protobuf_3.1.0.bb} (91%)

diff --git a/recipes-devtools/protobuf/protobuf-native_3.0.0.bb b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
similarity index 66%
rename from recipes-devtools/protobuf/protobuf-native_3.0.0.bb
rename to recipes-devtools/protobuf/protobuf-native_3.1.0.bb
index 33467b3..47fb401 100644
--- a/recipes-devtools/protobuf/protobuf-native_3.0.0.bb
+++ b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 
 PR = "r0"
 
-SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
-SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146"
-SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.gz;downloadfilename=protobuf-3.0.0.tar.gz \
+SRC_URI[md5sum] = "14a532a7538551d5def317bfca41dace"
+SRC_URI[sha256sum] = "0a0ae63cbffc274efb573bdde9a253e3f32e458c41261df51c5dbc5ad541e8f7"
+SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.gz;downloadfilename=protobuf-3.1.0.tar.gz \
 	"
 
 EXTRA_OECONF += " --with-protoc=echo --disable-shared"
diff --git a/recipes-devtools/protobuf/protobuf_3.0.0.bb b/recipes-devtools/protobuf/protobuf_3.1.0.bb
similarity index 91%
rename from recipes-devtools/protobuf/protobuf_3.0.0.bb
rename to recipes-devtools/protobuf/protobuf_3.1.0.bb
index fd81fe7..b948e66 100644
--- a/recipes-devtools/protobuf/protobuf_3.0.0.bb
+++ b/recipes-devtools/protobuf/protobuf_3.1.0.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 PR = "r0"
 EXCLUDE_FROM_WORLD = "1"
 
-SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
-SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146"
-SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.gz;downloadfilename=protobuf-3.0.0.tar.gz\
+SRC_URI[md5sum] = "14a532a7538551d5def317bfca41dace"
+SRC_URI[sha256sum] = "0a0ae63cbffc274efb573bdde9a253e3f32e458c41261df51c5dbc5ad541e8f7"
+SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.gz;downloadfilename=protobuf-3.1.0.tar.gz\
 	        file://protobuf-allow-running-python-scripts-from-anywhere.patch \
 	        file://run-ptest \
             "
-- 
2.8.1


