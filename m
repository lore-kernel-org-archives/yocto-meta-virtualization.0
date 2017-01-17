Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20C9BE00947; Tue, 17 Jan 2017 10:50:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4E32E008D3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 10:50:05 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0HIo4bi002851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 10:50:04 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 Jan 2017 10:50:04 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 17 Jan 2017 13:49:51 -0500
Message-ID: <1484678992-32129-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484678992-32129-1-git-send-email-mark.asselstine@windriver.com>
References: <1484678992-32129-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 3/4] python-rfc3986: uprev to 0.4.1
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
X-List-Received-Date: Tue, 17 Jan 2017 18:50:09 -0000
Content-Type: text/plain

Required uprev to support python-oslo.config uprev to stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-rfc3986_0.2.1.bb                 | 26 ----------------------
 .../python/python-rfc3986_0.4.1.bb                 | 26 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-rfc3986_0.2.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rfc3986_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-rfc3986_0.2.1.bb
deleted file mode 100644
index 66952d8..0000000
--- a/meta-openstack/recipes-devtools/python/python-rfc3986_0.2.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Validating URI References per RFC 3986"
-HOMEPAGE = "https://rfc3986.rtfd.org"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=03731a0e7dbcb30cecdcec77cc93ec29"
-
-
-SRCNAME = "rfc3986"
-SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "84151eec209c99e71edc760745510da4"
-SRC_URI[sha256sum] = "85aec4beb1edc4fa7cb7466cca1410237cb3e344968d07126e428bc62adb8f3c"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb b/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb
new file mode 100644
index 0000000..99da266
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Validating URI References per RFC 3986"
+HOMEPAGE = "https://rfc3986.rtfd.org"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=03731a0e7dbcb30cecdcec77cc93ec29"
+
+
+SRCNAME = "rfc3986"
+SRC_URI = "http://pypi.io/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b2b48cd36dabb82d5eaa54bbfb20d382"
+SRC_URI[sha256sum] = "5ac85eb132fae7bbd811fa48d11984ae3104be30d44d397a351d004c633a68d2"
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


