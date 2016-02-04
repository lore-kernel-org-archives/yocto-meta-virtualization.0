Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF72AE00C98; Wed,  3 Feb 2016 17:43:10 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A2D4E00C98
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:29 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gT5Q011630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:29 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:28 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:35 -0500
Message-ID: <1454550104-7065-41-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 40/49] ceilometer: uprev to Liberty
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:10 -0000
Content-Type: text/plain

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-ceilometer_git.bb                | 30 ++++++++++++++++++----
 .../python/python-ceilometerclient_git.bb          | 18 ++++++++-----
 2 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
index 3860ca5..2825e60 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
@@ -4,10 +4,9 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 SRCNAME = "ceilometer"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
            file://ceilometer.conf \
            file://ceilometer.init \
            file://fix_ceilometer_memory_leak.patch \
@@ -16,8 +15,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
 #   file://ceilometer-builtin-tests-config-location.patch
 
 
-SRCREV = "b0447ed8e7bee371bf7095c86e47d717abe89edc"
-PV = "2015.1.0+git${SRCPV}"
+SRCREV = "026a5d475e1958bf761e41c2bb426b09e0f3d270"
+PV = "5.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 CEILOMETER_SECRET ?= "12121212"
@@ -202,7 +201,7 @@ RDEPENDS_${PN} += " \
 	python-paste \
 	python-sqlalchemy-migrate \
 	python-stevedore \
-	python-suds \
+	python-suds-jurko \
 	python-paramiko \
 	python-babel \
 	python-iso8601 \
@@ -237,6 +236,27 @@ RDEPENDS_${PN} += " \
 	python-croniter \
 	python-ipaddr \
 	python-pysnmp \
+        python-retrying \
+        python-jsonpath-rw-ext \
+        python-jsonschema \
+        python-kafka \
+        python-keystonemiddleware \
+        python-oslo.context \
+        python-oslo.db \
+        python-oslo.concurrency \
+        python-oslo.i18n \
+        python-oslo.log \
+        python-oslo.policy \
+        python-oslo.reports \
+        python-oslo.service \
+        python-oslo.messaging \
+        python-oslo.middleware \
+        python-oslo.utils \
+        python-neutronclient \
+        python-novaclient \
+        python-requests \
+        python-six \
+        python-tooz \
 	"
 
 RDEPENDS_${SRCNAME}-controller = "${PN} ${SRCNAME}-common ${SRCNAME}-alarm-notifier ${SRCNAME}-alarm-evaluator ${SRCNAME}-agent-notification ${SRCNAME}-reseller \
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
index 35760a9..a830e51 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb
@@ -9,27 +9,33 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} +="python-cliff \
+RDEPENDS_${PN} +=" \
+        python-cliff \
 	python-httplib2 \
 	python-iso8601 \
 	python-prettytable \
 	python-pyparsing \
 	python-simplejson \
 	python-pbr \
+        python-oslo.i18n \
+        python-oslo.serialization \
+        python-oslo.utils \
+        python-keystoneclient \
+        python-requests \
+        python-six \
+        python-stevedore \
 	"
 
-PR = "r0"
-
 SRC_URI = "\
 	git://github.com/openstack/python-ceilometerclient.git;branch=master \
 	file://fix_ceilometerclient_memory_leak.patch \
 	"
 
-PV = "1.0.13+git${SRCPV}"
-SRCREV = "f8765ce532a45391c5366be8fa0f583f96a30d22"
+PV = "1.5.0+git${SRCPV}"
+SRCREV = "daed7e59c383f1ca74d75160cbc99fbd89675648"
 S = "${WORKDIR}/git"
 
-inherit setuptools
+inherit setuptools rmargparse
 
 
 PACKAGECONFIG ?= "bash-completion"
-- 
2.1.4


