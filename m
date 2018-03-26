Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1EC2EE009C9; Sun, 25 Mar 2018 19:11:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6B94E0070F
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Mar 2018 19:11:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38151170"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Mar 2018 10:11:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 76E3848AE76D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 10:11:31 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 26 Mar 2018 10:11:31 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Mar 2018 10:11:33 +0800
Message-ID: <1522030294-809-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 76E3848AE76D.A52FA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH] python-stevedore: 1.27.1 -> 1.28.0
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
X-List-Received-Date: Mon, 26 Mar 2018 02:11:36 -0000
Content-Type: text/plain

Upgrade python-stevedore from 1.27.1 to 1.28.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-stevedore_1.27.1.bb => python-stevedore_1.28.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-stevedore_1.27.1.bb => python-stevedore_1.28.0.bb} (75%)

diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.28.0.bb
similarity index 75%
rename from meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb
rename to meta-openstack/recipes-devtools/python/python-stevedore_1.28.0.bb
index e1c0167..789d76b 100644
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.28.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "80113d0f3b0f4d64107546dde410003a"
-SRC_URI[sha256sum] = "236468dae36707069e8b3bdb455e9f1be090b1e6b937f4ac0c56a538d6f50be0"
+SRC_URI[md5sum] = "b736a71431a2ff5831bbff4a6ccec0c1"
+SRC_URI[sha256sum] = "f1c7518e7b160336040fee272174f1f7b29a46febb3632502a8f2055f973d60b"
 
 inherit setuptools rmargparse pypi
 
-- 
2.7.4




