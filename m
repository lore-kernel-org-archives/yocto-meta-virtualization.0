Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFF3EE00DA7; Fri, 18 Oct 2019 01:05:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B492E00D89
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 01:05:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="77150279"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Oct 2019 16:05:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2ACBC4CE1503
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 16:05:04 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 18 Oct 2019 16:05:27 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 18 Oct 2019 16:05:38 +0800
Message-ID: <20191018080538.7425-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2ACBC4CE1503.AABB7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-httplib2: upgrade 0.13.1 -> 0.14.0
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
X-List-Received-Date: Fri, 18 Oct 2019 08:05:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-httplib2.inc          | 6 +++---
 .../python/{python-httplib2_0.13.1.bb => python-httplib2_0.14.0.bb} | 0
 .../{python3-httplib2_0.13.1.bb => python3-httplib2_0.14.0.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httplib2_0.13.1.bb => python-httplib2_0.14.0.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-httplib2_0.13.1.bb => python3-httplib2_0.14.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-httplib2.inc b/meta-openstack/recipes-devtools/python/python-httplib2.inc
index 75473ab..35c8b1c 100644
--- a/meta-openstack/recipes-devtools/python/python-httplib2.inc
+++ b/meta-openstack/recipes-devtools/python/python-httplib2.inc
@@ -2,10 +2,10 @@ DESCRIPTION = "A comprehensive HTTP client library"
 HOMEPAGE = "https://code.google.com/p/httplib2/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e199474a42f8d1baba57f39b790a557e"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2d0e1e5a49b6ead3380e3ac544351eb9"
 
-SRC_URI[md5sum] = "ff90c595c6a58a954a65088b6a470999"
-SRC_URI[sha256sum] = "6901c8c0ffcf721f9ce270ad86da37bc2b4d32b8802d4a9cec38274898a64044"
+SRC_URI[md5sum] = "427cda9f4d55762db325bd2eb46b7fe0"
+SRC_URI[sha256sum] = "34537dcdd5e0f2386d29e0e2c6d4a1703a3b982d34c198a5102e6e5d6194b107"
 
 inherit pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.13.1.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.14.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-httplib2_0.13.1.bb
rename to meta-openstack/recipes-devtools/python/python-httplib2_0.14.0.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.1.bb b/meta-openstack/recipes-devtools/python/python3-httplib2_0.14.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-httplib2_0.13.1.bb
rename to meta-openstack/recipes-devtools/python/python3-httplib2_0.14.0.bb
-- 
2.7.4




