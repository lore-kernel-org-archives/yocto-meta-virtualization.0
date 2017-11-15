Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF708E00CD4; Wed, 15 Nov 2017 10:00:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53D1AE009B4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 09:59:54 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAFHxs1C003340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 09:59:54 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 15 Nov 2017 09:59:53 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 15 Nov 2017 12:59:53 -0500
Message-ID: <1510768793-27481-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] python-*: fixup postinst scripts
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
X-List-Received-Date: Wed, 15 Nov 2017 18:00:12 -0000
Content-Type: text/plain

Checking for "$D" and doing an "exit 1" now results in errors such as:

[log_check] warning: %post(keystone-cronjobs-...) scriptlet failed, exit status 2

during image creation. Instead of escaping the script for "level-1"
(image creation postinst) we wrap the "level-2" (first boot) postinst
in an if statement. This also ensure the scriptlet in
indentity.bbclass is less prone to behaving differently based on the
postinsts defined in the classes which inherit 'identity'.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/classes/identity.bbclass            | 11 +++--
 .../recipes-devtools/python/python-barbican_git.bb |  8 ++--
 .../python/python-ceilometer_git.bb                | 24 +++++------
 .../recipes-devtools/python/python-cinder_git.bb   | 48 ++++++++++-----------
 .../recipes-devtools/python/python-glance_git.bb   | 24 +++++------
 .../recipes-devtools/python/python-heat_git.bb     | 24 +++++------
 .../recipes-devtools/python/python-keystone_git.bb | 50 +++++++++++-----------
 .../recipes-devtools/python/python-neutron_git.bb  | 32 ++++++--------
 .../recipes-devtools/python/python-nova_git.bb     | 42 ++++++++----------
 .../recipes-devtools/python/python-rally_git.bb    | 28 ++++++------
 .../recipes-devtools/python/python-swift_git.bb    | 40 ++++++++---------
 .../recipes-devtools/python/python-trove_git.bb    | 45 ++++++++++---------
 .../postgresql/postgresql_9.%.bbappend             | 14 +++---
 13 files changed, 185 insertions(+), 205 deletions(-)

diff --git a/meta-openstack/classes/identity.bbclass b/meta-openstack/classes/identity.bbclass
index c4b1394..1f4f408 100644
--- a/meta-openstack/classes/identity.bbclass
+++ b/meta-openstack/classes/identity.bbclass
@@ -163,9 +163,11 @@ python populate_packages_append () {
 
         postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
         if not postinst:
-            postinst = '    if [ "x$D" != "x" ]; then\n' + \
-                       '        exit 1\n' + \
-                       '    fi\n'
+            postinst = ''
+
+        # Only execute on target. Header.
+        postinst += '    if [ -z "$D" ]; then\n'
+
         postinst += servicecreate_postinst_common_copy
 
         if d.getVar('USERCREATE_PARAM_%s' % pkg, True):
@@ -176,6 +178,9 @@ python populate_packages_append () {
             servicecreate_postinst_service = servicecreate_postinst_service_copy.replace("SERVICECREATE_PARAM", servicecreate_param(d, pkg))
             postinst += servicecreate_postinst_service
 
+        # Footer.
+        postinst += '    fi\n'
+
         d.setVar('pkg_postinst_%s' % pkg, postinst)
         bb.debug(1, 'pkg_postinst_%s = %s' % (pkg, d.getVar('pkg_postinst_%s' % pkg, True)))
 }
diff --git a/meta-openstack/recipes-devtools/python/python-barbican_git.bb b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
index 0b3d768..579413c 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
@@ -85,12 +85,10 @@ FILES_${SRCNAME} = "${sysconfdir}/${SRCNAME}/* \
 
 ALLOW_EMPTY_${SRCNAME}-setup = "1"
 pkg_postinst_${SRCNAME}-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "$D" ]; then
+        chown -R barbican:barbican ${sysconfdir}/${SRCNAME}
+        chown -R barbican:barbican ${localstatedir}/lib/barbican
     fi
