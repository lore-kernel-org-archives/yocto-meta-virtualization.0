Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3560FE00AF2; Thu, 19 Jan 2017 18:55:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A6FAE00AF2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 18:55:34 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14936217"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2017 10:55:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9C2B247B150D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 10:55:28 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 20 Jan 2017 10:55:29 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 20 Jan 2017 10:55:27 +0800
Message-ID: <1484880927-765-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 9C2B247B150D.A7BB0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-mox3: 0.9.0 -> 0.20.0
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
X-List-Received-Date: Fri, 20 Jan 2017 02:55:39 -0000
Content-Type: text/plain

Upgrade python-mox3 from 0.9.0 to 0.20.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-mox3_0.9.0.bb => python-mox3_0.20.0.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-mox3_0.9.0.bb => python-mox3_0.20.0.bb} (64%)

diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
similarity index 64%
rename from meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
rename to meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
index 7eb948e..893978b 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 PR = "r0"
 
 SRCNAME = "mox3"
-SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/d8/a8/64e78823c52d719181100e9e01dd3485a6e064e79e402089ba4e33cfaed6/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "7574eabaa0f1d8f83289f33aaf2c4884"
-SRC_URI[sha256sum] = "8469f35690077f888fbb49a7e31251de9f78bd319ebd4e1af0bbb1349c1ad1be"
+SRC_URI[md5sum] = "53be7bf2d109c8bdf477c75b369773b8"
+SRC_URI[sha256sum] = "7b1549222353f6cc5b705734ef186fe2cc323d30c3987df50eceb77273595606"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




