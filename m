Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98BFEE00AB3; Wed,  5 Aug 2015 13:30:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA3A9E00B1B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:30:11 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KUBeL001902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:30:11 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:30:10 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:51 -0400
Message-ID: <1438806592-32745-11-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 10/11] python-mox3: uprev to version 0.9.0
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
X-List-Received-Date: Wed, 05 Aug 2015 20:30:15 -0000
Content-Type: text/plain

Because we updated the version of python-pbr we need to uprev
python-mox3 as the version that was present only works with python-pbr
versions <1.0.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-mox3_0.7.0.bb   | 22 ----------------------
 .../recipes-devtools/python/python-mox3_0.9.0.bb   | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb
deleted file mode 100644
index 9e40686..0000000
--- a/meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "mox3: mock object framework for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/mox3/0.7.0"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-PR = "r0"
-
-SRCNAME = "mox3"
-SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "3235d9fc504aee015576ca784c16f3ff"
-SRC_URI[sha256sum] = "7cc2ffac72d55816bbf670b03cf636b4abdc089c3d8b31a6760b22fc1eeedde2"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} += " \
-    python-pbr \
-    python-fixtures \
-"
diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
new file mode 100644
index 0000000..7ef5276
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "mox3: mock object framework for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/mox3/0.9.0"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+PR = "r0"
+
+SRCNAME = "mox3"
+SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7574eabaa0f1d8f83289f33aaf2c4884"
+SRC_URI[sha256sum] = "8469f35690077f888fbb49a7e31251de9f78bd319ebd4e1af0bbb1349c1ad1be"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+    python-pbr \
+    python-fixtures \
+"
-- 
2.1.4


