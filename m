Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 282BAE00C44; Tue,  7 Nov 2017 12:38:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A900BE00C44
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:38:48 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA7KcltW017308
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:38:48 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:38:46 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 7 Nov 2017 15:38:30 -0500
Message-ID: <1510087118-28132-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
References: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 02/10] python-stevedore: uprev to v1.27.1
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
X-List-Received-Date: Tue, 07 Nov 2017 20:38:49 -0000
Content-Type: text/plain

This newer version is required by the latest keystone and others.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...-stevedore_1.19.1.bb => python-stevedore_1.27.1.bb} | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-stevedore_1.19.1.bb => python-stevedore_1.27.1.bb} (49%)

diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.19.1.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb
similarity index 49%
rename from meta-openstack/recipes-devtools/python/python-stevedore_1.19.1.bb
rename to meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb
index ffd2997..e1c0167 100644
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.19.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb
@@ -4,21 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
+SRC_URI[md5sum] = "80113d0f3b0f4d64107546dde410003a"
+SRC_URI[sha256sum] = "236468dae36707069e8b3bdb455e9f1be090b1e6b937f4ac0c56a538d6f50be0"
 
-SRCNAME = "stevedore"
-SRC_URI = "http://pypi.io/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "f02de21fc0efac440db3a6d716068669"
-SRC_URI[sha256sum] = "c963858176fdbac899859a9e215411d024e3a46655034a853e0f3b57947c9856"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools rmargparse
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
+inherit setuptools rmargparse pypi
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
@@ -27,6 +16,5 @@ DEPENDS += " \
 
 RDEPENDS_${PN} += " \
         python-pbr \
-        python-argparse \
         python-six \
         "
-- 
2.7.4


