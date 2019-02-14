Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB05BE00BE8; Wed, 13 Feb 2019 21:43:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D347E00A0C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Feb 2019 21:43:24 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.58,367,1544457600"; d="scan'208";a="54311008"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Feb 2019 13:43:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0A1B54C4BCD7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 13:43:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 14 Feb 2019 13:43:32 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 14 Feb 2019 13:44:25 +0800
Message-ID: <20190214054425.11565-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 0A1B54C4BCD7.ADBAB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-oslo.config:modify homepage
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
X-List-Received-Date: Thu, 14 Feb 2019 05:43:26 -0000
Content-Type: text/plain

Modify homepage to correspond to new version

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-oslo.config_git.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
index 0ccc66e..eed00c5 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "API supporting parsing command line arguments and .ini style configuration files."
-HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/2.6.0"
+HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/4.11.1"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
@@ -34,4 +34,4 @@ RDEPENDS_${PN} += " \
     python-rfc3986 \
     python-pyyaml \
     "
-	
\ No newline at end of file
+	
-- 
2.17.2




