Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5761.1637306966636244921
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 23:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AJ7TL03010413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Nov 2021 23:29:25 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 18 Nov 2021 23:29:21 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 18 Nov 2021 23:29:20 -0800
From: "kai" <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] openstack-image-aio: fix warning of operator remove combined with +=
Date: Fri, 19 Nov 2021 15:28:41 +0800
Message-ID: <20211119072841.20701-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix warning of openstack-image-aio:

| WARNING: /path/to/meta-openstack/recipes-extended/images/openstack-image-aio.bb:
|   IMAGE_ROOTFS_EXTRA_SPACE:append += is not a recommended operator combination,
|   please replace it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-openstack/recipes-extended/images/openstack-image-aio.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/images/openstack-image-aio.bb b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
index 858c8e99..f01d0ed5 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-aio.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
@@ -27,7 +27,7 @@ inherit identity
 inherit monitor
 
 # check for 5G of free space, so we use 5G as a starting point.
-IMAGE_ROOTFS_EXTRA_SPACE:append += "+ 5000000"
+IMAGE_ROOTFS_EXTRA_SPACE += "+ 5000000"
 
 POST_KEYSTONE_SETUP_COMMAND = "/etc/keystone/hybrid-backend-setup"
 
-- 
2.17.1

