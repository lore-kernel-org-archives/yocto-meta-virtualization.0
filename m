Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66120E00D5C; Mon,  5 Aug 2019 19:35:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B683AE00D47
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 19:35:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,352,1559491200"; d="scan'208";a="73033672"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2019 10:35:37 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 873564CDFACD
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 10:35:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019 10:35:42 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 6 Aug 2019 19:35:21 +0800
Message-ID: <1565091321-15298-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 873564CDFACD.A9A6E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [PATCH] python-kombu: Add python3 version
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
X-List-Received-Date: Tue, 06 Aug 2019 02:35:41 -0000
Content-Type: text/plain

Providing a python3 version of python-kombu.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-kombu.inc      | 14 ++++++++++++++
 .../recipes-devtools/python/python-kombu_4.6.0.bb | 15 +--------------
 .../python/python3-kombu_4.6.0.bb                 |  2 ++
 3 files changed, 17 insertions(+), 14 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-kombu.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta-openstack/recipes-devtools/python/python-kombu.inc
new file mode 100644
index 0000000..7f66a4b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "A messaging framework for Python"
+HOMEPAGE = "http://kombu.readthedocs.org"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
+
+SRC_URI[md5sum] = "3543525c1bfaa74260cbf9a6e47dad2f"
+SRC_URI[sha256sum] = "27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e203cecaa0aeca84360be"
+
+FILES_${PN}-doc += "${datadir}/${SRCNAME}"
+
+RDEPENDS_${PN} = " \
+        python-amqp \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
index 8cd6825..28b6258 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
@@ -1,16 +1,3 @@
-DESCRIPTION = "A messaging framework for Python"
-HOMEPAGE = "http://kombu.readthedocs.org"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
-
-SRC_URI[md5sum] = "3543525c1bfaa74260cbf9a6e47dad2f"
-SRC_URI[sha256sum] = "27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e203cecaa0aeca84360be"
-
 inherit setuptools pypi
+require python-kombu.inc
 
-FILES_${PN}-doc += "${datadir}/${SRCNAME}"
-
-RDEPENDS_${PN} = " \
-        python-amqp \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb
new file mode 100644
index 0000000..fc752d9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3 pypi
+require python-kombu.inc
-- 
2.17.1