-
-    chown -R barbican:barbican ${sysconfdir}/${SRCNAME}
-    chown -R barbican:barbican ${localstatedir}/lib/barbican
 }
 
 DEPENDS += " \
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
index 5645626..4b01022 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
@@ -108,20 +108,18 @@ do_install_append() {
 }
 
 pkg_postinst_${SRCNAME}-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "$D" ]; then
+        # This is to make sure postgres is configured and running
+        if ! pidof postmaster > /dev/null; then
+           /etc/init.d/postgresql-init
+           /etc/init.d/postgresql start
+           sleep 2
+        fi
+
+        mkdir /var/log/ceilometer
+        sudo -u postgres createdb ceilometer
+        ceilometer-dbsync
     fi
-
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-       /etc/init.d/postgresql-init
-       /etc/init.d/postgresql start
-       sleep 2
-    fi
-    
-    mkdir /var/log/ceilometer
-    sudo -u postgres createdb ceilometer
-    ceilometer-dbsync
 }
 
 inherit setuptools identity hosts update-rc.d default_configs monitor
diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index e70a3aa..9f70beb 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -124,31 +124,29 @@ do_install_append() {
 }
 
 pkg_postinst_${SRCNAME}-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-       /etc/init.d/postgresql-init
-       /etc/init.d/postgresql start
-    fi
-
-    if [ ! -d /var/log/cinder ]; then
-       mkdir /var/log/cinder
-    fi
-
-    sudo -u postgres createdb cinder
-    cinder-manage db sync
-
-    # Create Cinder nfs_share config file with default nfs server
-    if [ ! -f /etc/cinder/nfs_shares ]; then
-        /bin/bash /etc/cinder/drivers/nfs_setup.sh
-    fi
-
-    # Create Cinder glusterfs_share config file with default glusterfs server
-    if [ ! -f /etc/cinder/glusterfs_shares ] && [ -f /usr/sbin/glusterfsd ]; then
-        /bin/bash /etc/cinder/drivers/glusterfs_setup.sh
+    if [ -z "$D" ]; then
+	 # This is to make sure postgres is configured and running
+	 if ! pidof postmaster > /dev/null; then
+	    /etc/init.d/postgresql-init
+	    /etc/init.d/postgresql start
+	 fi
+
+	 if [ ! -d /var/log/cinder ]; then
+	    mkdir /var/log/cinder
+	 fi
+
+	 sudo -u postgres createdb cinder
+	 cinder-manage db sync
+
+	 # Create Cinder nfs_share config file with default nfs server
+	 if [ ! -f /etc/cinder/nfs_shares ]; then
+	     /bin/bash /etc/cinder/drivers/nfs_setup.sh
+	 fi
+
+	 # Create Cinder glusterfs_share config file with default glusterfs server
+	 if [ ! -f /etc/cinder/glusterfs_shares ] && [ -f /usr/sbin/glusterfsd ]; then
+	     /bin/bash /etc/cinder/drivers/glusterfs_setup.sh
+	 fi
     fi
 }
 
diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index 27c33b9..4042f1b 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -122,20 +122,18 @@ do_install_append() {
 }
 
 pkg_postinst_${SRCNAME}-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "$D" ]; then
+	# This is to make sure postgres is configured and running
+	if ! pidof postmaster > /dev/null; then
+	   /etc/init.d/postgresql-init
+	   /etc/init.d/postgresql start
+	   sleep 5
+	fi
+
+	mkdir /var/log/glance
+	sudo -u postgres createdb glance
+	glance-manage db_sync
     fi
-    
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-       /etc/init.d/postgresql-init
-       /etc/init.d/postgresql start
-       sleep 5
-    fi
-    
-    mkdir /var/log/glance
-    sudo -u postgres createdb glance
-    glance-manage db_sync
 }
 
 PACKAGES += " ${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-setup ${SRCNAME}-api ${SRCNAME}-registry"
diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
index cccaf0a..2cf7ce4 100644
--- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
@@ -107,20 +107,18 @@ do_install_append() {
 }
 
 pkg_postinst_${SRCNAME}-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "$D" ]; then
