Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.3288.1591124113839425060
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 11:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: bsarashk@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 052It9GZ015388
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Jun 2020 11:55:12 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 2 Jun 2020
 11:54:57 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 16552)	id 60070C61BB6;
 Tue,  2 Jun 2020 11:54:28 -0700 (PDT)
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <zbsarashki@gmail.com>, Babak Sarashki <Babak.SarAshki@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH 27/34] python-oslotest: satisfy setup.py setup_requires
Date: Tue, 2 Jun 2020 11:54:20 -0700
Message-ID: <20200602185427.36627-28-Babak.SarAshki@windriver.com>
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
 .../recipes-devtools/python/python-oslotest_git.bb         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslotest_git.bb b/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
index f60b372..7505100 100644
--- a/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
@@ -20,6 +20,11 @@ DEPENDS += "\
     python-pbr \
     "
 
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+	"
+
 RDEPENDS_${PN} = "python-fixtures \
                   python-subunit \
                   python-six \
@@ -31,4 +36,4 @@ RDEPENDS_${PN} = "python-fixtures \
                   python-debtcollector \
                   bash \
 "
-	
\ No newline at end of file
+	
-- 
2.23.0

