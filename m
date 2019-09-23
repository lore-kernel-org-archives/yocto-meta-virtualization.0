Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 177A3E00D5C; Mon, 23 Sep 2019 00:39:18 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E50D7E00D90
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Sep 2019 00:38:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,539,1559491200"; d="scan'208";a="75876830"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Sep 2019 15:38:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3A6024CE14E1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Sep 2019 15:38:54 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 23 Sep 2019 15:38:57 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Sep 2019 15:38:44 +0800
Message-ID: <20190923073844.1402-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3A6024CE14E1.A6E62
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-contextlib2: upgrade 0.5.5 -> 0.6.0
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
X-List-Received-Date: Mon, 23 Sep 2019 07:39:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-contextlib2.inc | 4 ++--
 ...ython-contextlib2_0.5.5.bb => python-contextlib2_0.6.0.bb} | 0
 ...hon3-contextlib2_0.5.5.bb => python3-contextlib2_0.6.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-contextlib2_0.5.5.bb => python-contextlib2_0.6.0.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-contextlib2_0.5.5.bb => python3-contextlib2_0.6.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2.inc b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
index 0a45008..d409034 100644
--- a/meta-openstack/recipes-devtools/python/python-contextlib2.inc
+++ b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
 
-SRC_URI[md5sum] = "95fe420941ebc64951cd9d89edc41870"
-SRC_URI[sha256sum] = "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"
+SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
+SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277077ed3"
 
 DEPENDS += " \
         ${PYTHON_PN}-pip \
diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb b/meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
rename to meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb b/meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb
rename to meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.0.bb
-- 
2.20.1




