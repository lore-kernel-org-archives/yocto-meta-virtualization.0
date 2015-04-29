Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E43DE00A92; Tue, 28 Apr 2015 20:10:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E47F1E009FD
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:39 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39dQn009418
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:39 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:39 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:49 +0800
Message-ID: <f3cab78df3c8a64e5fd957eda7a14765613b78f4.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 39/55] python-sqlalchemy-migrate: upgrade to 0.9.6
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
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
1.9.1


