Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.4656.1634611992913141972
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 19:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 19J2r5Nw021003
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 19:53:09 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Oct 2021 19:53:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 18 Oct 2021 19:53:03 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 18 Oct 2021 19:53:03 -0700
From: "kai" <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH v2] ceph: inherit pkgconfig.bbclass
Date: Tue, 19 Oct 2021 10:53:00 +0800
Message-ID: <20211019025300.39608-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

According to oe-core commit

8e26252b45 layer.conf: Extend recipes not to install without explict dependencies

pkgconfig-native is not deployed in sysroot by default any more. Inherit
pkgconfig.bbclass to make it available for ceph.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:
* correct referenced commit

 recipes-extended/ceph/ceph_15.2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/ceph/ceph_15.2.12.bb b/recipes-extended/ceph/ceph_15.2.12.bb
index 6636d7a..693b525 100644
--- a/recipes-extended/ceph/ceph_15.2.12.bb
+++ b/recipes-extended/ceph/ceph_15.2.12.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24
                     file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754 \
 "
-inherit cmake python3native python3-dir systemd
+inherit cmake pkgconfig python3native python3-dir systemd
 # Disable python pybind support for ceph temporary, when corss compiling pybind,
 # pybind mix cmake and python setup environment, would case a lot of errors.
 
-- 
2.17.1

