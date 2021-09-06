Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.19288.1630915756385623701
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 01:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18689EN5009049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 6 Sep 2021 01:09:15 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 6 Sep 2021 01:09:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 6 Sep 2021 01:09:13 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 6 Sep 2021 01:09:12 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 1/2] podman: upgrade to 3.3.1
Date: Mon, 6 Sep 2021 16:05:09 +0800
Message-ID: <20210906080510.28468-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-containers/podman/podman_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index ab9aef1..d5f19ab 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -17,9 +17,9 @@ DEPENDS = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
 
-SRCREV = "8809aed5647b61abb14970d409ff7c99c7fbdc34"
+SRCREV = "4c5283fabff2de5145838f1847a5a7b2b1fbc0a5"
 SRC_URI = " \
-    git://github.com/containers/libpod.git;branch=v3.3 \
+    git://github.com/containers/podman.git;branch=v3.3 \
 "
 
 LICENSE = "Apache-2.0"
@@ -29,7 +29,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "3.3.0+git${SRCPV}"
+PV = "3.3.1+git${SRCPV}"
 
 PACKAGES =+ "${PN}-contrib"
 
-- 
2.17.1

