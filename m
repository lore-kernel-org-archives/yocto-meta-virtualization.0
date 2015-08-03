Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2572BE00461; Mon,  3 Aug 2015 02:17:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7B88E00349
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Aug 2015 02:17:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99195786"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2015 17:20:53 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t739FUEl028602
	for <meta-virtualization@yoctoproject.org>;
	Mon, 3 Aug 2015 17:15:30 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 3 Aug 2015 17:17:23 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 3 Aug 2015 17:17:22 +0800
Message-ID: <1438593442-47020-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-cloud-services] [PATCH] python-sqlalchemy-migrate: upgrade 0.9.6->0.9.7
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
X-List-Received-Date: Mon, 03 Aug 2015 09:17:31 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
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
1.8.4.2


