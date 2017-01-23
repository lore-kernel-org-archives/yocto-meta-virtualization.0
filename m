Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CAECE00828; Sun, 22 Jan 2017 21:23:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61D7AE00805
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jan 2017 21:23:09 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14997782"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2017 13:23:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7DB2D47B1502
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:23:05 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 23 Jan 2017 13:23:09 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Jan 2017 13:22:48 +0800
Message-ID: <1485148968-6117-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 7DB2D47B1502.A7339
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH v2] python-httplib2: 0.9.1 -> 0.9.2
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
X-List-Received-Date: Mon, 23 Jan 2017 05:23:12 -0000
Content-Type: text/plain

1) Upgrade python-httplib2 from 0.9.1 to 0.9.2.
2) License checksum changed,since the version was updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-httplib2_0.9.1.bb => python-httplib2_0.9.2.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httplib2_0.9.1.bb => python-httplib2_0.9.2.bb} (51%)

diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.9.1.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.9.2.bb
similarity index 51%
rename from meta-openstack/recipes-devtools/python/python-httplib2_0.9.1.bb
rename to meta-openstack/recipes-devtools/python/python-httplib2_0.9.2.bb
index d49361b..711411b 100644
--- a/meta-openstack/recipes-devtools/python/python-httplib2_0.9.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.9.2.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "A comprehensive HTTP client library"
 HOMEPAGE = "https://code.google.com/p/httplib2/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6010ef08fe55505a5e11ad1f1fb90fb8"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=01abba5d32279f9ed6b3350390258547"
 
 SRCNAME = "httplib2"
 
-SRC_URI = "https://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/ff/a9/5751cdf17a70ea89f6dde23ceb1705bfb638fd8cee00f845308bf8d26397/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c49590437e4c5729505d034cd34a8528"
-SRC_URI[sha256sum] = "bc6339919a5235b9d1aaee011ca5464184098f0c47c9098001f91c97176583f5"
+SRC_URI[md5sum] = "bd1b1445b3b2dfa7276b09b1a07b7f0e"
+SRC_URI[sha256sum] = "c3aba1c9539711551f4d83e857b316b5134a1c4ddce98a875b7027be7dd6d988"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




