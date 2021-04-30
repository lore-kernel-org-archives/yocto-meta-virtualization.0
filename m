Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.5544.1619744593282944480
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Apr 2021 18:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 13U13BoJ003162
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Apr 2021 20:03:12 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/1] xen: Remove deltask for setscene
Date: Thu, 29 Apr 2021 20:03:10 -0500
Message-Id: <20210430010311.29911-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430010311.29911-1-mark.hatle@kernel.crashing.org>
References: <20210430010311.29911-1-mark.hatle@kernel.crashing.org>

From: Mark Hatle <mark.hatle@xilinx.com>

As of the gatesgarth you are no longer allowed to remove setscene tasks
as the eSDK generation expects for tasks to actually be executed.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc b/dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc
index 344061a..d27362a 100644
--- a/dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc
+++ b/dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc
@@ -9,6 +9,3 @@ do_deploy_append() {
            uboot-mkimage -A arm64 -T kernel -a ${XENIMAGE_KERNEL_LOADADDRESS} -e ${XENIMAGE_KERNEL_LOADADDRESS} -C none -d ${DEPLOYDIR}/xen-${MACHINE} ${DEPLOYDIR}/xen.ub
        fi
 }
-
-deltask do_deploy_setscene
-deltask do_populate_sysroot_setscene
-- 
2.17.1

