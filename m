Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.6190.1636602869133208122
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 19:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AB3sM4O030060
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Nov 2021 19:54:22 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1AB3sLd0002297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Nov 2021 19:54:22 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Nov 2021 19:54:21 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 10 Nov 2021 19:54:20 -0800
From: "kai" <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] open-iscsi-user: remove typo spaces in SRC_URI
Date: Thu, 11 Nov 2021 11:53:39 +0800
Message-ID: <20211111035339.3538-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There are typo spaces in SRC_URI which are introduced when add
';branch=master'. Remove them.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
index d4c489cf..fe802b72 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "kmod openssl util-linux open-isns"
 DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
-SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https  ;branch=master \
+SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
            file://0001-fix-build-error-of-cross-build.patch \
            "
 
-- 
2.17.1

