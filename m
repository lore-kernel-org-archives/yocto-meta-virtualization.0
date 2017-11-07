Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F6ADE00AD7; Tue,  7 Nov 2017 12:38:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E284E00AAF
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:38:46 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA7KckHh014640
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:38:46 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:38:45 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 7 Nov 2017 15:38:29 -0500
Message-ID: <1510087118-28132-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
References: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 01/10] python-sqlalchemy-migrate: upgrade to v0.11.0
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
X-List-Received-Date: Tue, 07 Nov 2017 20:38:47 -0000
Content-Type: text/plain

This version is required by the latest version of keystone.

The additional license was added since the source header has one
license and the COPYING file has a different license, so better safe
than sorry.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...10.0.bb => python-sqlalchemy-migrate_0.11.0.bb} | 32 ++++++++--------------
 1 file changed, 11 insertions(+), 21 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.10.0.bb => python-sqlalchemy-migrate_0.11.0.bb} (34%)

diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.10.0.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.11.0.bb
similarity index 34%
rename from meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.10.0.bb
rename to meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.11.0.bb
index 2fd7262..715d2cd 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.10.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.11.0.bb
@@ -1,32 +1,22 @@
 DESCRIPTION = "Database schema migration for SQLAlchemy"
 HOMEPAGE = "http://code.google.com/p/sqlalchemy-migrate/"
 SECTION = "devel/python"
-LICENSE = "MIT"
+LICENSE = "MIT & Apache-2.0"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=32;endline=32;md5=d41d8cd98f00b204e9800998ecf8427e"
 
-SRCNAME = "sqlalchemy-migrate"
+inherit pypi
 
-SRC_URI = "https://pypi.python.org/packages/source/s/sqlalchemy-migrate/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "af20c212b3379c142a1b3f66bb39b6d8"
-SRC_URI[sha256sum] = "f83c5cce9c09e5c05527279b7fe1565b32e5353342ff30b24f594fa2e5a7e003"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+SRC_URI[md5sum] = "f68c75280270f2fb2824633ef8633628"
+SRC_URI[sha256sum] = "e68af5e3e0561f629d4eb23d9d0ea77d2649747f2eff37fd29aece74615ca251"
 
 inherit setuptools
 
-DEPENDS += " \
-        python-pip \
+RDEPENDS_${PN} += " \
         python-pbr \
+        python-sqlalchemy \
+        python-decorator \
+        python-six \
+        python-sqlparse \
+        python-tempita \
         "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += "python-sqlalchemy  \
-	python-decorator \
-	python-tempita  \
-        python-pbr \
-    "
+	
\ No newline at end of file
-- 
2.7.4


