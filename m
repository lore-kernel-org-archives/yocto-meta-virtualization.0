Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FBDEE00D59; Sun, 25 Aug 2019 22:51:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67184E0097C
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 22:51:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="74278319"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2019 13:51:12 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 24A124CE045A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Aug 2019 13:51:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 13:51:16 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 26 Aug 2019 13:51:04 +0800
Message-ID: <1566798664-114964-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 24A124CE045A.A8444
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-requestsexceptions: Add python3 version
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
X-List-Received-Date: Mon, 26 Aug 2019 05:51:14 -0000
Content-Type: text/plain

Providing a python3 version of python-requestsexceptions.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/python-requestsexceptions.inc      | 23 +++++++++++++++++
 .../python/python-requestsexceptions_1.4.0.bb | 25 ++-----------------
 .../python3-requestsexceptions_1.4.0.bb       |  2 ++
 3 files changed, 27 insertions(+), 23 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-requestsexceptions.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-requestsexceptions.inc b/meta-openstack/recipes-devtools/python/python-requestsexceptions.inc
new file mode 100644
index 0000000..bac99a3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-requestsexceptions.inc
@@ -0,0 +1,23 @@
+DESCRIPTION = "Import exceptions from potentially bundled packages in requests."
+HOMEPAGE = "https://www.openstack.org/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
+
+SRC_URI[md5sum] = "f43b246ccd7d5b618e6f0dc946a6c3f3"
+SRC_URI[sha256sum] = "b095cbc77618f066d459a02b137b020c37da9f46d9b057704019c9f77dba3065"
+
+inherit pypi
+
+# conflicting file prevention
+do_install_append() {
+	rm -f ${D}${libdir}/python*/site-packages/tests/*
+}
+
+DEPENDS += " \
+        ${PYTHON_PN}-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-pbr \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb
index 729e3d7..87b6ca9 100644
--- a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb
@@ -1,23 +1,2 @@
-DESCRIPTION = "Import exceptions from potentially bundled packages in requests."
-HOMEPAGE = "https://www.openstack.org/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
-
-SRC_URI[md5sum] = "f43b246ccd7d5b618e6f0dc946a6c3f3"
-SRC_URI[sha256sum] = "b095cbc77618f066d459a02b137b020c37da9f46d9b057704019c9f77dba3065"
-
-inherit setuptools pypi
-
-# conflicting file prevention
-do_install_append() {
-	rm -f ${D}${libdir}/python*/site-packages/tests/*
-}
-
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        "
+inherit setuptools
+require python-requestsexceptions.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb b/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
new file mode 100644
index 0000000..1c049f3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-requestsexceptions.inc
-- 
2.17.1




