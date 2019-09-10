Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3EF77E00DA3; Mon,  9 Sep 2019 19:14:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EEA5E00D63
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 19:14:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,487,1559491200"; d="scan'208";a="75194214"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Sep 2019 10:14:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0D9204CE14EA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2019 10:14:08 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 10 Sep 2019 10:14:17 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 10 Sep 2019 10:13:43 +0800
Message-ID: <20190910021343.22438-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 0D9204CE14EA.ACA20
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-keystoneauth1: upgrade 3.17.0 -> 3.17.1
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
X-List-Received-Date: Tue, 10 Sep 2019 02:14:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-keystoneauth1.inc       | 4 ++--
 ...{python-keystoneauth1_3.17.0.bb => python-keystoneauth1_3.17.1.bb} | 0
 ...ython3-keystoneauth1_3.17.0.bb => python3-keystoneauth1_3.17.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_3.17.0.bb => python-keystoneauth1_3.17.1.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-keystoneauth1_3.17.0.bb => python3-keystoneauth1_3.17.1.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
index 3d6309d..14893d6 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
 
-SRC_URI[md5sum] = "599340c2b3ccbcf9996870478abb5407"
-SRC_URI[sha256sum] = "59a4488ceae0c1210cba468945013b875b2ce09d99c54c9fcc9c926aea55dfd7"
+SRC_URI[md5sum] = "0864f3485db8709d1dec0c8fa6073a31"
+SRC_URI[sha256sum] = "db91ccab5cc43dac4a25dc2c090642d7c31f9ceb28df2c685620d7c12335a8cd"
 
 inherit pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.1.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.1.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.1.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb
rename to meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.1.bb
-- 
2.7.4




