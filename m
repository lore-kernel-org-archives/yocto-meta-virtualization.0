Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.4918.1615530541166154936
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 22:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: rameshkrishnanx.geddy.sekar@intel.com)
IronPort-SDR: YJfjev/LLz3CMjUmqW0lCAcBFUW3zXjDkyxGqd5kZTA01UB8e9GogizJeJNkTkyVtTj8JyBetW
 iKlKMNOcc5uQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="250155603"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; 
   d="scan'208";a="250155603"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 22:28:59 -0800
IronPort-SDR: qIjFSk2NcT9yufW2hACsDllSbneAAEKCbJQyy3xyz/0BTzgoCXwQR9HI2W8ElL7owl75rR816e
 TMjQRHy7J5qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; 
   d="scan'208";a="409755782"
Received: from gio-c697a622fbe.png.intel.com ([10.221.254.119])
  by orsmga007.jf.intel.com with ESMTP; 11 Mar 2021 22:28:58 -0800
From: rameshkrishnanx.geddy.sekar@intel.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][dunfell][PATCH] src_uri: artifacts moved from downloads to newpath
Date: Fri, 12 Mar 2021 22:25:04 +0800
Message-Id: <20210312142504.26501-1-rameshkrishnanx.geddy.sekar@intel.com>
X-Mailer: git-send-email 2.17.1

From: RameshkrishnanX Geddy Sekar <rameshkrishnanx.geddy.sekar@intel.com>

This is to fix the fetch issue during the yocto build and the given fix
is able to download the source from the https://linuxcontainers.org/

new_path:
https://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz

old path:
https://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz

Signed-off-by: RameshkrishnanX Geddy Sekar <rameshkrishnanx.geddy.sekar@intel.com>
---
 recipes-containers/lxc/lxc_4.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_4.0.1.bb b/recipes-containers/lxc/lxc_4.0.1.bb
index 807232e..ded8065 100644
--- a/recipes-containers/lxc/lxc_4.0.1.bb
+++ b/recipes-containers/lxc/lxc_4.0.1.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 RDEPENDS_${PN}-networking += "iptables"
 
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://run-ptest \
 	file://lxc-fix-B-S.patch \
-- 
2.17.1

