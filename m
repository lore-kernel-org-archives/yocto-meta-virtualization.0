Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58FE5E00D9F; Wed,  4 Sep 2019 20:21:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9617BE00929
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 20:21:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74869406"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 11:21:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8CEDC4CDE64D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 11:21:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 11:21:08 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 5 Sep 2019 12:20:42 +0900
Message-ID: <20190905032042.39761-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 8CEDC4CDE64D.A548A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python-debtcollector: upgrade 1.21.0 -> 1.22.0
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
X-List-Received-Date: Thu, 05 Sep 2019 03:21:12 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-debtcollector.inc          | 4 ++--
 ...debtcollector_1.21.0.bb => python-debtcollector_1.22.0.bb} | 0
 ...ebtcollector_1.21.0.bb => python3-debtcollector_1.22.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-debtcollector_1.21.0.bb => python-debtcollector_1.22.0.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-debtcollector_1.21.0.bb => python3-debtcollector_1.22.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector.inc b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
index 629a059..d519bfd 100644
--- a/meta-openstack/recipes-devtools/python/python-debtcollector.inc
+++ b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[md5sum] = "ec899623b37fdee65b888243f0a46735"
-SRC_URI[sha256sum] = "f6ce5a383ad73c23e1138dbb69bf45d33f4a4bdec38f02dbf2b89477ec5e55bc"
+SRC_URI[md5sum] = "0d12694a93a16824b1c67bece341229e"
+SRC_URI[sha256sum] = "d1756440d25a50e3eca2fc399c9e5f1ca2f9e6b837570a80b9450999f4290525"
 
 inherit pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb b/meta-openstack/recipes-devtools/python/python-debtcollector_1.22.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
rename to meta-openstack/recipes-devtools/python/python-debtcollector_1.22.0.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb b/meta-openstack/recipes-devtools/python/python3-debtcollector_1.22.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb
rename to meta-openstack/recipes-devtools/python/python3-debtcollector_1.22.0.bb
-- 
2.17.1




