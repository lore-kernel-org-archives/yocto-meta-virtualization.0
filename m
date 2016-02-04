Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E928FE00CE0; Wed,  3 Feb 2016 17:42:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16544E00C9A
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:18 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gHGB000341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:17 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:17 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:25 -0500
Message-ID: <1454550104-7065-31-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 30/49] python-magnumclient: initial version
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

This package provides a Python client for containers service.

This package is required by heat.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python/python-magnumclient_git.bb              | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-magnumclient_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-magnumclient_git.bb b/meta-openstack/recipes-devtools/python/python-magnumclient_git.bb
new file mode 100644
index 0000000..fd12589
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-magnumclient_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Python client for containers service"
+HOMEPAGE = "https://github.com/openstack/python-magnumclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} +=" \
+        python-pbr \
+        python-babel \
+        python-oslo.config \
+        python-oslo.i18n \
+        python-oslo.serialization \
+        python-oslo.utils \
+        python-iso8601 \
+        python-requests \
+        python-keystoneclient \
+        python-pyyaml \
+        python-stevedore \
+        python-six \
+	"
+
+SRCNAME = "magnumclient"
+SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
+
+PV = "1.0.0.0b1+git${SRCPV}"
+SRCREV = "fb1ff6777eb96a5b7ba38156bf8354cda9b88ad4"
+S = "${WORKDIR}/git"
+
+inherit setuptools rmargparse
-- 
2.1.4


