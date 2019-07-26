Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14734E00D46; Thu, 25 Jul 2019 18:06:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 970C7E00C27
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 18:06:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,308,1559491200"; d="scan'208";a="72221873"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jul 2019 09:06:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2D15B4CDE92A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Jul 2019 09:06:05 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 26 Jul 2019 09:06:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 26 Jul 2019 09:05:20 +0800
Message-ID: <20190726010520.12925-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 2D15B4CDE92A.A7261
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-paramiko: upgrade 2.4.2 -> 2.6.0
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
X-List-Received-Date: Fri, 26 Jul 2019 01:06:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-paramiko_2.4.2.bb => python-paramiko_2.6.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-paramiko_2.4.2.bb => python-paramiko_2.6.0.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb b/meta-openstack/recipes-devtools/python/python-paramiko_2.6.0.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb
rename to meta-openstack/recipes-devtools/python/python-paramiko_2.6.0.bb
index a570c32..2b2c8e8 100644
--- a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.6.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[md5sum] = "a476ea106177fe22e797428d54811aed"
-SRC_URI[sha256sum] = "a8975a7df3560c9f1e2b43dc54ebd40fd00a7017392ca5445ce7df409f900fcb"
+SRC_URI[md5sum] = "f729a45c9122bf975b9177ec5aaa3791"
+SRC_URI[sha256sum] = "f4b2edfa0d226b70bd4ca31ea7e389325990283da23465d572ed1f70a7583041"
 
 inherit setuptools pypi
 
-- 
2.7.4




