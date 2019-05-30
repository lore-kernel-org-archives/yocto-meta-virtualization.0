Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 354E5E00D48; Wed, 29 May 2019 22:21:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A1F5E00951
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:21:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,529,1549900800"; d="scan'208";a="65176937"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2019 13:21:44 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EFB824CD9DA3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 May 2019 13:21:39 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 30 May 2019 13:21:39 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 13:22:52 +0800
Message-ID: <20190530052252.12600-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: EFB824CD9DA3.AD513
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-futurist: upgrade 0.21.0 -> 1.8.1
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
X-List-Received-Date: Thu, 30 May 2019 05:21:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-futurist_0.21.0.bb to python-futurist_1.8.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-futurist_0.21.0.bb => python-futurist_1.8.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-futurist_0.21.0.bb => python-futurist_1.8.1.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb b/meta-openstack/recipes-devtools/python/python-futurist_1.8.1.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
rename to meta-openstack/recipes-devtools/python/python-futurist_1.8.1.bb
index afee162..0f35c96 100644
--- a/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-futurist_1.8.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "da7e87d273f1982c24e9fe8a24f81259"
-SRC_URI[sha256sum] = "086dd646c067d4ef6dc9c04000828acfbdc00842bd37c64825b596a6976509b4"
+SRC_URI[md5sum] = "3e5a4b8254ded1624ec807cb7ae04ba5"
+SRC_URI[sha256sum] = "499ee57728a987028725f836ac22aa18899702162fa0a0f1bbe2ecd5c8daf1eb"
 
 inherit setuptools pypi
 
-- 
2.20.1




