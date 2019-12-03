Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3268.1575361466463108549
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 00:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: wangmy@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 573E2E01105; Tue,  3 Dec 2019 00:24:26 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1F20E01087
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 00:24:25 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,272,1571673600"; 
   d="scan'208";a="79505728"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Dec 2019 16:24:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D77E24CE1A05
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Dec 2019 16:15:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 3 Dec 2019 16:24:18 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][PATCH] python-osprofiler: 2.8.2 -> 2.9.0
Date: Tue, 3 Dec 2019 06:48:29 -0800
Message-ID: <1575384511-121432-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575384511-121432-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575384511-121432-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D77E24CE1A05.A8350
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python-osprofiler_2.8.2.bb => python-osprofiler_2.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-osprofiler_2.8.2.bb => python-osprofiler_2.9.0.bb} (83%)

diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
similarity index 83%
rename from meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
rename to meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
index 408bbdb..8dcab0d 100644
--- a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
 
-SRC_URI[md5sum] = "b192bdcbf201101a97d163d7ec6f4783"
-SRC_URI[sha256sum] = "525b2becd692e3c6ed77a6fdf8a9ad8a52127f18e48a3abc1264c16d7fc5208a"
+SRC_URI[md5sum] = "75f190b00ac248b3d547b67a480801db"
+SRC_URI[sha256sum] = "6915cbf8ac390dc3e125340b0ff368dd53f5889e3d053f9122dd83ba0dd366f7"
 
 inherit setuptools pypi
 
-- 
2.7.4



