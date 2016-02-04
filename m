Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E079BE00CA2; Wed,  3 Feb 2016 17:43:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DEF4E00C6F
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:35 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gY4b011633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:35 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:34 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:38 -0500
Message-ID: <1454550104-7065-44-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 43/49] neutron: uprev to Liberty
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
 .../recipes-devtools/python/python-neutron_git.bb  | 68 +++++++++++++---------
 .../python/python-neutronclient_git.bb             | 26 +++++----
 2 files changed, 56 insertions(+), 38 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index b9cf518..cadc80f 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRCNAME = "neutron"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
            file://neutron-server.init \
            file://neutron-agent.init \
            file://l3_agent.ini \
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
 # TBD: update or drop
 # file://uuid_wscheck.patch
 
-SRCREV = "7260e0e3fc2ea479e80e0962624aca7fd38a1f60"
-PV = "2015.1.0+git${SRCPV}"
+SRCREV = "6dcfe3a9362ae5fcf18e5cfb59663e43446cd59c"
+PV = "7.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -258,30 +258,44 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} += "python-paste \
-	python-pastedeploy \
-	python-routes \
-	python-amqplib \
-	python-anyjson \
-	python-alembic \
-	python-eventlet \
-	python-greenlet \
-	python-httplib2 \
-	python-iso8601 \
-	python-kombu \
-	python-netaddr \
-	python-neutronclient \
-	python-sqlalchemy \
-	python-webob \
-	python-keystoneclient \
-	python-oslo.config \
-	python-oslo.rootwrap \
-	python-pyudev \
-	python-novaclient \
-	python-mako \
-	python-markupsafe \
-	python-pyparsing \
-	python-pbr \
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-paste \
+        python-pastedeploy \
+        python-debtcollector \
+        python-eventlet \
+        python-pecan \
+        python-greenlet \
+        python-httplib2 \
+        python-requests \
+        python-jinja2 \
+        python-keystonemiddleware \
+        python-netaddr \
+        python-neutronclient \
+        python-retrying \
+        python-ryu \
+        python-sqlalchemy \
+        python-webob \
+        python-keystoneclient \
+        python-alembic \
+        python-six \
+        python-stevedore \
+        python-oslo.concurrency \
+        python-oslo.config \
+        python-oslo.context \
+        python-oslo.db \
+        python-oslo.i18n \
+        python-oslo.log \
+        python-oslo.messaging \
+        python-oslo.middleware \
+        python-oslo.policy \
+        python-oslo.rootwrap \
+        python-oslo.serialization \
+        python-oslo.service \
+        python-oslo.utils \
+        python-oslo.versionedobjects \
+        python-novaclient \
+        python-routes \
 	"
 
 RDEPENDS_${SRCNAME} = "${PN} \
diff --git a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
index 16a2e92..bcbefaa 100644
--- a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
@@ -9,24 +9,28 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} +="python-cliff \
-	python-httplib2 \
-	python-iso8601 \
-	python-prettytable \
-	python-pyparsing \
-	python-simplejson \
-	python-pbr \
+RDEPENDS_${PN} +="\
+        python-pbr \
+        python-cliff \
+        python-iso8601 \
+        python-netaddr \
+        python-oslo.i18n \
+        python-oslo.serialization \
+        python-oslo.utils \
+        python-requests \
+        python-keystoneclient \
+        python-simplejson \
+        python-six \
+        python-babel \
 	"
 
-PR = "r0"
-
 SRC_URI = "git://github.com/openstack/python-neutronclient.git;branch=master \
            file://neutronclient-use-csv-flag-instead-of-json.patch \
            file://neutron-api-check.sh \
           "
 
-PV = "2.4.0+git${SRCPV}"
-SRCREV = "aa1215a5ad063b299d32ef319eb63d5210249a9b"
+PV = "3.1.0+git${SRCPV}"
+SRCREV = "3e115991c1cf9ec7cf4252440fa8d6015a5f53ce"
 S = "${WORKDIR}/git"
 
 inherit setuptools monitor rmargparse
-- 
2.1.4


