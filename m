Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.7236.1634290630994222551
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Oct 2021 02:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 19F9b9Wk020733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Oct 2021 02:37:09 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 15 Oct 2021 02:37:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 15 Oct 2021 02:37:08 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 15 Oct 2021 02:37:07 -0700
From: "kai" <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] ceph: inherit pkgconfig.bbclass
Date: Fri, 15 Oct 2021 17:37:05 +0800
Message-ID: <20211015093705.39812-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

According to oe-core commit

652fdf8719 sstate: Allow validation of sstate singatures against list of keys

pkgconfig-native is not deployed in sysroot by default any more. Inherit
pkgconfig.bbclass to make it work for ceph.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
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

