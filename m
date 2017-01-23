Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CBB9E00828; Mon, 23 Jan 2017 01:48:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63AC2E007EB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 01:48:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="15007680"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2017 17:47:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2162B47B1502
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 17:47:57 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 23 Jan 2017 17:48:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Jan 2017 17:47:40 +0800
Message-ID: <1485164860-6820-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 2162B47B1502.A49C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-cliff: 1.15.0 -> 2.4.0
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
X-List-Received-Date: Mon, 23 Jan 2017 09:48:14 -0000
Content-Type: text/plain

Upgrade python-cliff from 1.15.0 to 2.4.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-cliff_1.15.0.bb => python-cliff_2.4.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-cliff_1.15.0.bb => python-cliff_2.4.0.bb} (73%)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_2.4.0.bb
similarity index 73%
rename from meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
rename to meta-openstack/recipes-devtools/python/python-cliff_2.4.0.bb
index 2c9341f..20518bb 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_2.4.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCNAME = "cliff"
 
-SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/5a/86/61cb36713a6feb28cfb3201022a218c359dc988cf9f65b2e2681cb33cf8d/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "23f9187d6d7ffa70d8f725381bb1094f"
-SRC_URI[sha256sum] = "f5ba6fe0940547549947d5a24ca3354145a603d3a9ba054f209d20b66dc02be7"
+SRC_URI[md5sum] = "26ef765d200e54aebf72984dfce5f255"
+SRC_URI[sha256sum] = "cc9175e3c2a42bc06343290a1218bc6b70f36883520b2948f743c5f9ae917675"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




