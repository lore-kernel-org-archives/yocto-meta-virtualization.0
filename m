Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2B38E00C19; Wed,  2 Dec 2015 08:34:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id BB0D0E009F5
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:49 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:48 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:45 +0100
Message-ID: <1449073966-29707-40-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 39/40] Openstack doesn't depend on lockfile anymore
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:30 -0000
Content-Type: text/plain

Openstack uses oslo.concurrency now, following commits removed the
depedency on lockfile for each respective component:
	ceilometer: ddcc118a4c13fb88a08d437de86c8e2d6f9cb23f
	cinder: a497b4a214b89cb2b387f227c208cfdae62ad6b1
	heat: c889bf64ee03b7aa4168b2451359770f1cabccb7
	horizon: 366f9527e6234874495b70d104d49b4f3de2d522
	oslo.db: c34c32e09ed1f170dfe62c7daedf0cd60f57a833

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-ceilometer_git.bb | 1 -
 meta-openstack/recipes-devtools/python/python-cinder_git.bb     | 1 -
 meta-openstack/recipes-devtools/python/python-heat_git.bb       | 1 -
 meta-openstack/recipes-devtools/python/python-horizon_git.bb    | 1 -
 meta-openstack/recipes-devtools/python/python-oslo.db_1.7.2.bb  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
index e734d32..c3a69ee 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
@@ -197,7 +197,6 @@ RDEPENDS_${PN} += " \
 	python-routes \
 	python-webob \
 	python-greenlet \
-	python-lockfile \
 	python-pastedeploy \
 	python-paste \
 	python-sqlalchemy-migrate \
diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index 9276d1f..d8b3f86 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -202,7 +202,6 @@ RDEPENDS_${PN} += "lvm2 \
 	python-routes \
 	python-webob \
 	python-greenlet \
-	python-lockfile \
 	python-pastedeploy \
 	python-paste \
 	python-sqlalchemy-migrate \
diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
index 87e93c7..5926cc0 100644
--- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
@@ -179,7 +179,6 @@ RDEPENDS_${PN} += " \
 	python-routes \
 	python-webob \
 	python-greenlet \
-	python-lockfile \
 	python-pastedeploy \
 	python-paste \
 	python-sqlalchemy-migrate \
diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index eca780e..a351bc4 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -29,7 +29,6 @@ RDEPENDS_${PN} += " python-django \
     python-pbr \
     python-six \
     python-swiftclient \
-    python-lockfile \
     python-pyyaml \
     python-pint \
     python-xstatic \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.db_1.7.2.bb b/meta-openstack/recipes-devtools/python/python-oslo.db_1.7.2.bb
index 3f2dd95..a381263 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.db_1.7.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.db_1.7.2.bb
@@ -23,7 +23,6 @@ RDEPENDS_${PN} += " \
        python-alembic \
        python-babel \
        python-iso8601 \
-       python-lockfile \
        python-oslo.config \
        python-sqlalchemy \
        python-sqlalchemy-migrate \
-- 
2.1.0


