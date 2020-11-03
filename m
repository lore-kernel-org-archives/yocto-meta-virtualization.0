Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1026.1604389479233183816
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 23:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B85A938C08E3
	for <meta-virtualization@yoctoproject.org>; Mon,  2 Nov 2020 23:44:38 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,447,1596470400"; 
   d="scan'208";a="100859431"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Nov 2020 15:44:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2D2824CE1A08
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 15:44:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 3 Nov 2020 15:44:32 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-arrow: upgrade 0.15.7 -> 0.17.0
Date: Tue, 3 Nov 2020 15:44:35 +0800
Message-ID: <1604389475-98548-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2D2824CE1A08.A6081
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-arrow_0.15.7.bb => python3-arrow_0.17.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-arrow_0.15.7.bb => python3-arrow_0.17.0.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python3-arrow_0.15.7.bb b/meta-openstack/recipes-devtools/python/python3-arrow_0.17.0.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python3-arrow_0.15.7.bb
rename to meta-openstack/recipes-devtools/python/python3-arrow_0.17.0.bb
index b37086c..65e4a03 100644
--- a/meta-openstack/recipes-devtools/python/python3-arrow_0.15.7.bb
+++ b/meta-openstack/recipes-devtools/python/python3-arrow_0.17.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=62e977be69cd001d6545038b6bb1575c"
 
-SRC_URI[md5sum] = "2176ce6e28a1c43bbdb2ccc79886f420"
-SRC_URI[sha256sum] = "3f1a92b25bbee5f80cc8f6bdecfeade9028219229137c559c37335b4f574a292"
+SRC_URI[md5sum] = "76d66d0d03effad1407fb4dcebce9566"
+SRC_URI[sha256sum] = "ff08d10cda1d36c68657d6ad20d74fbea493d980f8b2d45344e00d6ed2bf6ed4"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



