Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FB12E00C7D; Sun, 26 May 2019 20:37:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77B06E00C36
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 20:37:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64746219"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 11:37:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9CBBE4CDCCAB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 11:37:09 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 11:37:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 11:38:09 +0800
Message-ID: <20190527033809.32112-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 9CBBE4CDCCAB.AE997
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-mox3:upgrade 0.26.0 -> 0.27.0
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
X-List-Received-Date: Mon, 27 May 2019 03:37:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-mox3_0.26.0.bb => python-mox3_0.27.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-mox3_0.26.0.bb => python-mox3_0.27.0.bb} (75%)

diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.27.0.bb
similarity index 75%
rename from meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
rename to meta-openstack/recipes-devtools/python/python-mox3_0.27.0.bb
index c420bc2..215c63f 100644
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.26.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.27.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "c05b14ecb25d040f00b0d5ef3b370e20"
-SRC_URI[sha256sum] = "b13c0b8459d6fb0688f9a4e70feeec43fa2cca05b727fc01156789596e083bb1"
+SRC_URI[md5sum] = "fa4fd9d9a12c388707c1579e2a6338dc"
+SRC_URI[sha256sum] = "210ccaf5829de3e133f0fb8ab798cdb82663aae09b715130fc4765f18234162a"
 
 inherit setuptools pypi
 
-- 
2.20.1




