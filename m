Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85127E00B71; Thu, 19 Jan 2017 21:57:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04713E00A21
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 21:57:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14941677"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2017 13:57:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 837D446701AF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:57:04 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 20 Jan 2017 13:57:05 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 20 Jan 2017 13:56:45 +0800
Message-ID: <1484891805-1083-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 837D446701AF.A6D45
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] ipython-wsme: 0.7.0 -> 0.9.1
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
X-List-Received-Date: Fri, 20 Jan 2017 05:57:11 -0000
Content-Type: text/plain

Upgrade python-wsme from 0.7.0 to 0.9.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-wsme_0.7.0.bb => python-wsme_0.9.1.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-wsme_0.7.0.bb => python-wsme_0.9.1.bb} (66%)

diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
similarity index 66%
rename from meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
rename to meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
index db89474..e74efd9 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
 
 SRCNAME = "WSME"
 
-SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/8d/c5/0d0ba34f228aa1b5512cbfa833aba24755523ed2eca3ece043702ea19911/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0d50fffead72d8a9fcb6152082d5b61b"
-SRC_URI[sha256sum] = "1cae2c4df4af93db345ef7a52204b8facab8318aee6b9b56f54f8cb4aac79849"
+SRC_URI[md5sum] = "23b0269af3f4c1db8cfa35054703f0db"
+SRC_URI[sha256sum] = "afdd3ba14f815837239d6dead652de460bd61a869e39430b459be77d1a928197"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




