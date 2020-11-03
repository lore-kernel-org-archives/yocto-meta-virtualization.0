Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1059.1604389540739734278
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 23:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 39ADE38C08E3
	for <meta-virtualization@yoctoproject.org>; Mon,  2 Nov 2020 23:45:40 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.77,447,1596470400"; 
   d="scan'208";a="100859500"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Nov 2020 15:45:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8CFF84CE34EF
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 15:45:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 3 Nov 2020 15:45:35 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-debtcollector: upgrade 2.1.0 -> 2.2.0
Date: Tue, 3 Nov 2020 15:45:35 +0800
Message-ID: <1604389535-98666-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8CFF84CE34EF.AAE7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...-debtcollector_2.1.0.bb => python3-debtcollector_2.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-debtcollector_2.1.0.bb => python3-debtcollector_2.2.0.bb} (82%)

diff --git a/meta-openstack/recipes-devtools/python/python3-debtcollector_2.1.0.bb b/meta-openstack/recipes-devtools/python/python3-debtcollector_2.2.0.bb
similarity index 82%
rename from meta-openstack/recipes-devtools/python/python3-debtcollector_2.1.0.bb
rename to meta-openstack/recipes-devtools/python/python3-debtcollector_2.2.0.bb
index fbf4626..4c6bf70 100644
--- a/meta-openstack/recipes-devtools/python/python3-debtcollector_2.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-debtcollector_2.2.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[md5sum] = "9a1014f18abbc565b8e149fd70048c22"
-SRC_URI[sha256sum] = "a25fc6215560d81cb9f2a0b58d6c834f2a24010987027bde169599e138a205af"
+SRC_URI[md5sum] = "6ac3af37693e0f517e51593d9ea33f23"
+SRC_URI[sha256sum] = "787981f4d235841bf6eb0467e23057fb1ac7ee24047c32028a8498b9128b6829"
 
 inherit setuptools3 pypi
 
-- 
2.25.1



