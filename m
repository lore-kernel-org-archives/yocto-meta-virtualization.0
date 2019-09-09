Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1C4EE00DCE; Sun,  8 Sep 2019 23:11:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C344E00D67
	for <meta-virtualization@yoctoproject.org>;
	Sun,  8 Sep 2019 23:11:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,483,1559491200"; d="scan'208";a="75152897"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2019 14:11:40 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0D00C4CE14E7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 14:11:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019 14:11:47 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 9 Sep 2019 14:10:28 +0800
Message-ID: <1568009428-113268-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 0D00C4CE14E7.A7517
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-colorama: upgrade 0.3.3 -> 0.4.1
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
X-List-Received-Date: Mon, 09 Sep 2019 06:11:44 -0000
Content-Type: text/plain

1) Upgrade python-colorama from 0.3.3 to 0.4.1.

2) License File LICENSE.txt content changed:
   Remove the line break in last line.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python-colorama_0.3.3.bb => python-colorama_0.4.1.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-colorama_0.3.3.bb => python-colorama_0.4.1.bb} (56%)

diff --git a/meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb b/meta-openstack/recipes-devtools/python/python-colorama_0.4.1.bb
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb
rename to meta-openstack/recipes-devtools/python/python-colorama_0.4.1.bb
index 81b7e09..7df4e97 100644
--- a/meta-openstack/recipes-devtools/python/python-colorama_0.3.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-colorama_0.4.1.bb
@@ -5,10 +5,10 @@ DESCRIPTION = "Simple cross-platform colored terminal text in Python"
 HOMEPAGE = "http://pypi.python.org/pypi/colorama"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14d0b64047ed8f510b51ce0495995358"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
 
-SRC_URI[md5sum] = "a56b8dc55158a41ab3c89c4c8feb8824"
-SRC_URI[sha256sum] = "eb21f2ba718fbf357afdfdf6f641ab393901c7ca8d9f37edd0bee4806ffa269c"
+SRC_URI[md5sum] = "f927529cd1735f6f50ee2c61628e9c1f"
+SRC_URI[sha256sum] = "05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d"
 
 inherit setuptools pypi
 
-- 
2.17.1




