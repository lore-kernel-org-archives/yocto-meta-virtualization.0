Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.3289.1591124149598495218
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 11:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: bsarashk@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 052IsfD8026299
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Jun 2020 11:55:13 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 2 Jun 2020
 11:55:10 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 16552)	id 8E49CC61BC0;
 Tue,  2 Jun 2020 11:54:28 -0700 (PDT)
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <zbsarashki@gmail.com>, Babak Sarashki <Babak.SarAshki@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH 33/34] python-tooz: satisfy setup.py setup_requires
Date: Tue, 2 Jun 2020 11:54:26 -0700
Message-ID: <20200602185427.36627-34-Babak.SarAshki@windriver.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200602185427.36627-1-Babak.SarAshki@windriver.com>
References: <20200602185427.36627-1-Babak.SarAshki@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit 8fdbb0381d disallows fetch of code during do_compile task.
This commits extends DEPENDS to python-pbr-native.

Signed-off-by: Babak Sarashki <Babak.SarAshki@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb b/meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb
index 1443b1b..14f69d1 100644
--- a/meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-tooz_1.48.0.bb
@@ -16,6 +16,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 # RDEPENDS_default:
 RDEPENDS_${PN} += " \
         python-pbr \
-- 
2.23.0

