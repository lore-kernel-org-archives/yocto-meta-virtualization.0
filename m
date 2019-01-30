Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06956E00D14; Tue, 29 Jan 2019 16:43:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46B35E00D0E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2019 16:43:13 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.56,538,1539619200"; d="scan'208";a="53161397"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jan 2019 08:42:07 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F9C24C4BB85
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Jan 2019 08:42:03 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 30 Jan 2019 08:42:08 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 30 Jan 2019 08:42:46 +0800
Message-ID: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 3F9C24C4BB85.A07E3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-mox3
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
X-List-Received-Date: Wed, 30 Jan 2019 00:43:14 -0000
Content-Type: text/plain

Fix HOMEPAGE

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
index 73de2b3..c420bc2 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "mox3: mock object framework for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/mox3/0.9.0"
+HOMEPAGE = "https://pypi.python.org/pypi/mox3"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-- 
2.17.2




