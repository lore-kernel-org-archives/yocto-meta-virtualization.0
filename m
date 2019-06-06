Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AACD5E00D75; Wed,  5 Jun 2019 19:56:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F46EE00D6B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Jun 2019 19:56:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66164866"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 10:56:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 55FF04CDCCAC
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Jun 2019 10:55:57 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 10:56:01 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Jun 2019 10:57:10 +0800
Message-ID: <20190606025710.30112-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 55FF04CDCCAC.AF19C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-webtest: upgrade 2.0.29 -> 2.0.33
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
X-List-Received-Date: Thu, 06 Jun 2019 02:56:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-webtest_2.0.29.bb to python-webtest_2.0.33.bb.

-License-Update: Changed the path of docs.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-webtest_2.0.29.bb => python-webtest_2.0.33.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-webtest_2.0.29.bb => python-webtest_2.0.33.bb} (52%)

diff --git a/meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb b/meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
similarity index 52%
rename from meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
rename to meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
index c075a55..527f5c7 100644
--- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
+++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Helper to test WSGI applications"
 HOMEPAGE = "https://pypi.python.org/pypi/WebTest/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=c7fb282fc7269ea1ef7dd689470b528b"
+LIC_FILES_CHKSUM = "file://README.rst;md5=e3e00192f000e33de99fd5a3cb32a8fc"
 
 PYPI_PACKAGE = "WebTest"
 
 RDEPENDS_${PN} += "python-beautifulsoup4"
 
-SRC_URI[md5sum] = "30b4cf0d340b9a5335fac4389e6f84fc"
-SRC_URI[sha256sum] = "dbbccc15ac2465066c95dc3a7de0d30cde3791e886ccbd7e91d5d2a2580c922d"
+SRC_URI[md5sum] = "dd0385c725b85ac1e8079f38d2acd7b1"
+SRC_URI[sha256sum] = "41348efe4323a647a239c31cde84e5e440d726ca4f449859264e538d39037fd0"
 
 inherit setuptools pypi
-- 
2.20.1




