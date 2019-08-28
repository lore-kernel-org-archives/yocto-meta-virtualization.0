Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59F37E00DD1; Tue, 27 Aug 2019 20:25:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2B39E00DAE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2019 20:25:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,439,1559491200"; d="scan'208";a="74416211"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2019 11:25:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4C3044CDDB0D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Aug 2019 11:25:27 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 28 Aug 2019 11:25:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 28 Aug 2019 11:24:53 +0800
Message-ID: <20190828032453.19882-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 4C3044CDDB0D.AA1AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-dogpile: Add python3 version
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
X-List-Received-Date: Wed, 28 Aug 2019 03:25:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-dogpile.cache.inc         | 12 ++++++++++++
 .../recipes-devtools/python/python-dogpile.cache_0.7.1.bb    | 12 ++----------
 .../recipes-devtools/python/python3-dogpile.cache_0.7.1.bb   |  4 ++++
 3 files changed, 18 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
new file mode 100644
index 0000000..13e4b03
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
+HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9b4ca25e52ccc9b1601e8fe6d4fb4ba7"
+
+SRC_URI[md5sum] = "88043b337eb609214dbd8fa498300b38"
+SRC_URI[sha256sum] = "691b7f199561c4bd6e7e96f164a43cc3781b0c87bea29b7d59d859f873fd4a31"
+
+inherit pypi
+
+
diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
index 74e6a74..6f531a0 100644
--- a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
@@ -1,12 +1,4 @@
-DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
-HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9b4ca25e52ccc9b1601e8fe6d4fb4ba7"
-
-SRC_URI[md5sum] = "88043b337eb609214dbd8fa498300b38"
-SRC_URI[sha256sum] = "691b7f199561c4bd6e7e96f164a43cc3781b0c87bea29b7d59d859f873fd4a31"
-
-inherit setuptools pypi
+inherit setuptools
+require python-dogpile.cache.inc
 
 
diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb
new file mode 100644
index 0000000..ccfb292
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-dogpile.cache.inc
+
+
-- 
2.7.4




