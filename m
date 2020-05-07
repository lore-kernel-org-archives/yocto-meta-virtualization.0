Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.3634.1588820422825799003
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 May 2020 20:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04730055017387
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 6 May 2020 20:00:11 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 6 May 2020 19:59:32 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] python3-fastentrypoints: add missing setuptools RDEPENDS
Date: Thu, 7 May 2020 10:59:31 +0800
Message-ID: <1588820371-338308-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add missing setuptools RDEPENDS to fix below error:
 # python3
Python 3.8.2 (default, Apr 27 2020, 08:51:00)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import fastentrypoints
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib64/python3.8/site-packages/fastentrypoints.py", line 39, in <module>
from setuptools.command import easy_install
ModuleNotFoundError: No module named 'setuptools'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/python/python3-fastentrypoints_0.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/python/python3-fastentrypoints_0.12.bb b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
index 7bd1651..a96bd15 100644
--- a/recipes-devtools/python/python3-fastentrypoints_0.12.bb
+++ b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://README.rst;md5=f212a0cb34eb678477972d2011fb365a"
 
 inherit pypi setuptools3
 
+RDEPENDS_${PN} += "${PYTHON_PN}-setuptools"
+
 SRC_URI[md5sum] = "390ad9a9229164a06156a5b1f0ef1b22"
 SRC_URI[sha256sum] = "ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b"
 
-- 
2.7.4

