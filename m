Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7BF1E00D97; Wed, 15 May 2019 01:48:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63AAEE00D6C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 01:48:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,472,1549900800"; d="scan'208";a="63132527"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2019 16:48:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 977674CE150F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 16:41:20 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 May 2019 16:41:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 May 2019 16:42:18 +0800
Message-ID: <20190515084218.15292-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 977674CE150F.A964E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-debtcollector:upgrade 1.17.1 -> 1.21.0
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
X-List-Received-Date: Wed, 15 May 2019 08:48:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-debtcollector_1.17.1.bb to python-debtcollector_1.21.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...debtcollector_1.17.1.bb => python-debtcollector_1.21.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-debtcollector_1.17.1.bb => python-debtcollector_1.21.0.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector_1.17.1.bb b/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-debtcollector_1.17.1.bb
rename to meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
index 52b1319..18b910b 100644
--- a/meta-openstack/recipes-devtools/python/python-debtcollector_1.17.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[md5sum] = "d43a2733f02549628fe9f716363a5b01"
-SRC_URI[sha256sum] = "1f751d74789baa82684f55bececf754ebff1ad40e3fb1bee44fcf5c25a31e92d"
+SRC_URI[md5sum] = "ec899623b37fdee65b888243f0a46735"
+SRC_URI[sha256sum] = "f6ce5a383ad73c23e1138dbb69bf45d33f4a4bdec38f02dbf2b89477ec5e55bc"
 
 inherit setuptools pypi
 
-- 
2.20.1




