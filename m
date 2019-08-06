Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93045E00D59; Mon,  5 Aug 2019 21:09:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14EA1E00798
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 21:09:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,352,1559491200"; d="scan'208";a="73040045"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2019 12:09:08 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D173A4CDFAD2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 12:09:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019 12:09:12 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 6 Aug 2019 21:09:01 +0800
Message-ID: <1565096941-16553-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: D173A4CDFAD2.A89EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-osc-lib: upgrade 1.12.1 -> 1.13.0.
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
X-List-Received-Date: Tue, 06 Aug 2019 04:09:12 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python-osc-lib_1.12.1.bb => python-osc-lib_1.13.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-osc-lib_1.12.1.bb => python-osc-lib_1.13.0.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib_1.12.1.bb b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-osc-lib_1.12.1.bb
rename to meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
index 8b7a4f7..7540e79 100644
--- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.12.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "73c8bd90b8325b2595b814f41d06fdb8"
-SRC_URI[sha256sum] = "26d3e32c8c4eff47240c458cddb6b75db52034d643f01de2841ad9e84904d7aa"
+SRC_URI[md5sum] = "5e91028524b50a72f9913ccd2994cf77"
+SRC_URI[sha256sum] = "9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707950dc1c6f0b286cce77"
 
 inherit setuptools pypi
 
-- 
2.17.1




