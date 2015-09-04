Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83F3EE00D8D; Fri,  4 Sep 2015 08:16:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id BAA0FE00BE3
	for <meta-virtualization@yoctoproject.org>;
	Fri,  4 Sep 2015 08:15:47 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.154) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Fri, 4 Sep 2015
	17:15:44 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 4 Sep 2015 17:15:37 +0200
Message-ID: <1441379737-16799-2-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441379737-16799-1-git-send-email-josep.puigdemont@enea.com>
References: <1441379737-16799-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][kilo][PATCH 2/2] python-sqlalchemy: add dependency on sqlparse
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Sep 2015 15:16:15 -0000
Content-Type: text/plain

Account for python-sqlparse dependency.
Project home page has moved to github.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
index c64855b..3c20a50 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Database schema migration for SQLAlchemy"
-HOMEPAGE = "http://code.google.com/p/sqlalchemy-migrate/"
+HOMEPAGE = "https://github.com/stackforge/sqlalchemy-migrate"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=32;endline=32;md5=d41d8cd98f00b204e9800998ecf8427e"
@@ -24,4 +24,5 @@ RDEPENDS_${PN} += "python-sqlalchemy  \
 	python-decorator \
 	python-tempita  \
         python-pbr \
+	python-sqlparse \
     "
-- 
2.1.0


