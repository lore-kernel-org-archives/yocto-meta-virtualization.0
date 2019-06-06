Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 447B5E00D75; Wed,  5 Jun 2019 19:37:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BB09E00D6B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Jun 2019 19:37:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66162642"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 10:37:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7397B4CDCD42
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Jun 2019 10:37:09 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Jun 2019 10:37:12 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Jun 2019 10:38:22 +0800
Message-ID: <20190606023822.17597-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 7397B4CDCD42.AB9CC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-rfc3986: upgrade 0.4.1 -> 1.3.2
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
X-List-Received-Date: Thu, 06 Jun 2019 02:37:12 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-rfc3986_0.4.1.bb to python-rfc3986_1.3.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-rfc3986_0.4.1.bb => python-rfc3986_1.3.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-rfc3986_0.4.1.bb => python-rfc3986_1.3.2.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb b/meta-openstack/recipes-devtools/python/python-rfc3986_1.3.2.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb
rename to meta-openstack/recipes-devtools/python/python-rfc3986_1.3.2.bb
index 0eaf181..e32f903 100644
--- a/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-rfc3986_1.3.2.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03731a0e7dbcb30cecdcec77cc93ec29"
 
-SRC_URI[md5sum] = "b2b48cd36dabb82d5eaa54bbfb20d382"
-SRC_URI[sha256sum] = "5ac85eb132fae7bbd811fa48d11984ae3104be30d44d397a351d004c633a68d2"
+SRC_URI[md5sum] = "5b6d009806a94d418c82d48219a256de"
+SRC_URI[sha256sum] = "0344d0bd428126ce554e7ca2b61787b6a28d2bbd19fc70ed2dd85efe31176405"
 
 inherit setuptools pypi
 
-- 
2.20.1




