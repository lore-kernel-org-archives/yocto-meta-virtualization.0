Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 865D2E00B33; Mon, 23 Sep 2019 21:00:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B299E0074B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Sep 2019 21:00:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,542,1559491200"; d="scan'208";a="75917022"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Sep 2019 12:00:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6803D4CE14EA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 12:00:31 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 24 Sep 2019 12:00:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 24 Sep 2019 12:00:26 +0800
Message-ID: <20190924040026.6545-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 6803D4CE14EA.A9FBE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-setuptools-git: Add python3 version
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
X-List-Received-Date: Tue, 24 Sep 2019 04:00:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-setuptools-git.inc  | 16 ++++++++++++++++
 .../python/python-setuptools-git_1.2.bb                | 18 ++----------------
 .../python/python3-setuptools-git_1.2.bb               |  2 ++
 3 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-setuptools-git.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git.inc b/meta-openstack/recipes-devtools/python/python-setuptools-git.inc
new file mode 100644
index 0000000..18bc1dc
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-setuptools-git.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Plugin for setuptools that enables git integration"
+HOMEPAGE = "https://github.com/wichert/setuptools-git"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
+
+SRC_URI[md5sum] = "40b2ef7687a384ea144503c2e5bc67e2"
+SRC_URI[sha256sum] = "ff64136da01aabba76ae88b050e7197918d8b2139ccbf6144e14d472b9c40445"
+
+inherit pypi
+
+# conflicting file prevention
+do_install_append() {
+	rm -f ${D}${libdir}/python*/site-packages/site.py*
+}
+BBCLASSEXTEND = "native"
diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
index 2514017..0317002 100644
--- a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.2.bb
@@ -1,16 +1,2 @@
-DESCRIPTION = "Plugin for setuptools that enables git integration"
-HOMEPAGE = "https://github.com/wichert/setuptools-git"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
-
-SRC_URI[md5sum] = "40b2ef7687a384ea144503c2e5bc67e2"
-SRC_URI[sha256sum] = "ff64136da01aabba76ae88b050e7197918d8b2139ccbf6144e14d472b9c40445"
-
-inherit setuptools pypi
-
-# conflicting file prevention
-do_install_append() {
-	rm -f ${D}${libdir}/python*/site-packages/site.py*
-}
-BBCLASSEXTEND = "native"
+inherit setuptools
+require python-setuptools-git.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
new file mode 100644
index 0000000..5dd6804
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-setuptools-git.inc
-- 
2.7.4




