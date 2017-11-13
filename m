Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08CC6E00DD3; Mon, 13 Nov 2017 11:32:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECC90E00BEA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:46 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vADJWfxm017675
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:46 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:42 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:26 -0500
Message-ID: <1510601551-32245-7-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 06/11] python-osc-lib: uprev to v1.7.0
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:53 -0000
Content-Type: text/plain

This uprev is required for the uprev of python-neutronclient to
stable/pike.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../{python-osc-lib_1.1.0.bb => python-osc-lib_1.7.0.bb}    | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-osc-lib_1.1.0.bb => python-osc-lib_1.7.0.bb} (63%)

diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-osc-lib_1.1.0.bb
rename to meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb
index 70582f7..64e1a17 100644
--- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb
@@ -4,17 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRCNAME = "osc-lib"
+SRC_URI[md5sum] = "8bae654318c8c82d341f7228cfa3ec2d"
+SRC_URI[sha256sum] = "7dee72f13e5478f8d3d836267fa019b99ed4d5e478fc08bbcc9e23029d11ec78"
 
-SRC_URI = "https://pypi.io/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "08bf2b46089da52240893d99a3892897"
-SRC_URI[sha256sum] = "e06ca111b2702d442f5cf70c754b6331cc7742231f0fe0b634cbd03c502610ba"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 RDEPENDS_${PN} += " \
         python-pbr \
-- 
2.7.4


