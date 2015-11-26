Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E85C4E00C10; Thu, 26 Nov 2015 07:47:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 0014DE00BFD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:40 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:39 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:19 +0100
Message-ID: <1448552846-24382-7-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 06/13] python-sqlalchemy-migrate: upgrade to 0.9.6
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...qlalchemy-migrate_0.9.1.bb => python-sqlalchemy-migrate_0.9.6.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.9.1.bb => python-sqlalchemy-migrate_0.9.6.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.1.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.1.bb
rename to meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
index 8590de4..c64855b 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=32;endline=32;md5=d41d8cd98f00b204e9800998ecf8427e"
 
-PR = "r0"
 SRCNAME = "sqlalchemy-migrate"
 
 SRC_URI = "https://pypi.python.org/packages/source/s/sqlalchemy-migrate/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5f0237ed55041b9a831d4d18d0a46f53"
-SRC_URI[sha256sum] = "16e327c9642ca4c99a70dcac3b39aeb821edaf5214834b47fb0a89bac44af23b"
+SRC_URI[md5sum] = "1cdb4583dc30c436c4a060d08c764632"
+SRC_URI[sha256sum] = "c2c73d8dbeb29a96459d8622e3bac2e97cf6f74ed0564469486fe7ffe0ef3d97"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


