Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.3299.1591124139452244064
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 11:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: bsarashk@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 052IsfD7026299
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Jun 2020 11:55:13 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 2 Jun 2020
 11:55:06 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 16552)	id 83FE8C61BBF;
 Tue,  2 Jun 2020 11:54:28 -0700 (PDT)
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <zbsarashki@gmail.com>, Babak Sarashki <Babak.SarAshki@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH 32/34] python-taskflow: satisfy setup.py setup_requires
Date: Tue, 2 Jun 2020 11:54:25 -0700
Message-ID: <20200602185427.36627-33-Babak.SarAshki@windriver.com>
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
 .../recipes-devtools/python/python-taskflow_git.bb         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb b/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
index 76371a8..a2fe43b 100644
--- a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
@@ -19,6 +19,11 @@ DEPENDS += " \
         python-pbr \
         "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
 RDEPENDS_${PN} += " \
         python-pbr \
         python-six \
@@ -37,4 +42,4 @@ RDEPENDS_${PN} += " \
         python-cachetools \
         python-debtcollector \
         "
-	
\ No newline at end of file
+	
-- 
2.23.0

