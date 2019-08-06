Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BC9EE00D2C; Mon,  5 Aug 2019 18:57:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57EE6E006EE
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 18:57:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,350,1559491200"; d="scan'208";a="73031171"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2019 09:57:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4C7B64CDFCC1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 09:57:42 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019 09:57:46 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 6 Aug 2019 09:57:00 +0800
Message-ID: <20190806015700.8434-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 4C7B64CDFCC1.A9A02
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-cliff: upgrade 2.14.1 -> 2.15.0
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
X-List-Received-Date: Tue, 06 Aug 2019 01:57:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../python/{python-cliff_2.14.1.bb => python-cliff_2.15.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-cliff_2.14.1.bb => python-cliff_2.15.0.bb} (82%)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb b/meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
similarity index 82%
rename from meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
rename to meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
index 70ac4e6..cfcd424 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "4c5d43d98970c79b091e25676cce2b10"
-SRC_URI[sha256sum] = "b47387a344898ccb28ca7f386f017ade9eb66dc1713e5c642a0bc09ec606cc67"
+SRC_URI[md5sum] = "f51df6220d4a57c2b84d4b5a9e59e711"
+SRC_URI[sha256sum] = "fe044273539250a99a5b9915843902e40e4e9b32ac5698c1fae89e31200d649f"
 
 inherit setuptools pypi
 
-- 
2.7.4




