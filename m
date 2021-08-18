Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.49410.1629255183563001747
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 19:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qpRzHz00;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629255181; i=@fujitsu.com;
	bh=mpgR1DxwXYwSXKeaoj68zMzMhAzvwenkX1o6THw3oOE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qpRzHz00NQKGFBZRoBwKSu6udY3aexriJ0fANc7Z+i2bwWmyEKrzGK3eIfrM+EQm1
	 q6DbktaV+PMikMcNgTQZ+4Pxn5y3lcIyZMAPVU8ABx4UwF4TLCXfjd+hTHCh9pKCwv
	 3jKrt1rCzvWAFFYaSfZd4DefhHKlaPhMMfVVF8thQU5gxFIH0zDmgeb+YW2On0Y7+G
	 rwT8hN+jRy01ZbzhWnw6Mi8Bznx7D5em2pM+uYG0eWlJsVUpjfEDm0Q5lhXDVo38K3
	 oHFJSTf/M/sRKcjNQZSuhiqsRrzeK5MGjBnxRQ1bD8yIzgNz4P826nRH0FivwZWnjO
	 0KL0IYRdLOcyA==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 09/42-31171-D067C116; Wed, 18 Aug 2021 02:53:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MRqstTJpN
  oMPc1q8WiL89YHRg9Zp56xBzAGMWamZeUX5HAmtE78RBbwdnTzBUXH8k3MK6azdzFyMUhJDCH
  SWLet9fsEM4JRolVX1oZuxg5OdgE1CSm37rBCmKLCBhInDs3nxnEZhZQkXjxuweogYNDWMBVY
  uPJcJAwi4CqxJ6Pe8DKeQWcJK5+PcYGYksIKEhMefieGSIuKHFy5hMWiDESEgdfvGCGqFGUmH
  25mQXCrpCYNauNaQIj7ywkLbOQtCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKwLJI0N9BKrdBP
  1Ukt1k1PzSooSgbJ6ieXFesWVuck5KXp5qSWbGIEhllLI0LSD8d2rD3qHGCU5mJREea+7yyQK
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuB9WASUEyxKTU+tSMvMAYY7TFqCg0dJhLerBCjNW1yQm
  FucmQ6ROsVoybHz9OJFzBwnVy0BkldApBBLXn5eqpQ4r08pUIMASENGaR7cOFhMXmKUlRLmZW
  RgYBDiKUgtys0sQZV/xSjOwagkzOsJMoUnM68EbusroIOYgA7yMZAEOagkESEl1cCkvqZo5WK
  p8o05YaoXD4p5CvjPvX+hvVth8cKnIUcTn0nHWP6LnM++uy3quMm1mbNX8fA8j12p8agt+Pms
  mB6zygZ5xxvLrCsM478e5NPh1udk3imyYnUhs3T6Hl+Pj5wCClt2KPMJPU7Q+nJsaecK/tpLu
  7wO1y1/mzZ9+u4lTz9Pld3W+vfR2WvVr7ew5M5cInba93P+sb2bffY/5zMzXmAo9y9XW9xpzz
  9O3yOZ8w8dKZp3iLO2/8HuGZ9mueiZ8vVFn+HTb136fO3/X9nXl12de+9SfbWtiezDW19cmIR
  ++r7ushbX+qW9u8XG+NnFcO1H9yI2vjXuTj6YmOe2f0J85x8720nR/2bffeanpsRSnJFoqMVc
  VJwIAA7J9OhEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-232.messagelabs.com!1629255179!77130!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10297 invoked from network); 18 Aug 2021 02:53:00 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Aug 2021 02:53:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17I2qsBh031389
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Aug 2021 03:52:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 18 Aug 2021 03:52:52 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH] Convert to new override syntax
Date: Wed, 18 Aug 2021 10:52:37 +0800
Message-ID: <1629255157-40026-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

This is the result of automated script (0.9.1) conversion:

oe-core/scripts/contrib/convert-overrides.py .

converting the metadata to use ":" as the override character instead of "_".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python-neutron_git.bbappend                 |  4 ++--
 .../recipes-devtools/python/python-cinder_git.bbappend |  6 +++---
 .../recipes-devtools/python/python-glance_git.bbappend |  4 ++--
 .../python/python-neutron_git.bbappend                 |  4 ++--
 .../recipes-devtools/python/python-nova_git.bbappend   |  4 ++--
 .../python/python-ceilometer_git.bbappend              |  2 +-
 .../recipes-devtools/python/python-nova_git.bbappend   |  2 +-
 meta-openstack/Documentation/README.OpenLDAP           |  2 +-
 meta-openstack/README                                  |  2 +-
 meta-openstack/README.setup                            |  6 +++---
 meta-openstack/classes/identity.bbclass                |  2 +-
 meta-openstack/classes/rmargparse.bbclass              |  2 +-
 .../open-iscsi/open-iscsi-kernel_2.0-873.bb            |  2 +-
 .../open-iscsi/open-iscsi-user_2.1.4.bb                |  4 ++--
 .../recipes-connectivity/openssh/openssh_openstack.inc |  4 ++--
 .../recipes-core/base-files/base-files_openstack.inc   |  4 ++--
 .../recipes-core/initscripts/initscripts_openstack.inc |  2 +-
 .../recipes-dbs/postgresql/postgresql_openstack.inc    |  4 ++--
 .../recipes-devtools/erlang/erlang-native_R15B.bb      |  4 ++--
 .../recipes-devtools/erlang/erlang-native_R16B03-1.bb  |  4 ++--
 meta-openstack/recipes-devtools/erlang/erlang_R15B.bb  | 10 +++++-----
 .../recipes-devtools/erlang/erlang_R16B03-1.bb         | 10 +++++-----
 .../erlang/nativesdk-erlang_R16B03-1.bb                |  6 +++---
 .../recipes-devtools/python/python-barbican_git.bb     |  2 +-
 .../recipes-devtools/python/python-ceilometer_git.bb   |  4 ++--
 .../recipes-devtools/python/python-cinder_git.bb       |  2 +-
 .../recipes-devtools/python/python-cinderclient_git.bb |  2 +-
 .../recipes-devtools/python/python-glance_git.bb       |  4 ++--
 .../recipes-devtools/python/python-heat_git.bb         |  2 +-
 .../recipes-devtools/python/python-heatclient_git.bb   |  2 +-
 .../recipes-devtools/python/python-horizon_git.bb      |  2 +-
 .../python/python-keystone-hybrid-backend_git.bb       |  2 +-
 .../recipes-devtools/python/python-keystone_git.bb     |  2 +-
 .../recipes-devtools/python/python-neutron_git.bb      |  2 +-
 .../python/python-neutronclient_git.bb                 |  2 +-
 .../recipes-devtools/python/python-nova_git.bb         |  4 ++--
 .../recipes-devtools/python/python-novaclient_git.bb   |  2 +-
 .../recipes-devtools/python/python-oauth2_1.5.211.bb   |  2 +-
 .../recipes-devtools/python/python-oauthlib_0.7.2.bb   |  2 +-
 .../recipes-devtools/python/python-rally_git.bb        |  2 +-
 .../recipes-devtools/python/python-swift_git.bb        |  2 +-
 meta-openstack/recipes-devtools/python/python-tox.inc  |  2 +-
 .../recipes-devtools/python/python-trove_git.bb        |  4 ++--
 .../recipes-devtools/python/python-troveclient_git.bb  |  2 +-
 .../python/python3-django-compressor_2.1.bb            |  2 +-
 .../recipes-devtools/python/python3-falcon_2.0.0.bb    |  2 +-
 .../recipes-devtools/python/python3-happybase_1.2.0.bb |  2 +-
 .../python/python3-keystoneclient_git.bb               |  2 +-
 .../python/python3-requestsexceptions_1.4.0.bb         |  2 +-
 .../python/python3-setuptools-git_1.2.bb               |  2 +-
 .../python/python3-swiftclient_3.10.0.bb               |  2 +-
 meta-openstack/recipes-devtools/ruby/erubis_git.bb     |  2 +-
 meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb  |  2 +-
 .../recipes-devtools/ruby/http-parser.rb_0.6.0.bb      |  2 +-
 .../recipes-extended/images/openstack-image-aio.bb     |  2 +-
 .../recipes-extended/images/openstack-image-compute.bb |  2 +-
 .../images/openstack-image-controller.bb               |  2 +-
 .../recipes-extended/libpam/libpam_openstack.inc       |  4 ++--
 .../recipes-extended/libvirt/libvirt_openstack.inc     |  4 ++--
 .../recipes-extended/lighttpd/lighttpd_openstack.inc   |  2 +-
 meta-openstack/recipes-extended/qpid/qpid_0.20.bb      |  2 +-
 meta-openstack/recipes-extended/tempest/tempest_git.bb |  2 +-
 .../recipes-kernel/linux/linux-yocto_openstack.inc     |  2 +-
 meta-openstack/recipes-support/chef/chef_git.bb        |  2 +-
 .../recipes-support/dnsmasq/dnsmasq_openstack.inc      |  2 +-
 .../recipes-support/iproute2/iproute2_openstack.inc    |  2 +-
 .../recipes-support/memcached/memcached_1.5.3.bb       |  2 +-
 .../recipes-support/mod-wsgi/mod-wsgi_git.bb           |  2 +-
 .../recipes-support/openldap/openldap_openstack.inc    |  4 ++--
 meta-openstack/recipes-support/salt/salt_3001.1.bb     |  4 ++--
 recipes-connectivity/consul/consul_git.bb              |  6 +++---
 recipes-devtools/python/python-ansible.inc             |  2 +-
 recipes-extended/glusterfs/glusterfs.inc               |  6 +++---
 recipes-extended/librdmacm/librdmacm_1.1.0.bb          |  2 +-
 recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb   |  4 ++--
 recipes-support/openldap/openldap_2.4.39.bb            |  2 +-
 recipes-support/puppet-vswitch/puppet-vswitch_git.bb   |  2 +-
 recipes-support/puppet/puppet_5.4.0.bb                 |  2 +-
 recipes-support/spice/spice_git.bb                     |  4 ++--
 79 files changed, 117 insertions(+), 117 deletions(-)

