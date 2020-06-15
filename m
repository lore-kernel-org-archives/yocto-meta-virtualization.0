Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.12959.1592209793696116490
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 01:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,514,1583164800"; 
   d="scan'208";a="94502413"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 16:30:01 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 71D954CE2E80
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jun 2020 16:29:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 16:29:58 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-xstatic-smart-table: Change python to python3
Date: Mon, 15 Jun 2020 16:29:41 +0800
Message-ID: <1592209781-47932-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1592209781-47932-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1592209781-47932-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 71D954CE2E80.A3E4D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...able_1.4.13.2.bb => python3-xstatic-smart-table_1.4.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-smart-table_1.4.13.2.bb => python3-xstatic-smart-table_1.4.13.2.bb} (95%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-smart-table_1.4.13.2.bb
similarity index 95%
rename from meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-smart-table_1.4.13.2.bb
index 2430c8e..bb6895c 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-smart-table_1.4.13.2.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "f2fa5ed37c2953253de79c61c346fa6c3c4f38731295d2240552c14298
 inherit setuptools3 pypi
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 RDEPENDS_${PN} += " \
-- 
2.17.1



