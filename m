Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18F50E00DD1; Tue, 27 Aug 2019 18:59:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61D60E00C11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2019 18:59:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,439,1559491200"; d="scan'208";a="74411195"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 09:59:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0E7D54CE2E80
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Aug 2019 09:59:50 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 28 Aug 2019 09:59:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 28 Aug 2019 09:59:16 +0800
Message-ID: <20190828015916.19200-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 0E7D54CE2E80.AD9B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-waitress: upgrade 1.3.0 -> 1.3.1
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
X-List-Received-Date: Wed, 28 Aug 2019 01:59:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-waitress_1.3.0.bb => python-waitress_1.3.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-waitress_1.3.0.bb => python-waitress_1.3.1.bb} (62%)

diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
similarity index 62%
rename from meta-openstack/recipes-devtools/python/python-waitress_1.3.0.bb
rename to meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
index fc227d6..78af225 100644
--- a/meta-openstack/recipes-devtools/python/python-waitress_1.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[md5sum] = "884dbea5d7348f7db1b8ab76ef3a3a71"
-SRC_URI[sha256sum] = "4e2a6e6fca56d6d3c279f68a2b2cc9b4798d834ea3c3a9db3e2b76b6d66f4526"
+SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
+SRC_URI[sha256sum] = "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
 
 inherit setuptools pypi
-- 
2.7.4




