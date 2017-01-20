Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0505CE004D2; Thu, 19 Jan 2017 19:34:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3859DE00480
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 19:34:44 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14937970"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2017 11:34:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7688747B0CB7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 11:34:36 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 20 Jan 2017 11:34:37 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 20 Jan 2017 11:34:36 +0800
Message-ID: <1484883276-854-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 7688747B0CB7.A7722
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-kombu: 3.0.26 -> 4.0.2
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
X-List-Received-Date: Fri, 20 Jan 2017 03:34:47 -0000
Content-Type: text/plain

1) Upgrade python-kombu from 3.0.26 to 4.0.2.
2) License checksum changed,since the copyright years were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-kombu_3.0.26.bb   | 20 --------------------
 .../recipes-devtools/python/python-kombu_4.0.2.bb    | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-kombu_3.0.26.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-kombu_4.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-kombu_3.0.26.bb b/meta-openstack/recipes-devtools/python/python-kombu_3.0.26.bb
deleted file mode 100644
index d3cc17d..0000000
--- a/meta-openstack/recipes-devtools/python/python-kombu_3.0.26.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "A messaging framework for Python"
-HOMEPAGE = "http://kombu.readthedocs.org"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a25a2e176842f3a9934f9d7ee8e0edae"
-
-SRCNAME = "kombu"
-
-SRC_URI = "https://pypi.python.org/packages/source/k/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "dda05763cd4b72a131fe1ef9ba93d542"
-SRC_URI[sha256sum] = "1f565abd44c4b7dfaa4dd543d52f982d2f006aba0a2b3830542b4d25a801fe09"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-FILES_${PN}-doc += "${datadir}/${SRCNAME}"
-
-RDEPENDS_${PN} = "python-anyjson python-amqplib"
diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.0.2.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.0.2.bb
new file mode 100644
index 0000000..66fe763
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-kombu_4.0.2.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A messaging framework for Python"
+HOMEPAGE = "http://kombu.readthedocs.org"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
+
+SRCNAME = "kombu"
+
+SRC_URI = "https://pypi.python.org/packages/c7/76/58c655a80bf08b703478ce673ed4e3029297105951863b73030d45b06b42/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1f24f3a8addf8f3eb0f463aad970f0fb"
+SRC_URI[sha256sum] = "d0fc6f2a36610a308f838db4b832dad79a681b516ac1d1a1f9d42edb58cc11a2"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+FILES_${PN}-doc += "${datadir}/${SRCNAME}"
+
+RDEPENDS_${PN} = "python-anyjson python-amqplib"
-- 
2.7.4




