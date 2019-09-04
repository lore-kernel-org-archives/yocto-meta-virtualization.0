Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D4F4E00DD3; Tue,  3 Sep 2019 20:05:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A724EE00D59
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 20:05:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,465,1559491200"; d="scan'208";a="74795683"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Sep 2019 11:05:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5DC394CDE64D
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 11:05:16 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 4 Sep 2019 11:05:19 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Sep 2019 11:04:44 +0800
Message-ID: <20190904030444.3848-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 5DC394CDE64D.AB403
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-warlock: Add python3 version
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
X-List-Received-Date: Wed, 04 Sep 2019 03:05:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-warlock.inc          | 17 +++++++++++++++++
 .../recipes-devtools/python/python-warlock_1.3.3.bb     | 16 ++--------------
 .../recipes-devtools/python/python3-warlock_1.3.3.bb    |  3 +++
 3 files changed, 22 insertions(+), 14 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-warlock.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-warlock.inc b/meta-openstack/recipes-devtools/python/python-warlock.inc
new file mode 100644
index 0000000..d8a16b1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-warlock.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "Build self-validating python objects using JSON schemas"
+HOMEPAGE = "http://github.com/bcwaldon/warlock"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS += "python-jsonschema python-jsonpatch"
+
+SRC_URI[md5sum] = "746aba989d97762948e5fca6601f283f"
+SRC_URI[sha256sum] = "a093c4d04b42b7907f69086e476a766b7639dca50d95edc83aef6aeab9db2090"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-jsonschema \
+                   ${PYTHON_PN}-jsonpatch  \
+                  "
+
diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
index c2c694b..3358cec 100644
--- a/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
@@ -1,15 +1,3 @@
-DESCRIPTION = "Build self-validating python objects using JSON schemas"
-HOMEPAGE = "http://github.com/bcwaldon/warlock"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-DEPENDS += "python-jsonschema python-jsonpatch"
-
-SRC_URI[md5sum] = "746aba989d97762948e5fca6601f283f"
-SRC_URI[sha256sum] = "a093c4d04b42b7907f69086e476a766b7639dca50d95edc83aef6aeab9db2090"
-
-inherit setuptools pypi
-
-RDEPENDS_${PN} += " python-jsonschema python-jsonpatch"
+inherit setuptools
+require python-warlock.inc
 
diff --git a/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb b/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb
new file mode 100644
index 0000000..7f4d350
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-warlock_1.3.3.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-warlock.inc
+
-- 
2.7.4




