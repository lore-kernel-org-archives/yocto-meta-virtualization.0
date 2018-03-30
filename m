Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE3D4E00BF6; Fri, 30 Mar 2018 02:28:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F94BE00944
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 02:28:51 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38348150"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Mar 2018 17:28:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7FACF486A78C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 17:28:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 30 Mar 2018 17:28:44 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Mar 2018 17:28:39 +0800
Message-ID: <1522402120-7482-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 7FACF486A78C.A887F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH] python-webtest: 2.0.21 -> 2.0.29
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
X-List-Received-Date: Fri, 30 Mar 2018 09:28:53 -0000
Content-Type: text/plain

1.Upgrade python-webtest from 2.0.21 to 2.0.29.
2.Update the checksum of LIC_FILES_CHKSUM, since the README.rst has been changed.
  Changed from https://webtest.readthedocs.org/en/latest/ to https://webtest.readthedocs.io/en/latest/.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-webtest_2.0.21.bb => python-webtest_2.0.29.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-webtest_2.0.21.bb => python-webtest_2.0.29.bb} (52%)

diff --git a/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb b/meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
similarity index 52%
rename from meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
rename to meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
index c0f6c94..c075a55 100644
--- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
+++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Helper to test WSGI applications"
 HOMEPAGE = "https://pypi.python.org/pypi/WebTest/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=7ddcdd3b8e69edc8c5ae7e6bb64f0bc5"
+LIC_FILES_CHKSUM = "file://README.rst;md5=c7fb282fc7269ea1ef7dd689470b528b"
 
 PYPI_PACKAGE = "WebTest"
 
 RDEPENDS_${PN} += "python-beautifulsoup4"
 
-SRC_URI[md5sum] = "98e8b59da3cc6c150cebca8c92b66041"
-SRC_URI[sha256sum] = "3dc92ecd7604e21fc7c97578e4c43aff2a67cebdd4884a2aa804d85e85b34b55"
+SRC_URI[md5sum] = "30b4cf0d340b9a5335fac4389e6f84fc"
+SRC_URI[sha256sum] = "dbbccc15ac2465066c95dc3a7de0d30cde3791e886ccbd7e91d5d2a2580c922d"
 
 inherit setuptools pypi
-- 
2.7.4




