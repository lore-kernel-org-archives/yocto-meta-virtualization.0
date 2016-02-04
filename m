Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C6C4E00CA0; Wed,  3 Feb 2016 17:43:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96835E00C79
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:27 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141gRGS019757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:27 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:26 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:33 -0500
Message-ID: <1454550104-7065-39-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 38/49] python-xstatic-roboto-fontface: initial version
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:03 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

A simple package providing the Roboto fontface.

This package is required by horizon.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python-xstatic-roboto-fontface_0.4.3.2.bb      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.4.3.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.4.3.2.bb b/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.4.3.2.bb
new file mode 100644
index 0000000..cba2389
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-roboto-fontface_0.4.3.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A simple package providing the Roboto fontface."
+HOMEPAGE = "https://github.com/choffmeister/roboto-fontface-bower"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=7eeeb6915ae97fbbac6282f36b6fcaaa"
+
+SRCNAME = "XStatic-roboto-fontface"
+SRC_URI = "https://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "2a19734d8e08bbe1413f37e703e288f8"
+SRC_URI[sha256sum] = "e539aa991300d8ee09ee557d3cab1066237806e365ceaf868084777379e307a5"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
-- 
2.1.4