+	# This is to make sure postgres is configured and running
+	if ! pidof postmaster > /dev/null; then
+	   /etc/init.d/postgresql-init
+	   /etc/init.d/postgresql start
+	   sleep 2
+	fi
+
+	mkdir /var/log/heat
+	sudo -u postgres createdb heat
+	heat-manage db_sync
     fi
-    
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-       /etc/init.d/postgresql-init
-       /etc/init.d/postgresql start
-       sleep 2
-    fi
-    
-    mkdir /var/log/heat
-    sudo -u postgres createdb heat
-    heat-manage db_sync
 }
 
 inherit setuptools identity hosts update-rc.d default_configs monitor
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index 79bd0c8..a26c9bf 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -189,28 +189,26 @@ role_tree_dn = ou=Roles,${LDAP_DN} \
 
 pkg_postinst_${SRCNAME}-setup () {
     # python-keystone postinst start
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-        /etc/init.d/postgresql-init
-        /etc/init.d/postgresql start
-        sleep 2
-    fi
-
-    # This is to make sure keystone is configured and running
-    PIDFILE="/var/run/keystone-all.pid"
-    if [ -z `cat $PIDFILE 2>/dev/null` ]; then
-        sudo -u postgres createdb keystone
-        keystone-manage db_sync
-        keystone-manage pki_setup --keystone-user=root --keystone-group=daemon
-
-        if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
-            /etc/init.d/openldap start
-        fi
-        /etc/init.d/keystone start
+    if [ -z "$D" ]; then
+	# This is to make sure postgres is configured and running
+	if ! pidof postmaster > /dev/null; then
+	    /etc/init.d/postgresql-init
+	    /etc/init.d/postgresql start
+	    sleep 2
+	fi
+
+	# This is to make sure keystone is configured and running
+	PIDFILE="/var/run/keystone-all.pid"
+	if [ -z `cat $PIDFILE 2>/dev/null` ]; then
+	    sudo -u postgres createdb keystone
+	    keystone-manage db_sync
+	    keystone-manage pki_setup --keystone-user=root --keystone-group=daemon
+
+	    if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
+		/etc/init.d/openldap start
+	    fi
+	    /etc/init.d/keystone start
+	fi
     fi
 }
 
@@ -219,9 +217,11 @@ pkg_postinst_${SRCNAME}-setup () {
 KEYSTONE_TOKEN_FLUSH_TIME ??= "0 0 */2 * *"
 
 pkg_postinst_${SRCNAME}-cronjobs () {
-    # By default keystone expired tokens are not automatic removed out of the
-    # database.  So we create a cronjob for cleaning these expired tokens.
-    echo "${KEYSTONE_TOKEN_FLUSH_TIME} root /usr/bin/keystone-manage token_flush" >> /etc/crontab
+    if [ -z "$D" ]; then
+	# By default keystone expired tokens are not automatic removed out of the
+	# database.  So we create a cronjob for cleaning these expired tokens.
+	echo "${KEYSTONE_TOKEN_FLUSH_TIME} root /usr/bin/keystone-manage token_flush" >> /etc/crontab
+    fi
 }
 
 PACKAGES += " ${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-setup ${SRCNAME}-cronjobs"
diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index 51c2ac4..c837401 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -138,29 +138,25 @@ do_install_append() {
 }
 
 pkg_postinst_${SRCNAME}-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "$D" ]; then
+	# This is to make sure postgres is configured and running
+	if ! pidof postmaster > /dev/null; then
+	    /etc/init.d/postgresql-init
+	    /etc/init.d/postgresql start
+	    sleep 2
+	fi
+
+	sudo -u postgres createdb neutron
+	sudo neutron-db-manage --config-file /etc/neutron/neutron.conf  \
+			       --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head
     fi
-
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-        /etc/init.d/postgresql-init
-        /etc/init.d/postgresql start
-        sleep 2
-    fi
-
-    sudo -u postgres createdb neutron
-    sudo neutron-db-manage --config-file /etc/neutron/neutron.conf  \
-                           --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head
 }
 
 pkg_postinst_${SRCNAME}-plugin-openvswitch-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "$D" ]; then
+	/etc/init.d/openvswitch-switch start
+	ovs-vsctl --no-wait -- --may-exist add-br br-int
     fi
