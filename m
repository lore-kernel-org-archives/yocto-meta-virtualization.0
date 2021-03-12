Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.4840.1615530350947974584
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 22:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: rameshkrishnanx.geddy.sekar@intel.com)
IronPort-SDR: 2ky0YpPm2WplhS8ZEEEvsL421vnj3nj2WmjNyIvihYgfAbl4jCha4S0HyGIJ4044KQKvF1Iv0q
 xmaQHoK9kTjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="208626563"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; 
   d="scan'208";a="208626563"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 22:25:50 -0800
IronPort-SDR: x+CrJDNp4sWi+wXbxv5N3ioK4pPaBOJ3d8/2TO68h+R79U/nfjWnmvRzvqndBOWIlXJVe4eZmf
 BlVbleUG7CHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; 
   d="scan'208";a="372582827"
Received: from gio-c697a622fbe.png.intel.com ([10.221.254.119])
  by orsmga006.jf.intel.com with ESMTP; 11 Mar 2021 22:25:49 -0800
From: rameshkrishnanx.geddy.sekar@intel.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][gatesgarth][PATCH] src_uri: artifacts moved from downloads to newpath
Date: Fri, 12 Mar 2021 22:21:55 +0800
Message-Id: <20210312142155.26379-1-rameshkrishnanx.geddy.sekar@intel.com>
X-Mailer: git-send-email 2.17.1

From: RameshkrishnanX Geddy Sekar <rameshkrishnanx.geddy.sekar@intel.com>

From: RameshkrishnanX Geddy Sekar <rameshkrishnanx.geddy.sekar@intel.com>

This is to fix the fetch issue during the yocto build and the given fix
is able to download the source from the https://linuxcontainers.org/

new_path:
https://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz

old path:
https://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz

Signed-off-by: RameshkrishnanX Geddy Sekar <rameshkrishnanx.geddy.sekar@intel.com>
---
 recipes-containers/lxc/lxc_4.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_4.0.4.bb b/recipes-containers/lxc/lxc_4.0.4.bb
index 4ef5fc0..637846e 100644
--- a/recipes-containers/lxc/lxc_4.0.4.bb
+++ b/recipes-containers/lxc/lxc_4.0.4.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 RDEPENDS_${PN}-networking += "iptables"
 
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://run-ptest \
 	file://lxc-fix-B-S.patch \
-- 
2.17.1

