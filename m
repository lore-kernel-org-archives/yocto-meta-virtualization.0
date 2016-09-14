Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F20DE009C9; Tue, 13 Sep 2016 22:29:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A924DE009BB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Sep 2016 22:29:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10963344"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2016 13:29:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 725434623461
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Sep 2016 13:29:26 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 14 Sep 2016 13:29:25 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 14 Sep 2016 01:29:23 -0400
Message-ID: <1473830963-3404-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 725434623461.A33DA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
Subject: [PATCH] python-beautifulsoup4: 4.4.0 -> 4.4.1
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
X-List-Received-Date: Wed, 14 Sep 2016 05:29:32 -0000
Content-Type: text/plain

Upgrade python-beautifulsoup4 from 4.4.0 to 4.4.1.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 ...{python-beautifulsoup4_4.4.0.bb => python-beautifulsoup4_4.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-beautifulsoup4_4.4.0.bb => python-beautifulsoup4_4.4.1.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.0.bb b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb
index 0b67b80..1e061c2 100644
--- a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb
@@ -9,8 +9,8 @@ SRCNAME = "beautifulsoup4"
 
 SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "63d1f33e6524f408cb6efbc5da1ae8a5"
-SRC_URI[sha256sum] = "fad91da88f69438b9ba939ab1b2cabaa31b1d914f1cccb4bb157a993ed2917f6"
+SRC_URI[md5sum] = "8fbd9a7cac0704645fa20d1419036815"
+SRC_URI[sha256sum] = "87d4013d0625d4789a4f56b8d79a04d5ce6db1152bb65f1d39744f7709a366b4"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