-   
-    /etc/init.d/openvswitch-switch start
-    ovs-vsctl --no-wait -- --may-exist add-br br-int
 }
 
 ALLOW_EMPTY_${SRCNAME}-setup = "1"
diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index f3a6b86..7b560a7 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -160,33 +160,29 @@ do_install_append() {
 }
 
 pkg_postinst_${SRCNAME}-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "$D" ]; then
+	# This is to make sure postgres is configured and running
+	if ! pidof postmaster > /dev/null; then
+	   /etc/init.d/postgresql-init
+	   /etc/init.d/postgresql start
+	   sleep 5
+	fi
+
+	sudo -u postgres createdb nova
+	sleep 2
+	nova-manage db sync
     fi
-
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-       /etc/init.d/postgresql-init
-       /etc/init.d/postgresql start
-       sleep 5
-    fi
-
-    sudo -u postgres createdb nova
-    sleep 2
-    nova-manage db sync
 }
 
 pkg_postinst_${SRCNAME}-common () {
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-
-    if [ -d  /home/root ]; then
-        echo "source /etc/nova/openrc" >> /home/root/.bashrc
-	echo "source /etc/nova/openrc" >> /home/root/.profile
-    else
-        echo "source /etc/nova/openrc" >> /root/.bashrc
-	echo "source /etc/nova/openrc" >> /root/.profile
+    if [ -z "$D" ]; then
+	if [ -d  /home/root ]; then
+	    echo "source /etc/nova/openrc" >> /home/root/.bashrc
+	    echo "source /etc/nova/openrc" >> /home/root/.profile
+	else
+	    echo "source /etc/nova/openrc" >> /root/.bashrc
+	    echo "source /etc/nova/openrc" >> /root/.profile
+	fi
     fi
 }
 
diff --git a/meta-openstack/recipes-devtools/python/python-rally_git.bb b/meta-openstack/recipes-devtools/python/python-rally_git.bb
index d29e7cb..31d4242 100644
--- a/meta-openstack/recipes-devtools/python/python-rally_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-rally_git.bb
@@ -63,22 +63,20 @@ do_install_append() {
 }
 
 pkg_postinst_${SRCNAME}-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "$D" ]; then
+	# This is to make sure postgres is configured and running
+	if ! pidof postmaster > /dev/null; then
+	   /etc/init.d/postgresql-init
+	   /etc/init.d/postgresql start
+	fi
+
+	if [ ! -d /var/log/rally ]; then
+	   mkdir /var/log/rally
+	fi
+
+	sudo -u postgres createdb rally
+	rally-manage db recreate
     fi
-
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-       /etc/init.d/postgresql-init
-       /etc/init.d/postgresql start
-    fi
-
-    if [ ! -d /var/log/rally ]; then
-       mkdir /var/log/rally
-    fi
-
-    sudo -u postgres createdb rally
-    rally-manage db recreate
 }
 
 PACKAGES += "${SRCNAME}-tests ${SRCNAME}-api ${SRCNAME} ${SRCNAME}-setup"
diff --git a/meta-openstack/recipes-devtools/python/python-swift_git.bb b/meta-openstack/recipes-devtools/python/python-swift_git.bb
index 8552ea7..fc7c258 100644
--- a/meta-openstack/recipes-devtools/python/python-swift_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-swift_git.bb
@@ -109,28 +109,26 @@ do_install_append() {
 }
 
 pkg_postinst_${SRCNAME}-setup () {
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "x$D" ]; then
+	CLUSTER_CONF=/etc/swift/cluster.conf
+	SWIFT_SETUP='/bin/bash /etc/swift/swift_setup.sh'
+
+	for i in `seq 1 3`; do
+	    BACKING_FILE=/etc/swift/swift_backing_$i
+	    if [ "x${SWIFT_BACKING_FILE_SIZE}" != "x0G" ]; then
+		truncate -s ${SWIFT_BACKING_FILE_SIZE} $BACKING_FILE
+		sed "s:%SWIFT_BACKING_FILE_${i}%:$BACKING_FILE:g" -i $CLUSTER_CONF
+	    else
+		sed "s:%SWIFT_BACKING_FILE_${i}%::g" -i $CLUSTER_CONF
+	    fi
+	done
+
+	$SWIFT_SETUP createrings
+	$SWIFT_SETUP formatdevs
+	$SWIFT_SETUP mountdevs
+	$SWIFT_SETUP -i "${CONTROLLER_IP}" adddevs
+	$SWIFT_SETUP unmountdevs
     fi
