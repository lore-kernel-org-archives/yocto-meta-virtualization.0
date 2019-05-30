Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E18FE00D48; Wed, 29 May 2019 22:41:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BDB1E00D45
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:41:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,529,1549900800"; d="scan'208";a="65180287"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2019 13:41:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6FEBF4CDB1E9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 May 2019 13:41:39 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 30 May 2019 13:41:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 13:42:51 +0800
Message-ID: <20190530054251.14308-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 6FEBF4CDB1E9.AF3F5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-positional: upgrade 1.1.1 -> 1.2.1
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
X-List-Received-Date: Thu, 30 May 2019 05:41:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-positional_1.1.1.bb to python-positional_1.2.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...{python-positional_1.1.1.bb => python-positional_1.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-positional_1.1.1.bb => python-positional_1.2.1.bb} (75%)

diff --git a/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb b/meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
similarity index 75%
rename from meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
rename to meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
index 144b2cc..93eb6e1 100644
--- a/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
 
-SRC_URI[md5sum] = "c82903c32c1aec1ac0f0f6e166ef4e2e"
-SRC_URI[sha256sum] = "ef845fa46ee5a11564750aaa09dd7db059aaf39c44c901b37181e5ffa67034b0"
+SRC_URI[md5sum] = "4afcffd8e2ba733fd7a50f137a2ee893"
+SRC_URI[sha256sum] = "cf48ea169f6c39486d5efa0ce7126a97bed979a52af6261cf255a41f9a74453a"
 
 inherit setuptools pypi
 
-- 
2.20.1




