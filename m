Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.146.1590781370236644031
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 May 2020 12:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: bsarashk@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04TJfoNm000629
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 29 May 2020 12:42:21 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 29 May 2020
 12:41:47 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 16552)	id 1693DC600F6;
 Fri, 29 May 2020 12:41:47 -0700 (PDT)
From: babak.sarashki@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
CC: <zbsarashki@gmail.com>, Babak Sarashki <babak.sarashki@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH] postgresql: Fix install error on non existent file
Date: Fri, 29 May 2020 12:41:29 -0700
Message-ID: <20200529194129.89590-1-Babak.SarAshki@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Babak Sarashki <babak.sarashki@windriver.com>

Commit 103939fec ("postgresql: Allow successful run of postgresql-setup")
renamed .bash_profile to .profile. This commit reflects the file rename.

Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com>
---
 meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
index b6a9c3c..3de5845 100644
--- a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
+++ b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
@@ -35,7 +35,7 @@ do_install_append() {
     sed -e "s:%SYSCONFIGDIR%:${sysconfdir}:g" -i ${PG_INIT_SERVICE_FILE}
 
     # Update PGDATA throughout
-    files="${D}${localstatedir}/lib/${BPN}/.bash_profile"
+    files="${D}${localstatedir}/lib/${BPN}/.profile"
     files="$files ${D}${systemd_unitdir}/system/postgresql.service"
     files="$files ${D}${bindir}/${BPN}-setup"
     files="$files ${D}${sysconfdir}/init.d/${BPN}-server"
-- 
2.23.0

