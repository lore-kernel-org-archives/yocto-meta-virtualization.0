Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35EA6E00C43; Sun, 26 May 2019 18:24:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CF04E00C02
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 18:24:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64729573"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 09:24:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 37A1F4CDB948
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 09:24:52 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 09:24:57 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 09:25:51 +0800
Message-ID: <20190527012551.19048-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 37A1F4CDB948.A90E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-happybase:upgrade 1.1.0 -> 1.2.0
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
X-List-Received-Date: Mon, 27 May 2019 01:24:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-happybase_1.1.0.bb to python-happybase_1.2.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-happybase_1.1.0.bb => python-happybase_1.2.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-happybase_1.1.0.bb => python-happybase_1.2.0.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
rename to meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
index 0981c27..a8066b6 100644
--- a/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
 
-SRC_URI[md5sum] = "62a09c784a65161e9f5f01129d115457"
-SRC_URI[sha256sum] = "e20376e2e32291798d2226502994134c1c4e175136d8375b3c517a234fa22481"
+SRC_URI[md5sum] = "96cb7ea8163f531907fabd0dddc8b87e"
+SRC_URI[sha256sum] = "850b4ee651128588a57e1e152dd1252e5ec39776a5d3d14ee892b8bac0fa9e1a"
 
 inherit setuptools pypi
 
-- 
2.20.1




