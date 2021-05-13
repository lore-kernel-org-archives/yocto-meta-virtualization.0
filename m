Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.244.1620921451739958159
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 May 2021 08:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DC3B1476;
	Thu, 13 May 2021 08:57:30 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.69.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 616333F718;
	Thu, 13 May 2021 08:57:29 -0700 (PDT)
From: "Richard Neill" <richard.neill@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization] [PATCH] xen, rpi4: fix typo in raspberrypi dynamic-layers inclusion
Date: Thu, 13 May 2021 16:58:12 +0100
Message-Id: <20210513155812.3905140-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index f1f468b..b3e5283 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -13,7 +13,7 @@ LICENSE_PATH +=3D "${LAYERDIR}/files/custom-licenses"

 BBFILES_DYNAMIC +=3D " \
     raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bb \
-    raspberrypi:${LAYERDIR}/dynamic-layers/rasbperrypi/*/*/*.bbappend \
+    raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bbappend \
     xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bb \
     xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bbappend \
 "
--
2.25.1

