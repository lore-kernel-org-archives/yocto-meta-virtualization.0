Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.24533.1604990808905372992
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 22:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 690B838C06E0
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 22:46:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; 
   d="scan'208";a="101136599"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 10 Nov 2020 14:46:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id F2A694CE3A71
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 14:46:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 10 Nov 2020 14:46:19 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-kazoo: upgrade 2.7.0 -> 2.8.0
Date: Tue, 10 Nov 2020 14:45:40 +0800
Message-ID: <1604990740-96816-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: F2A694CE3A71.A8E32
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python3-kazoo_2.7.0.bb => python3-kazoo_2.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-kazoo_2.7.0.bb => python3-kazoo_2.8.0.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb b/meta-openstack/recipes-devtools/python/python3-kazoo_2.8.0.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
rename to meta-openstack/recipes-devtools/python/python3-kazoo_2.8.0.bb
index adfec92c..554e1659 100644
--- a/meta-openstack/recipes-devtools/python/python3-kazoo_2.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-kazoo_2.8.0.bb
@@ -9,8 +9,8 @@ SRCNAME = "kazoo"
 
 PYPI_SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/kazoo-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "073445f65d71520de2b6275530d88c4e"
-SRC_URI[sha256sum] = "6883f6dd3e8d4e1741076dd3b23b0861592f13759072e3835f035bcb72b077cb"
+SRC_URI[md5sum] = "5b2667e9c3f7b92675aef16c14cef97c"
+SRC_URI[sha256sum] = "588e27868e4a0ed70ae4a7a5b0f3bca4cec5e5c49dbd7e41349c0883182bf2fe"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



