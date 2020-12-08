Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.4282.1607403620105297744
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 21:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 968D238C0858
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 05:00:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102163525"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 13:00:18 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 32F4C4CE6009
	for <meta-virtualization@yoctoproject.org>; Tue,  8 Dec 2020 13:00:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 13:00:17 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-castellan: upgrade 3.6.0 -> 3.7.0
Date: Tue, 8 Dec 2020 13:00:11 +0800
Message-ID: <1607403611-56302-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 32F4C4CE6009.A544A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{python3-castellan_3.6.0.bb => python3-castellan_3.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python3-castellan_3.6.0.bb => python3-castellan_3.7.0.bb} (89%)

diff --git a/meta-openstack/recipes-devtools/python/python3-castellan_3.6.0.bb b/meta-openstack/recipes-devtools/python/python3-castellan_3.7.0.bb
similarity index 89%
rename from meta-openstack/recipes-devtools/python/python3-castellan_3.6.0.bb
rename to meta-openstack/recipes-devtools/python/python3-castellan_3.7.0.bb
index 75a57c11..5dd45dad 100644
--- a/meta-openstack/recipes-devtools/python/python3-castellan_3.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-castellan_3.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[sha256sum] = "66c8e02a822e78a8fd58abc928149c559f3d238472690f36e4993a9249b0636d"
+SRC_URI[sha256sum] = "528033d00cca4fae078dadfd43db5e52b7af5bba6d97b730aa585eb092356dd7"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



