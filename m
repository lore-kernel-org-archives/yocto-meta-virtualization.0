Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44D77E00BE8; Wed, 13 Feb 2019 19:43:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8208BE00B92
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Feb 2019 19:43:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.58,367,1544457600"; d="scan'208";a="54303445"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Feb 2019 11:43:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9A8244BAD9BD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 11:43:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 14 Feb 2019 11:44:00 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 14 Feb 2019 11:44:53 +0800
Message-ID: <20190214034453.31484-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 9A8244BAD9BD.AE4E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-paramiko:upgrade to 2.4.2
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
X-List-Received-Date: Thu, 14 Feb 2019 03:43:54 -0000
Content-Type: text/plain

Upgrade python-paramiko from 2.4.1 to 2.4.2

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../{python-paramiko_2.4.1.bb => python-paramiko_2.4.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-paramiko_2.4.1.bb => python-paramiko_2.4.2.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
rename to meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb
index 6906c41..a570c32 100644
--- a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.2.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[md5sum] = "f9fa1204f706767b6c179effa7c0fb9e"
-SRC_URI[sha256sum] = "33e36775a6c71790ba7692a73f948b329cf9295a72b0102144b031114bd2a4f3"
+SRC_URI[md5sum] = "a476ea106177fe22e797428d54811aed"
+SRC_URI[sha256sum] = "a8975a7df3560c9f1e2b43dc54ebd40fd00a7017392ca5445ce7df409f900fcb"
 
 inherit setuptools pypi
 
-- 
2.17.2




