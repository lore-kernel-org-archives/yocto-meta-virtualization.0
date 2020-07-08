Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6610.1594198481954130351
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 01:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,327,1589212800"; 
   d="scan'208";a="95925639"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 16:54:36 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A9A174CE3F11
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  8 Jul 2020 16:54:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 16:54:30 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-xstatic-tv4: Change python to python3
Date: Wed, 8 Jul 2020 16:54:23 +0800
Message-ID: <1594198463-42395-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594198463-42395-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1594198463-42395-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: A9A174CE3F11.A47BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-xstatic-tv4_1.2.7.0.bb => python3-xstatic-tv4_1.2.7.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-tv4_1.2.7.0.bb => python3-xstatic-tv4_1.2.7.0.bb} (90%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-tv4_1.2.7.0.bb
similarity index 90%
rename from meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-tv4_1.2.7.0.bb
index e1cdbbe..73bee88 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-tv4_1.2.7.0.bb
@@ -11,10 +11,10 @@ SRC_URI[sha256sum] = "9b4c57244e914126cdda5d8bc24698189d73800203c85b1fc945a08e25
 
 inherit setuptools3 pypi
 
-# DEPENDS_default: python-pip
+# DEPENDS_default: python3-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
-- 
2.17.1



