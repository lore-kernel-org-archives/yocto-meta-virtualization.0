Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FF10E00C86; Wed,  3 Feb 2016 17:42:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26125E00C73
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:17 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141gGD3019748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:16 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:16 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:24 -0500
Message-ID: <1454550104-7065-30-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 29/49] python-manilaclient: initial version
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:41 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This package provides Python bindings to the OpenStack Manila API.

This package is required by heat.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python/python-manilaclient_git.bb              | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-manilaclient_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
new file mode 100644
index 0000000..5cabf2e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Python bindings to the OpenStack Manila API"
+HOMEPAGE = "https://github.com/openstack/python-manilaclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9edbbf5857ab51214ef0e8b79069bb07"
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} +=" \
+        python-pbr \
+        python-iso8601 \
+        python-oslo.config \
+        python-oslo.log \
+        python-oslo.serialization \
+        python-oslo.utils \
+        python-prettytable \
+        python-pycrypto \
+        python-requests \
+        python-simplejson \
+        python-babel \
+        python-six \
+        python-keystoneclient \
+	"
+
+SRCNAME = "manilaclient"
+SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
+
+PV = "1.4.0+git${SRCPV}"
+SRCREV = "0bbd2144f701df3408b1435b16611c2ba3c22221"
+S = "${WORKDIR}/git"
+
+inherit setuptools rmargparse
-- 
2.1.4


