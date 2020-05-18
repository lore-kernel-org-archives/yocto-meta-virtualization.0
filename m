Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.34472.1589767623296801113
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 17 May 2020 19:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04I26Bbl004079
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 17 May 2020 19:06:52 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 17 May 2020 19:06:10 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] python3-fastentrypoints: add the missing rdepends
Date: Mon, 18 May 2020 10:05:54 +0800
Message-ID: <20200518020554.30534-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import fastentrypoints
 [snip]
 ModuleNotFoundError: No module named 'pickle'
---
 recipes-devtools/python/python3-fastentrypoints_0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python3-fastentrypoints_0.12.bb b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
index a96bd15..53bed18 100644
--- a/recipes-devtools/python/python3-fastentrypoints_0.12.bb
+++ b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://README.rst;md5=f212a0cb34eb678477972d2011fb365a"
 
 inherit pypi setuptools3
 
-RDEPENDS_${PN} += "${PYTHON_PN}-setuptools"
+RDEPENDS_${PN} += "${PYTHON_PN}-setuptools ${PYTHON_PN}-pickle"
 
 SRC_URI[md5sum] = "390ad9a9229164a06156a5b1f0ef1b22"
 SRC_URI[sha256sum] = "ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b"
-- 
2.24.1

