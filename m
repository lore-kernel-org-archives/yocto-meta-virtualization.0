Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E908E00D48; Wed, 29 May 2019 20:33:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D4EDE0053F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 20:33:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,529,1549900800"; d="scan'208";a="65159658"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2019 11:33:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B722A4CD9588
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 May 2019 11:33:24 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 30 May 2019 11:33:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 11:34:36 +0800
Message-ID: <20190530033436.3625-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: B722A4CD9588.A8995
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-sqlparse: upgrade 0.2.4 -> 0.3.0
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
X-List-Received-Date: Thu, 30 May 2019 03:33:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-sqlparse_0.2.4.bb to python-sqlparse_0.3.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-sqlparse_0.2.4.bb => python-sqlparse_0.3.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-sqlparse_0.2.4.bb => python-sqlparse_0.3.0.bb} (73%)

diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.2.4.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
similarity index 73%
rename from meta-openstack/recipes-devtools/python/python-sqlparse_0.2.4.bb
rename to meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
index b253af4..88a0e8c 100644
--- a/meta-openstack/recipes-devtools/python/python-sqlparse_0.2.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI[md5sum] = "8f753105167f35ea94ae6387e8af152f"
-SRC_URI[sha256sum] = "ce028444cfab83be538752a2ffdb56bc417b7784ff35bb9a3062413717807dec"
+SRC_URI[md5sum] = "2ce34181d6b7b234c9f3c0ecd1ffb93e"
+SRC_URI[sha256sum] = "7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.20.1




