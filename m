Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6F5BE00CB0; Wed,  3 Feb 2016 17:43:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 838FBE00CA9
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:28 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gSoY000380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:28 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:27 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:34 -0500
Message-ID: <1454550104-7065-40-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 39/49] glance: uprev to Liberty
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:04 -0000
Content-Type: text/plain

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-glance_git.bb   | 31 ++++++++++++++++++----
 .../python/python-glanceclient_git.bb              |  5 ++--
 .../python/python-glancestore_git.bb               |  4 +--
 3 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index 79235af..e6f5f5f 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -4,18 +4,17 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 SRCNAME = "glance"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
            file://glance.init \
            "
 
 # removed. juno uses store library: file://0001-glance-store-only-load-known-stores-not-all-stores.patch
 #                                   file://glance-change-builtin-tests-config-location.patch
 
-SRCREV = "93b0d5fce3a41e4a3a549f98f78b6681cbc3ea95"
-PV = "2015.1.0+git${SRCPV}"
+SRCREV = "69516fad5f651a085a047a337a05c58b39023c1b"
+PV = "11.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -150,7 +149,10 @@ pkg_postinst_${SRCNAME}-setup () {
 PACKAGES += " ${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-setup ${SRCNAME}-api ${SRCNAME}-registry"
 ALLOW_EMPTY_${SRCNAME}-setup = "1"
 
-FILES_${PN} = "${libdir}/*"
+FILES_${PN} = " \
+    ${libdir}/* \
+    ${datadir}/etc/${SRCNAME}* \
+    "
 
 FILES_${SRCNAME}-tests = "${sysconfdir}/${SRCNAME}/run_tests.sh"
 
@@ -201,6 +203,25 @@ RDEPENDS_${PN} += "python-greenlet \
 	python-enum34 \
 	python-semantic-version \
 	python-oslo.vmware \
+        python-oslo.concurrency \
+        python-oslo.context \
+        python-oslo.service \
+        python-oslo.utils \
+        python-stevedore \
+        python-futurist \
+        python-taskflow \
+        python-keystonemiddleware \
+        python-wsme \
+        python-pyopenssl \
+        python-six \
+        python-oslo.db \
+        python-oslo.log \
+        python-oslo.messaging  \
+        python-oslo.middleware \
+        python-oslo.policy \
+        python-oslo.serialization \
+        python-castellan \
+        python-cryptography \
 	"
 
 RDEPENDS_${SRCNAME} = "${PN} \
diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
index ab32be8..f9edf6d 100644
--- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
@@ -9,9 +9,8 @@ DEPENDS += " \
         python-pbr \
         "
 
-SRCREV = "db6420b44779411d6d1f238f6b887f83f1988986"
-PV = "0.19.0+git${SRCPV}"
-PR = "r0"
+SRCREV = "86635868c1eb3aec0c065c12cb9928c613940f36"
+PV = "1.1.0+git${SRCPV}"
 
 SRC_URI = "\
 	git://github.com/openstack/${BPN}.git;protocol=https \
diff --git a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
index 932c5d9..0abf521 100644
--- a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRCREV = "ea88e503b617a7ac9a0ae7e537d6517e9992a104"
-PV = "0.4.0+git${SRCPV}"
+SRCREV = "c816b38d9f12be75d989409cbab6dfefa8f49dc3"
+PV = "0.9.1+git${SRCPV}"
 
 SRC_URI = "\
 	git://github.com/openstack/glance_store.git \
-- 
2.1.4


