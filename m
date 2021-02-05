Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.2801.1612492357320976195
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 18:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: wangmy@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id B2C7038C0481
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 02:32:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222325"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:32:35 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 553CB4CE6D91
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 10:32:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:32:36 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization] [PATCH] python3-keyring: upgrade 21.8.0 -> 22.0.1
Date: Fri, 5 Feb 2021 10:32:29 +0800
Message-ID: <1612492349-33410-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 553CB4CE6D91.A3E25
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-keyring_21.8.0.bb => python3-keyring_22.0.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-keyring_21.8.0.bb => python3-keyring_22.0.1.bb} (74%)

diff --git a/meta-openstack/recipes-devtools/python/python3-keyring_21.8.0.bb b/meta-openstack/recipes-devtools/python/python3-keyring_22.0.1.bb
similarity index 74%
rename from meta-openstack/recipes-devtools/python/python3-keyring_21.8.0.bb
rename to meta-openstack/recipes-devtools/python/python3-keyring_22.0.1.bb
index b81172e8..1eba7f64 100644
--- a/meta-openstack/recipes-devtools/python/python3-keyring_21.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-keyring_22.0.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "08913a578efc485bd5763822234d27c6"
-SRC_URI[sha256sum] = "1746d3ac913d449a090caf11e9e4af00e26c3f7f7e81027872192b2398b98675"
+SRC_URI[md5sum] = "88e1607f9f40b82ab9e28529eec3edbc"
+SRC_URI[sha256sum] = "9acb3e1452edbb7544822b12fd25459078769e560fa51f418b6d00afaa6178df"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



