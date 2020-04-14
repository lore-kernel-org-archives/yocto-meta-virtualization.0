Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.8789.1586862843837222026
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 04:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03EBE31w000439
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2020 04:14:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Apr 2020
 04:14:03 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/1] lxc: correct the LIC_FILES_CHKSUM and LICENSE fields
Date: Tue, 14 Apr 2020 19:13:53 +0800
Message-ID: <20200414111353.8404-2-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200414111353.8404-1-yanfei.xu@windriver.com>
References: <20200414111353.8404-1-yanfei.xu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

License changes from lxc3.2.1 to lxc4.0.1:
  1.File COPYING is renamed to LICENSE.LGPL2.1
  2.Add a new file LICENSE.GPL2

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 recipes-containers/lxc/lxc_4.0.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_4.0.1.bb b/recipes-containers/lxc/lxc_4.0.1.bb
index a3de38e..bfe003c 100644
--- a/recipes-containers/lxc/lxc_4.0.1.bb
+++ b/recipes-containers/lxc/lxc_4.0.1.bb
@@ -1,7 +1,10 @@
 DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
 SECTION = "console/utils"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+"
+
 DEPENDS = "libxml2 libcap"
 RDEPENDS_${PN} = " \
 		rsync \
-- 
2.18.2

