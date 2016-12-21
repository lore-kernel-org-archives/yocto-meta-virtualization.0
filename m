Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31D14E01115; Wed, 21 Dec 2016 07:22:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,URIBL_SBL
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.6 URIBL_SBL Contains an URL's NS IP listed in the SBL blocklist
	*      [URIs: init.sh]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE5D0E00C98
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Dec 2016 07:22:49 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBLFMmkb021151
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Dec 2016 07:22:48 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Dec 2016 07:22:48 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 21 Dec 2016 10:22:41 -0500
Message-ID: <1482333761-32026-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [mcs][PATCH] housekeeping: replace deprecated base_contains
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
X-List-Received-Date: Wed, 21 Dec 2016 15:22:52 -0000
Content-Type: text/plain

Fixes:
base_contains is deprecated, please use bb.utils.contains instead.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/classes/identity.bbclass                        |  2 +-
 meta-openstack/classes/monitor.bbclass                         |  4 ++--
 .../recipes-connectivity/openssh/openssh_7.%.bbappend          |  2 +-
 .../recipes-core/base-files/base-files_3.0.14.bbappend         |  4 ++--
 meta-openstack/recipes-devtools/python/python-barbican_git.bb  |  2 +-
 .../recipes-devtools/python/python-ceilometer_git.bb           |  2 +-
 meta-openstack/recipes-devtools/python/python-cinder_git.bb    |  2 +-
 meta-openstack/recipes-devtools/python/python-glance_git.bb    |  2 +-
 meta-openstack/recipes-devtools/python/python-heat_git.bb      |  2 +-
 meta-openstack/recipes-devtools/python/python-horizon_git.bb   |  2 +-
 meta-openstack/recipes-devtools/python/python-keystone_git.bb  |  8 ++++----
 meta-openstack/recipes-devtools/python/python-neutron_git.bb   |  8 ++++----
 meta-openstack/recipes-devtools/python/python-nova_git.bb      |  2 +-
 meta-openstack/recipes-devtools/python/python-rally_git.bb     |  2 +-
 meta-openstack/recipes-devtools/python/python-trove_git.bb     |  2 +-
 meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb |  4 ++--
 meta-openstack/recipes-extended/images/openstack-image-aio.bb  |  2 +-
 .../recipes-extended/images/openstack-image-controller.bb      |  2 +-
 meta-openstack/recipes-extended/libpam/libpam_1.%.bbappend     |  4 ++--
 meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend   |  2 +-
 .../packagegroups/packagegroup-cloud-compute.bb                | 10 +++++-----
 .../packagegroups/packagegroup-cloud-controller.bb             |  8 ++++----
 .../packagegroups/packagegroup-cloud-extras.bb                 |  2 +-
 meta-openstack/recipes-support/deploychef/deploychef_0.1.bb    |  2 +-
 meta-openstack/recipes-support/tgt/tgt_git.bb                  |  2 +-
 25 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/meta-openstack/classes/identity.bbclass b/meta-openstack/classes/identity.bbclass
index 4ea7305..c4b1394 100644
--- a/meta-openstack/classes/identity.bbclass
+++ b/meta-openstack/classes/identity.bbclass
@@ -22,7 +22,7 @@ ADMIN_USER_EMAIL = "admin@domain.com"
 
 MEMBER_ROLE = "Member"
 
-RUN_POSTINSTS_FILE = "${@base_contains('DISTRO_FEATURES', 'sysvinit', '/etc/rcS.d/S99run-postinsts', '', d)}"
+RUN_POSTINSTS_FILE = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '/etc/rcS.d/S99run-postinsts', '', d)}"
 
 # Add service and user setup into S99run-postinst running list
 ROOTFS_POSTPROCESS_COMMAND += "update_run_postinsts ; "
