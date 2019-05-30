Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12710E00D47; Wed, 29 May 2019 20:53:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5032FE009A0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 20:53:20 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,529,1549900800"; d="scan'208";a="65162394"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2019 11:53:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E6E164CD9588
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 May 2019 11:53:15 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 30 May 2019 11:53:22 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 11:54:27 +0800
Message-ID: <20190530035427.22259-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: E6E164CD9588.AAA0D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-waitress: upgrade 1.2.0 -> 1.3.0
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
X-List-Received-Date: Thu, 30 May 2019 03:53:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-waitress_1.2.0.bb to python-waitress_1.3.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-waitress_1.2.0.bb => python-waitress_1.3.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-waitress_1.2.0.bb => python-waitress_1.3.0.bb} (62%)

diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.2.0.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.3.0.bb
similarity index 62%
rename from meta-openstack/recipes-devtools/python/python-waitress_1.2.0.bb
rename to meta-openstack/recipes-devtools/python/python-waitress_1.3.0.bb
index e516d2b..fc227d6 100644
--- a/meta-openstack/recipes-devtools/python/python-waitress_1.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-waitress_1.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[md5sum] = "8c5492d3c1a2e0cd80780175686dbb0f"
-SRC_URI[sha256sum] = "e624c829656ffc99b33d661072b2814885ae92835cf835ee8ab283ddb7c915b9"
+SRC_URI[md5sum] = "884dbea5d7348f7db1b8ab76ef3a3a71"
+SRC_URI[sha256sum] = "4e2a6e6fca56d6d3c279f68a2b2cc9b4798d834ea3c3a9db3e2b76b6d66f4526"
 
 inherit setuptools pypi
-- 
2.20.1




