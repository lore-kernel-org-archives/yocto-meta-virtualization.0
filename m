Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [])
 by mx.groups.io with SMTP id smtpd.web10.6469.1597357098984279450
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 15:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=Knxfi1d/;
 spf=fail (domain: wdc.com, ip: <nil>, mailfrom: prvs=487a0182d=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1597357119; x=1628893119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2+HMGCGArx5RBMS5zCegnY1ZUZATd6sOfd76NoBu0Xc=;
  b=Knxfi1d/LEosjo4XdPBKU+Waez3KG3MJpCS6Gr2aeZb+EllTyzlCM/rX
   qLV+mlwQ0bB2H7vfs05ebzbXeqx9hn1YOa7bujEsrWoL1tD9+2HCEdNfr
   yqwStJb1BZzqBkzL5psW6FUhiQlXl7/diKeFdGuRq0xwD94up2ETMy8qT
   l1880jwEHI/UvLo12rE+7kStcMBmjSJq54OuqxiwsjyBzycjCko7GXo3y
   w/Ol9n7sKpLFNjjrXa5cUJLtHQ5nge8mp7MlTNDqqvweqFzj2b3jBhUMJ
   AiYiE5KB7eDwjbqr/E9lmIp4U6R9egxtRaQ3zDmP1GETEXRCTbSVNPscP
   w==;
IronPort-SDR: 16E5aXDkMtpZT215P0GFlm2I6oSZdGEquO3wRtLxm4U1LxnlpEjM+fOoqiq/k0UE2IP8wvMV5I
 T3WooCje2hmPSGXcU/AtuaRU8X5oiYheeox/5Me6J08QAZzULGYXlPisjHHzVarkUvY5rmTXXn
 tPBLqvgg5QlcjfXPFnlXhrejbfS2gmMMyYWXl9CqmyW+LbEc5yhDX9dIPBXm7lWQbebzE6TBbN
 qhlASNW8rJ5N6ulKttnwlaI2D7tHoaL2h5FiPNoymxrSoAhvBlwucjfvD9ybfD3FeY8xB5BHb+
 RpI=
X-IronPort-AV: E=Sophos;i="5.76,309,1592841600"; 
   d="scan'208";a="248064367"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Aug 2020 06:18:37 +0800
IronPort-SDR: vGgXQuHEf3dm+m5IecxCpTGM3hzyZ8l0Gj7gScSU+JbNpOxNAcVn+K64IcfbooqtIUmcHPgP//
 Tp1ifZQwnACg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 15:06:07 -0700
IronPort-SDR: ZXwJuXR86quYMdF1XHU4z1bF/JhTHahWNAbevjtn8nBLeysBtRPM0U2QEtoYhGftsyy6Oen9wO
 wexdbtZBpquw==
WDCIronportException: Internal
Received: from jbfyk72.ad.shared (HELO risc6-mainframe.hgst.com) ([10.86.59.14])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Aug 2020 15:18:17 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	bruce.ashfield@gmail.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 3/4] xvisor: Add support for building AArch64
Date: Thu, 13 Aug 2020 15:08:13 -0700
Message-Id: <20200813220814.3110999-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813220814.3110999-1-alistair.francis@wdc.com>
References: <20200813220814.3110999-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for building for AArch64, also remove the requirement to
specify a platform.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 recipes-extended/xvisor/xvisor-configs.inc | 22 +++++++++++-----------
 recipes-extended/xvisor/xvisor_git.bb      |  9 +++++++--
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/recipes-extended/xvisor/xvisor-configs.inc b/recipes-extended/xvisor/xvisor-configs.inc
index 099128d..f53bba2 100644
--- a/recipes-extended/xvisor/xvisor-configs.inc
+++ b/recipes-extended/xvisor/xvisor-configs.inc
@@ -1,15 +1,15 @@
-def get_oemake_config(d):
-    plat = d.getVar('XVISOR_PLAT')
-
-    if plat is None:
-        return ""
-
-    if 'riscv/virt32' in plat:
-        return "generic-32b-defconfig"
-    if 'riscv/virt64' in plat:
-        return "generic-64b-defconfig"
+def get_oemake_config(a, d):
+    import re
 
-    return ""
+    if   re.match('armeb$', a):               return 'generic-v7-defconfig'
+    elif re.match('aarch64$', a):             return 'generic-v8-defconfig'
+    elif re.match('aarch64_be$', a):          return 'generic-v8-defconfig'
+    elif re.match('aarch64_ilp32$', a):       return 'generic-v8-defconfig'
+    elif re.match('aarch64_be_ilp32$', a):    return 'generic-v8-defconfig'
+    elif re.match('riscv32(eb|)$', a):        return 'generic-32b-defconfig'
+    elif re.match('riscv64(eb|)$', a):        return 'generic-64b-defconfig'
+    else:
+        bb.error("cannot map '%s' to a Xvisor defconfig" % a)
 
 def map_xvisor_arch(a, d):
     import re
diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
index 45a7baf..64b0f22 100644
--- a/recipes-extended/xvisor/xvisor_git.bb
+++ b/recipes-extended/xvisor/xvisor_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += "ARCH=\"${@map_xvisor_arch(d.getVar('TARGET_ARCH'), d)}\" I=${D}"
 
-CONFIG = "${@get_oemake_config(d)}"
+CONFIG = "${@get_oemake_config(d.getVar('TARGET_ARCH'), d)}"
 
 do_configure() {
     oe_runmake ${CONFIG}
@@ -35,11 +35,16 @@ do_install_append() {
 do_deploy () {
     install -d ${DEPLOY_DIR_IMAGE}
     install -m 755 ${D}/vmm.* ${DEPLOY_DIR_IMAGE}/
+
+    if [[ -f "${D}/*.dtb" ]]; then
+        install -m 755 ${D}/*.dtb ${DEPLOY_DIR_IMAGE}/
+    fi
 }
 
 addtask deploy after do_install
 
 FILES_${PN} += "/vmm.*"
+FILES_${PN} += "/*.dtb"
 
-COMPATIBLE_HOST = "(riscv64|riscv32).*"
+COMPATIBLE_HOST = "(aarch64|riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.27.0

