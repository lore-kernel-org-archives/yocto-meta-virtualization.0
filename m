Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.4604.1591767924924491608
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jun 2020 22:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05A5jN0K014023
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 9 Jun 2020 22:45:24 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 9 Jun 2020 22:45:05 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] python3-dockerpty: add the missing rdepends
Date: Wed, 10 Jun 2020 13:43:38 +0800
Message-ID: <20200610054338.3566915-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import dockerpty
 [snip]
 ModuleNotFoundError: No module named 'ssl'
 ModuleNotFoundError: No module named 'fcntl'
 ModuleNotFoundError: No module named 'six'
 ModuleNotFoundError: No module named 'tty'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/python/python3-dockerpty_0.4.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-devtools/python/python3-dockerpty_0.4.1.bb b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
index 31a864a..cde2d12 100644
--- a/recipes-devtools/python/python3-dockerpty_0.4.1.bb
+++ b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
@@ -7,3 +7,10 @@ inherit pypi setuptools3
 
 SRC_URI[md5sum] = "028bacb34536f3ee6a2ccd668c27e8e4"
 SRC_URI[sha256sum] = "69a9d69d573a0daa31bcd1c0774eeed5c15c295fe719c61aca550ed1393156ce"
+
+RDEPENDS_${PN} += "\
+  ${PYTHON_PN}-fcntl \
+  ${PYTHON_PN}-io \
+  ${PYTHON_PN}-six \
+  ${PYTHON_PN}-terminal \
+"
-- 
2.24.1

