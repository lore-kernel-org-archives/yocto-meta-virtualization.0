Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A098CE00D20; Mon,  6 Nov 2017 12:18:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 061DAE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 12:18:26 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA6KIP80001340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 6 Nov 2017 12:18:26 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 6 Nov 2017 12:18:25 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 6 Nov 2017 15:18:23 -0500
Message-ID: <1509999503-7154-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [v2 PATCH] python-webob: uprev to v1.7.3
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
X-List-Received-Date: Mon, 06 Nov 2017 20:18:27 -0000
Content-Type: text/plain

The only user in meta-virtualization is python-bugsnag and there is no
version dependency. This new version is however required by the latest
openstack. Switched to using the "common" pypi.bbclass while we are at
it.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-devtools/python/python-webob_1.6.0.bb | 23 -----------------------
 recipes-devtools/python/python-webob_1.7.3.bb | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 23 deletions(-)
 delete mode 100644 recipes-devtools/python/python-webob_1.6.0.bb
 create mode 100644 recipes-devtools/python/python-webob_1.7.3.bb

diff --git a/recipes-devtools/python/python-webob_1.6.0.bb b/recipes-devtools/python/python-webob_1.6.0.bb
deleted file mode 100644
index 71c74ff..0000000
--- a/recipes-devtools/python/python-webob_1.6.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "WSGI request and response object"
-HOMEPAGE = "http://webob.org/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5"
-
-PR = "r0"
-SRCNAME = "WebOb"
-
-SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
-SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277fa2209f7f57eb47b537eeecfea383d55b7"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} += " \
-	python-sphinx \
-	python-nose \
-	"
-
diff --git a/recipes-devtools/python/python-webob_1.7.3.bb b/recipes-devtools/python/python-webob_1.7.3.bb
new file mode 100644
index 0000000..a2448be
--- /dev/null
+++ b/recipes-devtools/python/python-webob_1.7.3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "WSGI request and response object"
+HOMEPAGE = "http://webob.org/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5"
+
+PYPI_PACKAGE = "WebOb"
+
+SRC_URI[md5sum] = "350028baffc508e3d23c078118e35316"
+SRC_URI[sha256sum] = "e65ca14b9f5ae5b031988ffc93f8b7f305ddfcf17a4c774ae0db47bcb3b87283"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+	python-sphinx \
+	python-nose \
+	"
+
-- 
2.7.4


