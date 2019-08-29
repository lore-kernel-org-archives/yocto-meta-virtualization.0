Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 747A1E00DEF; Thu, 29 Aug 2019 00:25:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF50CE00DE6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 00:25:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,442,1559491200"; d="scan'208";a="74513655"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Aug 2019 15:25:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6AB324CE0885
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 15:25:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 29 Aug 2019 15:25:22 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Aug 2019 16:25:07 +0900
Message-ID: <20190829072507.15367-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 6AB324CE0885.AE014
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python3-sphinx: Add python3 version
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
X-List-Received-Date: Thu, 29 Aug 2019 07:25:26 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 recipes-devtools/python/python3-sphinx_2.2.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 recipes-devtools/python/python3-sphinx_2.2.0.bb

diff --git a/recipes-devtools/python/python3-sphinx_2.2.0.bb b/recipes-devtools/python/python3-sphinx_2.2.0.bb
new file mode 100644
index 0000000..5ea408f
--- /dev/null
+++ b/recipes-devtools/python/python3-sphinx_2.2.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Python documentation generator"
+HOMEPAGE = "http://sphinx-doc.org/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cc3ed00294f08c93200bc064c73c9d40"
+
+PYPI_PACKAGE = "Sphinx"
+
+SRC_URI[md5sum] = "ca64efdbb4d3a0a78398dbcf9f78971d"
+SRC_URI[sha256sum] = "0d586b0f8c2fc3cc6559c5e8fd6124628110514fda0e5d7c82e682d749d2e845"
+inherit setuptools3 pypi
-- 
2.17.1




