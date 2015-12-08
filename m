Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43CBDE00B8B; Tue,  8 Dec 2015 09:34:29 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D7CEAE00BC2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:16 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:15 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:24 +0100
Message-ID: <1449596034-8308-13-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 12/42] python-sqlalchemy-migrate: upgrade 0.9.6->0.9.7
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:29 -0000
Content-Type: text/plain

From: Lei Maohui <leimaohui@cn.fujitsu.com>

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...sqlalchemy-migrate_0.9.6.bb => python-sqlalchemy-migrate_0.9.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.9.6.bb => python-sqlalchemy-migrate_0.9.7.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
rename to meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
index c64855b..32ecdb3 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
@@ -8,8 +8,8 @@ SRCNAME = "sqlalchemy-migrate"
 
 SRC_URI = "https://pypi.python.org/packages/source/s/sqlalchemy-migrate/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1cdb4583dc30c436c4a060d08c764632"
-SRC_URI[sha256sum] = "c2c73d8dbeb29a96459d8622e3bac2e97cf6f74ed0564469486fe7ffe0ef3d97"
+SRC_URI[md5sum] = "fd586f77b25f905d56d1847fc1f9c68b"
+SRC_URI[sha256sum] = "a6adc1c9593e4a4c824230375ce18a887e28e1e9bb5374f5996b58879519f4e5"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.5.0


