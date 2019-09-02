Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 38F5EE00D8D; Sun,  1 Sep 2019 20:04:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE71AE008D3
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 20:04:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,457,1559491200"; d="scan'208";a="74680827"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 11:04:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D757F4CDFCE9
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 11:04:20 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 11:04:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 2 Sep 2019 11:03:46 +0800
Message-ID: <20190902030346.30212-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: D757F4CDFCE9.AC3C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-pika-pool: Add python3 version
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
X-List-Received-Date: Mon, 02 Sep 2019 03:04:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-pika-pool.inc        | 15 +++++++++++++++
 .../recipes-devtools/python/python-pika-pool_0.1.3.bb   | 17 ++---------------
 .../recipes-devtools/python/python3-pika-pool_0.1.3.bb  |  2 ++
 3 files changed, 19 insertions(+), 15 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pika-pool.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pika-pool_0.1.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pika-pool.inc b/meta-openstack/recipes-devtools/python/python-pika-pool.inc
new file mode 100644
index 0000000..c87d744
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pika-pool.inc
@@ -0,0 +1,15 @@
+SUMMARY = "pools for your pikas"
+HOMEPAGE = "https://github.com/bninja/pika-pool"
+SECTION = "devel/python"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+SRC_URI[md5sum] = "0a3897e991aa3da948e03660313c1980"
+SRC_URI[sha256sum] = "f3985888cc2788cdbd293a68a8b5702a9c955db6f7b8b551aeac91e7f32da397"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pika \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb b/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
index bfd282b..482e564 100644
--- a/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-pika-pool_0.1.3.bb
@@ -1,15 +1,2 @@
-SUMMARY = "pools for your pikas"
-HOMEPAGE = "https://github.com/bninja/pika-pool"
-SECTION = "devel/python"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
-
-SRC_URI[md5sum] = "0a3897e991aa3da948e03660313c1980"
-SRC_URI[sha256sum] = "f3985888cc2788cdbd293a68a8b5702a9c955db6f7b8b551aeac91e7f32da397"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} += " \
-    python-pika \
-    "
+inherit setuptools 
+require python-pika-pool.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-pika-pool_0.1.3.bb b/meta-openstack/recipes-devtools/python/python3-pika-pool_0.1.3.bb
new file mode 100644
index 0000000..049e521
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pika-pool_0.1.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools3 
+require python-pika-pool.inc
-- 
2.7.4




