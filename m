Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4008.1605589962225431238
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 21:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B739F38C04AD
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 05:12:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,484,1596470400"; 
   d="scan'208";a="101445946"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Nov 2020 13:12:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CB5694CE5458
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 13:12:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Nov 2020 13:12:36 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH 6/7] python3-glance-store: Change to python3
Date: Tue, 17 Nov 2020 22:12:36 +0800
Message-ID: <1605622356-3663-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CB5694CE5458.A7AC6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...ore_git.bb => python3-glance-store_git.bb} | 34 ++++++++++---------
 1 file changed, 18 insertions(+), 16 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-glance-store_git.bb => python3-glance-store_git.bb} (52%)

diff --git a/meta-openstack/recipes-devtools/python/python-glance-store_git.bb b/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb
similarity index 52%
rename from meta-openstack/recipes-devtools/python/python-glance-store_git.bb
rename to meta-openstack/recipes-devtools/python/python3-glance-store_git.bb
index 1a8c3aab..afd7818d 100644
--- a/meta-openstack/recipes-devtools/python/python-glance-store_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb
@@ -15,28 +15,30 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 
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
 
 RDEPENDS_${PN} += " \
         bash \
-        python-oslo.config \
-        python-oslo.i18n \
-        python-oslo.serialization \
-        python-oslo.utils \
-        python-oslo.concurrency \
-        python-stevedore \
-        python-enum34 \
-        python-eventlet \
-        python-six \
-        python-jsonschema \
-        python-keystoneauth1 \
-        python-keystoneclient \
-        python-requests \
+        python3-oslo.config \
+        python3-oslo.i18n \
+        python3-oslo.serialization \
+        python3-oslo.utils \
+        python3-oslo.concurrency \
+        python3-stevedore \
+        python3-eventlet \
+        python3-six \
+        python3-jsonschema \
+        python3-keystoneauth1 \
+        python3-keystoneclient \
+        python3-requests \
+        python3-greenlet \
+        python3-monotonic \
+        python3-dnspython \
         "
-- 
2.25.1



