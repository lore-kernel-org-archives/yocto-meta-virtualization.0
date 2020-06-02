Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.3264.1591124071760866309
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 11:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: bsarashk@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 052IsUZn021867
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Jun 2020 11:54:30 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 2 Jun 2020
 11:54:30 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 16552)	id C0A8FC6018D;
 Tue,  2 Jun 2020 11:54:27 -0700 (PDT)
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <zbsarashki@gmail.com>, Babak Sarashki <Babak.SarAshki@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH 06/34] python-cursive: satisfy setup.py setup_requires
Date: Tue, 2 Jun 2020 11:53:59 -0700
Message-ID: <20200602185427.36627-7-Babak.SarAshki@windriver.com>
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
 meta-openstack/recipes-devtools/python/python-cursive_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-cursive_git.bb b/meta-openstack/recipes-devtools/python/python-cursive_git.bb
index 83be034..ce82998 100644
--- a/meta-openstack/recipes-devtools/python/python-cursive_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cursive_git.bb
@@ -18,6 +18,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += " \
         python-pbr \
         python-lxml \
-- 
2.23.0

