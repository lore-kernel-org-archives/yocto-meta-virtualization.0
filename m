Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE5D5E00CE0; Wed,  3 Feb 2016 17:42:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 216A7E00C74
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:09 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u141g8dC000321
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:08 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:08 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:16 -0500
Message-ID: <1454550104-7065-22-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 21/49] python-castellan: initial version
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:28 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This package provides a generic key manager interface for OpenStack.

This package is required by glance.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python/python-castellan_git.bb                 | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-castellan_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-castellan_git.bb b/meta-openstack/recipes-devtools/python/python-castellan_git.bb
new file mode 100644
index 0000000..40a085d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-castellan_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Generic Key Manager interface for OpenStack"
+HOMEPAGE = "https://github.com/openstack/castellan"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRCNAME = "castellan"
+
+SRC_URI = "\
+	git://git.openstack.org/openstack/${SRCNAME}.git;branch=master \
+	"
+
+PV="0.2.1+git${SRCPV}"
+SRCREV="4fda4a749f3f908d58817c326676073aa6fcf62a"
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-babel \
+        python-cryptography \
+        python-oslo.config \
+        python-oslo.context \
+        python-oslo.log \
+        python-oslo.policy \
+        python-oslo.serialization \
+        python-oslo.utils \
+	"
-- 
2.1.4


