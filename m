Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.9716.1592190562595502608
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Jun 2020 20:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,513,1583164800"; 
   d="scan'208";a="94485740"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jun 2020 11:09:21 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id E0F004CE281C
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jun 2020 11:09:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Jun 2020 11:09:10 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-jsonext: Change python to python3
Date: Mon, 15 Jun 2020 11:07:51 +0800
Message-ID: <1592190472-47315-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1592190472-47315-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1592190472-47315-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: E0F004CE281C.A30AA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python-jsonext_0.4.2.bb => python3-jsonext_0.4.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-jsonext_0.4.2.bb => python3-jsonext_0.4.2.bb} (91%)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonext_0.4.2.bb b/meta-openstack/recipes-devtools/python/python3-jsonext_0.4.2.bb
similarity index 91%
rename from meta-openstack/recipes-devtools/python/python-jsonext_0.4.2.bb
rename to meta-openstack/recipes-devtools/python/python3-jsonext_0.4.2.bb
index fad44f5..0bf227a 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonext_0.4.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-jsonext_0.4.2.bb
@@ -11,6 +11,6 @@ SRC_URI[sha256sum] = "e7634e0b8d1a668bd2c92db5498f6162573feb72ac050c4415384e773b
 inherit setuptools3 pypi
 
 RDEPENDS_${PN} += " \
-        python-six \
-        python-arrow \
+        python3-six \
+        python3-arrow \
         "
-- 
2.17.1



