Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6005E00C9E; Wed,  3 Feb 2016 17:42:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BBD7E00C65
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:41:53 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u141frdr011597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:41:53 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:41:52 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:02 -0500
Message-ID: <1454550104-7065-8-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 07/49] python-os-brick: initial version
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:00 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This package provides an OpenStack Cinder brick library for managing
local volume attaches.

This package is required by nova and cinder.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../recipes-devtools/python/python-os-brick_git.bb | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-os-brick_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-os-brick_git.bb b/meta-openstack/recipes-devtools/python/python-os-brick_git.bb
new file mode 100644
index 0000000..cbfc8ab
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-os-brick_git.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "OpenStack Cinder brick library for managing local volume attaches"
+HOMEPAGE = "https://github.com/openstack/os-brick"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI = "\
+	git://github.com/openstack/os-brick.git;branch=master \
+	"
+
+PV = "0.5.0+git${SRCPV}"
+SRCREV = "5ac54d4e0c89daba1be80702ee4060a538c08754"
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+FILES_${PN} += "${datadir}/etc/*"
+
+DEPENDS += " \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+	"
-- 
2.1.4


