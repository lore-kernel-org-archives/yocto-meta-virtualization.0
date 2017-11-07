Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62047E00D73; Tue,  7 Nov 2017 12:40:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FB1DE00D4C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:38:56 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA7KcuQe017316
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:38:56 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:38:55 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 7 Nov 2017 15:38:36 -0500
Message-ID: <1510087118-28132-9-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
References: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 08/10] python-kombu: uprev to v4.1.0
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
X-List-Received-Date: Tue, 07 Nov 2017 20:40:29 -0000
Content-Type: text/plain

This version is required for python-oslo.messaging when moved to
stable/pike. We can drop the v3.0.37 version as it is no longer
required allowing us to only have one recipe.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                     |  1 -
 .../recipes-devtools/python/python-kombu_3.0.37.bb | 23 ----------------------
 ...python-kombu_4.0.2.bb => python-kombu_4.1.0.bb} | 16 ++++++---------
 3 files changed, 6 insertions(+), 34 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-kombu_3.0.37.bb
 rename meta-openstack/recipes-devtools/python/{python-kombu_4.0.2.bb => python-kombu_4.1.0.bb} (38%)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index ceb489b..302b657 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -19,6 +19,5 @@ PREFERRED_VERSION_python-django = "1.8.6"
 PREFERRED_VERSION_python-netaddr = "0.7.19"
 PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
 PREFERRED_VERSION_python-requests = "2.13.0"
-PREFERRED_VERSION_python-kombu = "3.0.%"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-kombu_3.0.37.bb b/meta-openstack/recipes-devtools/python/python-kombu_3.0.37.bb
deleted file mode 100644
index 16e3f0a..0000000
--- a/meta-openstack/recipes-devtools/python/python-kombu_3.0.37.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "A messaging framework for Python"
-HOMEPAGE = "http://kombu.readthedocs.org"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ee3b641e9940ba25a4dd66b3942866cf"
-
-SRCNAME = "kombu"
-
-SRC_URI = "https://pypi.io/packages/source/k/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "a1901036ba5e70e6b1733f7c2d5ee313"
-SRC_URI[sha256sum] = "e064a00c66b4d1058cd2b0523fb8d98c82c18450244177b6c0f7913016642650"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-FILES_${PN}-doc += "${datadir}/${SRCNAME}"
-
-RDEPENDS_${PN} = " \
-    python-anyjson \
-    python-amqp \
-    "
diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.0.2.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb
similarity index 38%
rename from meta-openstack/recipes-devtools/python/python-kombu_4.0.2.bb
rename to meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb
index 66fe763..8d44426 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu_4.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-kombu_4.1.0.bb
@@ -4,17 +4,13 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 
-SRCNAME = "kombu"
+SRC_URI[md5sum] = "2fb2be9fec0e6514231bba23a3779439"
+SRC_URI[sha256sum] = "4249d9dd9dbf1fcec471d1c2def20653c9310dd1a217272d77e4844f9d5273cb"
 
-SRC_URI = "https://pypi.python.org/packages/c7/76/58c655a80bf08b703478ce673ed4e3029297105951863b73030d45b06b42/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "1f24f3a8addf8f3eb0f463aad970f0fb"
-SRC_URI[sha256sum] = "d0fc6f2a36610a308f838db4b832dad79a681b516ac1d1a1f9d42edb58cc11a2"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 FILES_${PN}-doc += "${datadir}/${SRCNAME}"
 
-RDEPENDS_${PN} = "python-anyjson python-amqplib"
+RDEPENDS_${PN} = " \
+        python-amqp \
+        "
-- 
2.7.4


