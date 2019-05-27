Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E012CE00D39; Sun, 26 May 2019 22:09:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27136E00D2C
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 22:07:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64756198"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 13:07:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DE42F4CDBF79
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 13:07:40 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 13:07:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 13:08:40 +0800
Message-ID: <20190527050840.24901-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: DE42F4CDBF79.AACCA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-pecan:upgrade 1.3.2 -> 1.3.3
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
X-List-Received-Date: Mon, 27 May 2019 05:09:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pecan_1.3.2.bb to python-pecan_1.3.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pecan_1.3.2.bb => python-pecan_1.3.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pecan_1.3.2.bb => python-pecan_1.3.3.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python-pecan_1.3.2.bb b/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-pecan_1.3.2.bb
rename to meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb
index 0e2a863..62f29fa 100644
--- a/meta-openstack/recipes-devtools/python/python-pecan_1.3.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
 
-SRC_URI[md5sum] = "42bff04c3a90c32d78560fe7921658d4"
-SRC_URI[sha256sum] = "24f06cf88a488b75f433e62b33c1c97e4575d0cd91eec9eec841a81cecfd6de3"
+SRC_URI[md5sum] = "8f006ed860f7fbdf0c0bf5ad0cf2f3b4"
+SRC_URI[sha256sum] = "b5461add4e3f35a7ee377b3d7f72ff13e93f40f3823b3208ab978b29bde936ff"
 
 inherit setuptools pypi
 
-- 
2.20.1




