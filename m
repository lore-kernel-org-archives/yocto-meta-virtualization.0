Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FA34E00C97; Wed,  3 Feb 2016 17:43:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27DACE00CA7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:32 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141gV3i019760
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:31 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:29 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:36 -0500
Message-ID: <1454550104-7065-42-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 41/49] cinder: uprev to Liberty
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:12 -0000
Content-Type: text/plain

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-cinder_git.bb   | 50 +++++++++++++++++-----
 .../python/python-cinderclient_git.bb              |  8 ++--
 2 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index ceb17d8..7e689e7 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -4,10 +4,9 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 SRCNAME = "cinder"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
     file://cinder.conf \
     file://cinder.init \
     file://cinder-volume \
@@ -15,14 +14,14 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
     file://glusterfs_setup.sh \
     file://lvm_iscsi_setup.sh \
     file://add-cinder-volume-types.sh \
-    file://cinder-builtin-tests-config-location.patch \
     "
 
 # file://0001-run_tests-respect-tools-dir.patch
 # file://fix_cinder_memory_leak.patch 
+# file://cinder-builtin-tests-config-location.patch
 
-SRCREV = "5987bb2290f629e59b0bcced2f8fe22cdeb9cc6d"
-PV = "2015.1.0+git${SRCPV}"
+SRCREV = "61026d4e4f2a58dd84ffb2e4e40ab99860b9316a"
+PV = "7.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit setuptools update-rc.d identity default_configs hosts openstackchef monitor
@@ -49,9 +48,9 @@ python () {
 }
 SERVICECREATE_PACKAGES[vardeps] += "KEYSTONE_HOST"
 
-do_install_prepend() {
-    sed 's:%PYTHON_SITEPACKAGES_DIR%:${PYTHON_SITEPACKAGES_DIR}:g' -i ${S}/${SRCNAME}/tests/conf_fixture.py
-}
+#do_install_prepend() {
+#    sed 's:%PYTHON_SITEPACKAGES_DIR%:${PYTHON_SITEPACKAGES_DIR}:g' -i ${S}/${SRCNAME}/tests/conf_fixture.py
+#}
 
 CINDER_LVM_VOLUME_BACKING_FILE_SIZE ?= "2G"
 CINDER_NFS_VOLUME_SERVERS_DEFAULT = "controller:/etc/cinder/nfs_volumes"
@@ -162,7 +161,7 @@ pkg_postinst_${SRCNAME}-setup () {
 PACKAGES += "${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-setup ${SRCNAME}-api ${SRCNAME}-volume ${SRCNAME}-scheduler ${SRCNAME}-backup"
 ALLOW_EMPTY_${SRCNAME}-setup = "1"
 
-RDEPENDS_${SRCNAME}-tests += " bash"
+RDEPENDS_${SRCNAME}-tests += " bash python"
 
 FILES_${PN} = "${libdir}/* /etc/tgt"
 
@@ -207,7 +206,7 @@ RDEPENDS_${PN} += "lvm2 \
 	python-paste \
 	python-sqlalchemy-migrate \
 	python-stevedore \
-	python-suds \
+	python-suds-jurko \
 	python-paramiko \
 	python-babel \
 	python-iso8601 \
@@ -218,9 +217,40 @@ RDEPENDS_${PN} += "lvm2 \
 	python-cinderclient \
 	python-oslo.config \
 	python-oslo.rootwrap \
+        python-oslo.concurrency \
+        python-oslo.context \
+        python-oslo.db \
+        python-oslo.log \
+        python-oslo.messaging \
+        python-oslo.middleware \
+        python-oslo.policy \
+        python-oslo.reports \
+        python-oslo.serialization \
+        python-oslo.service \
+        python-oslo.utils \
+        python-oslo.versionedobjects \
 	python-pbr \
 	python-taskflow \
 	python-rtslib-fb \
+        python-keystonemiddleware \
+        python-netaddr \
+        python-osprofiler \
+        python-pycrypto \
+        python-pyparsing \
+        python-barbicanclient \
+        python-glanceclient \
+        python-novaclient \
+        python-swiftclient \
+        python-requests \
+        python-retrying \
+        python-taskflow \
+        python-rtslib-fb \
+        python-six \
+        python-oslo.i18n \
+        python-oslo.vmware \
+        python-os-brick \
+        python-enum34 \
+        python-routes \
 	"
 
 RDEPENDS_${SRCNAME} = "${PN} \
diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
index 7e8e780..e264694 100644
--- a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
@@ -5,7 +5,6 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3572962e13e5e739b30b0864365e0795"
 DEPENDS = "python-setuptools-git"
 
-PR = "r0"
 SRCNAME = "python-cinderclient"
 
 SRC_URI = "\
@@ -14,8 +13,8 @@ SRC_URI = "\
 	file://cinder-api-check.sh \
 	"
 
-PV="1.1.1+git${SRCPV}"
-SRCREV="9e94d814c6ae07c3d5e8242754aebcce150265cc"
+PV="1.4.0+git${SRCPV}"
+SRCREV="c167dda40cc65fe437a12b815ef91bbde4efb6bb"
 S = "${WORKDIR}/git"
 
 inherit setuptools monitor rmargparse
@@ -30,6 +29,9 @@ RDEPENDS_${PN} += "python-prettytable \
                    python-requests \
                    python-setuptools-git \
                    python-pbr \
+                   python-keystoneclient \
+                   python-babel \
+                   python-six \
 	           "
 
 PACKAGECONFIG ?= "bash-completion"
-- 
2.1.4


