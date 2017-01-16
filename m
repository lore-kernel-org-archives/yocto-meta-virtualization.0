Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5762E00805; Sun, 15 Jan 2017 17:52:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B19EE0078F
	for <meta-virtualization@yoctoproject.org>;
	Sun, 15 Jan 2017 17:52:01 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14785235"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2017 09:51:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 15ADA47AD1F4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jan 2017 09:51:49 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 16 Jan 2017 09:51:53 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Jan 2017 09:51:39 +0800
Message-ID: <1484531499-24440-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 15ADA47AD1F4.A67C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [PATCH] python-sqlalchemy: 1.0.8 -> 1.0.9
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
X-List-Received-Date: Mon, 16 Jan 2017 01:52:05 -0000
Content-Type: text/plain

Upgrade python-sqlalchemy from 1.0.8 to 1.0.9.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-sqlalchemy_1.0.8.bb => python-sqlalchemy_1.0.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-sqlalchemy_1.0.8.bb => python-sqlalchemy_1.0.9.bb} (76%)

diff --git a/recipes-devtools/python/python-sqlalchemy_1.0.8.bb b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
similarity index 76%
rename from recipes-devtools/python/python-sqlalchemy_1.0.8.bb
rename to recipes-devtools/python/python-sqlalchemy_1.0.9.bb
index 2d66ffd..01c94a5 100644
--- a/recipes-devtools/python/python-sqlalchemy_1.0.8.bb
+++ b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
@@ -8,8 +8,8 @@ RDEPENDS_${PN} += "python-numbers"
 SRCNAME = "SQLAlchemy"
 SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "7cfd005be63945c96a78c67764ac3a85"
-SRC_URI[sha256sum] = "950c79c0abf9e9f99c43c627c51d40d14a946810a90c35e7cd827bfd0bffe46f"
+SRC_URI[md5sum] = "0e2d7442e70d02c9f6346a5bf0ec2265"
+SRC_URI[sha256sum] = "c3d37501e36ec5d74c2d7b4a3764719db86a9cdab4a24431bf58b386743ab10e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




