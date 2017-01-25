Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85326E00BBA; Tue, 24 Jan 2017 17:49:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10913E0053F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jan 2017 17:48:56 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="15074443"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jan 2017 09:48:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 039E6477AE6D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Jan 2017 09:48:48 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 25 Jan 2017 09:48:47 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 25 Jan 2017 09:48:28 +0800
Message-ID: <1485308908-2189-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 039E6477AE6D.A6DBF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-warlock: 1.1.0 -> 1.3.0
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
X-List-Received-Date: Wed, 25 Jan 2017 01:49:00 -0000
Content-Type: text/plain

1) Upgrade python-warlock from 1.1.0 to 1.3.0.
2) Change the license file to LICENSE.txt.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-warlock_1.1.0.bb | 21 ---------------------
 .../recipes-devtools/python/python-warlock_1.3.0.bb | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
deleted file mode 100644
index 49f1390..0000000
--- a/meta-openstack/recipes-devtools/python/python-warlock_1.1.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Build self-validating python objects using JSON schemas"
-HOMEPAGE = "http://github.com/bcwaldon/warlock"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://README.md;md5=97b002bcda83d22e7d3fd1427688a6a6"
-
-DEPENDS += "python-jsonschema python-jsonpatch"
-
-SRCNAME = "warlock"
-
-SRC_URI = "http://pypi.python.org/packages/source/w/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "79649fd8096eeb0c175a193f06237676"
-SRC_URI[sha256sum] = "bbfb4279034ccc402723e38d2a2e67cd619988bf4802fda7ba3e8fab15762651"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} += " python-jsonschema python-jsonpatch"
-
diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
new file mode 100644
index 0000000..6a884df
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Build self-validating python objects using JSON schemas"
+HOMEPAGE = "http://github.com/bcwaldon/warlock"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS += "python-jsonschema python-jsonpatch"
+
+SRCNAME = "warlock"
+
+SRC_URI = "https://pypi.python.org/packages/2d/40/9f01a5e1574dab946598793351d59c86f58209d182d229aaa545abb98894/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "61cc809a3af2c76288f4dd26a003932d"
+SRC_URI[sha256sum] = "d7403f728fce67ee2f22f3d7fa09c9de0bc95c3e7bcf6005b9c1962b77976a06"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += " python-jsonschema python-jsonpatch"
+
-- 
2.7.4




