Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6C1BE009C9; Tue, 13 Sep 2016 22:33:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C11A6E009BB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Sep 2016 22:33:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10963485"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2016 13:33:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8FC614623465
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Sep 2016 13:33:00 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 14 Sep 2016 13:32:59 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 14 Sep 2016 01:32:55 -0400
Message-ID: <1473831175-3644-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 8FC614623465.A486C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
Subject: [PATCH] python-webtest: 2.0.18 -> 2.0.21
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
X-List-Received-Date: Wed, 14 Sep 2016 05:33:07 -0000
Content-Type: text/plain

Upgrade python-webtest from 2.0.18 to 2.0.21.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../python/{python-webtest_2.0.18.bb => python-webtest_2.0.21.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-webtest_2.0.18.bb => python-webtest_2.0.21.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-webtest_2.0.18.bb b/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-webtest_2.0.18.bb
rename to meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
index 314cf4c..2735306 100644
--- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.18.bb
+++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
@@ -8,10 +8,10 @@ SRCNAME = "WebTest"
 
 RDEPENDS_${PN} += "python-beautifulsoup4"
 
-SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.zip"
+SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "444a4160408670a50d7cb149a4035cf5"
-SRC_URI[sha256sum] = "beb569e6d707cb4cd82c226c97b7e1f41cd62bae656d89e687107eef8376c7fd"
+SRC_URI[md5sum] = "98e8b59da3cc6c150cebca8c92b66041"
+SRC_URI[sha256sum] = "3dc92ecd7604e21fc7c97578e4c43aff2a67cebdd4884a2aa804d85e85b34b55"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




