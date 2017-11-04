Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80F75E00D1C; Fri,  3 Nov 2017 23:57:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after
	Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 60 seconds by postgrey-1.32 at yocto-www;
	Fri, 03 Nov 2017 23:57:17 PDT
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D5C8E00D04
	for <meta-virtualization@yoctoproject.org>;
	Fri,  3 Nov 2017 23:57:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="29892851"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Nov 2017 14:57:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7DFBD48089C7
	for <meta-virtualization@yoctoproject.org>;
	Sat,  4 Nov 2017 14:57:17 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Sat, 4 Nov 2017 14:57:17 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sat, 4 Nov 2017 23:55:03 +0800
Message-ID: <1509810903-19796-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: 7DFBD48089C7.AA5DB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH]python-httplib2:	upgrade to 0.10.3
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
X-List-Received-Date: Sat, 04 Nov 2017 06:57:18 -0000
Content-Type: text/plain

1) Upgrade python-httplib2 from 0.9.2 to 0.10.3.

2) Modify LIC_FILES_CHKSUM as home-page in PKG-INFO has been changed from https://github.com/jcgregorio/httplib2 to https://github.com/httplib2/httplib2

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python-httplib2_0.9.2.bb => python-httplib2_0.10.3.bb}       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httplib2_0.9.2.bb => python-httplib2_0.10.3.bb} (52%)

diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.9.2.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
similarity index 52%
rename from meta-openstack/recipes-devtools/python/python-httplib2_0.9.2.bb
rename to meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
index 711411b..e2b27e7 100644
--- a/meta-openstack/recipes-devtools/python/python-httplib2_0.9.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "A comprehensive HTTP client library"
 HOMEPAGE = "https://code.google.com/p/httplib2/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=01abba5d32279f9ed6b3350390258547"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=41a98bc55b04b2a38acdb5c8ab0ae6b2"
 
 SRCNAME = "httplib2"
 
-SRC_URI = "https://pypi.python.org/packages/ff/a9/5751cdf17a70ea89f6dde23ceb1705bfb638fd8cee00f845308bf8d26397/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/e4/2e/a7e27d2c36076efeb8c0e519758968b20389adf57a9ce3af139891af2696/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bd1b1445b3b2dfa7276b09b1a07b7f0e"
-SRC_URI[sha256sum] = "c3aba1c9539711551f4d83e857b316b5134a1c4ddce98a875b7027be7dd6d988"
+SRC_URI[md5sum] = "709c305e1b00e9c0af49ee816429569c"
+SRC_URI[sha256sum] = "e404d3b7bd86c1bc931906098e7c1305d6a3a6dcef141b8bb1059903abb3ceeb"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




