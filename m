Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C734E00A71; Thu,  6 Aug 2015 01:13:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82C59E009F3
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Aug 2015 01:12:57 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99335485"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2015 16:16:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t768B0Rs006965
	for <meta-virtualization@yoctoproject.org>;
	Thu, 6 Aug 2015 16:11:00 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 6 Aug 2015 16:12:54 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Aug 2015 16:12:04 +0800
Message-ID: <1438848725-1643-11-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-cloud-services][PATCH 10/11] python-pecan: upgrade 0.8.3 -> 0.9.0
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
X-List-Received-Date: Thu, 06 Aug 2015 08:13:14 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python/{python-pecan_0.8.3.bb => python-pecan_0.9.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pecan_0.8.3.bb => python-pecan_0.9.0.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-pecan_0.8.3.bb b/meta-openstack/recipes-devtools/python/python-pecan_0.9.0.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-pecan_0.8.3.bb
rename to meta-openstack/recipes-devtools/python/python-pecan_0.9.0.bb
index e7f32cd..efab57e 100644
--- a/meta-openstack/recipes-devtools/python/python-pecan_0.8.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-pecan_0.9.0.bb
@@ -10,8 +10,8 @@ SRCNAME = "pecan"
 SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "e2b329c5088c2adb1510ac9d1af84bca"
-SRC_URI[sha256sum] = "ca6c31e1fb98e4ae780a44a40a88eacb7a19172d3f64d4e31f32049a784a1281"
+SRC_URI[md5sum] = "f739a18866a83f6b9ac8622ee89ea784"
+SRC_URI[sha256sum] = "d26be0e451c5999504599a9a741534caa0fba97d9bb8991c951f63b79a30b933"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


