Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C71CE00B5C; Fri, 31 Jul 2015 01:39:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84758E00B59
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 01:38:57 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99115571"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 16:42:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V8b3Sc003781
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 16:37:03 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 16:38:55 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Jul 2015 16:38:14 +0800
Message-ID: <1438331894-19319-2-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438331894-19319-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438331894-19319-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] ipython-stevedore: upgrade 1.4.0 -> 1.6.0
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
X-List-Received-Date: Fri, 31 Jul 2015 08:39:01 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-stevedore_1.4.0.bb => python-stevedore_1.6.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-stevedore_1.4.0.bb => python-stevedore_1.6.0.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.6.0.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-stevedore_1.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-stevedore_1.6.0.bb
index cf1af85..de04105 100644
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.6.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCNAME = "stevedore"
 SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5d93cb6eaa3abf49e86b8a6cf133eee4"
-SRC_URI[sha256sum] = "4a8d80b0a232746c09e0173bd61d60a18e9864e3dc87e3ebefa3ba3d8a00232f"
+SRC_URI[md5sum] = "c53fc7d4408f715339e7fd3e8189ca4e"
+SRC_URI[sha256sum] = "dab2aa31ec742f651e6a2fe0429560aebbbe0fb7fc462fa0ff565c8f5ff2ec25"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


