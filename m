Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33301E00CA7; Wed,  3 Feb 2016 17:43:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8FABE00CA2
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:33 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gX3L000416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:33 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:33 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:37 -0500
Message-ID: <1454550104-7065-43-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 42/49] heat: uprev to Liberty
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:13 -0000
Content-Type: text/plain

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-heat_git.bb     | 42 +++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
index 7abb4d0..c2b2da7 100644
--- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
@@ -4,10 +4,9 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 SRCNAME = "heat"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
            file://heat.conf \
            file://heat.init \
            file://autoscaling_example.template \
@@ -16,8 +15,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
            file://heat-tests-change-project_dir-path.patch \
 "
 
-SRCREV = "6db88597dba0b79b2501f43b704c93b2728a5ec6"
-PV = "2015.1.0+git${SRCPV}"
+SRCREV = "4348b7ababd1048e17ec354ca38c903c908cd74e"
+PV = "5.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup ${SRCNAME}-templates ${SRCNAME}-cfn"
@@ -184,7 +183,7 @@ RDEPENDS_${PN} += " \
 	python-paste \
 	python-sqlalchemy-migrate \
 	python-stevedore \
-	python-suds \
+	python-suds-jurko \
 	python-paramiko \
 	python-babel \
 	python-iso8601 \
@@ -213,6 +212,39 @@ RDEPENDS_${PN} += " \
         python-pytz \
         python-pbr \
         python-oslo.log \
+        python-croniter \
+        python-cryptography \
+        python-keystonemiddleware \
+        python-netaddr \
+        python-oslo.cache \
+        python-oslo.concurrency \
+        python-oslo.context \
+        python-oslo.db \
+        python-oslo.i18n \
+        python-oslo.messaging \
+        python-oslo.middleware \
+        python-oslo.policy \
+        python-oslo.reports \
+        python-oslo.serialization \
+        python-oslo.service \
+        python-oslo.utils \
+        python-osprofiler \
+        python-oslo.versionedobjects \
+        python-pycrypto \
+        python-barbicanclient \
+        python-ceilometerclient \
+        python-cinderclient \
+        python-designateclient \
+        python-magnumclient \
+        python-manilaclient \
+        python-mistralclient \
+        python-neutronclient \
+        python-novaclient \
+        python-saharaclient \
+        python-troveclient \
+        python-zaqarclient \
+        python-requests \
+        python-six \
 	"
 
 RDEPENDS_${SRCNAME}-engine = "${PN} ${SRCNAME}-templates ${SRCNAME}-common postgresql postgresql-client python-psycopg2 tgt ${SRCNAME}-cfn"
-- 
2.1.4


