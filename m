Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.2355.1609832093105201188
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 23:34:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9815538C0554
	for <meta-virtualization@yoctoproject.org>; Tue,  5 Jan 2021 07:34:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,476,1599494400"; 
   d="scan'208";a="103193054"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 15:34:51 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9C3BB4CE6024
	for <meta-virtualization@yoctoproject.org>; Tue,  5 Jan 2021 15:34:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 15:34:51 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-keyring: upgrade 21.5.0 -> 21.8.0
Date: Tue, 5 Jan 2021 15:34:49 +0800
Message-ID: <1609832089-107969-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9C3BB4CE6024.A6171
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-keyring_21.5.0.bb => python3-keyring_21.8.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-keyring_21.5.0.bb => python3-keyring_21.8.0.bb} (74%)

diff --git a/meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb b/meta-openstack/recipes-devtools/python/python3-keyring_21.8.0.bb
similarity index 74%
rename from meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb
rename to meta-openstack/recipes-devtools/python/python3-keyring_21.8.0.bb
index d7565fd6..b81172e8 100644
--- a/meta-openstack/recipes-devtools/python/python3-keyring_21.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-keyring_21.8.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "1609e4804bfc08ca0adf43f9d9c90de6"
-SRC_URI[sha256sum] = "207bd66f2a9881c835dad653da04e196c678bf104f8252141d2d3c4f31051579"
+SRC_URI[md5sum] = "08913a578efc485bd5763822234d27c6"
+SRC_URI[sha256sum] = "1746d3ac913d449a090caf11e9e4af00e26c3f7f7e81027872192b2398b98675"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