diff --git a/meta-openstack/classes/monitor.bbclass b/meta-openstack/classes/monitor.bbclass
index e916137..e217780 100644
--- a/meta-openstack/classes/monitor.bbclass
+++ b/meta-openstack/classes/monitor.bbclass
@@ -25,7 +25,7 @@ def copy_check_files(d, check_var_name, src, dest):
 python do_monitor_install() {
     import shutil
 
-    if base_contains('OPENSTACK_EXTRA_FEATURES', 'monitoring', "0", "1", d) == "1":
+    if bb.utils.contains('OPENSTACK_EXTRA_FEATURES', 'monitoring', "0", "1", d) == "1":
         bb.debug(1, 'OpenStack monitoring feature is disabled, skipping do_monitor_install')
         return
 
@@ -85,7 +85,7 @@ python do_monitor_clean() {
 }
 
 monitor_rootfs_postprocess() {
-    if ${@base_contains('OPENSTACK_EXTRA_FEATURES', 'monitoring', "false", "true", d)}; then
+    if ${@bb.utils.contains('OPENSTACK_EXTRA_FEATURES', 'monitoring', "false", "true", d)}; then
         echo "OpenStack monitoring feature is disabled, skipping monitor_rootfs_postprocess"
         exit
     fi
diff --git a/meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend b/meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend
index bfc543a..5c0d724 100644
--- a/meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend
+++ b/meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend
@@ -4,7 +4,7 @@ SRC_URI += "file://mcs-sshd"
 SRC_URI += "file://mcs-sshd_config"
 
 do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
         install -D -m 644 ${WORKDIR}/mcs-sshd ${D}/etc/pam.d/sshd
         install -D -m 644 ${WORKDIR}/mcs-sshd_config ${D}/etc/ssh/sshd_config
     fi
diff --git a/meta-openstack/recipes-core/base-files/base-files_3.0.14.bbappend b/meta-openstack/recipes-core/base-files/base-files_3.0.14.bbappend
index 53f0c20..0a1b160 100644
--- a/meta-openstack/recipes-core/base-files/base-files_3.0.14.bbappend
+++ b/meta-openstack/recipes-core/base-files/base-files_3.0.14.bbappend
@@ -2,11 +2,11 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://nsswitch.conf"
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
 PACKAGECONFIG[OpenLDAP] = ",,,nss-pam-ldapd"
 
 do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
         install -m 755 -d ${D}/etc/
         install -m 644 ${WORKDIR}/nsswitch.conf ${D}/etc/
     fi
diff --git a/meta-openstack/recipes-devtools/python/python-barbican_git.bb b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
index 15459f1..aa896ac 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
@@ -52,7 +52,7 @@ do_install_append() {
         sed -e "s:%BARBICAN_MAX_PACKET_SIZE%:${BARBICAN_MAX_PACKET_SIZE}:g" -i ${BARBICAN_CONF_DIR}/vassals/barbican-api.ini
         sed -e "s:%BARBICAN_MAX_PACKET_SIZE%:${BARBICAN_MAX_PACKET_SIZE}:g" -i ${BARBICAN_CONF_DIR}/vassals/barbican-admin.ini
     fi
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
 
 	for binary in api; do
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
index 2825e60..0d6e2d3 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
@@ -78,7 +78,7 @@ do_install_append() {
         sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
         sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" -i ${CEILOMETER_CONF_DIR}/ceilometer.conf
     fi
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
 
         sed 's:@suffix@:api:' < ${WORKDIR}/ceilometer.init >${WORKDIR}/ceilometer-api.init.sh
diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index 3203c43..91098c4 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -92,7 +92,7 @@ do_install_append() {
         done
     fi
 
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         sed 's:@suffix@:api:' < ${WORKDIR}/cinder.init >${WORKDIR}/cinder-api.init.sh
         install -m 0755 ${WORKDIR}/cinder-api.init.sh ${D}${sysconfdir}/init.d/cinder-api
diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index e6f5f5f..bce373d 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -112,7 +112,7 @@ do_install_append() {
         done
     fi
 
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         sed 's:@suffix@:api:' < ${WORKDIR}/glance.init >${WORKDIR}/glance-api.init.sh
         install -m 0755 ${WORKDIR}/glance-api.init.sh ${D}${sysconfdir}/init.d/glance-api
diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
index e5c9b09..e1ce99b 100644
--- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
@@ -89,7 +89,7 @@ do_install_append() {
         sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${HEAT_CONF_DIR}/heat.conf
         sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" -i ${HEAT_CONF_DIR}/heat.conf
     fi
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
 
         sed 's:@suffix@:api:' < ${WORKDIR}/heat.init >${WORKDIR}/heat-api.init.sh
diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index 2a96190..01ce598 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -107,7 +107,7 @@ do_install_append() {
         -i ${DASHBOARD_DIR}/local/local_settings.py
     install -m 644 ${S}/manage.py ${DASHBOARD_DIR}/manage.py
 
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)};
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)};
     then
         install -d ${D}${sysconfdir}/init.d
         sed 's:@PYTHON_SITEPACKAGES@:${PYTHON_SITEPACKAGES_DIR}:' \
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index 4bd739a..e79a6a4 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -100,7 +100,7 @@ do_install_append() {
 
     cp -r ${S}/examples ${KEYSTONE_PACKAGE_DIR}
 
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)};
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)};
     then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${WORKDIR}/keystone ${D}${sysconfdir}/init.d/keystone
@@ -144,7 +144,7 @@ do_install_append() {
             -i ${KEYSTONE_PACKAGE_DIR}/tests/test_overrides.conf
     fi
 
-    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)};
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)};
     then
         sed -i -e '/^\[identity\]/a \
 driver = keystone.identity.backends.hybrid_identity.Identity \
@@ -215,7 +215,7 @@ pkg_postinst_${SRCNAME}-setup () {
         keystone-manage db_sync
         keystone-manage pki_setup --keystone-user=root --keystone-group=daemon
 