-
-    CLUSTER_CONF=/etc/swift/cluster.conf
-    SWIFT_SETUP='/bin/bash /etc/swift/swift_setup.sh'
-
-    for i in `seq 1 3`; do
-        BACKING_FILE=/etc/swift/swift_backing_$i
-        if [ "x${SWIFT_BACKING_FILE_SIZE}" != "x0G" ]; then
-            truncate -s ${SWIFT_BACKING_FILE_SIZE} $BACKING_FILE
-            sed "s:%SWIFT_BACKING_FILE_${i}%:$BACKING_FILE:g" -i $CLUSTER_CONF
-        else
-            sed "s:%SWIFT_BACKING_FILE_${i}%::g" -i $CLUSTER_CONF
-        fi
-    done
-
-    $SWIFT_SETUP createrings
-    $SWIFT_SETUP formatdevs
-    $SWIFT_SETUP mountdevs
-    $SWIFT_SETUP -i "${CONTROLLER_IP}" adddevs
-    $SWIFT_SETUP unmountdevs
 }
 
 PACKAGES += "${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-setup"
diff --git a/meta-openstack/recipes-devtools/python/python-trove_git.bb b/meta-openstack/recipes-devtools/python/python-trove_git.bb
index 830da92..b90e552 100755
--- a/meta-openstack/recipes-devtools/python/python-trove_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-trove_git.bb
@@ -146,30 +146,29 @@ do_install_append() {
 
 pkg_postinst_${SRCNAME}-setup () {
     # python-trove-setup postinst start
-    if [ "x$D" != "x" ]; then
-        exit 1
+    if [ -z "$D" ]; then
+	source /etc/nova/openrc
+
+	# This is to make sure postgres is configured and running
+	if ! pidof postmaster > /dev/null; then
+	   /etc/init.d/postgresql-init
+	   /etc/init.d/postgresql start
+	   sleep 5
+	fi
+
+	mkdir /var/log/trove
+	# Create database for trove.
+	sudo -u postgres createdb trove
+
+	# Create default trove database.
+	trove-manage db_sync
+	# Create new datastore.
+	trove-manage datastore_update "postgresql" ""
+	# Set up new version
+	trove-manage datastore_version_update "postgresql" "9.1" "postgresql" 1 "postgresql-server-9.1" 1
+	# Set new default version.
+	trove-manage datastore_update "postgresql" "9.1"
     fi
-    source /etc/nova/openrc
-
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-       /etc/init.d/postgresql-init
-       /etc/init.d/postgresql start
-       sleep 5
-    fi
-
-    mkdir /var/log/trove
-    # Create database for trove.
-    sudo -u postgres createdb trove
-
-    # Create default trove database.
-    trove-manage db_sync
-    # Create new datastore.
-    trove-manage datastore_update "postgresql" ""
-    # Set up new version
-    trove-manage datastore_version_update "postgresql" "9.1" "postgresql" 1 "postgresql-server-9.1" 1
-    # Set new default version.
-    trove-manage datastore_update "postgresql" "9.1"
 }
 
 
diff --git a/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
index 22dae71..b26054e 100644
--- a/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
+++ b/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
@@ -41,14 +41,12 @@ ALLOW_EMPTY_${PN}-setup = "1"
 
 pkg_postinst_${PN}-setup () {
     # postgres 9.2.4 postinst
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-      
-    /etc/init.d/postgresql-init
-    if [ $? -ne 0 ]; then
-        echo "[ERROR] postgres: unable to create admin account"
-        exit 1
+    if [ -z "$D" ]; then
+	/etc/init.d/postgresql-init
+	if [ $? -ne 0 ]; then
+	    echo "[ERROR] postgres: unable to create admin account"
+	    exit 1
+	fi
     fi
 }
 
-- 
2.7.4


