Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.2285.1609832254305817877
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 23:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id CC38838C0554
	for <meta-virtualization@yoctoproject.org>; Tue,  5 Jan 2021 07:37:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,476,1599494400"; 
   d="scan'208";a="103193157"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Jan 2021 15:37:32 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 791F148990D2
	for <meta-virtualization@yoctoproject.org>; Tue,  5 Jan 2021 15:37:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 5 Jan 2021 15:37:33 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-magnumclient: upgrade 3.2.1 -> 3.3.0
Date: Tue, 5 Jan 2021 15:37:25 +0800
Message-ID: <1609832245-108034-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 791F148990D2.A56C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...hon3-magnumclient_3.2.1.bb => python3-magnumclient_3.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python3-magnumclient_3.2.1.bb => python3-magnumclient_3.3.0.bb} (90%)

diff --git a/meta-openstack/recipes-devtools/python/python3-magnumclient_3.2.1.bb b/meta-openstack/recipes-devtools/python/python3-magnumclient_3.3.0.bb
similarity index 90%
rename from meta-openstack/recipes-devtools/python/python3-magnumclient_3.2.1.bb
rename to meta-openstack/recipes-devtools/python/python3-magnumclient_3.3.0.bb
index 28af248b..9914f4c1 100644
--- a/meta-openstack/recipes-devtools/python/python3-magnumclient_3.2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-magnumclient_3.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "3d03a3a3cf4b9ece4e903a77415356767c2bea44ce5c1449a00edb527fc9cb0e"
+SRC_URI[sha256sum] = "9734fbaa571fe11f252835878999efe02d4200ca9a5b1d9fe691fd5f4ec81f3b"
 
 DEPENDS += " \
         python3-pip \
-- 
2.25.1



