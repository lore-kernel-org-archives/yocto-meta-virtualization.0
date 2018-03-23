Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D649E00C59; Thu, 22 Mar 2018 20:30:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED886E00948
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Mar 2018 20:30:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38089875"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Mar 2018 11:28:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EEC8248AE773
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 11:28:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 23 Mar 2018 11:28:50 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 23 Mar 2018 11:28:51 +0800
Message-ID: <1521775736-38102-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: EEC8248AE773.A82D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH] python-mox3: 0.20.0 -> 0.25.0
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
X-List-Received-Date: Fri, 23 Mar 2018 03:30:02 -0000
Content-Type: text/plain

Upgrade python-mox3 from 0.20.0 to 0.25.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-mox3_0.20.0.bb => python-mox3_0.25.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-mox3_0.20.0.bb => python-mox3_0.25.0.bb} (75%)

diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
similarity index 75%
rename from meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
rename to meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
index 95ed6e1..062fc7c 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.25.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "53be7bf2d109c8bdf477c75b369773b8"
-SRC_URI[sha256sum] = "7b1549222353f6cc5b705734ef186fe2cc323d30c3987df50eceb77273595606"
+SRC_URI[md5sum] = "77bb9a6a57187b708d822bad05c51e0e"
+SRC_URI[sha256sum] = "b7476f7a2dfe4d7ad743e3cbbf04ade624b3a208a0042f3f8b2ae7b00559543a"
 
 inherit setuptools pypi
 
-- 
2.7.4




