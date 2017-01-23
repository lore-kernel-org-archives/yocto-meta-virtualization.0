Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76D5FE00655; Mon, 23 Jan 2017 13:40:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_SPAM
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [192.103.53.11 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 465A8E004D2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:40:09 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0NLe8qI002233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:40:09 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 13:40:08 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 16:40:03 -0500
Message-ID: <1485207603-7946-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-rjsmin: initial version
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
X-List-Received-Date: Mon, 23 Jan 2017 21:40:10 -0000
Content-Type: text/plain

This package is required to support the uprev of
python-django-compressor to v2.1.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-rjsmin_1.0.12.bb                 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb b/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
new file mode 100644
index 0000000..145eea0
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "rJSmin is a javascript minifier written in python."
+HOMEPAGE = "http://opensource.perlig.de/rjsmin/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRCNAME = "rjsmin"
+
+SRC_URI = "https://pypi.io/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "9f67e133c88df5497d3da847603da9bf"
+SRC_URI[sha256sum] = "dd9591aa73500b08b7db24367f8d32c6470021f39d5ab4e50c7c02e4401386f1"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools 
+
+RDEPENDS_${PN} += " \
+        "
+
+CLEANBROKEN = "1"
-- 
2.7.4


