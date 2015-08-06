Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 944D5E009EC; Thu,  6 Aug 2015 01:12:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E984E009B3
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Aug 2015 01:12:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99335471"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2015 16:16:13 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t768ApUV006935
	for <meta-virtualization@yoctoproject.org>;
	Thu, 6 Aug 2015 16:10:51 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 6 Aug 2015 16:12:45 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Aug 2015 16:11:59 +0800
Message-ID: <1438848725-1643-6-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-cloud-services][PATCH 05/11] python-jsonpointer: upgrade 1.7 -> 1.9
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
X-List-Received-Date: Thu, 06 Aug 2015 08:12:50 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python/{python-jsonpointer_1.7.bb => python-jsonpointer_1.9.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-jsonpointer_1.7.bb => python-jsonpointer_1.9.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb
rename to meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
index 14d38fd..61b2f3f 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
@@ -9,8 +9,8 @@ SRCNAME = "jsonpointer"
 
 SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "97666849a7c390950a5ecfbeb74e64f4"
-SRC_URI[sha256sum] = "46b2016b5e4f2b5cd2edf07c60ca8fe7dd91204ca848f98964be61b3c4760f5e"
+SRC_URI[md5sum] = "c4d3f28e72ba77062538d1c0864c40a9"
+SRC_URI[sha256sum] = "39403b47a71aa782de6d80db3b78f8a5f68ad8dfc9e674ca3bb5b32c15ec7308"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


