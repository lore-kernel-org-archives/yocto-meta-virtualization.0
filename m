Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0732E00CE4; Wed,  3 Feb 2016 17:43:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,WEIRD_PORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BE38E00CB6
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141gdS8019766
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:39 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:38 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:42 -0500
Message-ID: <1454550104-7065-48-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 47/49] trove: move to latest release
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
X-List-Received-Date: Thu, 04 Feb 2016 01:43:19 -0000
Content-Type: text/plain

Uprev trove to the latest release. This requires updates to
configurations strings since the 'sql_' configs have been deprecated.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-trove_git.bb           | 15 ++++++++-------
 .../recipes-devtools/python/python-troveclient_git.bb     |  9 +++++----
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-trove_git.bb b/meta-openstack/recipes-devtools/python/python-trove_git.bb
index ae6defd..1b8d9ac 100755
--- a/meta-openstack/recipes-devtools/python/python-trove_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-trove_git.bb
@@ -4,15 +4,14 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 SRCNAME = "trove"
 
-SRC_URI = "git://github.com/openstack/trove.git;branch=stable/juno \
+SRC_URI = "git://github.com/openstack/trove.git;branch=master \
           file://trove-init \
           "
 
-SRCREV="6c4ea5b845a4d6d71d3d3786517b5b358c30f3ec"
-PV="2014.2+git${SRCPV}"
+SRCREV="11996635299396f181f5aec3c6825f8011d45e2c"
+PV="4.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit update-rc.d setuptools identity hosts useradd default_configs
@@ -77,13 +76,13 @@ do_install_append() {
         sed -e "s:#log_dir.*:log_dir = ${TROVE_LOG_DIR}:g" \
                 -i ${TROVE_CONF_DIR}/$file
 
-        sed -e "s:^sql_connection = mysql\(.*\):#sql_connection = mysql\1:g" \
+        sed -e "s:^connection = mysql\(.*\):#connection = mysql\1:g" \
                 -i ${TROVE_CONF_DIR}/$file
 
-        sed -e "s,^#sql_connection = postgresql://.*,sql_connection = postgresql://${ADMIN_USER}:${ADMIN_PASSWORD}@localhost/trove,g" \
+        sed -e "s,^#connection = postgresql://.*,connection = postgresql://${ADMIN_USER}:${ADMIN_PASSWORD}@localhost/trove,g" \
                 -i ${TROVE_CONF_DIR}/$file
 
-        sed -i "/sql_connection = postgres.*n/adefault_datastore = postgresql" \
+        sed -i "/connection = postgres.*n/adefault_datastore = postgresql" \
                 ${TROVE_CONF_DIR}/$file
 
         sed -e "s,dns_auth_url = .*,dns_auth_url = http://127.0.0.1:8081/keystone/main/v2.0,g" \
@@ -255,6 +254,7 @@ RDEPENDS_${PN} += " \
     python-neutronclient \
     python-novaclient \
     python-oslo.config \
+    python-oslo.service \
     python-passlib \
     python-paste \
     python-pastedeploy \
@@ -262,6 +262,7 @@ RDEPENDS_${PN} += " \
     python-sqlalchemy-migrate \
     python-swiftclient \
     python-webob \
+    python-monotonic \
     uwsgi \
     "
 
diff --git a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
index a55ce27..251d9e0 100644
--- a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
@@ -4,18 +4,17 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 SRCNAME = "troveclient"
 
 SRC_URI = "\
 	git://github.com/openstack/python-troveclient.git;branch=master \
 	"
 
-PV = "1.0.9+git${SRCPV}"
-SRCREV = "a36ebe539ce0affef5388b7edd7a6a230a0fde6c"
+PV = "1.3.0+git${SRCPV}"
+SRCREV = "7132f5ff78af75645c3430d35094b3c9aba49200"
 S = "${WORKDIR}/git"
 
-inherit setuptools hosts default_configs
+inherit setuptools hosts default_configs rmargparse
 
 
 USERADD_PACKAGES = "${PN}"
@@ -62,6 +61,8 @@ RDEPENDS_${PN} += " \
         python-simplejson \
         python-babel \
         python-six \
+        python-oslo.utils \
+        python-keystoneclient \
 	"
 
 RDEPENDS_${SRCNAME}-tests += "python-mock"
-- 
2.1.4


