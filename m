Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C22CCE00D74; Wed,  5 Jun 2019 20:00:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC083E00D4E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Jun 2019 20:00:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66165496"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 11:00:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A04914CDD0DB
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Jun 2019 11:00:18 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 11:00:22 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Jun 2019 11:01:32 +0800
Message-ID: <20190606030132.4145-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: A04914CDD0DB.A8628
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-wsme: upgrade 0.9.2 -> 0.9.3
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
X-List-Received-Date: Thu, 06 Jun 2019 03:00:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-wsme_0.9.2.bb to python-wsme_0.9.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-wsme_0.9.2.bb => python-wsme_0.9.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-wsme_0.9.2.bb => python-wsme_0.9.3.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
rename to meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
index 15f46d4..4e83299 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
 
 PYPI_PACKAGE = "WSME"
 
-SRC_URI[md5sum] = "f7ab1fecd5fa64f579d6ef3aabf38f60"
-SRC_URI[sha256sum] = "e790ac755a7e36eaa796d3966d3878677896dbc7d1c2685cb85c06b744c21976"
+SRC_URI[md5sum] = "e6cb3864bae872acaa0cd0c2efacc94f"
+SRC_URI[sha256sum] = "e24fcff24392a0b176e560ffc6591b1f658342bbc992f84e0e8a3c53fd92580a"
 
 inherit setuptools pypi
 
-- 
2.20.1




