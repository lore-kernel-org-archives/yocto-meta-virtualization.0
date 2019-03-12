Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0BEEE00872; Tue, 12 Mar 2019 02:03:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAD55E00872
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Mar 2019 02:03:51 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.58,470,1544457600"; d="scan'208";a="56547564"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Mar 2019 17:03:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 660894C8B024
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 Mar 2019 17:03:27 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 12 Mar 2019 17:03:57 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 12 Mar 2019 17:05:14 +0800
Message-ID: <20190312090514.30087-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190312090514.30087-1-hongl.fnst@cn.fujitsu.com>
References: <20190312090514.30087-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 660894C8B024.A64D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-croniter: Upgrade to 0.3.27
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
X-List-Received-Date: Tue, 12 Mar 2019 09:03:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

1.Upgrade python-croniter from 0.3.5 to 0.3.27.

2.Modified PKG-INFO due to version update.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 ...python-croniter_0.3.5.bb => python-croniter_0.3.27.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-croniter_0.3.5.bb => python-croniter_0.3.27.bb} (65%)

diff --git a/meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb b/meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb
rename to meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb
index 128a4aa..97df2a9 100644
--- a/meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "croniter provides iteration for datetime object with cron like fo
 HOMEPAGE = "https://pypi.python.org/pypi/croniter/0.3.4"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2c82e6382ef84397e2341a04f039abcc"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=21cc5101d5b0c940e3354fb1bd26c7e5"
 
 # Archived version so we have to overwrite what the pypi class will derive
-PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.zip"
+PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "63cf9e4d6778dc4102a4794a39a1b45b"
-SRC_URI[sha256sum] = "ecd5cda855668ae11ed5ea341e9c2145bbab88bfd0763666951cfe15bab23f50"
+SRC_URI[md5sum] = "f5543f9f165fe725b2133b698f520380"
+SRC_URI[sha256sum] = "fbd72189a0ff38c27e953d15175c5fedafb953479559240a1afcf8e8e7523757"
 
 inherit setuptools pypi
 
-- 
2.20.1




