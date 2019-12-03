Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.3160.1575361467832498770
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 00:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: wangmy@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B183EE01105; Tue,  3 Dec 2019 00:24:27 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F48EE01087
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 00:24:26 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,272,1571673600"; 
   d="scan'208";a="79505729"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Dec 2019 16:24:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4DC4A4CE1C07
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 16:15:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 3 Dec 2019 16:24:22 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python-keystoneauth1: 3.17.1 -> 3.18.0
Date: Tue, 3 Dec 2019 06:48:31 -0800
Message-ID: <1575384511-121432-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575384511-121432-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575384511-121432-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4DC4A4CE1C07.A8380
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-keystoneauth1.inc       | 4 ++--
 ...{python-keystoneauth1_3.17.1.bb => python-keystoneauth1_3.18.0.bb} | 0
 ...ython3-keystoneauth1_3.17.1.bb => python3-keystoneauth1_3.18.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_3.17.1.bb => python-keystoneauth1_3.18.0.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-keystoneauth1_3.17.1.bb => python3-keystoneauth1_3.18.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
index 14893d6..bca6ce9 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
 
-SRC_URI[md5sum] = "0864f3485db8709d1dec0c8fa6073a31"
-SRC_URI[sha256sum] = "db91ccab5cc43dac4a25dc2c090642d7c31f9ceb28df2c685620d7c12335a8cd"
+SRC_URI[md5sum] = "6104205044175fa8aac659582fdd0260"
+SRC_URI[sha256sum] = "3ae67c6542ed66a37cddcd26a35457c1ff5cd14b20f5490973273cf9eb555a52"
 
 inherit pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.1.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.18.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.1.bb
rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_3.18.0.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.1.bb b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.18.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.1.bb
rename to meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.18.0.bb
-- 
2.7.4



