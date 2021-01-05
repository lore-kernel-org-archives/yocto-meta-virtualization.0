Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2311.1609832267226831749
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 23:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id BB77638C0554
	for <meta-virtualization@yoctoproject.org>; Tue,  5 Jan 2021 07:37:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,476,1599494400"; 
   d="scan'208";a="103193168"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 15:37:45 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8EDB44CE602C
	for <meta-virtualization@yoctoproject.org>; Tue,  5 Jan 2021 15:37:43 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 15:37:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-manilaclient: upgrade 2.3.0 -> 2.4.0
Date: Tue, 5 Jan 2021 15:37:37 +0800
Message-ID: <1609832257-108071-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8EDB44CE602C.A8E0A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...hon3-manilaclient_2.3.0.bb => python3-manilaclient_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python3-manilaclient_2.3.0.bb => python3-manilaclient_2.4.0.bb} (90%)

diff --git a/meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb b/meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb
similarity index 90%
rename from meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb
rename to meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb
index 78403c2d..c0a55210 100644
--- a/meta-openstack/recipes-devtools/python/python3-manilaclient_2.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9edbbf5857ab51214ef0e8b79069bb07"
 
-SRC_URI[sha256sum] = "7b5b3215215a720ace08e53caca447a605dee9c8b3b3cfaa302b6bc7e63e4a28"
+SRC_URI[sha256sum] = "e314cce0e1d2b92ff194dfa8e29bc67dd5703799a43abf7c323616ddb50d83c0"
 
 DEPENDS += " \
         python3-pip \
-- 
2.25.1



