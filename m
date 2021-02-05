Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.2824.1612492200241197643
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 18:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: wangmy@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id BAD5038C0481
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 02:29:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222155"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:29:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AE18E4CE6D8F
	for <meta-virtualization@yoctoproject.org>; Fri,  5 Feb 2021 10:29:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:29:59 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization] [PATCH] python3-httpretty: upgrade 1.0.3 -> 1.0.5
Date: Fri, 5 Feb 2021 10:29:43 +0800
Message-ID: <1612492185-33353-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1612492185-33353-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: AE18E4CE6D8F.A522D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...{python3-httpretty_1.0.3.bb => python3-httpretty_1.0.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-httpretty_1.0.3.bb => python3-httpretty_1.0.5.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.3.bb b/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.5.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python3-httpretty_1.0.3.bb
rename to meta-openstack/recipes-devtools/python/python3-httpretty_1.0.5.bb
index e288c8e5..4b732caf 100644
--- a/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.3.bb
+++ b/meta-openstack/recipes-devtools/python/python3-httpretty_1.0.5.bb
@@ -7,8 +7,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d87f7868a62b8d598eab40164594d21b"
 
-SRC_URI[md5sum] = "f42d7dcee7efa3b4aa842494abb23cac"
-SRC_URI[sha256sum] = "9335cbd8f38745e0e2dc4755d8932a77d378d93e15804969504b1e6b568d613c"
+SRC_URI[md5sum] = "6d71a2387997ae8523dcc7ada51cb46a"
+SRC_URI[sha256sum] = "e53c927c4d3d781a0761727f1edfad64abef94e828718e12b672a678a8b3e0b5"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



