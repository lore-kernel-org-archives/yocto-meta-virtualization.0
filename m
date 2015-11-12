Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C42ACE00A9B; Wed, 11 Nov 2015 18:50:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEA84E007AE
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:36 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAC2oZbK013140
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:35 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 Nov 2015 18:50:35 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 11 Nov 2015 21:50:28 -0500
Message-ID: <1447296631-16483-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
References: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 3/6] openstackclient: add missing python modules
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
X-List-Received-Date: Thu, 12 Nov 2015 02:50:40 -0000
Content-Type: text/plain

Attempting to run 'openstack' commands (such as 'openstack user list')
will fail with errors regarding missing python modules.

Add the missing module recipes and add the dependencies to
openstackclient.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-appdirs_git.bb  | 34 ++++++++++++++++++++++
 .../python/python-keystoneauth1_1.2.0.bb           | 23 +++++++++++++++
 .../python/python-openstackclient_1.1.0.bb         |  3 ++
 .../python/python-os-client-config_git.bb          | 23 +++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-appdirs_git.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-keystoneauth1_1.2.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-os-client-config_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb b/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
new file mode 100644
index 0000000..8e40f26
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "A small Python module for determining appropriate platform-specific dirs, e.g. a user data dir."
+HOMEPAGE = "http://github.com/ActiveState/appdirs"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
+
+PV = "1.4.0"
+SRCREV = "57f2bc44a8bca99bac6c57496c8b3fdea26f94d5"
+
+SRCNAME = "appdirs"
+SRC_URI = "git://github.com/ActiveState/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit distutils
+
+DEPENDS += " \
+        python-pip \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pip \
+        "
+
+do_install_append() {
+    # Using these "longest" paths will ensure needed shorter paths will be created
+    install -d ${D}/${libdir}/python2.7/site-packages/${SRCNAME}/test
+    install -d ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-info
+    
+    install -m 644 ${S}/${SRCNAME}.py ${D}/${libdir}/python2.7/site-packages/${SRCNAME}/__init__.py
+    install -m 644 ${S}/${SRCNAME}.pyc ${D}/${libdir}/python2.7/site-packages/${SRCNAME}/__init__.pyc
+    install -m 644 ${S}/test/* ${D}/${libdir}/python2.7/site-packages/${SRCNAME}/test/
+    install -m 644 ${S}/${SRCNAME}.egg-info/* ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-info/
+}
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_1.2.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_1.2.0.bb
new file mode 100644
index 0000000..a88f8a3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_1.2.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Authentication Library for OpenStack Identity"
+HOMEPAGE = "https://pypi.python.org/pypi/keystoneauth1"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
+
+SRCNAME = "keystoneauth1"
+SRC_URI = "http://pypi.python.org/packages/source/k/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "db4c75346480300fe9015945f73ab33a"
+SRC_URI[sha256sum] = "e8386dc8b0f17d439e1f2f4e6a8ef64fe0f2b81938b2f0b13f80042bb98e2b85"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+DEPENDS += " \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
index 3aa733e..37703cc 100644
--- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.1.0.bb
@@ -21,4 +21,7 @@ DEPENDS += "\
 
 RDEPENDS_${PN} += "\
     python-pbr \
+    python-os-client-config \
+    python-appdirs \
+    python-keystoneauth1 \
     "
diff --git a/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
new file mode 100644
index 0000000..de8c2c2
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "OpenStack Client Configuation Library"
+HOMEPAGE = "https://pypi.python.org/pypi/os-client-config"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "1.9.0"
+SRCREV = "790fac98542ba303274180831cbd9a03604a84e8"
+
+SRCNAME = "os-client-config"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit distutils
+
+DEPENDS += " \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        "
-- 
2.1.4


