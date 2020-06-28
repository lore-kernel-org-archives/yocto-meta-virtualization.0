Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.23062.1593320549120259090
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 Jun 2020 22:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,290,1589212800"; 
   d="scan'208";a="95408943"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jun 2020 13:02:10 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AE3924CE49B7
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Jun 2020 12:51:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Jun 2020 13:02:09 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 2/4] python3-oslo.serialization: Change python to python3
Date: Sun, 28 Jun 2020 13:02:00 +0800
Message-ID: <1593320522-14645-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593320522-14645-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593320522-14645-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: AE3924CE49B7.A39DE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...it.bb => python3-oslo.serialization_git.bb} | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.serialization_git.bb => python3-oslo.serialization_git.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.serialization_git.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
rename to meta-openstack/recipes-devtools/python/python3-oslo.serialization_git.bb
index 80b86bb..36e9424 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-oslo.serialization_git.bb
@@ -13,23 +13,23 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-# DEPENDS_default: python-pip
+# DEPENDS_default: python3-pip
 
 DEPENDS += " \
-        python-pip \
-        python-pbr \
+        python3-pip \
+        python3-pbr \
         "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
-        python-pbr \
-        python-six \
-        python-oslo.utils \
-        python-pytz \
-        python-msgpack \
+        python3-pbr \
+        python3-six \
+        python3-oslo.utils \
+        python3-pytz \
+        python3-msgpack \
         "
-- 
2.17.1



