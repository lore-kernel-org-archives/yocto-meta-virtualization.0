Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 380AEE00ADD; Thu, 19 Jan 2017 21:29:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B18AAE009F3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 21:29:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14940954"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2017 13:29:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A642746701AF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:29:37 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 20 Jan 2017 13:29:38 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 20 Jan 2017 13:29:17 +0800
Message-ID: <1484890157-1002-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: A642746701AF.A62C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-testtools: 1.8.0 -> 2.2.0
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
X-List-Received-Date: Fri, 20 Jan 2017 05:29:53 -0000
Content-Type: text/plain

1) Upgrade python-testtools from 1.8.0 to 2.2.0.
2) License checksum changed,since the testtools authors changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../{python-testtools_1.8.0.bb => python-testtools_2.2.0.bb}     | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-testtools_1.8.0.bb => python-testtools_2.2.0.bb} (56%)

diff --git a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
rename to meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
index 3138aae..7c6baed 100644
--- a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-testtools_2.2.0.bb
@@ -2,16 +2,15 @@ DESCRIPTION = "Extensions to the Python standard library unit testing framework"
 HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=30a345a6863019b548dba40895dfee79"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
 
 PR = "r0"
 SRCNAME = "testtools"
 
-SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "89965b0b39930c0d1f5e07c6f545e6a0"
-SRC_URI[sha256sum] = "8afd6400fb4e75adb0b29bd09695ecb2024cd7befab4677a58c147701afadd97"
+SRC_URI = "https://pypi.python.org/packages/0d/72/3212c1723d49f5b58fca736dabdd2e74f38435076d943f4a642117f04d65/${SRCNAME}-${PV}.tar.gz"
 
+SRC_URI[md5sum] = "adef817b07ba24fd6d807fd41a4f1ef4"
+SRC_URI[sha256sum] = "80f606607a6e4ce4d0e24e5b786562aa42c581906f3c070607a4265f3da65810"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




