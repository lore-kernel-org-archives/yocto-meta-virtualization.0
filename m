Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.11012.1594887324868555572
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 01:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B48BEE01E8C; Thu, 16 Jul 2020 01:15:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3866E01E8A
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 01:15:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427908"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:15:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 559F74CE4BD9
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 16:15:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:15:22 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-cssselect: upgrade 0.9.1 -> 1.1.0
Date: Fri, 17 Jul 2020 03:42:04 +0800
Message-ID: <1594928524-4453-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594928524-4453-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1594928524-4453-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 559F74CE4BD9.A452C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-cssselect_0.9.1.bb      | 2 --
 .../{python-cssselect.inc => python3-cssselect_1.1.0.bb}    | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-cssselect_0.9.1.bb
 rename meta-openstack/recipes-devtools/python/{python-cssselect.inc => python3-cssselect_1.1.0.bb} (69%)

diff --git a/meta-openstack/recipes-devtools/python/python3-cssselect_0.9.1.bb b/meta-openstack/recipes-devtools/python/python3-cssselect_0.9.1.bb
deleted file mode 100644
index de194f8..0000000
--- a/meta-openstack/recipes-devtools/python/python3-cssselect_0.9.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-cssselect.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-cssselect.inc b/meta-openstack/recipes-devtools/python/python3-cssselect_1.1.0.bb
similarity index 69%
rename from meta-openstack/recipes-devtools/python/python-cssselect.inc
rename to meta-openstack/recipes-devtools/python/python3-cssselect_1.1.0.bb
index 377560e..e0a41b8 100644
--- a/meta-openstack/recipes-devtools/python/python-cssselect.inc
+++ b/meta-openstack/recipes-devtools/python/python3-cssselect_1.1.0.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=952026b3fd2f625f2a3c0aa21da2493d"
 
-SRC_URI[md5sum] = "c74f45966277dc7a0f768b9b0f3522ac"
-SRC_URI[sha256sum] = "0535a7e27014874b27ae3a4d33e8749e345bdfa62766195208b7996bf1100682"
+SRC_URI[md5sum] = "fa57704c1cb66cc8e537b782bd6b227e"
+SRC_URI[sha256sum] = "f95f8dedd925fd8f54edb3d2dfb44c190d9d18512377d3c1e2388d16126879bc"
 
-inherit pypi
+inherit setuptools3 pypi
 
 # DEPENDS_default: python-pip
 
-- 
2.25.1



