Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB07BE00D20; Tue, 14 Nov 2017 23:12:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC2EAE00C11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 23:12:40 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30192630"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Nov 2017 15:12:40 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id B105C41860DD
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 15:12:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 15 Nov 2017 15:12:37 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 16 Nov 2017 00:09:24 +0800
Message-ID: <1510762164-47666-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: B105C41860DD.A70D6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH]python-paramiko: upgrade to 2.4.0
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
X-List-Received-Date: Wed, 15 Nov 2017 07:12:41 -0000
Content-Type: text/plain

1) Upgrade python-paramiko from 2.2.1 to 2.4.0.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python-paramiko_2.1.1.bb => python-paramiko_2.4.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-paramiko_2.1.1.bb => python-paramiko_2.4.0.bb} (55%)

diff --git a/meta-openstack/recipes-devtools/python/python-paramiko_2.1.1.bb b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
similarity index 55%
rename from meta-openstack/recipes-devtools/python/python-paramiko_2.1.1.bb
rename to meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
index e257cff..52d0cda 100644
--- a/meta-openstack/recipes-devtools/python/python-paramiko_2.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 PR = "r0"
 SRCNAME = "paramiko"
 
-SRC_URI = "https://pypi.python.org/packages/d1/5a/ebd00d884f30baf208359a027eb7b38372d81d0c004724bb1aa71ae43b37/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/c8/de/791773d6a4b23327c7475ae3d7ada0d07fa147bf77fb6f561a4a7d8afd11/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "9e8abe635baa6bb75a4cd55dcb56a264"
-SRC_URI[sha256sum] = "d51dada7ad0736c116f8bfe3263627925947e4a50e61436a83d58bfe7055b575"
+SRC_URI[md5sum] = "ed6d085a5e5369817e49cf1315b32eba"
+SRC_URI[sha256sum] = "486f637f0a33a4792e0e567be37426c287efaa8c4c4a45e3216f9ce7fd70b1fc"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




