Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE05CE00405; Mon, 23 Jan 2017 13:39:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_SPAM
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [192.103.53.11 listed in dnsbl.sorbs.net]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 856DAE003C1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:39:17 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0NLdHIa002201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:39:17 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 13:39:16 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 16:39:12 -0500
Message-ID: <1485207552-6624-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-xstatic-tv4: initial version
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
X-List-Received-Date: Mon, 23 Jan 2017 21:39:19 -0000
Content-Type: text/plain

This package is required to support the stable/newton version of
python-horizon.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-xstatic-tv4_1.2.7.0.bb           | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb
new file mode 100644
index 0000000..1301ed9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-tv4_1.2.7.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Tiny Validator packaged for setuptools (easy_install) / pip."
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-tv4"
+SECTION = "devel/python"
+LICENSE = "PD & MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=68f6d0037519374aba3cc3d13bb66260"
+
+SRCNAME = "XStatic-tv4"
+SRC_URI = "http://pypi.io/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "921148dff35fb41431d5f122da570248"
+SRC_URI[sha256sum] = "9b4c57244e914126cdda5d8bc24698189d73800203c85b1fc945a08e25c7c713"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        python-pip \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
-- 
2.7.4


