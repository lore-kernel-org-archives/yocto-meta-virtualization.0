Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1060E00D9D; Wed, 12 Jun 2019 23:04:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4DDEE00D00
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Jun 2019 23:04:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.63,367,1557158400"; d="scan'208";a="67194025"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jun 2019 14:04:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 550B74CDDAE3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Jun 2019 14:04:11 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 13 Jun 2019 14:04:10 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 13 Jun 2019 14:05:24 +0800
Message-ID: <20190613060524.13621-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 550B74CDDAE3.A8895
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH v2] python-httplib2: upgrade 0.12.3 -> 0.13.0
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
X-List-Received-Date: Thu, 13 Jun 2019 06:04:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-httplib2_0.12.3.bb to python-httplib2_0.13.0.bb.

-Add recipe python3-httplib2_0.13.0.bb.

-License-Update: Update the information of package.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-httplib2_0.12.3.bb => python-httplib2.inc}    | 8 ++++----
 .../recipes-devtools/python/python-httplib2_0.13.0.bb     | 2 ++
 .../recipes-devtools/python/python3-httplib2_0.13.0.bb    | 2 ++
 3 files changed, 8 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httplib2_0.12.3.bb => python-httplib2.inc} (55%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb b/meta-openstack/recipes-devtools/python/python-httplib2.inc
similarity index 55%
rename from meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
rename to meta-openstack/recipes-devtools/python/python-httplib2.inc
index a1a518f..95890cc 100644
--- a/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-httplib2.inc
@@ -2,12 +2,12 @@ DESCRIPTION = "A comprehensive HTTP client library"
 HOMEPAGE = "https://code.google.com/p/httplib2/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ad87b270277b5f40e2a281d9f7dde584"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=341f12f35eee133c8ce15c04a042fb72"
 
-SRC_URI[md5sum] = "f78ce222216865271f2672e6941174d5"
-SRC_URI[sha256sum] = "a18121c7c72a56689efbf1aef990139ad940fee1e64c6f2458831736cd593600"
+SRC_URI[md5sum] = "c0c3b1c1a1c51fa40f46271d95f74fdc"
+SRC_URI[sha256sum] = "d1146939d270f1f1eb8cbf8f5aa72ff37d897faccca448582bb1e180aeb4c6b2"
 
-inherit setuptools pypi
+inherit pypi
 
 do_install_append() {
 	perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
new file mode 100644
index 0000000..8f98163
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-httplib2.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb b/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
new file mode 100644
index 0000000..03be0bd
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-httplib2.inc
-- 
2.20.1




