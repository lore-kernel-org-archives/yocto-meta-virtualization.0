Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA207E00D47; Mon, 23 Sep 2019 01:38:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD971E00D38
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Sep 2019 01:38:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,539,1559491200"; d="scan'208";a="75879517"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Sep 2019 16:38:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8FB234CE14E7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Sep 2019 16:38:17 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 23 Sep 2019 16:38:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Sep 2019 16:38:08 +0800
Message-ID: <20190923083808.27539-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 8FB234CE14E7.ABD39
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-dogpile.cache: upgrade 0.7.1 -> 0.8.0
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
X-List-Received-Date: Mon, 23 Sep 2019 08:38:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

--License-Update: Copyright year updated to 2019,and streamlined description of LICENCE.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-dogpile.cache.inc        | 6 +++---
 ...dogpile.cache_0.7.1.bb => python-dogpile.cache_0.8.0.bb} | 0
 ...ogpile.cache_0.7.1.bb => python3-dogpile.cache_0.8.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-dogpile.cache_0.7.1.bb => python-dogpile.cache_0.8.0.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-dogpile.cache_0.7.1.bb => python3-dogpile.cache_0.8.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
index 13e4b03..020b171 100644
--- a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
+++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
@@ -2,10 +2,10 @@ DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lo
 HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9b4ca25e52ccc9b1601e8fe6d4fb4ba7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e8d5890806254a2648269bb4029f74c6"
 
-SRC_URI[md5sum] = "88043b337eb609214dbd8fa498300b38"
-SRC_URI[sha256sum] = "691b7f199561c4bd6e7e96f164a43cc3781b0c87bea29b7d59d859f873fd4a31"
+SRC_URI[md5sum] = "62512dea6839d2fd1f88532fb573077c"
+SRC_URI[sha256sum] = "70f5eae4aec908f76188a2c287e07105f60c05d879bb9a4efcc5ba44563d8de6"
 
 inherit pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.8.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
rename to meta-openstack/recipes-devtools/python/python-dogpile.cache_0.8.0.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.8.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb
rename to meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.8.0.bb
-- 
2.20.1




