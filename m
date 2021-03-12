Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web09.4769.1615529772942641481
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 22:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: rameshkrishnanx.geddy.sekar@intel.com)
IronPort-SDR: 6PFLT0w7dJpfVeQa1yEJvAkaRtObOHxMZF/IPJhvXnbyPGvDBpM77aIHM7Rhtk6wFIoZIxewj0
 marN316mwpqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="208625802"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; 
   d="scan'208";a="208625802"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 22:16:11 -0800
IronPort-SDR: rJgFf2epO6aBXLw1zmNIzgSt1dDxa/hVnySHX/wBePQY2g4s7lTwRtC8Dciqv0Kboeu+5AytUy
 OcsEKOhJtq9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; 
   d="scan'208";a="404322280"
Received: from gio-c697a622fbe.png.intel.com ([10.221.254.119])
  by fmsmga008.fm.intel.com with ESMTP; 11 Mar 2021 22:16:11 -0800
From: rameshkrishnanx.geddy.sekar@intel.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][PATCH] src_uri: artifacts moved from downloads to newpath
Date: Fri, 12 Mar 2021 22:12:17 +0800
Message-Id: <20210312141217.26145-1-rameshkrishnanx.geddy.sekar@intel.com>
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
 recipes-containers/lxc/lxc_4.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/lxc_4.0.6.bb
index ddff9af..b422909 100644
--- a/recipes-containers/lxc/lxc_4.0.6.bb
+++ b/recipes-containers/lxc/lxc_4.0.6.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 RDEPENDS_${PN}-networking += "iptables"
 
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://run-ptest \
 	file://lxc-fix-B-S.patch \
-- 
2.17.1

