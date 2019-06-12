Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 132DAE00DE4; Tue, 11 Jun 2019 18:38:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4C68E00DDC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Jun 2019 18:38:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67003697"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 09:38:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 19E974CDD458
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Jun 2019 09:38:26 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 09:38:27 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 12 Jun 2019 09:39:39 +0800
Message-ID: <20190612013939.29655-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 19E974CDD458.A725E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-httplib2: upgrade 0.12.3 -> 0.13.0
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
X-List-Received-Date: Wed, 12 Jun 2019 01:38:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-httplib2_0.12.3.bb to python-httplib2_0.13.0.bb.

-Add recipe python3-httplib2_0.13.0.bb.

-License-Update: Update the information of package.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...lib2_0.12.3.bb => python-httplib2_0.13.0.bb} |  6 +++---
 .../python/python3-httplib2_0.13.0.bb           | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httplib2_0.12.3.bb => python-httplib2_0.13.0.bb} (59%)
 create mode 100644 meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
rename to meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
index a1a518f..1e73ca9 100644
--- a/meta-openstack/recipes-devtools/python/python-httplib2_0.12.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.13.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A comprehensive HTTP client library"
 HOMEPAGE = "https://code.google.com/p/httplib2/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ad87b270277b5f40e2a281d9f7dde584"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=341f12f35eee133c8ce15c04a042fb72"
 
-SRC_URI[md5sum] = "f78ce222216865271f2672e6941174d5"
-SRC_URI[sha256sum] = "a18121c7c72a56689efbf1aef990139ad940fee1e64c6f2458831736cd593600"
+SRC_URI[md5sum] = "c0c3b1c1a1c51fa40f46271d95f74fdc"
+SRC_URI[sha256sum] = "d1146939d270f1f1eb8cbf8f5aa72ff37d897faccca448582bb1e180aeb4c6b2"
 
 inherit setuptools pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb b/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
new file mode 100644
index 0000000..1a5ac79
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A comprehensive HTTP client library"
+HOMEPAGE = "https://code.google.com/p/httplib2/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=341f12f35eee133c8ce15c04a042fb72"
+
+SRC_URI[md5sum] = "c0c3b1c1a1c51fa40f46271d95f74fdc"
+SRC_URI[sha256sum] = "d1146939d270f1f1eb8cbf8f5aa72ff37d897faccca448582bb1e180aeb4c6b2"
+
+inherit setuptools3 pypi
+
+do_install_append() {
+	perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
+	for f in $perm_files; do
+		chmod 644 "${f}"
+	done
+}
-- 
2.20.1




