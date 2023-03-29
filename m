Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3A6C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 14:19:15 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.25865.1680099552461880666
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 07:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=oNuqXMZK;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680099553;
  x=1711635553;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rKkRZ4/6nbJWW/EWnEZUX+ZoW9jY6AgCae6xc+FmhSc=;
  b=oNuqXMZKz19+Y2pqiuQsYCOJcx0f62aGOADtqhwdDrqzHZdGCXKPBmh+
   WNK9Qyr0q/uJPtzFKhKxS5wKWV2W9sveAxg6NrWFb5kb7sKd0mDCU5FO1
   tlAEGyJ35CU33Q467C5WjFrK93gx25SyQhw6iFW48dLMwsjJ7UzpQkRK3
   T7LS613rN6sQKSThGfFOq2bK1gri6Ui3Rg7ktpOLtD6YhTWXFzhNvBeoI
   X3HKRf4NTgtZhxaBrAKWoMiX8OJ3ckjcNjH8P273NMcDGgQWFFZvbQ4WI
   B5WIq8xwgWKMiyQ+1jO4kBpkpsMQKhIEKzoaDWGTxvnMLFmg1/knVTdX2
   w==;
From: Joakim Roubert <joakimr@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Joakim Roubert <joakimr@axis.com>
Subject: [meta-virtualization][PATCH] upx: Bump to v3.99
Date: Wed, 29 Mar 2023 16:18:47 +0200
Message-ID: <20230329141847.337386-1-joakimr@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 14:19:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7963

It seems there has been recent changes to the UPX repo that make the
current 3.96 setup here fail now. This patch mitigates that and also
bumps UPX to version 3.99.

Change-Id: I9fb718c9e98340a85997fde6c9d7c3fa1472d263
Signed-off-by: Joakim Roubert <joakimr@axis.com>
---
 recipes-extended/upx/upx_git.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
index bb8004c6..3cf82065 100644
--- a/recipes-extended/upx/upx_git.bb
+++ b/recipes-extended/upx/upx_git.bb
@@ -1,13 +1,13 @@
 HOMEPAGE = "http://upx.sourceforge.net"
 SUMMARY = "Ultimate executable compressor."
 
-SRCREV_upx = "8d1a98e03bf281b2cee459b6c27347e56d13c6a8"
-SRCREV_vendor_doctest = "666e648b68fda2deb141a1fe93e3fd1e2795dd0f"
-SRCREV_vendor_lzma_sdk = "9ebf8f468c689d83504e6c08c6bc26c4a1cf180f"
-SRCREV_vendor_ucl = "4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf"
-SRCREV_vendor_zlib = "2a5b338eb173a701ed179e951d4c390e75e8d4c7"
+SRCREV_upx = "feef2e38cfe7660c6d9e22b36defad4cfbf563a9"
+SRCREV_vendor_doctest = "${AUTOREV}"
+SRCREV_vendor_lzma_sdk = "${AUTOREV}"
+SRCREV_vendor_ucl = "${AUTOREV}"
+SRCREV_vendor_zlib = "${AUTOREV}"
 SRCREV_FORMAT = "upx"
-SRC_URI = "git://github.com/upx/upx;name=upx;branch=devel;protocol=https \
+SRC_URI = "git://github.com/upx/upx;name=upx;branch=master;protocol=https \
            git://github.com/upx/upx-vendor-doctest;name=vendor_doctest;subdir=git/vendor/doctest;branch=upx-vendor;protocol=https \
            git://github.com/upx/upx-vendor-lzma-sdk;name=vendor_lzma_sdk;subdir=git/vendor/lzma-sdk;branch=upx-vendor;protocol=https \
            git://github.com/upx/upx-vendor-ucl;name=vendor_ucl;subdir=git/vendor/ucl;branch=upx-vendor;protocol=https \
@@ -17,13 +17,13 @@ SRC_URI = "git://github.com/upx/upx;name=upx;branch=devel;protocol=https \
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
 
-DEPENDS = "zlib libucl xz cmake-native"
+DEPENDS = "cmake-native"
 
 # inherit cmake
 
 S = "${WORKDIR}/git"
 
-PV = "3.96+${SRCPV}"
+PV = "3.99+${SRCPV}"
 
 EXTRA_OEMAKE += " \
     UPX_UCLDIR=${STAGING_DIR_TARGET} \
-- 
2.30.2


