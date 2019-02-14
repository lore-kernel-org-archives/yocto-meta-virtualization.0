Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9B4FE00BE8; Thu, 14 Feb 2019 01:20:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 266FEE00B92
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 01:20:36 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.58,368,1544457600"; d="scan'208";a="54327894"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Feb 2019 17:20:20 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7CD834C4BCB6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 17:20:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 14 Feb 2019 17:20:15 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 14 Feb 2019 17:21:09 +0800
Message-ID: <20190214092109.9468-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 7CD834C4BCB6.AD508
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-amqp:upgrade to 2.4.1
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
X-List-Received-Date: Thu, 14 Feb 2019 09:20:37 -0000
Content-Type: text/plain

Upgrade python-amqp from 2.3.2 to 2.4.1

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-amqp_2.3.2.bb => python-amqp_2.4.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-amqp_2.3.2.bb => python-amqp_2.4.1.bb} (68%)

diff --git a/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb b/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
similarity index 68%
rename from meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
rename to meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
index 395c81e..dee95db 100644
--- a/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
 
-SRC_URI[md5sum] = "11fce0d01f4ee6886a02415c20cece80"
-SRC_URI[sha256sum] = "073dd02fdd73041bffc913b767866015147b61f2a9bc104daef172fc1a0066eb"
+SRC_URI[md5sum] = "9e3d5f1f69d2106c2b3f77d275a79924"
+SRC_URI[sha256sum] = "6816eed27521293ee03aa9ace300a07215b11fee4e845588a9b863a7ba30addb"
 
 inherit setuptools pypi
 
-- 
2.17.2




