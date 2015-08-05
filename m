Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10DFFE00AB4; Tue,  4 Aug 2015 19:00:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FCD6E00AA2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Aug 2015 19:00:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99274028"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2015 10:03:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t751w5fl021360
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 09:58:05 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 5 Aug 2015 09:59:58 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 5 Aug 2015 09:59:10 +0800
Message-ID: <1438739950-2649-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [meta-cloud-services][PATCH] python-cliff: upgrade 1.12.0 -> 1.13.0
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
X-List-Received-Date: Wed, 05 Aug 2015 02:00:10 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python/{python-cliff_1.12.0.bb => python-cliff_1.13.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-cliff_1.12.0.bb => python-cliff_1.13.0.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.12.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-cliff_1.12.0.bb
rename to meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
index e6da930..d8ef0af 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_1.12.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
@@ -8,8 +8,8 @@ SRCNAME = "cliff"
 
 SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "feaa48620db2aeb9306ff33e5494fccc"
-SRC_URI[sha256sum] = "7609abc1789522fc4e228ea5567a9fd1db3963850396178adca3332cdd9c929a"
+SRC_URI[md5sum] = "188212b80ee152ee65b2018975193418"
+SRC_URI[sha256sum] = "2b92d12cf1aa59c0cf1914b4b6b02b78daadac890a53d0e6b71b5220661ab9e0"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


