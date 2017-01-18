Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 464FBE00992; Tue, 17 Jan 2017 23:36:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B82A3E0098A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 23:36:27 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14870017"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2017 15:36:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 05EA347B1502
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jan 2017 15:36:20 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 18 Jan 2017 15:36:19 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 18 Jan 2017 15:36:32 +0800
Message-ID: <1484724992-28726-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 05EA347B1502.A5F4F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-extras: 0.0.3 -> 1.0.0
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
X-List-Received-Date: Wed, 18 Jan 2017 07:36:36 -0000
Content-Type: text/plain

Upgrade python-extras from 0.0.3 to 1.0.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-extras_0.0.3.bb => python-extras_1.0.0.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-extras_0.0.3.bb => python-extras_1.0.0.bb} (55%)

diff --git a/meta-openstack/recipes-devtools/python/python-extras_0.0.3.bb b/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb
similarity index 55%
rename from meta-openstack/recipes-devtools/python/python-extras_0.0.3.bb
rename to meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb
index ebe2f58..cc99cc6 100644
--- a/meta-openstack/recipes-devtools/python/python-extras_0.0.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d108f338b2f68fe48ac366c4650bd8b"
 PR = "r0"
 SRCNAME = "extras"
 
-SRC_URI = "https://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/be/18/0b7283f0ebf6ad4bb6b9937538495eadf05ef097b102946b9445c4242636/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "62d8ba049e3386a6df69b413ea81517b"
-SRC_URI[sha256sum] = "7a60d84cb661b477c41a5ea35e931ae93860af8cd259ecc0a38a32ef1ae9ffc0"
+SRC_URI[md5sum] = "3a63ad60cf8f0186c9e3a02f55ec5b14"
+SRC_URI[sha256sum] = "132e36de10b9c91d5d4cc620160a476e0468a88f16c9431817a6729611a81b4e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




