Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5361CE00A96; Wed,  5 Aug 2015 13:30:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D7ABE009B3
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:30:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KU8tC001899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:30:09 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:30:08 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:49 -0400
Message-ID: <1438806592-32745-9-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 08/11] python-pbr: uprev to 1.4.0
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

The uprev to to python-testtools references VersionInfo
semantic_version which wasn't introduced until pbr version 1.3.0. So
we are uprev'ing pbr to a more suitable and recent version.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-pbr_0.10.8.bb   | 27 ----------------------
 .../recipes-devtools/python/python-pbr_1.4.0.bb    | 27 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pbr_0.10.8.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pbr_0.10.8.bb b/meta-openstack/recipes-devtools/python/python-pbr_0.10.8.bb
deleted file mode 100644
index ec5c589..0000000
--- a/meta-openstack/recipes-devtools/python/python-pbr_0.10.8.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
-HOMEPAGE = "https://pypi.python.org/pypi/pbr"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-PR = "r0"
-SRCNAME = "pbr"
-
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "ccef0c0fa2ad7ee2c9997322a83d7e45"
-SRC_URI[sha256sum] = "a741650c697abe9dd3da00039a57a45a15a6eed017a16f6b7e4c0161fae2b4b2"
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
diff --git a/meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb
new file mode 100644
index 0000000..273fdd4
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
+HOMEPAGE = "https://pypi.python.org/pypi/pbr"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+PR = "r0"
+SRCNAME = "pbr"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "21f847dd9d3f9bd37db402067024be98"
+SRC_URI[sha256sum] = "f080232fb6b208615b4c1854bf4277bb097d19c9ef89f94f203c1436fe600e92"
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
2.1.4


