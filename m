Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8878FE01366
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2013 01:28:50 -0700 (PDT)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 May 2013 01:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,675,1363158000"; d="scan'208";a="337538942"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.118])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2013 01:28:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 15 May 2013 09:28:37 +0100
Message-Id: <1368606517-4873-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] dmidecode: remove
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 08:28:50 -0000

A newer version is now in OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 recipes-extended/dmidecode/dmidecode_2.11.bb | 26 --------------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 recipes-extended/dmidecode/dmidecode_2.11.bb

diff --git a/recipes-extended/dmidecode/dmidecode_2.11.bb b/recipes-extended/dmidecode/dmidecode_2.11.bb
deleted file mode 100644
index 65496ae..0000000
--- a/recipes-extended/dmidecode/dmidecode_2.11.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "DMI (Desktop Management Interface) table related utilities"
-HOMEPAGE = "http://www.nongnu.org/dmidecode/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
-SECTION = "console/tools"
-
-PR = "r0"
-
-SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${PN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "9fddbbc3e330bee5950b8b5d424a57cb"
-SRC_URI[sha256sum] = "d99ee210ecbd6caff2cf6d95dec6d88818c16cec1a08ed0963fd8702f6af8b59"
-
-EXTRA_OEMAKE =+ "prefix=${prefix}  \
-                 includedir=${includedir} \
-                 libdir=${libdir} \
-                 sbindir=${sbindir} \
-                 DESTDIR=${D} \
-                 'CC=${CC}' \
-                 'CFLAGS=${CFLAGS}' \
-                 "
-
-do_install() {
-    oe_runmake install
-    install -d ${D}${sbindir}
-}
-- 
1.8.1.2


