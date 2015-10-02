Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02ADFE00FB8; Fri,  2 Oct 2015 06:51:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id CEBA3E00F98
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Oct 2015 06:51:05 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Fri, 2 Oct 2015
	15:51:04 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 2 Oct 2015 15:50:54 +0200
Message-ID: <1443793858-17763-3-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443793858-17763-1-git-send-email-josep.puigdemont@enea.com>
References: <1443793858-17763-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 2/6] python-alembic: upgrade to 0.7.5.post2
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
X-List-Received-Date: Fri, 02 Oct 2015 13:51:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../{python-alembic_0.5.0.bb => python-alembic_0.7.5.post2.bb}     | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-alembic_0.5.0.bb => python-alembic_0.7.5.post2.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python-alembic_0.5.0.bb b/meta-openstack/recipes-devtools/python/python-alembic_0.7.5.post2.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python-alembic_0.5.0.bb
rename to meta-openstack/recipes-devtools/python/python-alembic_0.7.5.post2.bb
index 05ca02f..51b0934 100644
--- a/meta-openstack/recipes-devtools/python/python-alembic_0.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-alembic_0.7.5.post2.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "A database migration tool for SQLAlchemy."
 HOMEPAGE = "http://bitbucket.org/zzzeek/alembic"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8a916dc02872b4ca467ca1aeaf9516ef"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8faea05c89b6ff4ad5a9fa082f540719"
 
-PR = "r0"
 SRCNAME = "alembic"
 
 SRC_URI = "https://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e22d10fd885473eccc9c8c75238e97ce"
-SRC_URI[sha256sum] = "9d6dfd094c405f2d53882624a34e78838a27e22be25d809a1dffce1f9cd64e93"
+SRC_URI[md5sum] = "1814563f5042b28c5c452f2faa895d8e"
+SRC_URI[sha256sum] = "f998184b8cd6d522249e88bb0e7f6ccd80cdd73df50189e85c7c35740b17e7d4"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


