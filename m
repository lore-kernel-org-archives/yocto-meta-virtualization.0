Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9F2EE00B43; Fri, 31 Jul 2015 00:26:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D24CEE00A75
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 00:26:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99112729"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 15:30:12 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V7OlUe030835
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 15:24:47 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 15:26:39 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Jul 2015 15:26:35 +0800
Message-ID: <1438327595-18499-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH] python-beautifulsoup4: upgrade 4.3.2 -> 4.4.0
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
X-List-Received-Date: Fri, 31 Jul 2015 07:26:59 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 ...ython-beautifulsoup4_4.3.2.bb => python-beautifulsoup4_4.4.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-beautifulsoup4_4.3.2.bb => python-beautifulsoup4_4.4.0.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.3.2.bb b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.0.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.3.2.bb
rename to meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.0.bb
index 2d3cddb..0b67b80 100644
--- a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.3.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.0.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Screen-scraping library"
 HOMEPAGE = "https://pypi.python.org/pypi/beautifulsoup4/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=83e365dc17176bd72ba7d08ca0555efa"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=39dacabe5494f61c8680f6fa7323b596"
 
 PR = "r0"
 SRCNAME = "beautifulsoup4"
 
 SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b8d157a204d56512a4cc196e53e7d8ee"
-SRC_URI[sha256sum] = "a2b29bd048ca2fe54a046b29770964738872a9747003a371344a93eedf7ad58e"
+SRC_URI[md5sum] = "63d1f33e6524f408cb6efbc5da1ae8a5"
+SRC_URI[sha256sum] = "fad91da88f69438b9ba939ab1b2cabaa31b1d914f1cccb4bb157a993ed2917f6"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


