Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC18CE00D20; Wed, 22 Nov 2017 10:28:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76684E00D2A
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 10:28:25 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAMISPfU023051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 10:28:25 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 10:28:23 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 13:28:11 -0500
Message-ID: <1511375292-27471-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511375292-27471-1-git-send-email-mark.asselstine@windriver.com>
References: <1511375292-27471-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 5/6] python-openstackclient: uprev to latest stable/pike
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
X-List-Received-Date: Wed, 22 Nov 2017 18:28:29 -0000
Content-Type: text/plain

Align with other packages found in the openstack project umbrella by
switching to use git. Beyond this it is a straightforward uprev.

Requires updates to python-zaqarclient along with the introduction of
the python-openstacksdk package.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-openstackclient_1.1.0.bb         | 23 --------------
 .../python/python-openstackclient_git.bb           | 35 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-openstackclient_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
deleted file mode 100644
index b4beaad..0000000
--- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "OpenStack Command-line Client"
-HOMEPAGE = "https://github.com/openstack/python-openstackclient"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-PYPI_PACKAGE = "python-openstackclient"
-
-SRC_URI[md5sum] = "c965b343b0fdf97d01e28d5460c7c175"
-SRC_URI[sha256sum] = "875b54ac95e29cc83ae76513b48306c8493c12d5ba7d23aea3432216f2fa91ba"
-
-inherit setuptools pypi
-
-DEPENDS += "\
-    python-pbr \
-    "
-
-RDEPENDS_${PN} += "\
-    python-pbr \
-    python-os-client-config \
-    python-appdirs \
-    python-keystoneauth1 \
-    "
diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_git.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_git.bb
new file mode 100644
index 0000000..ce33f0c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-openstackclient_git.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "OpenStack Command-line Client"
+HOMEPAGE = "https://github.com/openstack/python-openstackclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI = " \
+        git://github.com/openstack/python-openstackclient.git;branch=stable/pike \
+        "
+
+PV = "3.12.0+git${SRCPV}"
+SRCREV = "ff4abb7d19829efa0209cb67faf01011d9c841c5"
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += "\
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-six \
+        python-babel \
+        python-cliff \
+        python-keystoneauth1 \
+        python-openstacksdk \
+        python-osc-lib \
+        python-oslo.i18n \
+        python-oslo.utils \
+        python-glanceclient \
+        python-keystoneclient \
+        python-novaclient \
+        python-cinderclient \
+        "
-- 
2.7.4


