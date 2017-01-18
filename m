Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9F07E00992; Tue, 17 Jan 2017 22:42:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 284FDE0098A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 22:42:45 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14868317"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2017 14:42:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1FA4247B1500
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jan 2017 14:42:38 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 18 Jan 2017 14:42:38 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 18 Jan 2017 14:42:29 +0800
Message-ID: <1484721749-28629-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 1FA4247B1500.A5F7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-amqp: 1.4.6 -> 2.1.4
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
X-List-Received-Date: Wed, 18 Jan 2017 06:42:47 -0000
Content-Type: text/plain

1) Upgrade python-amqp from 1.4.6 to 2.1.4.
2) Change the LICENSE to BSD-3-Clause.
3) Change the  License checksum,since the license is changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-amqp_1.4.6.bb         | 16 ----------------
 .../recipes-devtools/python/python-amqp_2.1.4.bb         | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-amqp_2.1.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb b/meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb
deleted file mode 100644
index 273018c..0000000
--- a/meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Low-level AMQP client for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
-
-SRCNAME = "amqp"
-
-SRC_URI = "https://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "a061581b6864f838bffd62b6a3d0fb9f"
-SRC_URI[sha256sum] = "ebcfc867de5a68f9f5ba14d11dbad88e6aff8435a8d39339d5ceb0e5b06de640"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python-amqp_2.1.4.bb b/meta-openstack/recipes-devtools/python/python-amqp_2.1.4.bb
new file mode 100644
index 0000000..bda166f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-amqp_2.1.4.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Low-level AMQP client for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
+
+SRCNAME = "amqp"
+
+SRC_URI = "https://pypi.python.org/packages/23/39/06bb8bd31e78962675f696498f7821f5dbd11aa0919c5a811d83a0e02609/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "035a475e42ef4f431b4e0dca113434bd"
+SRC_URI[sha256sum] = "1378cc14afeb6c2850404f322d03dec0082d11d04bdcb0360e1b10d4e6e77ef9"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.7.4




