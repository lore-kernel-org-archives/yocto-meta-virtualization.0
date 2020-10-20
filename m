Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1611.1603176265487887506
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0546E38C0694
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 23:44:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,396,1596470400"; 
   d="scan'208";a="100322107"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 14:44:24 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id C482548990D3
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 14:44:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 14:44:18 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-voluptuous: upgrade 0.10.5 -> 0.12.0
Date: Tue, 20 Oct 2020 14:44:16 +0800
Message-ID: <1603176256-40720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: C482548990D3.A5483
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-voluptuous_0.10.5.bb    | 2 --
 .../{python-voluptuous.inc => python3-voluptuous_0.12.0.bb} | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-voluptuous_0.10.5.bb
 rename meta-openstack/recipes-devtools/python/{python-voluptuous.inc => python3-voluptuous_0.12.0.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python3-voluptuous_0.10.5.bb b/meta-openstack/recipes-devtools/python/python3-voluptuous_0.10.5.bb
deleted file mode 100644
index a869608..0000000
--- a/meta-openstack/recipes-devtools/python/python3-voluptuous_0.10.5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-voluptuous.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-voluptuous.inc b/meta-openstack/recipes-devtools/python/python3-voluptuous_0.12.0.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python-voluptuous.inc
rename to meta-openstack/recipes-devtools/python/python3-voluptuous_0.12.0.bb
index 7537aee..5c59c21 100644
--- a/meta-openstack/recipes-devtools/python/python-voluptuous.inc
+++ b/meta-openstack/recipes-devtools/python/python3-voluptuous_0.12.0.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9855ba150f2edb00d8e7a41554896ffb"
 
-SRC_URI[md5sum] = "e3fc99b75618d384cad63bc71b6507bc"
-SRC_URI[sha256sum] = "7a7466f8dc3666a292d186d1d871a47bf2120836ccb900d5ba904674957a2396"
+SRC_URI[md5sum] = "4b628978d320baeee543ee407aefc0b1"
+SRC_URI[sha256sum] = "3a4ef294e16f6950c79de4cba88f31092a107e6e3aaa29950b43e2bb9e1bb2dc"
 
-inherit pypi
+inherit setuptools3 pypi
 
 RDEPENDS_${PN} = " \
         "
-- 
2.25.1



