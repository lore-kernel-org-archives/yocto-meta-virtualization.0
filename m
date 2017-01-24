Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C828E00BB3; Mon, 23 Jan 2017 19:09:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_SPAM
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [192.103.53.11 listed in dnsbl.sorbs.net]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD2E9E00B99
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 19:09:05 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0O395A9009628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 19:09:05 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 19:09:04 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 22:09:01 -0500
Message-ID: <1485227341-30506-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-osc-lib: initial version
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
X-List-Received-Date: Tue, 24 Jan 2017 03:09:10 -0000
Content-Type: text/plain

This is required for the uprev of python-heatclient to
stable/newton. The version is selected based on all version
requirements.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-osc-lib_1.1.0.bb                 | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-osc-lib_1.1.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-osc-lib_1.1.0.bb
new file mode 100644
index 0000000..70582f7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.1.0.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "OpenStackClient Library"
+HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRCNAME = "osc-lib"
+
+SRC_URI = "https://pypi.io/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "08bf2b46089da52240893d99a3892897"
+SRC_URI[sha256sum] = "e06ca111b2702d442f5cf70c754b6331cc7742231f0fe0b634cbd03c502610ba"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-six \
+        python-babel \
+        python-cliff \
+        python-keystoneauth1 \
+        python-os-client-config \
+        python-oslo.i18n \
+        python-oslo.utils \
+        python-simplejson \
+        python-stevedore \
+        "
+
+CLEANBROKEN = "1"
-- 
2.7.4


