Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B33CAE00C36; Sun, 26 May 2019 20:23:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B49FFE00B33
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 20:23:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64744196"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 11:23:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4EC824CE045F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 11:07:00 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 11:07:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 11:07:57 +0800
Message-ID: <20190527030757.6710-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 4EC824CE045F.A9011
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-httpretty:upgrade 0.9.5 -> 0.9.6
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
X-List-Received-Date: Mon, 27 May 2019 03:23:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-httpretty_0.9.5.bb to python-httpretty_0.9.6.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-httpretty_0.9.5.bb => python-httpretty_0.9.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httpretty_0.9.5.bb => python-httpretty_0.9.6.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
rename to meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
index e39ad05..68d79f3 100644
--- a/meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
+++ b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
@@ -7,8 +7,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
 
-SRC_URI[md5sum] = "e0e4294987c02181b1141c9ceb81783f"
-SRC_URI[sha256sum] = "543fa2bd9c319bfa1e1de9e37d7c9c08fa926a692b65b0be5df4b2f069fd0ad7"
+SRC_URI[md5sum] = "3b881b519e0f405caaf8aaa63f3508c0"
+SRC_URI[sha256sum] = "01b52d45077e702eda491f4fe75328d3468fd886aed5dcc530003e7b2b5939dc"
 
 inherit setuptools pypi
 
-- 
2.20.1




