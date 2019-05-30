Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A067E00D48; Wed, 29 May 2019 20:53:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 751D9E009A0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 20:53:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,529,1549900800"; d="scan'208";a="65162287"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2019 11:53:00 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 135F94CDCD42
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 May 2019 11:46:58 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 30 May 2019 11:47:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 11:48:10 +0800
Message-ID: <20190530034810.18490-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 135F94CDCD42.AD339
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-tenacity: upgrade 4.5.0 -> 5.0.4
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
X-List-Received-Date: Thu, 30 May 2019 03:53:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-tenacity_4.5.0.bb to python-tenacity_5.0.4.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-tenacity_4.5.0.bb => python-tenacity_5.0.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tenacity_4.5.0.bb => python-tenacity_5.0.4.bb} (75%)

diff --git a/meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb b/meta-openstack/recipes-devtools/python/python-tenacity_5.0.4.bb
similarity index 75%
rename from meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb
rename to meta-openstack/recipes-devtools/python/python-tenacity_5.0.4.bb
index ffb3258..db435cb 100644
--- a/meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-tenacity_5.0.4.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
 
 inherit pypi
 
-SRC_URI[md5sum] = "7bb60e2bfa59797d415724d7cb770973"
-SRC_URI[sha256sum] = "e5eb0009d7fef345ffd27e43122ec288418b460952aeefde60df8e62c3953d4b"
+SRC_URI[md5sum] = "2c8333b9f06d5889ea70955a004ae525"
+SRC_URI[sha256sum] = "a0c3c5f7ae0c33f5556c775ca059c12d6fd8ab7121613a713e8b7d649908571b"
 
 inherit setuptools
 
-- 
2.20.1




