Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68EA4E00461; Mon,  3 Aug 2015 02:43:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2AEAE00349
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Aug 2015 02:43:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99197200"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2015 17:46:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t739fESp030462
	for <meta-virtualization@yoctoproject.org>;
	Mon, 3 Aug 2015 17:41:14 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 3 Aug 2015 17:43:07 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 3 Aug 2015 17:43:05 +0800
Message-ID: <1438594985-47259-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] python-sqlalchemy upgrade 0.9.7->1.0.8
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
X-List-Received-Date: Mon, 03 Aug 2015 09:43:14 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../{python-sqlalchemy_0.9.7.bb => python-sqlalchemy_1.0.8.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python-sqlalchemy_0.9.7.bb => python-sqlalchemy_1.0.8.bb} (65%)

diff --git a/recipes-devtools/python/python-sqlalchemy_0.9.7.bb b/recipes-devtools/python/python-sqlalchemy_1.0.8.bb
similarity index 65%
rename from recipes-devtools/python/python-sqlalchemy_0.9.7.bb
rename to recipes-devtools/python/python-sqlalchemy_1.0.8.bb
index 6207233..2d66ffd 100644
--- a/recipes-devtools/python/python-sqlalchemy_0.9.7.bb
+++ b/recipes-devtools/python/python-sqlalchemy_1.0.8.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6c90a3830628085e8ba945f94d622cb2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cf755cb27ad4331d45dbb4db5172fd33"
 RDEPENDS_${PN} += "python-numbers"
 
 SRCNAME = "SQLAlchemy"
 SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e3c8f836ea9b48886718f59b9d8646ff"
-SRC_URI[sha256sum] = "5fff261d0cff21c39913f9d30682659a52bfa2875699b2b7d908d0225df42a15"
+SRC_URI[md5sum] = "7cfd005be63945c96a78c67764ac3a85"
+SRC_URI[sha256sum] = "950c79c0abf9e9f99c43c627c51d40d14a946810a90c35e7cd827bfd0bffe46f"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


