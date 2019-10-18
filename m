Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75BCFE00DD5; Fri, 18 Oct 2019 01:20:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A723CE00DEF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 01:20:11 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="77151003"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Oct 2019 16:20:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C05494CE1503
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 16:19:47 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 18 Oct 2019 16:20:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 18 Oct 2019 16:20:22 +0800
Message-ID: <20191018082022.7664-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: C05494CE1503.A926D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-httpretty: upgrade 0.9.6 -> 0.9.7
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
X-List-Received-Date: Fri, 18 Oct 2019 08:20:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-httpretty.inc           | 4 ++--
 .../python/{python-httpretty_0.9.6.bb => python-httpretty_0.9.7.bb}   | 0
 .../python/{python3-httpretty_0.9.6.bb => python3-httpretty_0.9.7.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httpretty_0.9.6.bb => python-httpretty_0.9.7.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-httpretty_0.9.6.bb => python3-httpretty_0.9.7.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-httpretty.inc b/meta-openstack/recipes-devtools/python/python-httpretty.inc
index f39e283..97bd6b3 100644
--- a/meta-openstack/recipes-devtools/python/python-httpretty.inc
+++ b/meta-openstack/recipes-devtools/python/python-httpretty.inc
@@ -7,8 +7,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
 
-SRC_URI[md5sum] = "3b881b519e0f405caaf8aaa63f3508c0"
-SRC_URI[sha256sum] = "01b52d45077e702eda491f4fe75328d3468fd886aed5dcc530003e7b2b5939dc"
+SRC_URI[md5sum] = "2fc3d0dc986200be95ce8ad3ef56bc04"
+SRC_URI[sha256sum] = "66216f26b9d2c52e81808f3e674a6fb65d4bf719721394a1a9be926177e55fbe"
 
 inherit pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.7.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
rename to meta-openstack/recipes-devtools/python/python-httpretty_0.9.7.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb b/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.7.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb
rename to meta-openstack/recipes-devtools/python/python3-httpretty_0.9.7.bb
-- 
2.7.4




