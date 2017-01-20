Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F907E004D2; Fri, 20 Jan 2017 13:59:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5017AE0033D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:59:41 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0KLxfnZ004642
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:59:41 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 Jan 2017 13:59:40 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 Jan 2017 16:59:30 -0500
Message-ID: <1484949575-2411-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 1/6] python-fixtures: uprev to version 3.0.0
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
X-List-Received-Date: Fri, 20 Jan 2017 21:59:44 -0000
Content-Type: text/plain

This version is required by the python-oslotest uprev to the latest
stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/{python-fixtures_1.3.1.bb => python-fixtures_3.0.0.bb}  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-fixtures_1.3.1.bb => python-fixtures_3.0.0.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb b/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
rename to meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
index ac40e9d..25647ec 100644
--- a/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-fixtures_3.0.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=239e2f4698b85aad5ed39bae5d2ef226"
 
-PR = "r0"
 SRCNAME = "fixtures"
 
-SRC_URI = "https://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.io/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "72959be66e26b09641a1e3902f631e62"
-SRC_URI[sha256sum] = "b63cf3bb37f83ff815456e2d0e118535ae9a4bf43e76d9a1cf3286041bf717ce"
+SRC_URI[md5sum] = "cd6345b497a62fad739efee66346c2e0"
+SRC_URI[sha256sum] = "fcf0d60234f1544da717a9738325812de1f42c2fa085e2d9252d8fff5712b2ef"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


