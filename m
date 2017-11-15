Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA964E00D20; Tue, 14 Nov 2017 23:11:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after
	Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 191A5E00C11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 23:11:39 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30192584"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Nov 2017 15:11:39 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 8F53A41860D8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 15:11:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 15 Nov 2017 15:11:34 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 16 Nov 2017 00:08:22 +0800
Message-ID: <1510762102-47580-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: 8F53A41860D8.A660B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH]python-logutils: upgrade to 0.3.5
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
X-List-Received-Date: Wed, 15 Nov 2017 07:11:41 -0000
Content-Type: text/plain

1) Upgrade python-logutils from 0.3.3 to 0.3.5.

2) Modify LIC_FILES_CHKSUM as Copyright (c) in LICENSE.txt has been changed from 2008-2013 to 2008-2017.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python-logutils_0.3.3.bb => python-logutils_0.3.5.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-logutils_0.3.3.bb => python-logutils_0.3.5.bb} (57%)

diff --git a/meta-openstack/recipes-devtools/python/python-logutils_0.3.3.bb b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
similarity index 57%
rename from meta-openstack/recipes-devtools/python/python-logutils_0.3.3.bb
rename to meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
index 5b72be1..80c9490 100644
--- a/meta-openstack/recipes-devtools/python/python-logutils_0.3.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Set of handlers for the Python standard library's logging package
 HOMEPAGE = "https://pypi.python.org/pypi/logutils"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5b3cbf3c3220969afbf461f4a6ac97c9"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
 
 PR = "r0"
 SRCNAME = "logutils"
 
-SRC_URI = "https://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/49/b2/b57450889bf73da26027f8b995fd5fbfab258ec24ef967e4c1892f7cb121/logutils-0.3.5.tar.gz"
 
-SRC_URI[md5sum] = "07b2a31d3d48e4f748363d33c03639cd"
-SRC_URI[sha256sum] = "4042b8e57cbe3b01552b3c84191595ae6c36f1ab5aef7e3a6ce5c2f15c297c9c"
+SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
+SRC_URI[sha256sum] = "bc058a25d5c209461f134e1f03cab637d66a7a5ccc12e593db56fbb279899a82"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




