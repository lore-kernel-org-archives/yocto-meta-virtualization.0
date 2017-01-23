Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6097CE0082A; Mon, 23 Jan 2017 00:12:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D68ACE00823
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 00:12:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="15003682"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2017 16:12:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 20B6D47B1511
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 16:12:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 23 Jan 2017 16:12:45 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Jan 2017 16:12:24 +0800
Message-ID: <1485159144-6590-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 20B6D47B1511.A3DC7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-sqlalchemy-migrate: 0.9.7 -> 0.10.0
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
X-List-Received-Date: Mon, 23 Jan 2017 08:12:58 -0000
Content-Type: text/plain

Upgrade python-sqlalchemy-migrate from 0.9.7 to 0.10.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...qlalchemy-migrate_0.9.7.bb => python-sqlalchemy-migrate_0.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.9.7.bb => python-sqlalchemy-migrate_0.10.0.bb} (83%)

diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.10.0.bb
similarity index 83%
rename from meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
rename to meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.10.0.bb
index 5c3636e..2fd7262 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.10.0.bb
@@ -8,8 +8,8 @@ SRCNAME = "sqlalchemy-migrate"
 
 SRC_URI = "https://pypi.python.org/packages/source/s/sqlalchemy-migrate/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fd586f77b25f905d56d1847fc1f9c68b"
-SRC_URI[sha256sum] = "a6adc1c9593e4a4c824230375ce18a887e28e1e9bb5374f5996b58879519f4e5"
+SRC_URI[md5sum] = "af20c212b3379c142a1b3f66bb39b6d8"
+SRC_URI[sha256sum] = "f83c5cce9c09e5c05527279b7fe1565b32e5353342ff30b24f594fa2e5a7e003"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




