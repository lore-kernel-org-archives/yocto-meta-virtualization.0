Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47569E00BBC; Fri, 20 Jan 2017 00:07:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7EE1E00B2E
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 00:07:22 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14946370"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2017 16:07:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DACC147B1502
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 16:07:17 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 20 Jan 2017 16:07:18 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 20 Jan 2017 16:06:58 +0800
Message-ID: <1484899618-1294-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: DACC147B1502.A8EAB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] ipython-waitress: 0.8.9 -> 1.0.1
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
X-List-Received-Date: Fri, 20 Jan 2017 08:07:27 -0000
Content-Type: text/plain

Upgrade python-waitress from 0.8.9 to 1.0.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-waitress_0.8.9.bb => python-waitress_1.0.1.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-waitress_0.8.9.bb => python-waitress_1.0.1.bb} (51%)

diff --git a/meta-openstack/recipes-devtools/python/python-waitress_0.8.9.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
similarity index 51%
rename from meta-openstack/recipes-devtools/python/python-waitress_0.8.9.bb
rename to meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
index 548efd1..42c9b9f 100644
--- a/meta-openstack/recipes-devtools/python/python-waitress_0.8.9.bb
+++ b/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
 SRCNAME = "waitress"
 
-SRC_URI = "https://pypi.python.org/packages/source/w/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/78/7d/84d11b96c3f60164dec3bef4a859a03aeae0231aa93f57fbe0d05fa4ff36/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "da3f2e62b3676be5dd630703a68e2a04"
-SRC_URI[sha256sum] = "826527dc9d334ed4ed76cdae672fdcbbccf614186657db71679ab58df869458a"
+SRC_URI[md5sum] = "dda92358a7569669086155923a46e57c"
+SRC_URI[sha256sum] = "2daacaece189ede6a23440afe03bda58089a6207f1d80a1e9497f979dfb741fc"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




