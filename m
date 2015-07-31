Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2DDEE00B43; Fri, 31 Jul 2015 00:27:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F046BE00A75
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 00:27:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99112758"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 15:30:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V7PKVN030877
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 15:25:20 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 15:27:12 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Jul 2015 15:27:11 +0800
Message-ID: <1438327631-18578-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] python-wsme: upgrade 0.6.4 -> 0.7.0
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
X-List-Received-Date: Fri, 31 Jul 2015 07:27:18 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-wsme_0.6.4.bb => python-wsme_0.7.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-wsme_0.6.4.bb => python-wsme_0.7.0.bb} (68%)

diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.6.4.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
similarity index 68%
rename from meta-openstack/recipes-devtools/python/python-wsme_0.6.4.bb
rename to meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
index 238b67c..523c3df 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme_0.6.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "Simplify the writing of REST APIs, and extend them with additiona
 HOMEPAGE = "https://pypi.python.org/pypi/WSME/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=477dfa54ede28e2f361e7db05941d7a7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
 
 SRCNAME = "WSME"
 
 SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0ba96f660c10d41c63d6bb65bfeeed59"
-SRC_URI[sha256sum] = "e4c0012b1a592c3889697259c690447dfc8edcbae5b52307709705377305e953"
+SRC_URI[md5sum] = "0d50fffead72d8a9fcb6152082d5b61b"
+SRC_URI[sha256sum] = "1cae2c4df4af93db345ef7a52204b8facab8318aee6b9b56f54f8cb4aac79849"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


