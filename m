Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19D91E00E4F; Fri, 18 Oct 2019 00:53:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EB17E00E4C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 00:53:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="77149575"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Oct 2019 15:53:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 81FA74CE1504
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 15:53:19 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 18 Oct 2019 15:53:42 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 18 Oct 2019 15:53:54 +0800
Message-ID: <20191018075354.7293-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 81FA74CE1504.A943D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-enum-compat: upgrade 0.0.2 -> 0.0.3
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
X-List-Received-Date: Fri, 18 Oct 2019 07:53:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-enum-compat.inc         | 4 ++--
 .../{python-enum-compat_0.0.2.bb => python-enum-compat_0.0.3.bb}      | 0
 .../{python3-enum-compat_0.0.2.bb => python3-enum-compat_0.0.3.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-enum-compat_0.0.2.bb => python-enum-compat_0.0.3.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-enum-compat_0.0.2.bb => python3-enum-compat_0.0.3.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat.inc b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
index d1f7648..9fa8c52 100644
--- a/meta-openstack/recipes-devtools/python/python-enum-compat.inc
+++ b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[md5sum] = "3002940b6620837d0fbc86ec72509be3"
-SRC_URI[sha256sum] = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"
+SRC_URI[md5sum] = "74c19a80356825e5351aba8c4c1b00e6"
+SRC_URI[sha256sum] = "3677daabed56a6f724451d585662253d8fb4e5569845aafa8bb0da36b1a8751e"
 
 inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
rename to meta-openstack/recipes-devtools/python/python-enum-compat_0.0.3.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb
rename to meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.3.bb
-- 
2.7.4




