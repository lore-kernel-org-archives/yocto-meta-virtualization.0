Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26A9EE00C18; Mon, 23 Jul 2018 02:00:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78320E00BB5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 02:00:48 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42542304"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2018 17:00:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E97EB4B66A0A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 17:00:36 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 23 Jul 2018 17:00:35 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Jul 2018 17:00:10 +0800
Message-ID: <20180723090011.11902-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: E97EB4B66A0A.A1193
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-sphinx:1.4.1->1.7.6
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
X-List-Received-Date: Mon, 23 Jul 2018 09:00:50 -0000
Content-Type: text/plain

1.Upgrade python-sphinx from 1.4.1 to 1.7.6.

2.Modify LIC_FILES_CHKSUM,because of delete "PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2"

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 recipes-devtools/python/python-sphinx_1.4.1.bb | 12 ------------
 recipes-devtools/python/python-sphinx_1.7.6.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 recipes-devtools/python/python-sphinx_1.4.1.bb
 create mode 100644 recipes-devtools/python/python-sphinx_1.7.6.bb

diff --git a/recipes-devtools/python/python-sphinx_1.4.1.bb b/recipes-devtools/python/python-sphinx_1.4.1.bb
deleted file mode 100644
index 476ff97..0000000
--- a/recipes-devtools/python/python-sphinx_1.4.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Python documentation generator"
-HOMEPAGE = "http://sphinx-doc.org/"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
-
-PYPI_PACKAGE = "Sphinx"
-
-SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
-SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537a57e2fcf4d7c799410eba18236bc76d6bc"
-
-inherit setuptools pypi
diff --git a/recipes-devtools/python/python-sphinx_1.7.6.bb b/recipes-devtools/python/python-sphinx_1.7.6.bb
new file mode 100644
index 0000000..0200c9e
--- /dev/null
+++ b/recipes-devtools/python/python-sphinx_1.7.6.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python documentation generator"
+HOMEPAGE = "http://sphinx-doc.org/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=89cbefcd0a80481e8b26a9a7d25be749"
+
+PYPI_PACKAGE = "Sphinx"
+
+SRC_URI[md5sum] = "8fbd77d80c8e0966964751ab31a0204a"
+SRC_URI[sha256sum] = "217ad9ece2156ed9f8af12b5d2c82a499ddf2c70a33c5f81864a08d8c67b9efc"
+
+inherit setuptools pypi
-- 
2.7.4




