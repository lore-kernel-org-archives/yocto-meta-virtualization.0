Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77669E00B58; Tue, 12 Mar 2019 02:03:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90070E00AC5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Mar 2019 02:03:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.58,470,1544457600"; d="scan'208";a="56547565"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Mar 2019 17:03:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id CC6844C874FE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Mar 2019 17:03:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 12 Mar 2019 17:03:56 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 12 Mar 2019 17:05:13 +0800
Message-ID: <20190312090514.30087-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: CC6844C874FE.A9978
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]: python-cliff: upgrade to 2.14.1
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
X-List-Received-Date: Tue, 12 Mar 2019 09:03:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade python-cliff from 2.9.1 to 2.14.1.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-cliff_2.9.1.bb => python-cliff_2.14.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-cliff_2.9.1.bb => python-cliff_2.14.1.bb} (82%)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.9.1.bb b/meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
similarity index 82%
rename from meta-openstack/recipes-devtools/python/python-cliff_2.9.1.bb
rename to meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
index e24c756..70ac4e6 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_2.9.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "2bb9bc906a0174afbc25f896484d215e"
-SRC_URI[sha256sum] = "ab50fbb4717c74e32915123f4150805b463e81de1d58e43996fd813b26c5b447"
+SRC_URI[md5sum] = "4c5d43d98970c79b091e25676cce2b10"
+SRC_URI[sha256sum] = "b47387a344898ccb28ca7f386f017ade9eb66dc1713e5c642a0bc09ec606cc67"
 
 inherit setuptools pypi
 
-- 
2.20.1