diff --git a/meta-openstack-compute-test-config/recipes-devtools/python/python-neutron_git.bbappend b/meta-openstack-compute-test-config/recipes-devtools/python/python-neutron_git.bbappend
index 60e70fca..a34ba055 100644
--- a/meta-openstack-compute-test-config/recipes-devtools/python/python-neutron_git.bbappend
+++ b/meta-openstack-compute-test-config/recipes-devtools/python/python-neutron_git.bbappend
@@ -1,10 +1,10 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " file://neutron-test-config.init"
 
 NEUTRON_CONF_EXT_ETH_IF ?= "eth0"
 
-do_install_append() {
+do_install:append() {
     sed -e "s:%NEUTRON_CONF_EXT_ETH_IF%:${NEUTRON_CONF_EXT_ETH_IF}:g" -i ${WORKDIR}/neutron-test-config.init
     sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${WORKDIR}/neutron-test-config.init
     install -m 0755 ${WORKDIR}/neutron-test-config.init ${D}${sysconfdir}/init.d/neutron-test-config
diff --git a/meta-openstack-controller-test-config/recipes-devtools/python/python-cinder_git.bbappend b/meta-openstack-controller-test-config/recipes-devtools/python/python-cinder_git.bbappend
index 50033364..121f7e73 100644
--- a/meta-openstack-controller-test-config/recipes-devtools/python/python-cinder_git.bbappend
+++ b/meta-openstack-controller-test-config/recipes-devtools/python/python-cinder_git.bbappend
@@ -1,13 +1,13 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " file://cinder-test-config.init"
 
-do_install_prepend() {
+do_install:prepend() {
     # Remove nfs cinder-volume backend driver
     sed -e "s/nfsdriver,//" -i ${WORKDIR}/cinder.conf
 }
 
-do_install_append() {
+do_install:append() {
     install -m 0755 ${WORKDIR}/cinder-test-config.init ${D}${sysconfdir}/init.d/cinder-test-config
 }
 
diff --git a/meta-openstack-controller-test-config/recipes-devtools/python/python-glance_git.bbappend b/meta-openstack-controller-test-config/recipes-devtools/python/python-glance_git.bbappend
index 1c89d517..f3b32f2a 100644
--- a/meta-openstack-controller-test-config/recipes-devtools/python/python-glance_git.bbappend
+++ b/meta-openstack-controller-test-config/recipes-devtools/python/python-glance_git.bbappend
@@ -1,8 +1,8 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " file://glance-test-config.init"
 
-do_install_append() {
+do_install:append() {
     install -m 0755 ${WORKDIR}/glance-test-config.init ${D}${sysconfdir}/init.d/glance-test-config
 }
 
diff --git a/meta-openstack-controller-test-config/recipes-devtools/python/python-neutron_git.bbappend b/meta-openstack-controller-test-config/recipes-devtools/python/python-neutron_git.bbappend
index 2276456f..aa880bc4 100644
--- a/meta-openstack-controller-test-config/recipes-devtools/python/python-neutron_git.bbappend
+++ b/meta-openstack-controller-test-config/recipes-devtools/python/python-neutron_git.bbappend
@@ -1,10 +1,10 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " file://neutron-test-config.init"
 
 NEUTRON_CONF_EXT_ETH_IF ?= "eth0"
 
-do_install_append() {
+do_install:append() {
     sed -e "s:%NEUTRON_CONF_EXT_ETH_IF%:${NEUTRON_CONF_EXT_ETH_IF}:g" -i ${WORKDIR}/neutron-test-config.init
     sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${WORKDIR}/neutron-test-config.init
     install -m 0755 ${WORKDIR}/neutron-test-config.init ${D}${sysconfdir}/init.d/neutron-test-config
diff --git a/meta-openstack-controller-test-config/recipes-devtools/python/python-nova_git.bbappend b/meta-openstack-controller-test-config/recipes-devtools/python/python-nova_git.bbappend
index c01d6497..208fc88b 100644
--- a/meta-openstack-controller-test-config/recipes-devtools/python/python-nova_git.bbappend
+++ b/meta-openstack-controller-test-config/recipes-devtools/python/python-nova_git.bbappend
@@ -1,8 +1,8 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " file://nova-test-config.init"
 
-do_install_append() {
+do_install:append() {
     install -m 0755 ${WORKDIR}/nova-test-config.init ${D}${sysconfdir}/init.d/nova-test-config
 }
 
diff --git a/meta-openstack-qemu/recipes-devtools/python/python-ceilometer_git.bbappend b/meta-openstack-qemu/recipes-devtools/python/python-ceilometer_git.bbappend
index 5d45d629..e4edfde7 100644
--- a/meta-openstack-qemu/recipes-devtools/python/python-ceilometer_git.bbappend
+++ b/meta-openstack-qemu/recipes-devtools/python/python-ceilometer_git.bbappend
@@ -1,4 +1,4 @@
-do_install_append() {
+do_install:append() {
     if [ ! -f "${WORKDIR}/ceilometer.conf" ]; then
         return
     fi
diff --git a/meta-openstack-qemu/recipes-devtools/python/python-nova_git.bbappend b/meta-openstack-qemu/recipes-devtools/python/python-nova_git.bbappend
index b2e3dff0..42e2fbae 100644
--- a/meta-openstack-qemu/recipes-devtools/python/python-nova_git.bbappend
+++ b/meta-openstack-qemu/recipes-devtools/python/python-nova_git.bbappend
@@ -1,4 +1,4 @@
-do_install_append() {
+do_install:append() {
     if [ ! -f "${WORKDIR}/nova.conf" ]; then
         return
     fi
diff --git a/meta-openstack/Documentation/README.OpenLDAP b/meta-openstack/Documentation/README.OpenLDAP
index 06e186ea..a45b7691 100644
--- a/meta-openstack/Documentation/README.OpenLDAP
+++ b/meta-openstack/Documentation/README.OpenLDAP
@@ -6,7 +6,7 @@ OpenLDAP into DISTRO_FEATURES
 
 e.g. in conf/local.conf
 
-DISTRO_FEATURES_append += " OpenLDAP"
+DISTRO_FEATURES:append += " OpenLDAP"
 
 A number of variables can be specified during the build phase that configures
 OpenLDAP specific options:
diff --git a/meta-openstack/README b/meta-openstack/README
index cd1c2e75..127e8142 100644
--- a/meta-openstack/README
+++ b/meta-openstack/README
@@ -9,7 +9,7 @@ The bbappend files for some recipes (e.g. postgresql) and preferred version sett
 (e.g. python-networkx)in this layer need to have 'openstack' in DISTRO_FEATURES to
 have effect. To enable them, add in configuration file the following line.
 
-  DISTRO_FEATURES_append = " openstack"
+  DISTRO_FEATURES:append = " openstack"
 
 If meta-openstack is included, but openstack is not enabled as a
 distro feature a warning is printed at parse time:
diff --git a/meta-openstack/README.setup b/meta-openstack/README.setup
index b02ebf69..d1a47034 100644
--- a/meta-openstack/README.setup
+++ b/meta-openstack/README.setup
@@ -88,14 +88,14 @@ to the bblayers.conf file:
 initialized you have to append the necessary variables to ensure that
 systemd will be used in your images:
 
-    DISTRO_FEATURES_append = " systemd"
+    DISTRO_FEATURES:append = " systemd"
     DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
     VIRTUAL-RUNTIME_init_manager = "systemd"
     VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
 
 Additionally activiate the meta-virtualization layer:
 
-    DISTRO_FEATURES_append += "virtualization kvm"
+    DISTRO_FEATURES:append += "virtualization kvm"
 
 
 Package configurations
@@ -120,7 +120,7 @@ bblayers.conf file, after the node type deployment layer.
 If a sample guest image is desired on a control node, the following can
 be added to local.conf:
 
-  IMAGE_INSTALL_append = " cirros-guest-image"
+  IMAGE_INSTALL:append = " cirros-guest-image"
 
 * Cinder Additional Packages *
 
diff --git a/meta-openstack/classes/identity.bbclass b/meta-openstack/classes/identity.bbclass
index 1f4f408e..66998759 100644
--- a/meta-openstack/classes/identity.bbclass
+++ b/meta-openstack/classes/identity.bbclass
@@ -152,7 +152,7 @@ def servicecreate_param(d, pkg):
     return service_param
 
 # Add the postinst script into the generated package
-python populate_packages_append () {
+python populate_packages:append () {
     servicecreate_packages = d.getVar('SERVICECREATE_PACKAGES', True) or ""
 
     servicecreate_postinst_common_copy = d.getVar('servicecreate_postinst_common', True)
diff --git a/meta-openstack/classes/rmargparse.bbclass b/meta-openstack/classes/rmargparse.bbclass
index 65d84595..e3930cea 100644
--- a/meta-openstack/classes/rmargparse.bbclass
+++ b/meta-openstack/classes/rmargparse.bbclass
@@ -1,3 +1,3 @@
-do_install_append() {
+do_install:append() {
     sed -i '/argparse/d' ${D}${libdir}/python2.7/site-packages/*/requires.txt
 }
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-kernel_2.0-873.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-kernel_2.0-873.bb
index 8d514601..69412349 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-kernel_2.0-873.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-kernel_2.0-873.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
 HOMEPAGE = "http://www.open-iscsi.org/"
 LICENSE = "GPL"
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR:append = "a"
 PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
index b71d8dc1..7d046fcc 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
@@ -7,7 +7,7 @@ inherit systemd autotools pkgconfig
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "kmod openssl util-linux open-isns"
-DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https   \
            file://0001-fix-build-error-of-cross-build.patch \
@@ -54,7 +54,7 @@ SYSTEMD_SERVICE_${PN}-systemd = "iscsi.service \
                                  iscsid.socket \
                                  iscsiuio.socket "
 
-do_install_append () {
+do_install:append () {
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${S}/etc/systemd/* ${D}${systemd_unitdir}/system/
 }
diff --git a/meta-openstack/recipes-connectivity/openssh/openssh_openstack.inc b/meta-openstack/recipes-connectivity/openssh/openssh_openstack.inc
index 5c0d724f..0244ae32 100644
--- a/meta-openstack/recipes-connectivity/openssh/openssh_openstack.inc
+++ b/meta-openstack/recipes-connectivity/openssh/openssh_openstack.inc
@@ -1,9 +1,9 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://mcs-sshd"
 SRC_URI += "file://mcs-sshd_config"
 
-do_install_append() {
+do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
         install -D -m 644 ${WORKDIR}/mcs-sshd ${D}/etc/pam.d/sshd
         install -D -m 644 ${WORKDIR}/mcs-sshd_config ${D}/etc/ssh/sshd_config
diff --git a/meta-openstack/recipes-core/base-files/base-files_openstack.inc b/meta-openstack/recipes-core/base-files/base-files_openstack.inc
index 0a1b1604..d69bc792 100644
--- a/meta-openstack/recipes-core/base-files/base-files_openstack.inc
+++ b/meta-openstack/recipes-core/base-files/base-files_openstack.inc
@@ -1,11 +1,11 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://nsswitch.conf"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
 PACKAGECONFIG[OpenLDAP] = ",,,nss-pam-ldapd"
 
-do_install_append() {
+do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
         install -m 755 -d ${D}/etc/
         install -m 644 ${WORKDIR}/nsswitch.conf ${D}/etc/
diff --git a/meta-openstack/recipes-core/initscripts/initscripts_openstack.inc b/meta-openstack/recipes-core/initscripts/initscripts_openstack.inc
index 21749974..39308672 100644
--- a/meta-openstack/recipes-core/initscripts/initscripts_openstack.inc
+++ b/meta-openstack/recipes-core/initscripts/initscripts_openstack.inc
@@ -1,4 +1,4 @@
-do_install_append() {
+do_install:append() {
 
 	echo                  >> ${D}${sysconfdir}/init.d/functions
 	echo init_is_upstart \(\) \{  >> ${D}${sysconfdir}/init.d/functions
diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
index 3de5845b..4d55007d 100644
--- a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
+++ b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/postgresql:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/postgresql:"
 
 SRC_URI += " \
     file://postgresql-init \
@@ -12,7 +12,7 @@ SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 # default
 DB_DATADIR ?= "/var/lib/postgres/data"
 
-do_install_append() {
+do_install:append() {
     D_DEST_DIR=${D}${sysconfdir}/postgresql
 
     install -d ${D_DEST_DIR}
diff --git a/meta-openstack/recipes-devtools/erlang/erlang-native_R15B.bb b/meta-openstack/recipes-devtools/erlang/erlang-native_R15B.bb
index 435795fd..f4cad839 100644
--- a/meta-openstack/recipes-devtools/erlang/erlang-native_R15B.bb
+++ b/meta-openstack/recipes-devtools/erlang/erlang-native_R15B.bb
@@ -16,11 +16,11 @@ do_configure() {
 	oe_runconf
 }
 
-do_compile_prepend() {
+do_compile:prepend() {
     export TARGET=${HOST_SYS}
 }
 
-do_install_prepend() {
+do_install:prepend() {
     export TARGET=${HOST_SYS}
 }
 
diff --git a/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb b/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
index 61fc027d..6f3ca463 100644
--- a/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
+++ b/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
@@ -13,11 +13,11 @@ do_configure() {
 	oe_runconf
 }
 
-do_compile_prepend() {
+do_compile:prepend() {
     export TARGET=${HOST_SYS}
 }
 
-do_install_prepend() {
+do_install:prepend() {
     export TARGET=${HOST_SYS}
 }
 
diff --git a/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb b/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb
index 68d144b1..7aa9a80d 100644
--- a/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb
+++ b/meta-openstack/recipes-devtools/erlang/erlang_R15B.bb
@@ -9,11 +9,11 @@ EXTRA_OEMAKE = "BUILD_CC='${BUILD_CC}'"
 
 EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
-EXTRA_OECONF_append_arm = " --disable-smp-support --disable-hipe"
-EXTRA_OECONF_append_armeb = " --disable-smp-support --disable-hipe"
-EXTRA_OECONF_append_mipsel = " --disable-smp-support --disable-hipe"
-EXTRA_OECONF_append_sh3 = " --disable-smp-support --disable-hipe"
-EXTRA_OECONF_append_sh4 = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:arm = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:armeb = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:mipsel = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:sh3 = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:sh4 = " --disable-smp-support --disable-hipe"
 
 NATIVE_BIN = "${TMPDIR}/work/erlang-native-${PV}-${PR}/otp_src_${UPSTREAM_VERSION}/bin"
 
diff --git a/meta-openstack/recipes-devtools/erlang/erlang_R16B03-1.bb b/meta-openstack/recipes-devtools/erlang/erlang_R16B03-1.bb
index 4c2b947f..91c88177 100644
--- a/meta-openstack/recipes-devtools/erlang/erlang_R16B03-1.bb
+++ b/meta-openstack/recipes-devtools/erlang/erlang_R16B03-1.bb
@@ -9,11 +9,11 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 EXTRA_OEMAKE = "BUILD_CC='${BUILD_CC}'"
 
-EXTRA_OECONF_append_arm = " --disable-smp-support --disable-hipe"
-EXTRA_OECONF_append_armeb = " --disable-smp-support --disable-hipe"
-EXTRA_OECONF_append_mipsel = " --disable-smp-support --disable-hipe"
-EXTRA_OECONF_append_sh3 = " --disable-smp-support --disable-hipe"
-EXTRA_OECONF_append_sh4 = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:arm = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:armeb = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:mipsel = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:sh3 = " --disable-smp-support --disable-hipe"
+EXTRA_OECONF:append:sh4 = " --disable-smp-support --disable-hipe"
 
 NATIVE_BIN = "${STAGING_LIBDIR_NATIVE}/erlang/bin"
 
diff --git a/meta-openstack/recipes-devtools/erlang/nativesdk-erlang_R16B03-1.bb b/meta-openstack/recipes-devtools/erlang/nativesdk-erlang_R16B03-1.bb
index 7196fc69..6d0fc564 100644
--- a/meta-openstack/recipes-devtools/erlang/nativesdk-erlang_R16B03-1.bb
+++ b/meta-openstack/recipes-devtools/erlang/nativesdk-erlang_R16B03-1.bb
@@ -21,15 +21,15 @@ do_configure() {
     oe_runconf
 }
 
-do_compile_prepend() {
+do_compile:prepend() {
     export TARGET=${HOST_SYS}
 }
 
-do_install_prepend() {
+do_install:prepend() {
     export TARGET=${HOST_SYS}
 }
 
-do_install_append() {
+do_install:append() {
     rm -f ${D}/${libdir}/erlang/Install
 }
 
diff --git a/meta-openstack/recipes-devtools/python/python-barbican_git.bb b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
index 8908e205..96d016b4 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
@@ -40,7 +40,7 @@ python () {
 }
 SERVICECREATE_PACKAGES[vardeps] += "KEYSTONE_HOST"
 
-do_install_append() {
+do_install:append() {
     TEMPLATE_CONF_DIR=${S}${sysconfdir}/${SRCNAME}
     BARBICAN_CONF_DIR=${D}${sysconfdir}/${SRCNAME}
 
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
index 1f18d7bb..5af40416 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
@@ -47,13 +47,13 @@ python () {
     d.setVarFlags("USERCREATE_PARAM_%s-reseller" % d.getVar('SRCNAME',True), flags)
 }
 
-do_configure_append() {
+do_configure:append() {
     # We are using postgresql support, hence this requirement is not valid
     # removing it, to avoid on-target runtime issues
     sed -e "s:MySQL-python::g" -i ${S}/requirements.txt
 }
 
-do_install_append() {
+do_install:append() {
     TEMPLATE_CONF_DIR=${S}${sysconfdir}/${SRCNAME}
     CEILOMETER_CONF_DIR=${D}${sysconfdir}/${SRCNAME}
 
diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index 8afe84db..d174ed48 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -44,7 +44,7 @@ CINDER_NFS_VOLUME_SERVERS ?= "${CINDER_NFS_VOLUME_SERVERS_DEFAULT}"
 CINDER_GLUSTERFS_VOLUME_SERVERS_DEFAULT = "controller:/glusterfs_volumes"
 CINDER_GLUSTERFS_VOLUME_SERVERS ?= "${CINDER_GLUSTERFS_VOLUME_SERVERS_DEFAULT}"
 
-do_install_append() {
+do_install:append() {
     TEMPLATE_CONF_DIR=${S}${sysconfdir}/${SRCNAME}
     CINDER_CONF_DIR=${D}${sysconfdir}/${SRCNAME}
     
diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
index bacb25f9..ae91bb0b 100644
--- a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
@@ -43,7 +43,7 @@ RDEPENDS_${PN} += " \
 PACKAGECONFIG ?= "bash-completion"
 PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}/${sysconfdir}/bash_completion.d
 	install -m 664 ${S}/tools/cinder.bash_completion ${D}/${sysconfdir}/bash_completion.d
 }
diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index f692963d..1f0cf2f8 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -56,13 +56,13 @@ python () {
 }
 SERVICECREATE_PACKAGES[vardeps] += "KEYSTONE_HOST"
 
-do_install_prepend() {
+do_install:prepend() {
     sed 's:%PYTHON_SITEPACKAGES_DIR%:${PYTHON_SITEPACKAGES_DIR}:g' -i ${S}/${SRCNAME}/tests/functional/__init__.py
     sed 's:%PYTHON_SITEPACKAGES_DIR%:${PYTHON_SITEPACKAGES_DIR}:g' -i ${S}/${SRCNAME}/tests/unit/base.py
     sed 's:%PYTHON_SITEPACKAGES_DIR%:${PYTHON_SITEPACKAGES_DIR}:g' -i ${S}/${SRCNAME}/tests/utils.py
 }
 
-do_install_append() {
+do_install:append() {
     SRC_SYSCONFDIR=${S}${sysconfdir}
     GLANCE_CONF_DIR=${D}${sysconfdir}/glance
 
diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
index a3102ffa..d96bc168 100644
--- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
@@ -57,7 +57,7 @@ python () {
     d.setVarFlags("SERVICECREATE_PARAM_%s-cfn" % d.getVar('SRCNAME',True), flags)
 }
 
-do_install_append() {
+do_install:append() {
     TEMPLATE_CONF_DIR=${S}${sysconfdir}/${SRCNAME}
     HEAT_CONF_DIR=${D}${sysconfdir}/${SRCNAME}
 
diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
index e0927f3c..391d7d2f 100644
--- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
@@ -39,7 +39,7 @@ inherit setuptools3
 PACKAGECONFIG ?= "bash-completion"
 PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}/${sysconfdir}/bash_completion.d
 	install -m 664 ${S}/tools/heat.bash_completion ${D}/${sysconfdir}/bash_completion.d
 }
diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index 26afe402..ebccbabd 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -102,7 +102,7 @@ USERADD_PARAM_${PN} = "--system -m -d ${localstatedir}/lib/openstack-dashboard -
 # no longer required. kept as reference.
 # do_install[dirs] += "${D}/usr/share/bin"
 
-do_install_append() {
+do_install:append() {
     SYSCONF_DIR=${D}${sysconfdir}
     DASHBOARD_CONF_DIR=${SYSCONF_DIR}/openstack-dashboard
     DASHBOARD_SHARE_DIR=${D}${datadir}/openstack-dashboard
diff --git a/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb b/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb
index e595180c..e522cd63 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 
 inherit python3-dir
 
-do_install_append() {
+do_install:append() {
     install -D -m 0644 hybrid_assignment.py ${D}/${PYTHON_SITEPACKAGES_DIR}/keystone/assignment/backends/hybrid_assignment.py
     install -D -m 0644 hybrid_identity.py ${D}/${PYTHON_SITEPACKAGES_DIR}/keystone/identity/backends/hybrid_identity.py
 }
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index a8cc9440..63a0e326 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -65,7 +65,7 @@ python () {
     d.setVarFlags("SERVICECREATE_PARAM_%s-setup" % d.getVar('SRCNAME',True), flags)
 }
 
-do_install_append() {
+do_install:append() {
 
     KEYSTONE_CONF_DIR=${D}${sysconfdir}/keystone
     KEYSTONE_PACKAGE_DIR=${D}${PYTHON_SITEPACKAGES_DIR}/keystone
diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index 315cb45a..0a669cc0 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -60,7 +60,7 @@ python () {
     d.setVarFlags("SERVICECREATE_PARAM_%s-setup" % d.getVar('SRCNAME',True), flags)
 }
 
-do_install_append() {
+do_install:append() {
     TEMPLATE_CONF_DIR=${S}${sysconfdir}/
     NEUTRON_CONF_DIR=${D}${sysconfdir}/neutron
 
diff --git a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
index f519bf7d..04a9b10d 100644
--- a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
@@ -48,7 +48,7 @@ inherit setuptools3 monitor rmargparse
 PACKAGECONFIG ?= "bash-completion"
 PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}/${sysconfdir}/bash_completion.d
 	install -m 664 ${S}/tools/neutron.bash_completion ${D}/${sysconfdir}/bash_completion.d
 }
diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index 8c643bd2..82e0484d 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 SRCNAME = "nova"
 
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
+FILESEXTRAPATHS:append := "${THISDIR}/${PN}"
 
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike \
            file://neutron-api-set-default-binding-vnic_type.patch \
@@ -82,7 +82,7 @@ python () {
     d.setVarFlags("SERVICECREATE_PARAM_%s-ec2" % d.getVar('SRCNAME',True), flags)
 }
 
-do_install_append() {
+do_install:append() {
     if [ ! -f "${WORKDIR}/nova.conf" ]; then
         return
     fi
diff --git a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
index f85ae4d3..d83c4754 100644
--- a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
@@ -42,7 +42,7 @@ RDEPENDS_${PN} += " \
 PACKAGECONFIG ?= "bash-completion"
 PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}/${sysconfdir}/bash_completion.d
 	install -m 664 ${S}/tools/nova.bash_completion ${D}/${sysconfdir}/bash_completion.d
 
diff --git a/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb b/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb
index 38351385..d897a67e 100644
--- a/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb
+++ b/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb
@@ -17,7 +17,7 @@ RDEPENDS_${PN} += "python-prettytable \
             python-pyflakes"
 
 
-do_install_append() {
+do_install:append() {
 	perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
 	for f in $perm_files; do
 		chmod 644 "${f}"
diff --git a/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb b/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb
index a5be175c..12579742 100644
--- a/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb
@@ -19,7 +19,7 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         "
 
-do_install_append() {
+do_install:append() {
         perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt" -o -name "requires.txt"`
         perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
         for f in $perm_files; do
diff --git a/meta-openstack/recipes-devtools/python/python-rally_git.bb b/meta-openstack/recipes-devtools/python/python-rally_git.bb
index ef864182..2ab75adb 100644
--- a/meta-openstack/recipes-devtools/python/python-rally_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-rally_git.bb
@@ -26,7 +26,7 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3 update-rc.d hosts identity default_configs
 
-do_install_append() {
+do_install:append() {
     RALLY_CONF_DIR=${D}${sysconfdir}/${SRCNAME}
     RALLY_PYTHON_SITEPACKAGES_DIR=${D}${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}
 
diff --git a/meta-openstack/recipes-devtools/python/python-swift_git.bb b/meta-openstack/recipes-devtools/python/python-swift_git.bb
index a5998eb3..e7c84fb2 100644
--- a/meta-openstack/recipes-devtools/python/python-swift_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-swift_git.bb
@@ -48,7 +48,7 @@ python () {
     d.setVarFlags("SERVICECREATE_PARAM_%s-setup" % d.getVar('SRCNAME',True), flags)
 }
 
-do_install_append() {
+do_install:append() {
     SWIFT_CONF_DIR=${D}${sysconfdir}/swift
 
     install -d ${SWIFT_CONF_DIR}
diff --git a/meta-openstack/recipes-devtools/python/python-tox.inc b/meta-openstack/recipes-devtools/python/python-tox.inc
index 66b13553..eb95b518 100644
--- a/meta-openstack/recipes-devtools/python/python-tox.inc
+++ b/meta-openstack/recipes-devtools/python/python-tox.inc
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += " \
         ${PYTHON_PN}-pytest \
         "
 
-do_install_append() {
+do_install:append() {
 
     install -d ${D}/${sysconfdir}/${SRCNAME}
     cp ${S}/tox.ini    ${D}/${sysconfdir}/${SRCNAME}
diff --git a/meta-openstack/recipes-devtools/python/python-trove_git.bb b/meta-openstack/recipes-devtools/python/python-trove_git.bb
index f5a75a0f..3f1867aa 100755
--- a/meta-openstack/recipes-devtools/python/python-trove_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-trove_git.bb
@@ -36,7 +36,7 @@ python () {
 }
 SERVICECREATE_PACKAGES[vardeps] += "KEYSTONE_HOST"
 
-do_install_append() {
+do_install:append() {
     TEMPLATE_CONF_DIR=${S}${sysconfdir}/${SRCNAME}
     TROVE_CONF_DIR=${D}${sysconfdir}/${SRCNAME}
     TROVE_LOG_DIR="/var/log/${SRCNAME}"
@@ -191,7 +191,7 @@ PACKAGES += " \
     ${SRCNAME}-taskmanager \
     "
 
-PACKAGES_prepend = " \
+PACKAGES:prepend = " \
     ${SRCNAME}-tests \
     "
 
diff --git a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
index 64ab1669..54375761 100644
--- a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
@@ -29,7 +29,7 @@ PACKAGES += " \
     ${SRCNAME}-bin \
     "
 
-PACKAGES_prepend = " \
+PACKAGES:prepend = " \
     ${SRCNAME}-tests \
     "
 
diff --git a/meta-openstack/recipes-devtools/python/python3-django-compressor_2.1.bb b/meta-openstack/recipes-devtools/python/python3-django-compressor_2.1.bb
index 40a0133b..3d554b31 100644
--- a/meta-openstack/recipes-devtools/python/python3-django-compressor_2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-django-compressor_2.1.bb
@@ -17,7 +17,7 @@ RDEPENDS_${PN} += " \
         python3-rjsmin  \
         "
 
-do_install_append() {
+do_install:append() {
     # Ensure permisive perms are granted
     find -L "${D}${PYTHON_SITEPACKAGES_DIR}/compressor" -type f -exec chmod 644 {} \;
     find -L "${D}${PYTHON_SITEPACKAGES_DIR}/compressor" -type d -exec chmod 755 {} \;
diff --git a/meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb b/meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb
index 648a7dd1..bcc67fc2 100644
--- a/meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-falcon_2.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "eea593cf466b9c126ce667f6d30503624ef24459f118c75594a69353b6
 inherit setuptools3 pypi
 
 # conflicting file prevention
-do_install_append() {
+do_install:append() {
 	rm -f ${D}${libdir}/python*/site-packages/tests/*
 }
 
diff --git a/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb b/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
index 56b6c798..c8f9135b 100644
--- a/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "850b4ee651128588a57e1e152dd1252e5ec39776a5d3d14ee892b8bac0
 
 inherit setuptools3 pypi
 
-do_install_append() {
+do_install:append() {
 	perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt")
 	perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
 	for f in $perm_files; do
diff --git a/meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb
index c8fe38af..3b01036c 100644
--- a/meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-keystoneclient_git.bb
@@ -46,7 +46,7 @@ RDEPENDS_${PN} += " \
         python3-stevedore \
         "
 
-do_install_append() {
+do_install:append() {
 	cp -r ${S}/examples ${D}${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}
 }
 
diff --git a/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb b/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
index 4bf9c0eb..1357bd05 100644
--- a/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "b095cbc77618f066d459a02b137b020c37da9f46d9b057704019c9f77d
 inherit setuptools3 pypi
 
 # conflicting file prevention
-do_install_append() {
+do_install:append() {
 	rm -f ${D}${libdir}/python*/site-packages/tests/*
 }
 
diff --git a/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
index 34b40def..98fec91f 100644
--- a/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-setuptools-git_1.2.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "ff64136da01aabba76ae88b050e7197918d8b2139ccbf6144e14d472b9
 inherit setuptools3 pypi
 
 # conflicting file prevention
-do_install_append() {
+do_install:append() {
 	rm -f ${D}${libdir}/python*/site-packages/site.py*
 }
 BBCLASSEXTEND = "native"
diff --git a/meta-openstack/recipes-devtools/python/python3-swiftclient_3.10.0.bb b/meta-openstack/recipes-devtools/python/python3-swiftclient_3.10.0.bb
index 1025d9e0..f2ab597f 100644
--- a/meta-openstack/recipes-devtools/python/python3-swiftclient_3.10.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-swiftclient_3.10.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "66227eaf29a691c70675fb9982022980b92797c273dd5e6dc7e680425e
 
 inherit pypi setuptools3 python3-dir
 
-do_install_append() {
+do_install:append() {
     cp -r test ${D}/${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/
 }
 
diff --git a/meta-openstack/recipes-devtools/ruby/erubis_git.bb b/meta-openstack/recipes-devtools/ruby/erubis_git.bb
index 08e0f281..540231a9 100644
--- a/meta-openstack/recipes-devtools/ruby/erubis_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/erubis_git.bb
@@ -21,7 +21,7 @@ SRC_URI = " \
 
 inherit ruby
 
-do_patch_append() {
+do_patch:append() {
     bb.build.exec_func('do_fixup_gemspec', d)
 }
 
diff --git a/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb b/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
index 768bc218..77c1282d 100644
--- a/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
+++ b/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} = "cool.io http-parser.rb msgpack serverengine sigdump strptime t
 
 inherit ruby
 
-do_install_append() {
+do_install:append() {
 	install -d ${D}/etc/fluent/
 	install ${S}/fluent.conf ${D}/etc/fluent/fluent.conf
 }
diff --git a/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb b/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
index db52ebd5..6bf809ed 100644
--- a/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
+++ b/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
@@ -16,7 +16,7 @@ DEPENDS = "git"
 inherit ruby
 
 # Download the submodules
-do_configure_prepend() {
+do_configure:prepend() {
 	cd ${WORKDIR}/git
 	git submodule update --init --recursive
 }
diff --git a/meta-openstack/recipes-extended/images/openstack-image-aio.bb b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
index 2fbb85e2..858c8e99 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-aio.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
@@ -27,7 +27,7 @@ inherit identity
 inherit monitor
 
 # check for 5G of free space, so we use 5G as a starting point.
-IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 5000000"
+IMAGE_ROOTFS_EXTRA_SPACE:append += "+ 5000000"
 
 POST_KEYSTONE_SETUP_COMMAND = "/etc/keystone/hybrid-backend-setup"
 
diff --git a/meta-openstack/recipes-extended/images/openstack-image-compute.bb b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
index 897efc42..15726fde 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-compute.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
@@ -19,6 +19,6 @@ inherit monitor
 
 # Ensure extra space for guest images, and rabbit MQ has a hard coded
 # check for 2G of free space, so we use 3G as a starting point.
-IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"
+IMAGE_ROOTFS_EXTRA_SPACE:append += "+ 3000000"
 
 # ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
diff --git a/meta-openstack/recipes-extended/images/openstack-image-controller.bb b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
index 6f324d84..7f41a086 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-controller.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
@@ -24,5 +24,5 @@ inherit monitor
 
 # Ensure extra space for guest images, and rabbit MQ has a hard coded
 # check for 2G of free space, so we use 5G as a starting point.
-IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 5000000"
+IMAGE_ROOTFS_EXTRA_SPACE:append += "+ 5000000"
 
diff --git a/meta-openstack/recipes-extended/libpam/libpam_openstack.inc b/meta-openstack/recipes-extended/libpam/libpam_openstack.inc
index ec858a7f..6ebb4a33 100644
--- a/meta-openstack/recipes-extended/libpam/libpam_openstack.inc
+++ b/meta-openstack/recipes-extended/libpam/libpam_openstack.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://common-account"
 SRC_URI += "file://common-auth"
@@ -9,7 +9,7 @@ SRC_URI += "file://common-session-noninteractive"
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
 PACKAGECONFIG[OpenLDAP] = ",,,pam-plugin-mkhomedir nss-pam-ldapd"
 
-do_install_append() {
+do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
         install -m 755 -d ${D}/etc/pam.d/
         install -m 644 ${WORKDIR}/common-account ${D}/etc/pam.d/
diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_openstack.inc b/meta-openstack/recipes-extended/libvirt/libvirt_openstack.inc
index 0b0f0114..8f6f8400 100644
--- a/meta-openstack/recipes-extended/libvirt/libvirt_openstack.inc
+++ b/meta-openstack/recipes-extended/libvirt/libvirt_openstack.inc
@@ -5,9 +5,9 @@ PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
 
 inherit useradd
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN}_append = " ;--system libvirt"
+GROUPADD_PARAM_${PN}:append = " ;--system libvirt"
 
-do_install_append() {
+do_install:append() {
 	sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i ${D}/etc/libvirt/libvirtd.conf
 	sed -e "s:^#unix_sock_rw_perms =:unix_sock_rw_perms =:g" -i ${D}/etc/libvirt/libvirtd.conf
 }
diff --git a/meta-openstack/recipes-extended/lighttpd/lighttpd_openstack.inc b/meta-openstack/recipes-extended/lighttpd/lighttpd_openstack.inc
index 33b1f61c..73cc86a8 100644
--- a/meta-openstack/recipes-extended/lighttpd/lighttpd_openstack.inc
+++ b/meta-openstack/recipes-extended/lighttpd/lighttpd_openstack.inc
@@ -1,3 +1,3 @@
-do_install_append() {
+do_install:append() {
 	sed -i '2i port=`grep "^server.port" /etc/lighttpd.conf`; if [ -z $port ]; then echo "server port not configured, not running lighttpd..."; exit 0; fi' ${D}/etc/init.d/lighttpd
 }
diff --git a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
index 933f5efd..a88c8ead 100644
--- a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
+++ b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
@@ -32,7 +32,7 @@ EXTRA_OEMAKE += " CPPFLAGS=-Wno-unused-function \
         pythondir=${PYTHON_SITEPACKAGES_DIR} \
 "
 
-do_install_append() {
+do_install:append() {
      install -d ${D}${sysconfdir}/init.d
      install -m 0755 ${WORKDIR}/qpidd ${D}${sysconfdir}/init.d/qpidd
 }
diff --git a/meta-openstack/recipes-extended/tempest/tempest_git.bb b/meta-openstack/recipes-extended/tempest/tempest_git.bb
index 48a286ce..9bff98c2 100644
--- a/meta-openstack/recipes-extended/tempest/tempest_git.bb
+++ b/meta-openstack/recipes-extended/tempest/tempest_git.bb
@@ -61,7 +61,7 @@ python () {
     d.setVarFlags("USERCREATE_PARAM_%s-setup-admin" % d.getVar('SRCNAME',True), flags)
 }
 
-do_install_append() {
+do_install:append() {
     TEMPLATE_CONF_DIR=${S}${sysconfdir}/
     TEMPEST_CONF_DIR=${D}${sysconfdir}/${SRCNAME}
 
diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc b/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc
index cc774fed..4faab108 100644
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto_openstack.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto:"
 
 SRC_URI += "file://enable-veth.cfg \
             file://enable-iscsi-tcp.cfg \
diff --git a/meta-openstack/recipes-support/chef/chef_git.bb b/meta-openstack/recipes-support/chef/chef_git.bb
index 86e4165a..5960dd0c 100644
--- a/meta-openstack/recipes-support/chef/chef_git.bb
+++ b/meta-openstack/recipes-support/chef/chef_git.bb
@@ -67,6 +67,6 @@ RUBY_INSTALL_GEMS = "pkg/chef-${BPV}.gem"
 FILES_${PN} += "${libdir}/ruby/gems/2.2.0/build_info"
 FILES_${PN} += "${libdir}/ruby/gems/2.2.0/extensions"
 
-do_install_prepend() {
+do_install:prepend() {
 	rake gem
 }
diff --git a/meta-openstack/recipes-support/dnsmasq/dnsmasq_openstack.inc b/meta-openstack/recipes-support/dnsmasq/dnsmasq_openstack.inc
index 0c979fea..d731da26 100644
--- a/meta-openstack/recipes-support/dnsmasq/dnsmasq_openstack.inc
+++ b/meta-openstack/recipes-support/dnsmasq/dnsmasq_openstack.inc
@@ -1,4 +1,4 @@
-do_install_append() {
+do_install:append() {
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
 }
diff --git a/meta-openstack/recipes-support/iproute2/iproute2_openstack.inc b/meta-openstack/recipes-support/iproute2/iproute2_openstack.inc
index 2fde00dc..97e372a9 100644
--- a/meta-openstack/recipes-support/iproute2/iproute2_openstack.inc
+++ b/meta-openstack/recipes-support/iproute2/iproute2_openstack.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
+FILESEXTRAPATHS:append := "${THISDIR}/${PN}"
 
 RRECOMMENDS_${PN} += "kernel-module-veth \
 	"
diff --git a/meta-openstack/recipes-support/memcached/memcached_1.5.3.bb b/meta-openstack/recipes-support/memcached/memcached_1.5.3.bb
index b2d776b1..d65e699e 100644
--- a/meta-openstack/recipes-support/memcached/memcached_1.5.3.bb
+++ b/meta-openstack/recipes-support/memcached/memcached_1.5.3.bb
@@ -53,7 +53,7 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_PACKAGES = "memcached"
 SYSTEMD_SERVICE_${PN} = "memcached.service"
 
-do_install_append() {
+do_install:append() {
     install -D -m 755 ${S}/scripts/memcached-init ${D}${sysconfdir}/init.d/memcached
     
     mkdir -p ${D}/usr/share/memcached/scripts
diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
index 73dab13a..da49953d 100644
--- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
+++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
@@ -45,7 +45,7 @@ CFLAGS += " -I${STAGING_INCDIR}/apache2"
 FILES_${PN} += "/etc/apache2/"
 FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"
 
-do_install_append() {
+do_install:append() {
 	mkdir -p ${D}/etc/apache2/modules.d/
 	echo "LoadModule wsgi_module ${libexecdir}/apache2/modules/mod_wsgi.so" > \
 	  ${D}/etc/apache2/modules.d/wsgi.load
diff --git a/meta-openstack/recipes-support/openldap/openldap_openstack.inc b/meta-openstack/recipes-support/openldap/openldap_openstack.inc
index 63f6064f..bda1875b 100644
--- a/meta-openstack/recipes-support/openldap/openldap_openstack.inc
+++ b/meta-openstack/recipes-support/openldap/openldap_openstack.inc
@@ -1,7 +1,7 @@
 DEPEND_${PN} += "cyrus-sasl" 
 RDEPEND_${PN} += "libsasl2-modules"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 SRC_URI += "file://initscript"
 SRC_URI += "file://ops-base.ldif"
 
@@ -12,7 +12,7 @@ OPENLDAP_LIBEXECDIR = "${libexecdir}"
 
 EXTRA_OECONF += "--libexecdir=${OPENLDAP_LIBEXECDIR}"
 
-do_install_append() {
+do_install:append() {
     install -D -m 0755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/openldap
     sed -i -e 's/%DEFAULT_DN%/${LDAP_DN}/g' ${D}${sysconfdir}/init.d/openldap
     sed -i -e 's#%LDAP_DATADIR%#${LDAP_DATADIR}#g' ${D}${sysconfdir}/init.d/openldap
diff --git a/meta-openstack/recipes-support/salt/salt_3001.1.bb b/meta-openstack/recipes-support/salt/salt_3001.1.bb
index 9b485d69..ac5f5a78 100644
--- a/meta-openstack/recipes-support/salt/salt_3001.1.bb
+++ b/meta-openstack/recipes-support/salt/salt_3001.1.bb
@@ -58,7 +58,7 @@ PACKAGES += "\
            ${PN}-zsh-completion \
 "
 
-do_install_append() {
+do_install:append() {
         install -Dm644 ${S}/pkg/salt-common.logrotate ${D}${sysconfdir}/logrotate.d/${PN}
         install -Dm644 ${S}/pkg/salt.bash ${D}${datadir}/bash-completion/completions/${PN}
         install -Dm644 ${S}/pkg/zsh_completion.zsh ${D}${datadir}/zsh/site-functions/_${PN}
@@ -90,7 +90,7 @@ DESCRIPTION_${PN}-minion = "${DESCRIPTION_COMMON} This particular package provid
 RDEPENDS_${PN}-minion = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack python3-pycryptodomex (>= 3.9.7)"
 RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python3-pycrypto python3-pyzmq (>= 13.1.0)', '',d)}"
 RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python3-pycrypto', '',d)}"
-RRECOMMENDS_${PN}-minion_append_x64 = "dmidecode"
+RRECOMMENDS_${PN}-minion:append_x64 = "dmidecode"
 RSUGGESTS_${PN}-minion = "python3-augeas"
 CONFFILES_${PN}-minion = "${sysconfdir}/${PN}/minion"
 FILES_${PN}-minion = "${bindir}/${PN}-minion ${sysconfdir}/${PN}/minion.d/ ${CONFFILES_${PN}-minion} ${bindir}/${PN}-proxy ${systemd_system_unitdir}/salt-minion.service"
diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index a49d4a16..9f9c42c2 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://${GO_IMPORT}.git;branch=main \
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN}-dev_append = " bash"
+RDEPENDS_${PN}-dev:append = " bash"
 
 # Temporarily workaround an issue with GO 1.12.1
 # http://www.lyddzz.com/github_/golang/go/issues/30768
@@ -28,11 +28,11 @@ COMPATIBLE_HOST_mipsarch = "null"
 SYSTEMD_SERVICE_${PN} = "consul.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
-do_compile_prepend () {
+do_compile:prepend () {
     export GO111MODULE=off
 }
 
-do_install_append() {
+do_install:append() {
     install -d ${D}/${systemd_unitdir}/system
     cp ${WORKDIR}/consul.service ${D}/${systemd_unitdir}/system
 }
diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtools/python/python-ansible.inc
index f1b3771a..2b8d655e 100644
--- a/recipes-devtools/python/python-ansible.inc
+++ b/recipes-devtools/python/python-ansible.inc
@@ -16,7 +16,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 ANSIBLE_WHITELIST_MODULES ?= "commands files system network/ovs __pycache__ service"
 
-do_install_append() {
+do_install:append() {
     set +e
 
     # install hosts and conf
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 81ea65e1..c8ff71f0 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -52,8 +52,8 @@ EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
                "
 
 PACKAGECONFIG ??= "georeplication libibverbs"
-PACKAGECONFIG_remove_mipsarch = "libibverbs"
-PACKAGECONFIG_remove_arm = "libibverbs"
+PACKAGECONFIG:remove:mipsarch = "libibverbs"
+PACKAGECONFIG:remove:arm = "libibverbs"
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
 PACKAGECONFIG[georeplication] = "--enable-georeplication,--disable-georeplication,,rsync"
@@ -61,7 +61,7 @@ PACKAGECONFIG[libibverbs] = "--enable-ibverbs,--disable-ibverbs,virtual/libibver
 PACKAGECONFIG[ocf] = "--with-ocf,--without-ocf,,"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
 
-do_install_append() {
+do_install:append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/glusterd.init \
         ${D}${sysconfdir}/init.d/glusterd
diff --git a/recipes-extended/librdmacm/librdmacm_1.1.0.bb b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
index edf92f01..12b94a37 100644
--- a/recipes-extended/librdmacm/librdmacm_1.1.0.bb
+++ b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
@@ -35,7 +35,7 @@ FILES_${PN}-dbg += "${libdir}/rsocket/.debug"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
 
-do_install_append() {
+do_install:append() {
         rm -f ${D}${libdir}/librdmacm.la
         rm -f ${D}${libdir}/rsocket/librspreload.la
 }
diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
index 98fb4425..ef4d2e73 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
@@ -12,7 +12,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 SECTION = "base"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
 SRC_URI = "\
 	http://arthurdejong.org/nss-pam-ldapd/${BPN}-${PV}.tar.gz \
@@ -41,7 +41,7 @@ FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
 LDAP_DN ?= "dc=my-domain,dc=com"
 
-do_install_append() {
+do_install:append() {
 	install -D -m 0755 ${WORKDIR}/nslcd.init ${D}${sysconfdir}/init.d/nslcd
 
 	sed -i -e 's/^uid nslcd/# uid nslcd/;' ${D}${sysconfdir}/nslcd.conf
diff --git a/recipes-support/openldap/openldap_2.4.39.bb b/recipes-support/openldap/openldap_2.4.39.bb
index 3048c8ee..d52b1a12 100644
--- a/recipes-support/openldap/openldap_2.4.39.bb
+++ b/recipes-support/openldap/openldap_2.4.39.bb
@@ -164,7 +164,7 @@ PACKAGECONFIG[proxycache] = "--enable-proxycache=mod,--enable-proxycache=no,"
 #--enable-mdb         enable mdb database backend no|yes|mod no
 PACKAGECONFIG[mdb] = "--enable-mdb=mod,--enable-mdb=no,"
 
-CPPFLAGS_append = " -D_GNU_SOURCE"
+CPPFLAGS:append = " -D_GNU_SOURCE"
 
 do_configure() {
     cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain.sh ${S}/build
diff --git a/recipes-support/puppet-vswitch/puppet-vswitch_git.bb b/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
index 86922aef..a1cce85f 100644
--- a/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
+++ b/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
@@ -28,5 +28,5 @@ RDEPENDS_${PN} += " \
 
 RUBY_INSTALL_GEMS = "puppet-vswitch-${PV}.gem"
 
-do_install_append() {
+do_install:append() {
 }
diff --git a/recipes-support/puppet/puppet_5.4.0.bb b/recipes-support/puppet/puppet_5.4.0.bb
index 54574e49..3937d433 100644
--- a/recipes-support/puppet/puppet_5.4.0.bb
+++ b/recipes-support/puppet/puppet_5.4.0.bb
@@ -36,7 +36,7 @@ SYSTEMD_AUTO_ENABLE = "enable"
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
-do_install_append() {
+do_install:append() {
     install -d ${D}${sysconfdir}/puppet
     install -d ${D}${sysconfdir}/puppet/manifests
     install -d ${D}${sysconfdir}/puppet/modules
diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
index 7198ce05..4d8e962c 100644
--- a/recipes-support/spice/spice_git.bb
+++ b/recipes-support/spice/spice_git.bb
@@ -66,11 +66,11 @@ LICENSE_${PN}-protocol = "BSD"
 FILES_${PN}-protocol += "${includedir}/spice-1"
 FILES_${PN}-protocol += "${datadir}/pkgconfig"
 
-do_configure_prepend() {
+do_configure:prepend() {
 	mkdir -p ${S}/spice-common/spice-protocol/m4
 }
 
-do_install_append() {
+do_install:append() {
 	cd ${B}/spice-common/spice-protocol
 	oe_runmake DESTDIR="${D}" install
 	cd -
-- 
2.25.1

