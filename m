Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABBC1E00D95; Mon,  8 Feb 2016 07:01:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 464E4E00D91
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Feb 2016 07:01:35 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u18F1F8g021087
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 8 Feb 2016 07:01:34 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Feb 2016 07:01:18 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 8 Feb 2016 10:01:18 -0500
Message-ID: <1454943678-4827-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] python-six: uprev to latest
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
X-List-Received-Date: Mon, 08 Feb 2016 15:01:37 -0000
Content-Type: text/plain

The openstack layer requires a version of six >= 1.9.0

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/{python-requests_2.3.0.bb => python-requests_2.8.1.bb}  | 7 +++----
 .../python/{python-six_1.7.3.bb => python-six_1.10.0.bb}           | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename recipes-devtools/python/{python-requests_2.3.0.bb => python-requests_2.8.1.bb} (78%)
 rename recipes-devtools/python/{python-six_1.7.3.bb => python-six_1.10.0.bb} (57%)

diff --git a/recipes-devtools/python/python-requests_2.3.0.bb b/recipes-devtools/python/python-requests_2.8.1.bb
similarity index 78%
rename from recipes-devtools/python/python-requests_2.3.0.bb
rename to recipes-devtools/python/python-requests_2.8.1.bb
index 6f38bf1..187f97a 100644
--- a/recipes-devtools/python/python-requests_2.3.0.bb
+++ b/recipes-devtools/python/python-requests_2.8.1.bb
@@ -14,15 +14,14 @@ DESCRIPTION = "\
   "
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
 
-PR = "r0"
 SRCNAME = "requests"
 
 SRC_URI = "http://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "7449ffdc8ec9ac37bbcd286003c80f00"
-SRC_URI[sha256sum] = "1c1473875d846fe563d70868acf05b1953a4472f4695b7b3566d1d978957b8fc"
+SRC_URI[md5sum] = "a27ea3d72d7822906ddce5e252d6add9"
+SRC_URI[sha256sum] = "84fe8d5bf4dcdcc49002446c47a146d17ac10facf00d9086659064ac43b6c25b"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
diff --git a/recipes-devtools/python/python-six_1.7.3.bb b/recipes-devtools/python/python-six_1.10.0.bb
similarity index 57%
rename from recipes-devtools/python/python-six_1.7.3.bb
rename to recipes-devtools/python/python-six_1.10.0.bb
index 07dcafd..a84a4c4 100644
--- a/recipes-devtools/python/python-six_1.7.3.bb
+++ b/recipes-devtools/python/python-six_1.10.0.bb
@@ -2,16 +2,15 @@ DESCRIPTION = "Python 2 and 3 compatibility utilities"
 HOMEPAGE = "http://pypi.python.org/pypi/six/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=530f34047c21ad45b3199946dd90bea5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
 
-PR = "r1"
 SRCNAME = "six"
 
 SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "784c6e5541c3c4952de9c0a966a0a80b"
-SRC_URI[sha256sum] = "7a842c9f882c0b2ab1064d567bb9fff6a21c9efbc3d9992083ad6193787ed393"
+SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
+SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.4


