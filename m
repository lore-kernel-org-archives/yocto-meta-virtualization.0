Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC2F4E00C45; Wed, 15 Nov 2017 11:22:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4ADE3E009B4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 11:22:37 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAFJMZ8E015087
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Nov 2017 11:22:35 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 15 Nov 2017 11:22:34 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 15 Nov 2017 14:22:26 -0500
Message-ID: <1510773746-5134-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] python-jsonschema: drop our recipe in favor of the one in meta-python
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
X-List-Received-Date: Wed, 15 Nov 2017 19:22:38 -0000
Content-Type: text/plain

The current v2.5.1 recipe is slightly broken (needs PYPI_PACKAGE_EXT =
"zip" added). But regardless the current v2.5.1 recipe is unused since
we are picking up the v2.6.0 in meta-python. Drop the unused/broken
v2.5.1 recipe to clean things up. As with all our python recipes we
will need to keep an eye on the version to ensure the are compatible,
so add a PREF version to help track any skew that might develop.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                          |  1 +
 .../recipes-devtools/python/python-jsonschema_2.5.1.bb  | 17 -----------------
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index f2aa64e..838e7b0 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -21,4 +21,5 @@ PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
 PREFERRED_VERSION_python-requests = "2.13.0"
 PREFERRED_VERSION_python-eventlet = "0.20.0"
 PREFERRED_VERSION_python-warlock = "1.2.0"
+PREFERRED_VERSION_python-jsonschema = "2.6.0"
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
deleted file mode 100644
index 1174795..0000000
--- a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "An implementation of JSON-Schema validation for Python"
-HOMEPAGE = "http://pypi.python.org/pypi/jsonschema"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
-
-SRC_URI[md5sum] = "e491298485bdefeecb0f1ca3d65e5292"
-SRC_URI[sha256sum] = "9088494da4c74497a7a27842ae4ca9c3355b5f7754121edc440463eaf020f079"
-
-inherit setuptools pypi
-
-DEPENDS += "python-vcversioner"
-
-# Satisfy setup.py 'setup_requires'
-DEPENDS += " \
-        python-vcversioner-native \
-        "
-- 
2.7.4


