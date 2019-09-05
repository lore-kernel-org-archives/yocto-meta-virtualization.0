Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 573FDE00C11; Wed,  4 Sep 2019 20:15:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA777E00929
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 20:15:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74869202"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 11:15:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BA7184CE14EB
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 11:15:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 11:15:20 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 5 Sep 2019 12:14:54 +0900
Message-ID: <20190905031454.39639-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: BA7184CE14EB.AFA1E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python-mox3:upgrade 0.27.0 -> 0.28.0
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
X-List-Received-Date: Thu, 05 Sep 2019 03:15:21 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../python/{python-mox3_0.27.0.bb => python-mox3_0.28.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-mox3_0.27.0.bb => python-mox3_0.28.0.bb} (75%)

diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.27.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
similarity index 75%
rename from meta-openstack/recipes-devtools/python/python-mox3_0.27.0.bb
rename to meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
index 215c63f..28ffe16 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.27.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "fa4fd9d9a12c388707c1579e2a6338dc"
-SRC_URI[sha256sum] = "210ccaf5829de3e133f0fb8ab798cdb82663aae09b715130fc4765f18234162a"
+SRC_URI[md5sum] = "c930d8479996541b04447a67e96e4a62"
+SRC_URI[sha256sum] = "8094868e70f814b4a526ecc592365437bc93a7dd60341321344987b3e8dba49d"
 
 inherit setuptools pypi
 
-- 
2.17.1




