Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2F86E00546; Tue, 17 Jan 2017 07:56:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2BF0E004A0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 07:56:25 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0HFuOll015007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 07:56:24 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 Jan 2017 07:56:24 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 17 Jan 2017 10:56:01 -0500
Message-ID: <1484668561-28271-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-pbr: drop recipe
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
X-List-Received-Date: Tue, 17 Jan 2017 15:56:27 -0000
Content-Type: text/plain

We often include our own versions of recipes in meta-virtualization
and meta-cloud-services in order to satisfy specific version
dependencies, ie. grouping recipes by usecase. Historically python-pbr
versions have been extremely flexible (most recipes only specify the
very old 1.6 as a minimum version) and python-pbr can arguably be seen
as a core python package, so remove our version of the recipe in favor
of the one in meta-python.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-pbr_1.8.1.bb    | 30 ----------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb b/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
deleted file mode 100644
index 2018a1b..0000000
--- a/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
-HOMEPAGE = "https://pypi.python.org/pypi/pbr"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
-
-SRCNAME = "pbr"
-
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "c8f9285e1a4ca6f9654c529b158baa3a"
-SRC_URI[sha256sum] = "e2127626a91e6c885db89668976db31020f0af2da728924b56480fc7ccf09649"
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
-DEPENDS_class-native += ""
-
-# RDEPENDS_default:
-RDEPENDS_${PN} += " \
-        "
-
-BBCLASSEXTEND = "native"
-- 
2.7.4


