Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1A4CE00C9B; Wed,  3 Feb 2016 17:42:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 865CBE00C6D
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:41:54 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141fs6Q019716
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:41:54 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:41:53 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:03 -0500
Message-ID: <1454550104-7065-9-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 08/49] python-oslo.reports: initial version
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:01 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This package is required by nova, heat, cinder and others.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python/python-oslo.reports_git.bb              | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
new file mode 100644
index 0000000..89a83b8
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "oslo.reports library"
+HOMEPAGE = "https://wiki.openstack.org/wiki/Oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+PV = "0.6.0+git${SRCPV}"
+SRCREV = "31d4a2d9881316f1d2d911a677c0b7556e5040b6"
+
+SRCNAME = "oslo.reports"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-six \
+        python-jinja2 \
+        python-babel \
+        python-psutil \
+        python-oslo.i18n \
+        python-oslo.utils \
+        python-oslo.serialization \
+        "
-- 
2.1.4


