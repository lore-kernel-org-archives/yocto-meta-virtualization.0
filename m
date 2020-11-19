Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.5035.1605763107152630431
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 21:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: tCAwx45agCL1+qs+GB5q0KtjRGpkweCGWfUKTdhj/yolcddpRyQ8VsL5iKRjxeZk0NZ9Vx2AyL
 ZcVUO1KzlDJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171402941"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; 
   d="scan'208";a="171402941"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 21:18:25 -0800
IronPort-SDR: KkAuN8gtcglYVrq/unwlkqu1rLcJE6BWysKYbYFlfoJdx7NvwDPonbLjcGSn+dLc0ifl1q5izf
 GkWBY+z/yC7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; 
   d="scan'208";a="533025689"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2020 21:18:24 -0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: fix host gcc can't recognized option -fmacro-prefix-map
Date: Thu, 19 Nov 2020 13:18:21 +0800
Message-Id: <1605763101-60407-1-git-send-email-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.7.4

libvirt-python picks host gcc (instead of cross gcc) to build shared
library in absense of LD*SHARED flags.

Instead of inherit distutils3-base.class, taking SHARED flags to create
libvirt-python package.

Ref: https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/distutils-common-base.bbclass

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 7b87d5e..819eceb 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -24,6 +24,11 @@ export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
 export LIBVIRT_LIBS = "-L${B}/src/.libs -lvirt -ldl"
 export LDFLAGS="-L${B}/src/.libs"
+export LDSHARED  = "${CCLD} -shared"
+export LDCXXSHARED  = "${CXX} -shared"
+export CCSHARED  = "-fPIC -DPIC"
+export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
+
 
 LIBVIRT_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
-- 
2.7.4

