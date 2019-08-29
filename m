Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A347E00D38; Wed, 28 Aug 2019 22:44:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47D9BE00C78
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Aug 2019 22:43:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,442,1559491200"; d="scan'208";a="74507563"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Aug 2019 13:43:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E1D454CE0887
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 13:43:57 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 29 Aug 2019 13:44:00 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Aug 2019 13:43:24 +0800
Message-ID: <20190829054324.3530-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: E1D454CE0887.A9699
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-enum-compat: Add python3 version
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
X-List-Received-Date: Thu, 29 Aug 2019 05:44:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-enum-compat.inc           | 10 ++++++++++
 .../recipes-devtools/python/python-enum-compat_0.0.2.bb      | 12 ++----------
 .../recipes-devtools/python/python3-enum-compat_0.0.2.bb     |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-enum-compat.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat.inc b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
new file mode 100644
index 0000000..d1f7648
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-enum-compat.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Python enum/enum34 compatibility package"
+HOMEPAGE = "https://github.com/jstasiak/enum-compat"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] = "3002940b6620837d0fbc86ec72509be3"
+SRC_URI[sha256sum] = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"
+
+inherit pypi
diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
index 3ae7bb4..36ab5af 100644
--- a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
@@ -1,10 +1,2 @@
-DESCRIPTION = "Python enum/enum34 compatibility package"
-HOMEPAGE = "https://github.com/jstasiak/enum-compat"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-SRC_URI[md5sum] = "3002940b6620837d0fbc86ec72509be3"
-SRC_URI[sha256sum] = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"
-
-inherit setuptools pypi
+inherit setuptools
+require python-enum-compat.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb
new file mode 100644
index 0000000..a9bff30
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-enum-compat_0.0.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-enum-compat.inc
-- 
2.7.4




