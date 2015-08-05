Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BA81E00AB4; Tue,  4 Aug 2015 19:02:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66E4BE00AA2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Aug 2015 19:02:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99274176"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2015 10:06:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7520vf3021556
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 10:00:57 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 5 Aug 2015 10:02:50 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 5 Aug 2015 10:02:03 +0800
Message-ID: <1438740123-2708-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [meta-cloud-services][PATCH] python-eventlet: upgrade 0.17.3 -> 0.17.4
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
X-List-Received-Date: Wed, 05 Aug 2015 02:02:57 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python/{python-eventlet_0.17.3.bb => python-eventlet_0.17.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-eventlet_0.17.3.bb => python-eventlet_0.17.4.bb} (73%)

diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.17.3.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb
similarity index 73%
rename from meta-openstack/recipes-devtools/python/python-eventlet_0.17.3.bb
rename to meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb
index d85bef0..32494e1 100644
--- a/meta-openstack/recipes-devtools/python/python-eventlet_0.17.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb
@@ -8,8 +8,8 @@ SRCNAME = "eventlet"
 
 SRC_URI = "http://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "12c855e37dd688d3137ecc88d5b8f05b"
-SRC_URI[sha256sum] = "d39e4124a7b10055c78d5c51c2ee23789a8ebf4f8b811fee4533542ecd3ac99a"
+SRC_URI[md5sum] = "fea0993b14cc7322f944bdd535c4f24a"
+SRC_URI[sha256sum] = "8721e9714eaff8d20f2407e0d3a80069db6b57c9226c26ee9db25c541d06556d"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


