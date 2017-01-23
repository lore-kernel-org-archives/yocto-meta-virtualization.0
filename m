Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D10BE00816; Sun, 22 Jan 2017 17:37:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 058C2E007EB
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jan 2017 17:37:06 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14991296"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2017 09:37:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7D0C747B1505
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 09:37:00 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 23 Jan 2017 09:37:04 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Jan 2017 09:36:43 +0800
Message-ID: <1485135403-5664-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 7D0C747B1505.A371B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [PATCH] python-pecan: 0.9.0 -> 1.2.1
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
X-List-Received-Date: Mon, 23 Jan 2017 01:37:10 -0000
Content-Type: text/plain

Upgrade python-pecan from 0.9.0 to 1.2.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-pecan_0.9.0.bb => python-pecan_1.2.1.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pecan_0.9.0.bb => python-pecan_1.2.1.bb} (63%)

diff --git a/meta-openstack/recipes-devtools/python/python-pecan_0.9.0.bb b/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-pecan_0.9.0.bb
rename to meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
index efab57e..d3df883 100644
--- a/meta-openstack/recipes-devtools/python/python-pecan_0.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
 PR = "r0"
 SRCNAME = "pecan"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://pypi.python.org/packages/27/b2/eaa47baa88c848ea748e1583246c55466b3ba087cd413fc9a3cd51a6c5f5/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "f739a18866a83f6b9ac8622ee89ea784"
-SRC_URI[sha256sum] = "d26be0e451c5999504599a9a741534caa0fba97d9bb8991c951f63b79a30b933"
+SRC_URI[md5sum] = "d0ad387dbc77d1803ad3573fe38a4e0a"
+SRC_URI[sha256sum] = "8d95457b9cedcfda9b467f5cc7dde8cdf72ddba6b402d6a5902843d1b2186c46"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




