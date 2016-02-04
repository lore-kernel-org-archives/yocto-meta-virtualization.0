Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AF02E00C8F; Wed,  3 Feb 2016 17:42:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F516E00C65
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:01 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141g0xU019726
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:00 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:00 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:09 -0500
Message-ID: <1454550104-7065-15-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 14/49] python-suds-jurko: initial version
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:16 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This package provides a lightweight SOAP client (Jurko's fork).

This package is required by heat, nova and others.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python/python-suds-jurko_0.6.bb                | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb b/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
new file mode 100644
index 0000000..eeab977
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-suds-jurko_0.6.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Lightweight SOAP client (Jurko's fork)"
+HOMEPAGE = "https://bitbucket.org/jurko/suds"
+SECTION = "devel/python"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=847e96bce86d8774f491a92924343a29"
+
+SRCNAME = "suds-jurko"
+
+SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "1309e9bc2454aa3434041f0a24ae4e11"
+SRC_URI[sha256sum] = "29edb72fd21e3044093d86f33c66cf847c5aaab26d64cb90e69e528ef014e57f"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools 
+
+DEPENDS += " \
+        python-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        "
+
-- 
2.1.4


