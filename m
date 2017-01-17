Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F0D4E00939; Tue, 17 Jan 2017 10:50:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFBACE008D3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 10:50:01 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0HIo0SZ025979
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 10:50:00 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 Jan 2017 10:50:00 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 17 Jan 2017 13:49:50 -0500
Message-ID: <1484678992-32129-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484678992-32129-1-git-send-email-mark.asselstine@windriver.com>
References: <1484678992-32129-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 2/4] python-stevedore: uprev to 1.19.1
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
X-List-Received-Date: Tue, 17 Jan 2017 18:50:05 -0000
Content-Type: text/plain

Required uprev to support python-oslo.config uprev to stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-stevedore_1.19.1.bb              | 32 ++++++++++++++++++++++
 .../python/python-stevedore_1.9.0.bb               | 31 ---------------------
 2 files changed, 32 insertions(+), 31 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-stevedore_1.19.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.19.1.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.19.1.bb
new file mode 100644
index 0000000..ffd2997
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.19.1.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Manage dynamic plugins for Python applications"
+HOMEPAGE = "https://github.com/dreamhost/stevedore"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+
+SRCNAME = "stevedore"
+SRC_URI = "http://pypi.io/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f02de21fc0efac440db3a6d716068669"
+SRC_URI[sha256sum] = "c963858176fdbac899859a9e215411d024e3a46655034a853e0f3b57947c9856"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools rmargparse
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-argparse \
+        python-six \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
deleted file mode 100644
index 0029c2a..0000000
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Manage dynamic plugins for Python applications"
-HOMEPAGE = "https://github.com/dreamhost/stevedore"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-
-SRCNAME = "stevedore"
-SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "53e2bc3b49dd9c920cfce7f63822b1a5"
-SRC_URI[sha256sum] = "cc19908840498ed5f7cb5cf59bbe47b41aa9d65821548e2b3c8a99a571cbec06"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools rmargparse
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-pbr-native \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        python-argparse \
-        "
-- 
2.7.4


