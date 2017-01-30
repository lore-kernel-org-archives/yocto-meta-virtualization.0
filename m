Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5461FE00405; Mon, 30 Jan 2017 13:58:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 204DDE0030B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jan 2017 13:58:12 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0ULw6vV007789
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jan 2017 13:58:10 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 30 Jan 2017 13:58:04 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 30 Jan 2017 16:58:01 -0500
Message-ID: <1485813481-12999-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-xstatic-smart-table: uprev to v1.4.13.2
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
X-List-Received-Date: Mon, 30 Jan 2017 21:58:16 -0000
Content-Type: text/plain

Although version 1.4.5.3 is within the acceptable versions listed by
python-horizon (stable/newton) there are changes related to
smart-table.min.js vs smart-table.js which will cause python-horizon
to error with the following exception:

'horizon/lib/angular_smart_table/smart-table.min.js' could not be
found in the COMPRESS_ROOT '/usr/lib/python2.7/site-packages/static'
or with staticfiles.

(See commit 12c37e3af0a95cb793ad1fb7e055276da049e5ac in horizon)

Upstream should probably remove 1.4.5.3 from the range of acceptable
versions due to this. At any rate uprev'ing the package avoids the
mismatch.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...table_1.4.5.3.bb => python-xstatic-smart-table_1.4.13.2.bb} | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-smart-table_1.4.5.3.bb => python-xstatic-smart-table_1.4.13.2.bb} (51%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.5.3.bb b/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb
similarity index 51%
rename from meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.5.3.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb
index d3e7368..987cb8a 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.5.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-smart-table_1.4.13.2.bb
@@ -2,15 +2,13 @@ DESCRIPTION = "Angular JavaScript library packaged for setuptools"
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-smart-table"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d59aee3c8bb9698b08aaa3d8df31179e"
-
-PR = "r0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e057224b3cd6c78a00683d4f37a924fd"
 
 SRCNAME = "XStatic-smart-table"
-SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "http://pypi.io/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fb32bcbfb7ff05cd17ba65aae10946f9"
-SRC_URI[sha256sum] = "573bdff0b1ec88dd81b7f92c1b46fda4dd1b92cde94817837d61e62c9b20a8b6"
+SRC_URI[md5sum] = "21640f39d064ea292de9e8e7b33f9595"
+SRC_URI[sha256sum] = "f2fa5ed37c2953253de79c61c346fa6c3c4f38731295d2240552c14298db6b0a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


