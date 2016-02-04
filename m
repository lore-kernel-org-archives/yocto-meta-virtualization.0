Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AE73E00CD0; Wed,  3 Feb 2016 17:42:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8207EE00C92
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:22 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gMTb011624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:22 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:21 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:29 -0500
Message-ID: <1454550104-7065-35-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 34/49] python-xstatic-bootstrap-datepicker: recipe fixup
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:49 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

Correct the license and SRC_URI along with other trivial changes.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb      | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb
index bc53519..ce2268c 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker_1.3.1.0.bb
@@ -1,27 +1,23 @@
 DESCRIPTION = "Bootstrap-Datepicker JavaScript library packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Bootstrap-Datepicker"
 SECTION = "devel/python"
-LICENSE = "MIT"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=97d9c60d3a8c5fccccb317f944688479"
 
-PR = "r0"
-
 SRCNAME = "XStatic-Bootstrap-Datepicker"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "c2f5c58a7b41162923eca5a36b29b8b2"
 SRC_URI[sha256sum] = "9edc9b77501001fcee9fbf4bf0a722c263efd928ef928b40081a8269fdd9a944"
 
+
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-# DEPENDS_default: python-pip
-
 DEPENDS += " \
         python-pip \
         "
 
-# RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         "
-- 
2.1.4


