Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A311E0098A; Fri, 13 Jan 2017 01:22:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97230E009CD
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Jan 2017 01:22:44 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14747160"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2017 17:22:42 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E404447B0CA1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Jan 2017 17:22:42 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 13 Jan 2017 17:22:43 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 13 Jan 2017 17:22:26 +0800
Message-ID: <1484299346-1218-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: E404447B0CA1.A6756
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [PATCH] python-webob 1.4.1 -> 1.6.0
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
X-List-Received-Date: Fri, 13 Jan 2017 09:22:58 -0000
Content-Type: text/plain

Upgrade python-webob from 1.4.1 to 1.6.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-webob_1.4.1.bb => python-webob_1.6.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-webob_1.4.1.bb => python-webob_1.6.0.bb} (75%)

diff --git a/recipes-devtools/python/python-webob_1.4.1.bb b/recipes-devtools/python/python-webob_1.6.0.bb
similarity index 75%
rename from recipes-devtools/python/python-webob_1.4.1.bb
rename to recipes-devtools/python/python-webob_1.6.0.bb
index 18b3806..71c74ff 100644
--- a/recipes-devtools/python/python-webob_1.4.1.bb
+++ b/recipes-devtools/python/python-webob_1.6.0.bb
@@ -9,8 +9,8 @@ SRCNAME = "WebOb"
 
 SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a5c6e8ba5431756e6a5d5ec56047ec94"
-SRC_URI[sha256sum] = "12f8b98390befc47336d2c0e5bad9cc48609d808eabb3f8675dc1027a3a9e9db"
+SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
+SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277fa2209f7f57eb47b537eeecfea383d55b7"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




