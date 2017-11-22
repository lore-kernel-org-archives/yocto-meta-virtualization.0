Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BFAEE00D62; Wed, 22 Nov 2017 08:07:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7FEEE00A62
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:07:25 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAMG7O48019937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:07:24 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 08:07:23 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 11:06:57 -0500
Message-ID: <1511366817-5797-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] meta-openstack: initial move to use systemd
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
X-List-Received-Date: Wed, 22 Nov 2017 16:07:38 -0000
Content-Type: text/plain

Add instructions to the README.setup on how to configure the build to
use systemd. The remaining changes are a bit of hack and slash to get
the builds to succeed. The 'hacking' only touches core openstack
component recipes which are all in various states of broken anyways,
so these changes will not affect any current meta-cloud-services
users. All of these will be corrected shortly.

Most users of OpenStack have long ago made the move to systemd, by
following suit we can take advantage of the better support for service
files along with matching most OpenStack documentation. The remaining
sysvinit parts will be removed as we get the openstack components
updated and back to a working state.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/README.setup                                | 14 ++++++++++++++
 .../recipes-devtools/python/python-cinder_git.bb           |  4 ++++
 .../recipes-devtools/python/python-glance_git.bb           |  2 ++
 .../recipes-devtools/python/python-horizon_git.bb          |  1 +
 .../recipes-devtools/python/python-keystone_git.bb         | 12 ++++++------
 .../recipes-devtools/python/python-neutron_git.bb          |  1 +
 meta-openstack/recipes-devtools/python/python-nova_git.bb  | 12 ++++++++++++
 meta-openstack/recipes-devtools/python/python-trove_git.bb |  3 +++
 8 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/meta-openstack/README.setup b/meta-openstack/README.setup
index d55883f..b02ebf6 100644
--- a/meta-openstack/README.setup
+++ b/meta-openstack/README.setup
@@ -84,6 +84,20 @@ to the bblayers.conf file:
     /meta-openembedded/meta-webserver \
     /meta-openembedded/meta-ruby
 
+* All images must use systemd init system. After the builddir has been
+initialized you have to append the necessary variables to ensure that
+systemd will be used in your images:
+
+    DISTRO_FEATURES_append = " systemd"
+    DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+    VIRTUAL-RUNTIME_init_manager = "systemd"
+    VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+
+Additionally activiate the meta-virtualization layer:
+
+    DISTRO_FEATURES_append += "virtualization kvm"
+
+
 Package configurations
 ----------------------
 
diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index 9f70beb..3523038 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -152,6 +152,10 @@ pkg_postinst_${SRCNAME}-setup () {
 
 PACKAGES += "${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-setup ${SRCNAME}-api ${SRCNAME}-volume ${SRCNAME}-scheduler ${SRCNAME}-backup"
 ALLOW_EMPTY_${SRCNAME}-setup = "1"
+ALLOW_EMPTY_${SRCNAME}-backup = "1"
+ALLOW_EMPTY_${SRCNAME}-scheduler = "1"
+ALLOW_EMPTY_${SRCNAME}-volume = "1"
+ALLOW_EMPTY_${SRCNAME}-api = "1"
 
 RDEPENDS_${SRCNAME}-tests += " bash python"
 
diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index 4042f1b..4c408c9 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -138,6 +138,8 @@ pkg_postinst_${SRCNAME}-setup () {
 
 PACKAGES += " ${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-setup ${SRCNAME}-api ${SRCNAME}-registry"
 ALLOW_EMPTY_${SRCNAME}-setup = "1"
+ALLOW_EMPTY_${SRCNAME}-registry = "1"
+ALLOW_EMPTY_${SRCNAME}-api = "1"
 
 FILES_${PN} = " \
     ${libdir}/* \
diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index 69d19f5..51025e7 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -147,6 +147,7 @@ do_install_append() {
 }
 
 PACKAGES += "${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-apache ${SRCNAME}-standalone"
+ALLOW_EMPTY_${SRCNAME}-standalone = "1"
 
 RDEPENDS_${SRCNAME}-tests += " bash"
 
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index a26c9bf..b5f92dd 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -128,12 +128,12 @@ do_install_append() {
     sed -e "s:%TOKEN_FORMAT%:${TOKEN_FORMAT}:g" \
 	-i ${KEYSTONE_CONF_DIR}/keystone.conf
 
-    sed -e "s/%ADMIN_PASSWORD%/${ADMIN_PASSWORD}/g" \
-	-i ${D}${sysconfdir}/init.d/keystone
-    sed -e "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" \
-	-i ${D}${sysconfdir}/init.d/keystone
-    sed -e "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" \
-	-i ${D}${sysconfdir}/init.d/keystone
+#    sed -e "s/%ADMIN_PASSWORD%/${ADMIN_PASSWORD}/g" \
+#	-i ${D}${sysconfdir}/init.d/keystone
+#    sed -e "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" \
+#	-i ${D}${sysconfdir}/init.d/keystone
+#    sed -e "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" \
+#	-i ${D}${sysconfdir}/init.d/keystone
     
     install -d ${KEYSTONE_PACKAGE_DIR}/tests/tmp
 
diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index c837401..f2a4baa 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -56,6 +56,7 @@ do_install_append() {
     install -m 600 ${S}/etc/api-paste.ini ${NEUTRON_CONF_DIR}/
     install -m 600 ${S}/etc/policy.json ${NEUTRON_CONF_DIR}/
     install -m 600 ${TEMPLATE_CONF_DIR}/neutron/plugins/ml2/* ${NEUTRON_CONF_DIR}/plugins/ml2
+    install -m 600 ${WORKDIR}/metadata_agent.ini ${NEUTRON_CONF_DIR}/
 
     # Neutron.conf config changes (replace with .ini file editing)
     sed -e "s:^# core_plugin.*:core_plugin = ml2:g" -i ${NEUTRON_CONF_DIR}/neutron.conf
diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index 7b560a7..115d198 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -212,6 +212,18 @@ FILES_${BPN}-bash-completion = "${sysconfdir}/bash_completion.d/*"
 
 ALLOW_EMPTY_${SRCNAME}-setup = "1"
 ALLOW_EMPTY_${SRCNAME}-ec2 = "1"
+ALLOW_EMPTY_${SRCNAME}-api = "1"
+ALLOW_EMPTY_${SRCNAME}-compute = "1"
+ALLOW_EMPTY_${SRCNAME}-controller = "1"
+ALLOW_EMPTY_${SRCNAME}-consoleauth = "1"
+ALLOW_EMPTY_${SRCNAME}-cert = "1"
+ALLOW_EMPTY_${SRCNAME}-conductor = "1"
+ALLOW_EMPTY_${SRCNAME}-network = "1"
+ALLOW_EMPTY_${SRCNAME}-novncproxy = "1"
+ALLOW_EMPTY_${SRCNAME}-scheduler = "1"
+ALLOW_EMPTY_${SRCNAME}-spicehtml5proxy = "1"
+
+
 
 FILES_${PN} = "${libdir}/*"
 
diff --git a/meta-openstack/recipes-devtools/python/python-trove_git.bb b/meta-openstack/recipes-devtools/python/python-trove_git.bb
index b90e552..e1f8ae0 100755
--- a/meta-openstack/recipes-devtools/python/python-trove_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-trove_git.bb
@@ -210,6 +210,7 @@ FILES_${SRCNAME} = " \
 FILES_${SRCNAME}-api = " \
     ${sysconfdir}/init.d/trove-api \
     "
+ALLOW_EMPTY_${SRCNAME}-api = "1"
 
 FILES_${SRCNAME}-bin = " \
     ${bindir}/* \
@@ -218,10 +219,12 @@ FILES_${SRCNAME}-bin = " \
 FILES_${SRCNAME}-conductor = " \
     ${sysconfdir}/init.d/trove-conductor \
     "
+ALLOW_EMPTY_${SRCNAME}-conductor = "1"
 
 FILES_${SRCNAME}-taskmanager = " \
     ${sysconfdir}/init.d/trove-taskmanager \
     "
+ALLOW_EMPTY_${SRCNAME}-taskmanager = "1"
 
 FILES_${SRCNAME}-setup = " \
     ${localstatedir}/* \
-- 
2.7.4


