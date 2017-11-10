Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0983AE00D67; Fri, 10 Nov 2017 13:31:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A688EE00D51
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 13:31:13 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAALVDKJ021405
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 13:31:13 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 10 Nov 2017 13:31:12 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 10 Nov 2017 16:31:00 -0500
Message-ID: <1510349460-18777-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510349460-18777-1-git-send-email-mark.asselstine@windriver.com>
References: <1510349460-18777-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 5/5] python-keystone: uprev to latest stable/pike
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
X-List-Received-Date: Fri, 10 Nov 2017 21:31:23 -0000
Content-Type: text/plain

Required updates to python-olso*, keystoneclient, keystonemiddleware
and more. These updates have all been completed in commit prior to
this uprev.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-keystone_git.bb | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index 6dfdc93..79bd0c8 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRCNAME = "keystone"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike \
            file://keystone.conf \
            file://identity.sh \
            file://keystone \
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
 # file://keystone-remove-git-commands-in-tests.patch 
 # file://keystone-explicitly-import-localcontext-from-oslo.me.patch
 
-SRCREV = "8dcd82fb9c76d43f26338bee293b32f4af473ad9"
-PV = "8.0.0+git${SRCPV}"
+SRCREV = "d07677aba54362a4a3aa2d165b155105ffe30d73"
+PV = "12.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -75,7 +75,7 @@ do_install_append() {
 
     install -d ${D}${localstatedir}/log/${SRCNAME}
     install -m 755 -d ${KEYSTONE_CGI_DIR}
-    install -m 755 -d ${KEYSTONE_PY_DIR}
+    #install -m 755 -d ${KEYSTONE_PY_DIR}
 
     # Apache needs to read the keystone.conf
     install -m 644 ${WORKDIR}/keystone.conf ${KEYSTONE_CONF_DIR}/
@@ -87,16 +87,16 @@ do_install_append() {
     install -m 600 ${S}${sysconfdir}/keystone.conf.sample \
         ${KEYSTONE_CONF_DIR}/keystone.conf.sample
     # Apache user needs to read these files.
-    install -m 644 ${S}${sysconfdir}/policy.json \
-        ${KEYSTONE_CONF_DIR}/policy.json
+    #install -m 644 ${S}${sysconfdir}/policy.json \
+    #    ${KEYSTONE_CONF_DIR}/policy.json
     install -m 644 ${S}${sysconfdir}/keystone-paste.ini \
         ${KEYSTONE_CONF_DIR}/keystone-paste.ini
-    install -m 644 ${S}/httpd/keystone.py \
-        ${KEYSTONE_PY_DIR}/keystone-httpd.py
-    install -m 644 ${S}/httpd/keystone.py \
-        ${KEYSTONE_CGI_DIR}/admin
-    install -m 644 ${S}/httpd/keystone.py \
-        ${KEYSTONE_CGI_DIR}/main
+    #install -m 644 ${S}/httpd/keystone.py \
+    #    ${KEYSTONE_PY_DIR}/keystone-httpd.py
+    #install -m 644 ${S}/httpd/keystone.py \
+    #    ${KEYSTONE_CGI_DIR}/admin
+    #install -m 644 ${S}/httpd/keystone.py \
+    #    ${KEYSTONE_CGI_DIR}/main
 
     cp -r ${S}/examples ${KEYSTONE_PACKAGE_DIR}
 
@@ -249,37 +249,42 @@ DEPENDS += " \
         "
 
 RDEPENDS_${PN} += " \
-        python-pycadf \
-        python-oslo.db \
-        python-pam \
+        python-babel \
+        python-pbr \
         python-webob \
-        python-eventlet \
-        python-greenlet \
         python-pastedeploy \
         python-paste \
         python-routes \
+        python-cryptography \
+        python-six \
         python-sqlalchemy \
         python-sqlalchemy-migrate \
+        python-stevedore \
         python-passlib \
-        python-lxml \
-        python-iso8601 \
         python-keystoneclient \
-        python-openstack-nose \
+        python-keystonemiddleware \
+        python-bcrypt \
+        python-scrypt \
+        python-oslo.cache \
+        python-oslo.concurrency \
         python-oslo.config \
-        python-dogpile.core \
-        python-dogpile.cache \
-        python-pbr \
-        python-pysaml2 \
+        python-oslo.context \
+        python-oslo.messaging \
+        python-oslo.db \
+        python-oslo.i18n \
+        python-oslo.log \
+        python-oslo.middleware \
         python-oslo.policy \
+        python-oslo.serialization \
         python-oslo.utils \
         python-oauthlib \
-        python-fixtures \
-        python-oslotest \
-        python-functools32 \
-        python-six \
-        python-routes \
+        python-pysaml2 \
+        python-dogpile.cache \
+        python-jsonschema \
         python-pycadf \
-        python-cryptography \
+        python-msgpack \
+        python-osprofiler \
+        python-pytz \
         "
 
 RDEPENDS_${SRCNAME}-tests += " bash"
-- 
2.7.4


