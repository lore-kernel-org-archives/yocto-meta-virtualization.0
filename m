Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57956E009C9; Tue, 13 Sep 2016 22:30:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D2A4E009BB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Sep 2016 22:30:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10963371"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2016 13:30:12 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0EC514623461
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Sep 2016 13:30:13 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 14 Sep 2016 13:30:11 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 14 Sep 2016 01:30:03 -0400
Message-ID: <1473831003-3489-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 0EC514623461.A3467
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
Subject: [meta-networking][PATCH] python-eventlet: 0.17.4 -> 0.18.4
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
X-List-Received-Date: Wed, 14 Sep 2016 05:30:15 -0000
Content-Type: text/plain

Upgrade python-eventlet from 0.17.4 to 0.18.4.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../python/{python-eventlet_0.17.4.bb => python-eventlet_0.18.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-eventlet_0.17.4.bb => python-eventlet_0.18.4.bb} (73%)

diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb
similarity index 73%
rename from meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb
rename to meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb
index 32494e1..8c5e904 100644
--- a/meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.18.4.bb
@@ -8,8 +8,8 @@ SRCNAME = "eventlet"
 
 SRC_URI = "http://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fea0993b14cc7322f944bdd535c4f24a"
-SRC_URI[sha256sum] = "8721e9714eaff8d20f2407e0d3a80069db6b57c9226c26ee9db25c541d06556d"
+SRC_URI[md5sum] = "8d1c646d8cc10a4958c92fe8a30f3676"
+SRC_URI[sha256sum] = "74ef11d67ee5e85e009b0fced733c907620bca1ab8e6b0489d9f247405ab2685"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




