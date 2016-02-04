Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42667E00CCA; Wed,  3 Feb 2016 17:43:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E6A4E00CEB
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:40 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gesE000429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:40 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:39 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:43 -0500
Message-ID: <1454550104-7065-49-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 48/49] keystone: uprev to Liberty
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:23 -0000
Content-Type: text/plain

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-keystone_git.bb          | 13 +++++++------
 .../recipes-devtools/python/python-keystoneclient_git.bb    |  6 +++---
 .../python/python-keystonemiddleware_git.bb                 |  5 ++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index 58aa449..a8d1181 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRCNAME = "keystone"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
            file://keystone.conf \
            file://identity.sh \
            file://keystone \
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
 # file://keystone-remove-git-commands-in-tests.patch 
 # file://keystone-explicitly-import-localcontext-from-oslo.me.patch
 
-SRCREV = "5d3b31f9c3d34599ff8a83eeb7530fc6e0b1b67b"
-PV = "2015.1.0+git${SRCPV}"
+SRCREV = "8dcd82fb9c76d43f26338bee293b32f4af473ad9"
+PV = "8.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -144,9 +144,6 @@ do_install_append() {
             -i ${KEYSTONE_PACKAGE_DIR}/tests/test_overrides.conf
     fi
 
-    cp run_tests.sh ${KEYSTONE_CONF_DIR}
-
-
     if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)};
     then
         sed -i -e '/^\[identity\]/a \
@@ -287,6 +284,10 @@ RDEPENDS_${PN} += " \
         python-fixtures \
         python-oslotest \
         python-functools32 \
+        python-six \
+        python-routes \
+        python-pycadf \
+        python-cryptography \
         "
 
 RDEPENDS_${SRCNAME}-tests += " bash"
diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
index f4810e5..495f1e3 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
 
-PR = "r0"
 SRCNAME = "keystoneclient"
 
 SRC_URI = "\
@@ -13,8 +12,8 @@ SRC_URI = "\
 	file://keystone-api-check.sh \
 	"
 
-PV = "1.6.0+git${SRCPV}"
-SRCREV = "f6ab133f25f00e041cd84aa8bbfb422594d1942f"
+PV = "1.7.1+git${SRCPV}"
+SRCREV = "28138b588224c6b0503620ac2e24bd37dad25370"
 S = "${WORKDIR}/git"
 
 inherit setuptools monitor rmargparse
@@ -34,6 +33,7 @@ RDEPENDS_${PN} += " \
 	python-oslo.config \
 	python-oslo.serialization \
 	python-pbr \
+	python-argparse \
 	"
 
 PACKAGECONFIG ?= "bash-completion"
diff --git a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb b/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
index 35c5b49..50d3d95 100644
--- a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
@@ -4,15 +4,14 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a4d0e932ffae1c0131528d30d419c55"
 
-PR = "r0"
 SRCNAME = "keystonemiddleware"
 
 SRC_URI = "\
 	git://git.openstack.org/openstack/keystonemiddleware;branch=master \
 	"
 
-PV = "1.6.1+git${SRCPV}"
-SRCREV = "6ff732b3893a7e71f7b9a7318e8a4daaf906ebbf"
+PV = "2.3.0+git${SRCPV}"
+SRCREV = "62805857ea39710ba14ab9a4e6c606dc336c6b56"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.1.4


