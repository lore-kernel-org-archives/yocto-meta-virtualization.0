Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DCEEE00DA4; Wed,  7 Aug 2019 17:37:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED,TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 475DAE00D98
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Aug 2019 17:37:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,358,1559491200"; d="scan'208";a="73175966"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Aug 2019 08:37:35 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C35ED4CDFCEB
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Aug 2019 08:37:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 8 Aug 2019 08:37:44 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 8 Aug 2019 17:37:17 +0800
Message-ID: <1565257037-50942-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: C35ED4CDFCEB.ACAAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-kombu: upgrade 4.6.0 -> 4.6.3.
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
X-List-Received-Date: Thu, 08 Aug 2019 00:37:52 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-kombu.inc       | 4 ++--
 .../python/{python-kombu_4.6.0.bb => python-kombu_4.6.3.bb}   | 0
 .../python/{python3-kombu_4.6.0.bb => python3-kombu_4.6.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-kombu_4.6.0.bb => python-kombu_4.6.3.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-kombu_4.6.0.bb => python3-kombu_4.6.3.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta-openstack/recipes-devtools/python/python-kombu.inc
index 7f66a4b..722adcd 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu.inc
+++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 
-SRC_URI[md5sum] = "3543525c1bfaa74260cbf9a6e47dad2f"
-SRC_URI[sha256sum] = "27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e203cecaa0aeca84360be"
+SRC_URI[md5sum] = "adc9167ba3571c5465d6f7abe4945a12"
+SRC_URI[sha256sum] = "eb365ea795cd7e629ba2f1f398e0c3ba354b91ef4de225ffdf6ab45fdfc7d581"
 
 FILES_${PN}-doc += "${datadir}/${SRCNAME}"
 
diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.6.3.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
rename to meta-openstack/recipes-devtools/python/python-kombu_4.6.3.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.3.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb
rename to meta-openstack/recipes-devtools/python/python3-kombu_4.6.3.bb
-- 
2.17.1




