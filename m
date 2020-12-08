Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4170.1607403092176238924
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 20:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id AA38438C0858
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 04:51:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163233"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 12:51:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B399B4CE6008
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 12:51:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 12:51:26 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-osc-lib: upgrade 2.1.0 -> 2.3.0
Date: Tue, 8 Dec 2020 12:51:26 +0800
Message-ID: <1607403086-8877-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B399B4CE6008.A0341
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python3-osc-lib_2.1.0.bb => python3-osc-lib_2.3.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-osc-lib_2.1.0.bb => python3-osc-lib_2.3.0.bb} (83%)

diff --git a/meta-openstack/recipes-devtools/python/python3-osc-lib_2.1.0.bb b/meta-openstack/recipes-devtools/python/python3-osc-lib_2.3.0.bb
similarity index 83%
rename from meta-openstack/recipes-devtools/python/python3-osc-lib_2.1.0.bb
rename to meta-openstack/recipes-devtools/python/python3-osc-lib_2.3.0.bb
index db1ba030..bbbcdf38 100644
--- a/meta-openstack/recipes-devtools/python/python3-osc-lib_2.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-osc-lib_2.3.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "62d32a59bf4447191b957c6a65eff47f"
-SRC_URI[sha256sum] = "697d08204a59933035ac246fbc8c8e5453b846b4a8875ed7a9e9caba769b1b57"
+SRC_URI[md5sum] = "0fa5c159de19e984323474321a8a02ed"
+SRC_URI[sha256sum] = "ee4f8b6989d3a3fb1021a6a32665000b1db27e615a0ab5c86c35eb59c90003f1"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



