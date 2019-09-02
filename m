Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BCA2E00D60; Sun,  1 Sep 2019 20:57:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52ED3E00890
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 20:57:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,457,1559491200"; d="scan'208";a="74682808"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 11:57:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7E1CB4CE14E3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 11:57:25 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 11:57:28 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 2 Sep 2019 11:56:51 +0800
Message-ID: <20190902035651.31054-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 7E1CB4CE14E3.AAE4B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-repoze.lru: Add python3 version
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
X-List-Received-Date: Mon, 02 Sep 2019 03:57:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-repoze.lru.inc        | 14 ++++++++++++++
 .../recipes-devtools/python/python-repoze.lru_0.7.bb     | 16 ++--------------
 .../recipes-devtools/python/python3-repoze.lru_0.7.bb    |  2 ++
 3 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-repoze.lru.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb

diff --git a/meta-openstack/recipes-devtools/python/python-repoze.lru.inc b/meta-openstack/recipes-devtools/python/python-repoze.lru.inc
new file mode 100644
index 0000000..d79e864
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-repoze.lru.inc
@@ -0,0 +1,14 @@
+SUMMARY = "A tiny LRU cache implementation and decorator"
+DESCRIPTION = "repoze.lru is a LRU (least recently used) cache implementation. \
+Keys and values that are not used frequently will be evicted from the cache faster \
+than keys and values that are used frequently. \
+"
+HOMEPAGE = "https://pypi.python.org/pypi/repoze.lru"
+SECTION = "devel/python"
+LICENSE = "BSD-Modification-copyright"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
+
+SRC_URI[md5sum] = "c08cc030387e0b1fc53c5c7d964b35e2"
+SRC_URI[sha256sum] = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb
index 264a1cb..2343a4c 100644
--- a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb
+++ b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb
@@ -1,14 +1,2 @@
-SUMMARY = "A tiny LRU cache implementation and decorator"
-DESCRIPTION = "repoze.lru is a LRU (least recently used) cache implementation. \
-Keys and values that are not used frequently will be evicted from the cache faster \
-than keys and values that are used frequently. \
-"
-HOMEPAGE = "https://pypi.python.org/pypi/repoze.lru"
-SECTION = "devel/python"
-LICENSE = "BSD-Modification-copyright"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
-
-SRC_URI[md5sum] = "c08cc030387e0b1fc53c5c7d964b35e2"
-SRC_URI[sha256sum] = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"
-
-inherit setuptools pypi
+inherit setuptools
+require python-repoze.lru.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
new file mode 100644
index 0000000..88e358d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-repoze.lru.inc
-- 
2.7.4




