Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87B01E00DCE; Sun,  8 Sep 2019 22:31:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A71D1E00DAA
	for <meta-virtualization@yoctoproject.org>;
	Sun,  8 Sep 2019 22:31:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,483,1559491200"; d="scan'208";a="75151058"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2019 13:31:44 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4986C4CE03FD
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 13:31:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019 13:31:44 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 9 Sep 2019 13:30:27 +0800
Message-ID: <1568007027-112665-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 4986C4CE03FD.A6EAF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-cliff: upgrade 2.15.0 -> 2.16.0
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
X-List-Received-Date: Mon, 09 Sep 2019 05:31:49 -0000
Content-Type: text/plain

1) Upgrade python-cliff from 2.15.0 to 2.16.0.

2) Remove repetitive RDEPENDS python-prettytable.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python-cliff_2.15.0.bb => python-cliff_2.16.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-cliff_2.15.0.bb => python-cliff_2.16.0.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
rename to meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
index cfcd424..0d49f8c 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "f51df6220d4a57c2b84d4b5a9e59e711"
-SRC_URI[sha256sum] = "fe044273539250a99a5b9915843902e40e4e9b32ac5698c1fae89e31200d649f"
+SRC_URI[md5sum] = "89e96c6c8c5922832e124ed81c21a55b"
+SRC_URI[sha256sum] = "622e777b8ac2eb479708fe53893c37b2fd5469ce2c6c5b794a658246f05c6b81"
 
 inherit setuptools pypi
 
@@ -18,7 +18,7 @@ DEPENDS += " \
     python-pbr-native \
     "
 
-RDEPENDS_${PN} += "python-prettytable \
+RDEPENDS_${PN} += " \
             python-cmd2 \
             python-pbr \
             python-pyparsing \
-- 
2.17.1




