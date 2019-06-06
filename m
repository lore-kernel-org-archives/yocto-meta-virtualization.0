Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C020EE00D74; Wed,  5 Jun 2019 19:23:18 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F151E00D4E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Jun 2019 19:23:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66160839"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 10:23:14 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 891BC4CDCD42
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Jun 2019 10:23:11 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 10:23:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Jun 2019 10:24:24 +0800
Message-ID: <20190606022424.12634-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 891BC4CDCD42.AC1BE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-osc-lib: upgrade 1.7.0 -> 1.12.1
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
X-List-Received-Date: Thu, 06 Jun 2019 02:23:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-osc-lib_1.7.0.bb to python-osc-lib_1.12.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-osc-lib_1.7.0.bb => python-osc-lib_1.12.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-osc-lib_1.7.0.bb => python-osc-lib_1.12.1.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb b/meta-openstack/recipes-devtools/python/python-osc-lib_1.12.1.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb
rename to meta-openstack/recipes-devtools/python/python-osc-lib_1.12.1.bb
index e3328d7..8b7a4f7 100644
--- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.12.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "8bae654318c8c82d341f7228cfa3ec2d"
-SRC_URI[sha256sum] = "7dee72f13e5478f8d3d836267fa019b99ed4d5e478fc08bbcc9e23029d11ec78"
+SRC_URI[md5sum] = "73c8bd90b8325b2595b814f41d06fdb8"
+SRC_URI[sha256sum] = "26d3e32c8c4eff47240c458cddb6b75db52034d643f01de2841ad9e84904d7aa"
 
 inherit setuptools pypi
 
-- 
2.20.1




