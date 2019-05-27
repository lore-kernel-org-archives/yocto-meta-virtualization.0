Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77FB4E00C43; Sun, 26 May 2019 22:35:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A28AFE00798
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 22:35:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64759406"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 13:35:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AEEDC4CDBF7D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 13:35:06 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 13:35:14 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 13:36:06 +0800
Message-ID: <20190527053606.6207-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: AEEDC4CDBF7D.AE9C2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-sqlalchemy-migrate:upgrade 0.11.0 -> 0.12.0
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
X-List-Received-Date: Mon, 27 May 2019 05:35:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-sqlalchemy-migrate_0.11.0.bb to python-sqlalchemy-migrate_0.12.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-migrate_0.11.0.bb => python-sqlalchemy-migrate_0.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.11.0.bb => python-sqlalchemy-migrate_0.12.0.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.11.0.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.12.0.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.11.0.bb
rename to meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.12.0.bb
index f66476f..dcb6d9d 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.11.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.12.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=32;endline=32;md5=d41d8cd98f00b204
 
 inherit pypi
 
-SRC_URI[md5sum] = "f68c75280270f2fb2824633ef8633628"
-SRC_URI[sha256sum] = "e68af5e3e0561f629d4eb23d9d0ea77d2649747f2eff37fd29aece74615ca251"
+SRC_URI[md5sum] = "6a4920f2a2e07d193e95cf712d762b08"
+SRC_URI[sha256sum] = "8cfada30bbcf79a83b3a2d1bcd637de7e1f43e390d54de33e4f3249fd9aacfae"
 
 inherit setuptools
 
-- 
2.20.1




