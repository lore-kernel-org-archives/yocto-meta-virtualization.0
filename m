Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12316.1601348308233217229
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B7DD738C06C2
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:58:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99697794"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 10:58:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1170B48990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 10:57:58 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 10:57:56 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-openstack-nose: change to python3
Date: Tue, 29 Sep 2020 22:57:55 +0800
Message-ID: <1601391475-4834-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1170B48990CC.A186F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...nstack-nose_0.11.bb => python3-openstack-nose_0.11.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-openstack-nose_0.11.bb => python3-openstack-nose_0.11.bb} (85%)

diff --git a/meta-openstack/recipes-devtools/python/python-openstack-nose_0.11.bb b/meta-openstack/recipes-devtools/python/python3-openstack-nose_0.11.bb
similarity index 85%
rename from meta-openstack/recipes-devtools/python/python-openstack-nose_0.11.bb
rename to meta-openstack/recipes-devtools/python/python3-openstack-nose_0.11.bb
index 42d836f..9cdc9a2 100644
--- a/meta-openstack/recipes-devtools/python/python-openstack-nose_0.11.bb
+++ b/meta-openstack/recipes-devtools/python/python3-openstack-nose_0.11.bb
@@ -15,12 +15,12 @@ SRC_URI[sha256sum] = "a28d44dc23de8164d7893da7020404c73c4325b46d5507911f0257c15f
 inherit setuptools3 pypi
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 RDEPENDS_${PN} += " \
-        python-nose \
-        python-colorama \
-        python-termcolor \
+        python3-nose \
+        python3-colorama \
+        python3-termcolor \
         "
 
-- 
2.25.1



