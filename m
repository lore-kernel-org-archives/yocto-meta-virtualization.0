Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 861F7E00B43; Thu, 30 Jul 2015 22:30:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9658E00B1A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 Jul 2015 22:30:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99108233"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 13:33:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V5SDue022991
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 13:28:13 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 13:30:05 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Jul 2015 13:30:02 +0800
Message-ID: <1438320602-17454-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] python-simplejson: upgrade 3.6.2->3.7.3
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
X-List-Received-Date: Fri, 31 Jul 2015 05:30:13 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-simplejson_3.6.2.bb => python-simplejson_3.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-simplejson_3.6.2.bb => python-simplejson_3.7.3.bb} (84%)

diff --git a/recipes-devtools/python/python-simplejson_3.6.2.bb b/recipes-devtools/python/python-simplejson_3.7.3.bb
similarity index 84%
rename from recipes-devtools/python/python-simplejson_3.6.2.bb
rename to recipes-devtools/python/python-simplejson_3.7.3.bb
index ecc4679..39dfce6 100644
--- a/recipes-devtools/python/python-simplejson_3.6.2.bb
+++ b/recipes-devtools/python/python-simplejson_3.7.3.bb
@@ -13,8 +13,8 @@ PR = "r0"
 SRCNAME = "simplejson"
 
 SRC_URI = "https://pypi.python.org/packages/source/s/simplejson/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "deca871b9bfa4b76ea360756b2a22710"
-SRC_URI[sha256sum] = "99c092209f88d411858f01b14a97a4fcf8c4f438a685e23d733a3d65de52a35d"
+SRC_URI[md5sum] = "117346e5ee4ed4434ffe485f8e58f5ed"
+SRC_URI[sha256sum] = "63d7f7b14a20f29f74325a69e6db45925eaf6e3a003eab46c0234fd050a8c93f"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


