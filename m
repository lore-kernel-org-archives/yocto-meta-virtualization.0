Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3122.1575361468591081286
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 00:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: wangmy@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74F22E01087; Tue,  3 Dec 2019 00:24:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D499E01104
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 00:24:26 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,272,1571673600"; 
   d="scan'208";a="79505733"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Dec 2019 16:24:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4F2054CE1BED
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 16:15:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 3 Dec 2019 16:24:20 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python-kombu: 4.6.5 -> 4.6.6
Date: Tue, 3 Dec 2019 06:48:30 -0800
Message-ID: <1575384511-121432-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575384511-121432-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575384511-121432-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4F2054CE1BED.A86D9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-kombu.inc               | 4 ++--
 .../python/{python-kombu_4.6.5.bb => python-kombu_4.6.6.bb}           | 0
 .../python/{python3-kombu_4.6.5.bb => python3-kombu_4.6.6.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-kombu_4.6.5.bb => python-kombu_4.6.6.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-kombu_4.6.5.bb => python3-kombu_4.6.6.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta-openstack/recipes-devtools/python/python-kombu.inc
index 923278a..8029707 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu.inc
+++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 
-SRC_URI[md5sum] = "6279c780cfa64beda3a303f54cb19a7a"
-SRC_URI[sha256sum] = "c9078124ce2616b29cf6607f0ac3db894c59154252dee6392cdbbe15e5c4b566"
+SRC_URI[md5sum] = "5f751ea817b1f6a4293d4e3a01040d4f"
+SRC_URI[sha256sum] = "1760b54b1d15a547c9a26d3598a1c8cdaf2436386ac1f5561934bc8a3cbbbd86"
 
 inherit pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.5.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.6.6.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-kombu_4.6.5.bb
rename to meta-openstack/recipes-devtools/python/python-kombu_4.6.6.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.5.bb b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-kombu_4.6.5.bb
rename to meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.bb
-- 
2.7.4



