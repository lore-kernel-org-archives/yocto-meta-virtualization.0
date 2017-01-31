Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4066CE0082A; Mon, 30 Jan 2017 19:16:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4CCDE00961
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jan 2017 19:16:34 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0V3GX6E015664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jan 2017 19:16:33 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 30 Jan 2017 19:16:32 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 30 Jan 2017 22:16:28 -0500
Message-ID: <1485832588-30515-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-kombu: add version 3.0.37
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
X-List-Received-Date: Tue, 31 Jan 2017 03:16:36 -0000
Content-Type: text/plain

The 4.x.x series requires the amqp>=2 which is outside of the range of
amqp versions supported versions required for python-oslo.messaging
therefore we need to continue support for the 3.0.x series and force
its use via the layer.conf and PREFERRED_VERSION.

This is an updated version of the python-kombu recipe for the 3.0.x
series with updated license checksup (the license type remains the
same) and updated runtime dependencies based on the packages
requirements/default.txt.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                     |  1 +
 .../recipes-devtools/python/python-kombu_3.0.37.bb | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-kombu_3.0.37.bb

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index e940478..98282e2 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -20,5 +20,6 @@ PREFERRED_VERSION_python-netaddr = "0.7.19"
 PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
 PREFERRED_VERSION_python-requests = "2.12.0"
 PREFERRED_VERSION_python-amqp = "1.4.9"
+PREFERRED_VERSION_python-kombu = "3.0.%"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-kombu_3.0.37.bb b/meta-openstack/recipes-devtools/python/python-kombu_3.0.37.bb
new file mode 100644
index 0000000..16e3f0a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-kombu_3.0.37.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "A messaging framework for Python"
+HOMEPAGE = "http://kombu.readthedocs.org"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ee3b641e9940ba25a4dd66b3942866cf"
+
+SRCNAME = "kombu"
+
+SRC_URI = "https://pypi.io/packages/source/k/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "a1901036ba5e70e6b1733f7c2d5ee313"
+SRC_URI[sha256sum] = "e064a00c66b4d1058cd2b0523fb8d98c82c18450244177b6c0f7913016642650"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+FILES_${PN}-doc += "${datadir}/${SRCNAME}"
+
+RDEPENDS_${PN} = " \
+    python-anyjson \
+    python-amqp \
+    "
-- 
2.7.4


