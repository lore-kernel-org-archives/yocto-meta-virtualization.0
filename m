Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 611DDE00D48; Wed, 29 May 2019 22:15:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79CDCE0053F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:15:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,529,1549900800"; d="scan'208";a="65175820"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2019 13:15:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id DB8894CDBF6F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 May 2019 13:15:07 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 30 May 2019 13:15:07 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 13:16:19 +0800
Message-ID: <20190530051619.5106-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: DB8894CDBF6F.ADC76
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-dogpile.cache: upgrade 0.6.2 -> 0.7.1
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
X-List-Received-Date: Thu, 30 May 2019 05:15:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-dogpile.cache_0.6.2.bb to python-dogpile.cache_0.7.1.bb.

-License-Update: Copyright year updated to 2018.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python-dogpile.cache_0.6.2.bb             | 12 ------------
 .../python/python-dogpile.cache_0.7.1.bb             | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb
deleted file mode 100644
index 632061b..0000000
--- a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
-HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1edd9b48649f5bffa03e749a55f5a067"
-
-SRC_URI[md5sum] = "ab3771eb2155b9658c9e33fa1b827708"
-SRC_URI[sha256sum] = "73793471af07af6dc5b3ee015abfaca4220caaa34c615537f5ab007ed150726d"
-
-inherit setuptools pypi
-
-
diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
new file mode 100644
index 0000000..74e6a74
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
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
+inherit setuptools pypi
+
+
-- 
2.20.1




