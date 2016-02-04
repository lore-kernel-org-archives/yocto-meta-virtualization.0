Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDB68E00CDC; Wed,  3 Feb 2016 17:42:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 424F3E00CAF
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:08 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141g7v2019735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:08 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:07 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:15 -0500
Message-ID: <1454550104-7065-21-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 20/49] python-aioeventlet: initial version
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:28 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This package provides asyncio event loop scheduling callbacks in
eventlet.

This package is required by oslo.messaging.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../Makefile-skip-building-docs.patch              | 33 ++++++++++++++++++++++
 .../python/python-aioeventlet_0.4.bb               | 27 ++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-aioeventlet/Makefile-skip-building-docs.patch
 create mode 100644 meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-aioeventlet/Makefile-skip-building-docs.patch b/meta-openstack/recipes-devtools/python/python-aioeventlet/Makefile-skip-building-docs.patch
new file mode 100644
index 0000000..a1c85a3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-aioeventlet/Makefile-skip-building-docs.patch
@@ -0,0 +1,33 @@
+From e53f9da41a45f24329e42cef4796b68c70bfefcb Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Fri, 13 Nov 2015 10:48:59 -0500
+Subject: [PATCH] Makefile: skip building docs
+
+We don't have cross build sphinx-build support in Poky so skip
+building the docs. The user can build the docs on the target, where we
+do have sphinx-build support available.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ Makefile | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 40bccab..d93943f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,11 +1,6 @@
+-.PHONY: doc
+-
+ test:
+ 	tox
+-doc:
+-	make -C doc html
+ clean:
+ 	rm -rf build dist aioeventlet.egg-info .tox
+ 	find -name "*.pyc" -delete
+ 	find -name "__pycache__" -exec rm -rf {} \;
+-	make -C doc clean
+-- 
+2.1.4
+
diff --git a/meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb b/meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb
new file mode 100644
index 0000000..0841b9b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Asyncio event loop scheduling callbacks in eventlet"
+HOMEPAGE = "http://aioeventlet.readthedocs.org/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f7bb094c7232b058c7e9f2e431f389c"
+
+SRCNAME = "aioeventlet"
+
+SRC_URI = "https://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+    file://Makefile-skip-building-docs.patch \
+    "
+
+SRC_URI[md5sum] = "678ea30265ae0326bddc767f80efd144"
+SRC_URI[sha256sum] = "fe78c2b227ce077b1581e2ae2c071f351111d0878ec1b0216435f6a898df79a6"
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
+        python-sphinx \
+        "
+
-- 
2.1.4


