Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B319E00D17; Tue, 29 Jan 2019 16:43:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9D68E00D08
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2019 16:43:13 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.56,538,1539619200"; d="scan'208";a="53161398"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jan 2019 08:42:07 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A42F74C4BB98
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Jan 2019 08:42:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 30 Jan 2019 08:42:11 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 30 Jan 2019 08:42:49 +0800
Message-ID: <20190130004249.20870-4-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
References: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: A42F74C4BB98.A010E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [patch]:python-webob:upgrade to 1.8.5
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
X-List-Received-Date: Wed, 30 Jan 2019 00:43:14 -0000
Content-Type: text/plain

Upgrade python-webob from 1.8.2 to 1.8.5

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-webob_1.8.2.bb => python-webob_1.8.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-webob_1.8.2.bb => python-webob_1.8.5.bb} (68%)

diff --git a/recipes-devtools/python/python-webob_1.8.2.bb b/recipes-devtools/python/python-webob_1.8.5.bb
similarity index 68%
rename from recipes-devtools/python/python-webob_1.8.2.bb
rename to recipes-devtools/python/python-webob_1.8.5.bb
index 6fdfbd5..0ce928a 100644
--- a/recipes-devtools/python/python-webob_1.8.2.bb
+++ b/recipes-devtools/python/python-webob_1.8.5.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
 
 PYPI_PACKAGE = "WebOb"
 
-SRC_URI[md5sum] = "d04756e6683fedddba52eafbe9adf404"
-SRC_URI[sha256sum] = "1fe722f2ab857685fc96edec567dc40b1875b21219b3b348e58cd8c4d5ea7df3"
+SRC_URI[md5sum] = "1761f416e8cf53f6fb674149cc223bd1"
+SRC_URI[sha256sum] = "05aaab7975e0ee8af2026325d656e5ce14a71f1883c52276181821d6d5bf7086"
 
 inherit setuptools pypi
 
-- 
2.17.2




