Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CCF92E00C6B; Thu, 22 Mar 2018 20:30:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42A1CE008D2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Mar 2018 20:30:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38089877"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Mar 2018 11:28:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 19E2048AE77B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 11:28:53 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 23 Mar 2018 11:28:52 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 23 Mar 2018 11:28:53 +0800
Message-ID: <1521775736-38102-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 19E2048AE77B.A645A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH] python-paramiko: 2.4.0 -> 2.4.1
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
X-List-Received-Date: Fri, 23 Mar 2018 03:30:04 -0000
Content-Type: text/plain

Upgrade python-paramiko from 2.4.0 to 2.4.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-paramiko_2.4.0.bb => python-paramiko_2.4.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-paramiko_2.4.0.bb => python-paramiko_2.4.1.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
index 45ad5d0..6906c41 100644
--- a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[md5sum] = "ed6d085a5e5369817e49cf1315b32eba"
-SRC_URI[sha256sum] = "486f637f0a33a4792e0e567be37426c287efaa8c4c4a45e3216f9ce7fd70b1fc"
+SRC_URI[md5sum] = "f9fa1204f706767b6c179effa7c0fb9e"
+SRC_URI[sha256sum] = "33e36775a6c71790ba7692a73f948b329cf9295a72b0102144b031114bd2a4f3"
 
 inherit setuptools pypi
 
-- 
2.7.4




