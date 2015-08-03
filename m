Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36D9AE00461; Mon,  3 Aug 2015 02:58:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90311E00349
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Aug 2015 02:58:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99197819"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2015 18:01:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t739u7Et031252
	for <meta-virtualization@yoctoproject.org>;
	Mon, 3 Aug 2015 17:56:07 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 3 Aug 2015 17:58:00 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 3 Aug 2015 17:58:00 +0800
Message-ID: <1438595880-47411-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] python-sphinx: upgrade 1.2b1 -> 1.3.1
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
X-List-Received-Date: Mon, 03 Aug 2015 09:58:09 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-sphinx_1.2b1.bb => python-sphinx_1.3.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python-sphinx_1.2b1.bb => python-sphinx_1.3.1.bb} (58%)

diff --git a/recipes-devtools/python/python-sphinx_1.2b1.bb b/recipes-devtools/python/python-sphinx_1.3.1.bb
similarity index 58%
rename from recipes-devtools/python/python-sphinx_1.2b1.bb
rename to recipes-devtools/python/python-sphinx_1.3.1.bb
index acdba56..fe8ad94 100644
--- a/recipes-devtools/python/python-sphinx_1.2b1.bb
+++ b/recipes-devtools/python/python-sphinx_1.3.1.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=da9cf9fa4e0d0076dd4d116777ad401e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6dd095eaa1e7a662b279daf80ecad7e6"
 
 PR = "r0"
 SRCNAME = "Sphinx"
 
 SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "67bea6df63be8e2a76ebedc76d8f71a3"
-SRC_URI[sha256sum] = "16102b69e939d9ee60b05d694a804a83e3ce047c283f6b981a83573a75ea718d"
+SRC_URI[md5sum] = "8786a194acf9673464c5455b11fd4332"
+SRC_URI[sha256sum] = "1a6e5130c2b42d2de301693c299f78cc4bd3501e78b610c08e45efc70e2b5114"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