-        if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
             /etc/init.d/openldap start
         fi
         /etc/init.d/keystone start
@@ -292,7 +292,7 @@ RDEPENDS_${PN} += " \
 
 RDEPENDS_${SRCNAME}-tests += " bash"
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
 PACKAGECONFIG[OpenLDAP] = ",,,python-ldap python-keystone-hybrid-backend"
 
 # TODO:
diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index cadc80f..f651a8f 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -82,7 +82,7 @@ do_install_append() {
 
     PLUGIN=openvswitch
     ARGS="--config-file=${sysconfdir}/${SRCNAME}/neutron.conf --config-file=${sysconfdir}/${SRCNAME}/plugins/ml2/ml2_conf.ini"
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         sed "s:@plugin@:/etc/neutron/plugins/ml2/ml2_conf.ini:" \
              < ${WORKDIR}/neutron-server.init >${WORKDIR}/neutron-server.init.sh
@@ -93,7 +93,7 @@ do_install_append() {
 
     AGENT=dhcp
     ARGS="--config-file=${sysconfdir}/${SRCNAME}/neutron.conf --config-file=${sysconfdir}/${SRCNAME}/dhcp_agent.ini"
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         sed "s:@suffix@:$AGENT:;s:@args@:$ARGS:" < ${WORKDIR}/neutron-agent.init >${WORKDIR}/neutron-$AGENT.init.sh
         install -m 0755 ${WORKDIR}/neutron-$AGENT.init.sh ${D}${sysconfdir}/init.d/neutron-$AGENT-agent
         install -m 600 ${WORKDIR}/${AGENT}_agent.ini ${NEUTRON_CONF_DIR}/
@@ -104,7 +104,7 @@ do_install_append() {
 
     AGENT=l3
     ARGS="--config-file=${sysconfdir}/${SRCNAME}/neutron.conf --config-file=${sysconfdir}/${SRCNAME}/l3_agent.ini"
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         sed "s:@suffix@:$AGENT:;s:@args@:$ARGS:" < ${WORKDIR}/neutron-agent.init >${WORKDIR}/neutron-$AGENT.init.sh
         install -m 0755 ${WORKDIR}/neutron-$AGENT.init.sh ${D}${sysconfdir}/init.d/neutron-$AGENT-agent
         install -m 600 ${WORKDIR}/${AGENT}_agent.ini ${NEUTRON_CONF_DIR}/
@@ -112,7 +112,7 @@ do_install_append() {
 
     AGENT=metadata
     ARGS="--config-file=${sysconfdir}/${SRCNAME}/neutron.conf --config-file=${sysconfdir}/${SRCNAME}/metadata_agent.ini"
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         sed "s:@suffix@:$AGENT:;s:@args@:$ARGS:" < ${WORKDIR}/neutron-agent.init >${WORKDIR}/neutron-$AGENT.init.sh
         install -m 0755 ${WORKDIR}/neutron-$AGENT.init.sh ${D}${sysconfdir}/init.d/neutron-$AGENT-agent
         install -m 600 ${WORKDIR}/${AGENT}_agent.ini ${NEUTRON_CONF_DIR}/
diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index fd50173..7e0e861 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -137,7 +137,7 @@ do_install_append() {
     fi
     install -o nova -d ${NOVA_CONF_DIR}/instances
 
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
 
 	# nova-all is installed (and packaged), but not used as an initscript by default
diff --git a/meta-openstack/recipes-devtools/python/python-rally_git.bb b/meta-openstack/recipes-devtools/python/python-rally_git.bb
index 30e3283..d29e7cb 100644
--- a/meta-openstack/recipes-devtools/python/python-rally_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-rally_git.bb
@@ -35,7 +35,7 @@ do_install_append() {
     sed -e "s:%DB_USER%:${DB_USER}:g" -i ${RALLY_CONF_DIR}/rally.conf
     sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${RALLY_CONF_DIR}/rally.conf
 
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         sed 's:@suffix@:api:' < ${WORKDIR}/rally.init > ${WORKDIR}/rally-api.init.sh
         install -m 0755 ${WORKDIR}/rally-api.init.sh ${D}${sysconfdir}/init.d/rally-api
diff --git a/meta-openstack/recipes-devtools/python/python-trove_git.bb b/meta-openstack/recipes-devtools/python/python-trove_git.bb
index 1b8d9ac..830da92 100755
--- a/meta-openstack/recipes-devtools/python/python-trove_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-trove_git.bb
@@ -50,7 +50,7 @@ do_install_append() {
     install -d ${TROVE_CONF_DIR}
 
     # init.
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)};
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)};
     then
         install -d ${D}${sysconfdir}/init.d
         for suffix in api taskmanager conductor; do
diff --git a/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb b/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
index 457ff93..01ee924 100644
--- a/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
+++ b/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
@@ -16,8 +16,8 @@ SRC_URI[sha256sum] = "9e8fd22eb7f6e40ae6a5f66173ddc3cc18f65ee406c460a728092b37db
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-DISTUTILS_INSTALL_ARGS_append = " ${@base_contains('DISTRO_FEATURES', 'sysvinit', '--init-system=sysvinit_deb', '', d)}"
-DISTUTILS_INSTALL_ARGS_append = " ${@base_contains('DISTRO_FEATURES', 'systemd', '--init-system=systemd', '', d)}"
+DISTUTILS_INSTALL_ARGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '--init-system=sysvinit_deb', '', d)}"
+DISTUTILS_INSTALL_ARGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--init-system=systemd', '', d)}"
 
 MANAGE_HOSTS ?= "False"
 HOSTNAME ?= ""
diff --git a/meta-openstack/recipes-extended/images/openstack-image-aio.bb b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
index ec34770..2df8536 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-aio.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
@@ -17,7 +17,7 @@ IMAGE_INSTALL = " \
     ${OPENSTACK_CONTROLLER_EXTRA_INSTALL} \
     ${OPENSTACK_COMPUTE_EXTRA_INSTALL} \
     ${OPENSTACK_AIO_EXTRA_INSTALL} \
-    ${@base_contains('OPENSTACK_EXTRA_FEATURES', 'benchmarking', 'task-cloud-benchmarking', '', d)} \
+    ${@bb.utils.contains('OPENSTACK_EXTRA_FEATURES', 'benchmarking', 'task-cloud-benchmarking', '', d)} \
     "
 
 IMAGE_FEATURES += "ssh-server-openssh"
diff --git a/meta-openstack/recipes-extended/images/openstack-image-controller.bb b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
index 879e6cc..89a4d07 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-controller.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
@@ -11,7 +11,7 @@ IMAGE_INSTALL = "\
     packagegroup-cloud-network \
     packagegroup-cloud-debug \
     packagegroup-cloud-extras \
-    ${@base_contains('OPENSTACK_EXTRA_FEATURES', 'benchmarking', 'packagegroup-cloud-benchmarking', '', d)} \
+    ${@bb.utils.contains('OPENSTACK_EXTRA_FEATURES', 'benchmarking', 'packagegroup-cloud-benchmarking', '', d)} \
     ${OPENSTACK_CONTROLLER_EXTRA_INSTALL} \
     "
 
diff --git a/meta-openstack/recipes-extended/libpam/libpam_1.%.bbappend b/meta-openstack/recipes-extended/libpam/libpam_1.%.bbappend
index 0e93ace..ec858a7 100644
--- a/meta-openstack/recipes-extended/libpam/libpam_1.%.bbappend
+++ b/meta-openstack/recipes-extended/libpam/libpam_1.%.bbappend
@@ -6,11 +6,11 @@ SRC_URI += "file://common-password"
 SRC_URI += "file://common-session"
 SRC_URI += "file://common-session-noninteractive"
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
 PACKAGECONFIG[OpenLDAP] = ",,,pam-plugin-mkhomedir nss-pam-ldapd"
 
 do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
         install -m 755 -d ${D}/etc/pam.d/
         install -m 644 ${WORKDIR}/common-account ${D}/etc/pam.d/
         install -m 644 ${WORKDIR}/common-auth ${D}/etc/pam.d/
diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
index 874bfd6..b55f9a9 100644
--- a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
+++ b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
@@ -1,6 +1,6 @@
 PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
 	 	 python ebtables \
-		 ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+		 ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
 		"
 
 inherit useradd
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
index 98a7348..7563792 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-compute.bb
@@ -20,13 +20,13 @@ RDEPENDS_${PN} = " \
     neutron-plugin-openvswitch \
     openvswitch-switch \
     troveclient \
-    ${@base_contains('CINDER_EXTRA_FEATURES', 'open-iscsi-user', 'open-iscsi-user', '', d)} \
-    ${@base_contains('CINDER_EXTRA_FEATURES', 'iscsi-initiator-utils', 'iscsi-initiator-utils', '', d)} \
+    ${@bb.utils.contains('CINDER_EXTRA_FEATURES', 'open-iscsi-user', 'open-iscsi-user', '', d)} \
+    ${@bb.utils.contains('CINDER_EXTRA_FEATURES', 'iscsi-initiator-utils', 'iscsi-initiator-utils', '', d)} \
     nfs-utils-client \
     fuse \
-    ${@base_contains('CINDER_EXTRA_FEATURES', 'glusterfs', 'glusterfs glusterfs-fuse', '', d)} \
-    ${@base_contains('CINDER_EXTRA_FEATURES', 'ceph', 'packagegroup-ceph xfsprogs', '', d)} \
-    ${@base_contains('OPENSTACK_EXTRA_FEATURES', 'monitoring', 'packagegroup-monitoring-agent', '', d)} \
+    ${@bb.utils.contains('CINDER_EXTRA_FEATURES', 'glusterfs', 'glusterfs glusterfs-fuse', '', d)} \
+    ${@bb.utils.contains('CINDER_EXTRA_FEATURES', 'ceph', 'packagegroup-ceph xfsprogs', '', d)} \
+    ${@bb.utils.contains('OPENSTACK_EXTRA_FEATURES', 'monitoring', 'packagegroup-monitoring-agent', '', d)} \
     "
 
 RRECOMMENDS_${PN} = " \
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
index 5154b1d..653a493 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-controller.bb
@@ -50,10 +50,10 @@ RDEPENDS_${PN} = " postgresql-setup \
     chkconfig \
     qemu \
     fuse \
-    ${@base_contains('CINDER_EXTRA_FEATURES', 'glusterfs', 'glusterfs glusterfs-fuse glusterfs-server', '', d)} \
-    ${@base_contains('CINDER_EXTRA_FEATURES', 'ceph', 'packagegroup-ceph ceph-setup xfsprogs', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'openldap python-ldap cyrus-sasl nss-pam-ldapd pam-plugin-mkhomedir python-keystone-hybrid-backend', '', d)} \
-    ${@base_contains('OPENSTACK_EXTRA_FEATURES', 'monitoring', 'packagegroup-monitoring-core', '', d)} \
+    ${@bb.utils.contains('CINDER_EXTRA_FEATURES', 'glusterfs', 'glusterfs glusterfs-fuse glusterfs-server', '', d)} \
+    ${@bb.utils.contains('CINDER_EXTRA_FEATURES', 'ceph', 'packagegroup-ceph ceph-setup xfsprogs', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'openldap python-ldap cyrus-sasl nss-pam-ldapd pam-plugin-mkhomedir python-keystone-hybrid-backend', '', d)} \
+    ${@bb.utils.contains('OPENSTACK_EXTRA_FEATURES', 'monitoring', 'packagegroup-monitoring-core', '', d)} \
     "
 
 RRECOMMENDS_${PN} = " \
diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
index 721e2c9..2fcad8b 100644
--- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
+++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
@@ -8,7 +8,7 @@ inherit packagegroup
 
 RDEPENDS_${PN} = " \
     vim \
-    ${@base_contains('DISTRO_FEATURES', 'x11', 'xterm', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xterm', '', d)} \
     "
 
 IMAGE_FEATURES += "package-management"
diff --git a/meta-openstack/recipes-support/deploychef/deploychef_0.1.bb b/meta-openstack/recipes-support/deploychef/deploychef_0.1.bb
index b823514..6237538 100644
--- a/meta-openstack/recipes-support/deploychef/deploychef_0.1.bb
+++ b/meta-openstack/recipes-support/deploychef/deploychef_0.1.bb
@@ -55,7 +55,7 @@ FILES_${PN} += " \
 #Read the module config files and make them into
 #chef-solo templates
 do_install() {
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         #This script will make templates out of postinst script before they
         #have a chance to run
         install -d ${D}${sysconfdir}/init.d
diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
index af4aa4b..5c594b1 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -28,7 +28,7 @@ do_compile() {
 do_install() {
     oe_runmake -e DESTDIR="${D}" install-programs install-conf install-scripts
 
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${WORKDIR}/tgtd.init ${D}${sysconfdir}/init.d/tgtd
     fi
-- 
2.7.4


