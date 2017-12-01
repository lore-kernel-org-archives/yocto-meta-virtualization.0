Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8139EE00CF7; Fri,  1 Dec 2017 12:19:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,WEIRD_PORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A781E00CEF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 12:19:54 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB1KJswa028343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 1 Dec 2017 12:19:54 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Dec 2017 12:19:53 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 1 Dec 2017 15:19:42 -0500
Message-ID: <1512159582-6858-8-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
References: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 7/7] python-glance: uprev to latest stable/pike
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
X-List-Received-Date: Fri, 01 Dec 2017 20:19:57 -0000
Content-Type: text/plain

Complete the uprev and the transition to systemd. The configuration is
cleaned up to match the setup documentation found in the openstack
installation guide. Once a build is completed with these changes the
controller image is able to have images added via:

 %> . /etc/keystone/admin-openrc
 %> openstack image create "cirros" \
   --file cirros-0.3.5-x86_64-disk.img \
   --disk-format qcow2 --container-format bare \
   --public

Images can be listed with 'openstack image list' or
'glance image-list' or via the horizon web interface.

Requires introduction of python-glance-store...

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-glance/glance-api.service        |  20 ++
 .../python/python-glance/glance-init               |  42 ++++
 .../python/python-glance/glance-init.service       |  12 +
 .../python/python-glance/glance-registry.service   |  20 ++
 .../recipes-devtools/python/python-glance_git.bb   | 261 +++++++++++----------
 5 files changed, 225 insertions(+), 130 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-glance/glance-api.service
 create mode 100644 meta-openstack/recipes-devtools/python/python-glance/glance-init
 create mode 100644 meta-openstack/recipes-devtools/python/python-glance/glance-init.service
 create mode 100644 meta-openstack/recipes-devtools/python/python-glance/glance-registry.service

diff --git a/meta-openstack/recipes-devtools/python/python-glance/glance-api.service b/meta-openstack/recipes-devtools/python/python-glance/glance-api.service
new file mode 100644
index 0000000..6777496
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-glance/glance-api.service
@@ -0,0 +1,20 @@
+[Unit]
+Description=OpenStack Image Service API
+After=postgresql.service keystone.service ntp.service rabbitmq-server.service
+
+[Service]
+User=%USER%
+Group=%GROUP%
+Type=simple
+WorkingDirectory=%LOCALSTATEDIR%/lib/glance
+PermissionsStartOnly=true
+ExecStartPre=/bin/mkdir -p %LOCALSTATEDIR%/lock/glance %LOCALSTATEDIR%/log/glance %LOCALSTATEDIR%/lib/glance
+ExecStartPre=/bin/chown %USER%:%GROUP% %LOCALSTATEDIR%/lock/glance %LOCALSTATEDIR%/lib/glance
+ExecStartPre=/bin/chown %USER%:adm %LOCALSTATEDIR%/log/glance
+ExecStart=/usr/bin/glance-api --config-file=%SYSCONFDIR%/glance/glance-api.conf --log-file=%LOCALSTATEDIR%/log/glance/glance-api.log
+Restart=on-failure
+LimitNOFILE=65535
+TimeoutStopSec=15
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-openstack/recipes-devtools/python/python-glance/glance-init b/meta-openstack/recipes-devtools/python/python-glance/glance-init
new file mode 100644
index 0000000..8551399
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-glance/glance-init
@@ -0,0 +1,42 @@
+#!/bin/bash
+#
+# Basic glance setup based on:
+# https://docs.openstack.org/glance/pike/install/install-debian.html
+#
+# Prerequisites: keystone must be available and bootstrapped
+#
+
+# Substitutions setup at do_intall()
+DB_USER=%DB_USER%
+GLANCE_USER=%GLANCE_USER%
+GLANCE_GROUP=%GLANCE_GROUP%
+CONTROLLER_IP=%CONTROLLER_IP%
+ADMIN_USER=%ADMIN_USER%
+ADMIN_PASSWORD=%ADMIN_PASSWORD%
+ADMIN_ROLE=%ADMIN_ROLE%
+SYSCONFDIR=%SYSCONFDIR%
+
+# Create the glance DB and grant the necessary permissions
+sudo -u postgres psql -c "CREATE DATABASE glance" 2> /dev/null
+sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE glance TO ${DB_USER}" 2> /dev/null
+
+source ${SYSCONFDIR}/keystone/admin-openrc
+
+openstack user create --domain default --password ${ADMIN_PASSWORD} ${GLANCE_USER}
+
+# Ensure the 'service' project exists
+openstack project show service > /dev/null 2>&1
+if [ $? -ne 0 ]; then
+    openstack project create service --domain default
+fi
+openstack role add --project service --user ${GLANCE_USER} ${ADMIN_ROLE}
+
+openstack service create --name glance --description "OpenStack Image" image
+openstack endpoint create --region RegionOne image public http://${CONTROLLER_IP}:9292
+openstack endpoint create --region RegionOne image internal http://${CONTROLLER_IP}:9292
+openstack endpoint create --region RegionOne image admin http://${CONTROLLER_IP}:9292
+
+sudo -u ${GLANCE_USER} glance-manage db_sync
+
+systemctl restart glance-registry
+systemctl restart glance-api
diff --git a/meta-openstack/recipes-devtools/python/python-glance/glance-init.service b/meta-openstack/recipes-devtools/python/python-glance/glance-init.service
new file mode 100644
index 0000000..34941b9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-glance/glance-init.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Barebones OpenStack glance initialization
+After=postgresql-init.service keystone-init.service
+
+[Service]
+Type=oneshot
+ExecStart=%SYSCONFDIR%/glance/glance-init
+ExecStartPost=/bin/systemctl --no-reload disable glance-init.service
+RemainAfterExit=No
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-openstack/recipes-devtools/python/python-glance/glance-registry.service b/meta-openstack/recipes-devtools/python/python-glance/glance-registry.service
new file mode 100644
index 0000000..a72e6ea
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-glance/glance-registry.service
@@ -0,0 +1,20 @@
+[Unit]
+Description=OpenStack Image Service Registry
+After=postgresql.service keystone.service ntp.service rabbitmq-server.service
+
+[Service]
+User=%USER%
+Group=%GROUP%
+Type=simple
+WorkingDirectory=%LOCALSTATEDIR%/lib/glance
+PermissionsStartOnly=true
+ExecStartPre=/bin/mkdir -p %LOCALSTATEDIR%/lock/glance %LOCALSTATEDIR%/log/glance %LOCALSTATEDIR%/lib/glance
+ExecStartPre=/bin/chown %USER%:%GROUP% %LOCALSTATEDIR%/lock/glance %LOCALSTATEDIR%/lib/glance
+ExecStartPre=/bin/chown %USER%:adm %LOCALSTATEDIR%/log/glance
+ExecStart=/usr/bin/glance-registry --config-file=%SYSCONFDIR%/glance/glance-registry.conf --log-file=%LOCALSTATEDIR%/log/glance/glance-registry.log
+Restart=on-failure
+LimitNOFILE=65535
+TimeoutStopSec=15
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index 4c408c9..6a6cded 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -6,19 +6,27 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRCNAME = "glance"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike \
            file://glance.init \
+           file://glance-api.service \
+           file://glance-registry.service \
+           file://glance-init.service \
+           file://glance-init \
            "
 
-# removed. juno uses store library: file://0001-glance-store-only-load-known-stores-not-all-stores.patch
-#                                   file://glance-change-builtin-tests-config-location.patch
-
-SRCREV = "69516fad5f651a085a047a337a05c58b39023c1b"
-PV = "11.0.0+git${SRCPV}"
+SRCREV = "06af2eb5abe0332f7035a7d7c2fbfd19fbc4dae7"
+PV = "15.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools update-rc.d identity default_configs hosts monitor
+inherit setuptools identity default_configs hosts monitor useradd systemd
+
+USER = "glance"
+GROUP = "glance"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system ${GROUP}"
+USERADD_PARAM_${PN} = "--system -m -d ${localstatedir}/lib/glance -s /bin/false -g ${GROUP} ${USER}"
 
 GLANCE_DEFAULT_STORE ?= "file"
 GLANCE_KNOWN_STORES ?= "glance.store.rbd.Store,\
@@ -40,9 +48,9 @@ SERVICECREATE_PARAM_${SRCNAME}-setup = "name type description region publicurl a
 python () {
     flags = {'type':'image',\
              'description':'OpenStack Image Service',\
-             'publicurl':"'http://${KEYSTONE_HOST}:9292/v2'",\
-             'adminurl':"'http://${KEYSTONE_HOST}:9292/v2'",\
-             'internalurl':"'http://${KEYSTONE_HOST}:9292/v2'"}
+             'publicurl':"'http://${KEYSTONE_HOST}:5000'",\
+             'adminurl':"'http://${KEYSTONE_HOST}:35357'",\
+             'internalurl':"'http://${KEYSTONE_HOST}:35357'"}
 
     d.setVarFlags("SERVICECREATE_PARAM_%s-setup" % d.getVar('SRCNAME',True), flags)
 }
@@ -55,110 +63,105 @@ do_install_prepend() {
 }
 
 do_install_append() {
-    TEMPLATE_CONF_DIR=${S}${sysconfdir}
+    SRC_SYSCONFDIR=${S}${sysconfdir}
     GLANCE_CONF_DIR=${D}${sysconfdir}/glance
-    
-    for file in api registry cache
-    do
-        install -m 0600 ${TEMPLATE_CONF_DIR}/glance-$file.conf ${WORKDIR}
-        sed -e "s!^#connection =.*!connection = postgresql://%DB_USER%:%DB_PASSWORD%@localhost/glance!g" \
-        -i ${WORKDIR}/glance-$file.conf
-        sed -i '/\[keystone_authtoken\]/aidentity_uri=http://127.0.0.1:8081/keystone/admin' ${WORKDIR}/glance-$file.conf
-    done
-
-    sed -e "s:^filesystem_store_datadir =.*:filesystem_store_datadir = ${sysconfdir}/${SRCNAME}/images/:g" \
-        -i ${WORKDIR}/glance-api.conf
 
-    # send samples to rabbitmq for ceilometer integration
-    sed -e "s:^# notification_driver = noop:notification_driver = rabbit:g" \
-        -i ${WORKDIR}/glance-api.conf         
+    install -o root -g ${GROUP} -m 750 -d ${GLANCE_CONF_DIR}
 
-    sed 's:^default_store =.*:default_store = ${GLANCE_DEFAULT_STORE}:g' -i ${WORKDIR}/glance-api.conf
-    sed 's:^swift_store_auth_address =.*:swift_store_auth_address = http\://127.0.0.1\:8081/keystone/main/:g' -i ${WORKDIR}/glance-api.conf
-    sed 's:^swift_store_user =.*:swift_store_user = %SERVICE_TENANT_NAME%\:${SRCNAME}:g' -i ${WORKDIR}/glance-api.conf
-    sed 's:^swift_store_key =.*:swift_store_key = %SERVICE_PASSWORD%:g' -i ${WORKDIR}/glance-api.conf
-    sed 's:^swift_store_create_container_on_put =.*:swift_store_create_container_on_put = True:g' -i ${WORKDIR}/glance-api.conf
-
-    # multi line match, replace the known stores with the ones we support.
-    sed '1!N; s:#known_stores = glance.store.*\n.*#.*glance.store.http.*:known_stores = ${GLANCE_KNOWN_STORES}:g' -i ${WORKDIR}/glance-api.conf
-
-    install -d ${GLANCE_CONF_DIR}
-    install -m 600 ${WORKDIR}/glance-registry.conf ${GLANCE_CONF_DIR}/
-    install -m 600 ${WORKDIR}/glance-api.conf ${GLANCE_CONF_DIR}/
-    install -m 600 ${WORKDIR}/glance-cache.conf ${GLANCE_CONF_DIR}/
-
-    install -m 600 ${S}/etc/glance-registry-paste.ini ${GLANCE_CONF_DIR}/
-    install -m 600 ${S}/etc/glance-api-paste.ini ${GLANCE_CONF_DIR}/
-    install -m 600 ${S}/etc/policy.json ${GLANCE_CONF_DIR}/
-    install -m 600 ${S}/etc/schema-image.json ${GLANCE_CONF_DIR}/
-
-    install -d ${GLANCE_CONF_DIR}/images
-    install -d ${D}${localstatedir}/lib/glance/image_cache
-
-    install -d ${D}${localstatedir}/log/${SRCNAME}
+    # Start with pristine copies from upstream
+    install -m 644 -o root -g ${GROUP} ${SRC_SYSCONFDIR}/glance-registry.conf ${GLANCE_CONF_DIR}/
+    install -m 644 -o root -g ${GROUP} ${SRC_SYSCONFDIR}/glance-api.conf ${GLANCE_CONF_DIR}/
+    install -m 644 -o root -g ${GROUP} ${SRC_SYSCONFDIR}/glance-cache.conf ${GLANCE_CONF_DIR}/
+    install -m 644 -o root -g ${GROUP} ${SRC_SYSCONFDIR}/glance-registry-paste.ini ${GLANCE_CONF_DIR}/
+    install -m 644 -o root -g ${GROUP} ${SRC_SYSCONFDIR}/glance-api-paste.ini ${GLANCE_CONF_DIR}/
+    install -m 644 -o root -g ${GROUP} ${SRC_SYSCONFDIR}/policy.json ${GLANCE_CONF_DIR}/
+    install -m 644 -o root -g ${GROUP} ${SRC_SYSCONFDIR}/schema-image.json ${GLANCE_CONF_DIR}/
 
     for file in api registry cache
     do
-	sed -e "s:%SERVICE_TENANT_NAME%:${SERVICE_TENANT_NAME}:g" \
-	    -i ${GLANCE_CONF_DIR}/glance-$file.conf
-	sed -e "s:%SERVICE_USER%:${SRCNAME}:g" -i ${GLANCE_CONF_DIR}/glance-$file.conf
-	sed -e "s:%SERVICE_PASSWORD%:${SERVICE_PASSWORD}:g" \
-	    -i ${GLANCE_CONF_DIR}/glance-$file.conf
-	sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" \
-	    -i ${GLANCE_CONF_DIR}/glance-$file.conf
-	sed -e "s:%DB_USER%:${DB_USER}:g" \
+        sed -e "/^#connection = .*/aconnection = postgresql+psycopg2://${DB_USER}:${DB_PASSWORD}@localhost/glance" \
+            -i ${GLANCE_CONF_DIR}/glance-$file.conf
+        sed -e "/^#filesystem_store_datadir = .*/afilesystem_store_datadir = ${localstatedir}/lib/${SRCNAME}/images/" \
+            -i ${GLANCE_CONF_DIR}/glance-$file.conf
+	sed -e "/^#service_token_roles_required = .*/aservice_token_roles_required = true" \
 	    -i ${GLANCE_CONF_DIR}/glance-$file.conf
     done
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/init.d
-        sed 's:@suffix@:api:' < ${WORKDIR}/glance.init >${WORKDIR}/glance-api.init.sh
-        install -m 0755 ${WORKDIR}/glance-api.init.sh ${D}${sysconfdir}/init.d/glance-api
-        sed 's:@suffix@:registry:' < ${WORKDIR}/glance.init >${WORKDIR}/glance-registry.init.sh
-        install -m 0755 ${WORKDIR}/glance-registry.init.sh ${D}${sysconfdir}/init.d/glance-registry
-    fi
+    CONF_FILE=${GLANCE_CONF_DIR}/glance-api.conf
+    sed -e '/^#stores = .*/astores = ${GLANCE_KNOWN_STORES}' -i ${CONF_FILE}
+    sed -e '/^#default_store = .*/adefault_store = ${GLANCE_DEFAULT_STORE}' -i ${CONF_FILE}
+    #sed -e 's:^swift_store_auth_address =.*:swift_store_auth_address = http\://127.0.0.1\:8081/keystone/main/:g' -i ${CONF_FILE}
+    #sed -e 's:^swift_store_user =.*:swift_store_user = %SERVICE_TENANT_NAME%\:${SRCNAME}:g' -i ${CONF_FILE}
+    #sed -e 's:^swift_store_key =.*:swift_store_key = %SERVICE_PASSWORD%:g' -i ${CONF_FILE}
+    sed -e '/^#swift_store_create_container_on_put = .*/aswift_store_create_container_on_put = True' -i ${CONF_FILE}
 
-    cp run_tests.sh ${GLANCE_CONF_DIR}
-}
+    # As documented in https://docs.openstack.org/glance/pike/install/install-debian.html
+    for file in api registry
+    do
+        CONF_FILE=${GLANCE_CONF_DIR}/glance-$file.conf
+	keystone_authtoken="#\n# Setup at install by python-glance_git.bb\n#"
+	keystone_authtoken="$keystone_authtoken\nauth_uri = http://${CONTROLLER_IP}:5000"
+	keystone_authtoken="$keystone_authtoken\nauth_url = http://${CONTROLLER_IP}:35357"
+	keystone_authtoken="$keystone_authtoken\nmemcached_servers = ${CONTROLLER_IP}:11211"
+	keystone_authtoken="$keystone_authtoken\nauth_type = password"
+	keystone_authtoken="$keystone_authtoken\nproject_domain_name = Default"
+	keystone_authtoken="$keystone_authtoken\nuser_domain_name = Default"
+	keystone_authtoken="$keystone_authtoken\nproject_name = service"
+	keystone_authtoken="$keystone_authtoken\nusername = ${USER}"
+	keystone_authtoken="$keystone_authtoken\npassword = ${ADMIN_PASSWORD}"
+	sed -e "/^\[keystone_authtoken\].*/a$keystone_authtoken" -i ${CONF_FILE}
+	sed -e "/^#flavor = .*/aflavor = keystone" -i ${CONF_FILE}
+    done
+
+    # Install and setup systemd service files
+    install -d ${D}${systemd_system_unitdir}/
+    for service in glance-api.service glance-registry.service glance-init.service
+    do
+        SERVICE_FILE=${D}${systemd_system_unitdir}/$service
+        install -m 644 ${WORKDIR}/$service ${D}${systemd_system_unitdir}/
+        sed -e "s:%SYSCONFDIR%:${sysconfdir}:g" -i ${SERVICE_FILE}
+        sed -e "s:%LOCALSTATEDIR%:${localstatedir}:g" -i ${SERVICE_FILE}
+        sed -e "s:%USER%:${USER}:g" -i ${SERVICE_FILE}
+        sed -e "s:%GROUP%:${GROUP}:g" -i ${SERVICE_FILE}
+    done
 
-pkg_postinst_${SRCNAME}-setup () {
-    if [ -z "$D" ]; then
-	# This is to make sure postgres is configured and running
-	if ! pidof postmaster > /dev/null; then
-	   /etc/init.d/postgresql-init
-	   /etc/init.d/postgresql start
-	   sleep 5
-	fi
-
-	mkdir /var/log/glance
-	sudo -u postgres createdb glance
-	glance-manage db_sync
-    fi
+    # Setup the glance initialization script
+    INIT_FILE=${GLANCE_CONF_DIR}/glance-init
+    install -o root -g ${USER} -m 750 ${WORKDIR}/glance-init ${INIT_FILE}
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${INIT_FILE}
+    sed -e "s:%GLANCE_USER%:${USER}:g" -i ${INIT_FILE}
+    sed -e "s:%GLANCE_GROUP%:${GROUP}:g" -i ${INIT_FILE}
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${INIT_FILE}
+    sed -e "s:%ADMIN_USER%:${ADMIN_USER}:g" -i ${INIT_FILE}
+    sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${INIT_FILE}
+    sed -e "s:%ADMIN_ROLE%:${ADMIN_ROLE}:g" -i ${INIT_FILE}
+    sed -e "s:%SYSCONFDIR%:${sysconfdir}:g" -i ${INIT_FILE}
 }
 
-PACKAGES += " ${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-setup ${SRCNAME}-api ${SRCNAME}-registry"
-ALLOW_EMPTY_${SRCNAME}-setup = "1"
-ALLOW_EMPTY_${SRCNAME}-registry = "1"
-ALLOW_EMPTY_${SRCNAME}-api = "1"
+PACKAGES += " ${SRCNAME} ${SRCNAME}-setup ${SRCNAME}-api ${SRCNAME}-registry"
 
 FILES_${PN} = " \
     ${libdir}/* \
     ${datadir}/etc/${SRCNAME}* \
     "
 
-FILES_${SRCNAME}-tests = "${sysconfdir}/${SRCNAME}/run_tests.sh"
-
 FILES_${SRCNAME} = "${bindir}/* \
     ${sysconfdir}/${SRCNAME}/* \
     ${localstatedir}/* \
     "
 
-FILES_${SRCNAME}-api = "${bindir}/glance-api \
-    ${sysconfdir}/init.d/glance-api \
+FILES_${SRCNAME}-setup = " \
+    ${systemd_unitdir}/system/glance-init.service \
+    "
+
+FILES_${SRCNAME}-api = " \
+    ${bindir}/glance-api \
+    ${systemd_unitdir}/system/glance-api.service \
     "
 
-FILES_${SRCNAME}-registry = "${bindir}/glance-registry \
-    ${sysconfdir}/init.d/glance-registry \
+FILES_${SRCNAME}-registry = "\
+    ${bindir}/glance-registry \
+    ${systemd_unitdir}/system/glance-registry.service \
     "
 
 DEPENDS += " \
@@ -166,68 +169,66 @@ DEPENDS += " \
         python-pbr \
         "
 
-RDEPENDS_${PN} += "python-greenlet \
-	python-sqlalchemy \
-	python-anyjson \
-	python-eventlet \
-	python-pastedeploy \
-	python-routes \
-	python-webob \
-	python-boto \
-	python-sqlalchemy-migrate \
-	python-httplib2 \
-	python-kombu \
-	python-iso8601 \
-	python-oslo.config \
-	python-pip \
-	python-lxml \
-	python-paste \
-	python-pycrypto \
-	python-jsonschema \
-	python-keystoneclient \
-	python-swiftclient \
-	python-pbr \
-	python-i18n \
-	python-oslo.i18n \
-	python-osprofiler \
-	python-retrying \
-	python-glancestore \
-	python-enum34 \
-	python-semantic-version \
-	python-oslo.vmware \
+RDEPENDS_${PN} += " \
+        coreutils \
+        python-pbr \
+        python-sqlalchemy \
+        python-eventlet \
+        python-pastedeploy \
+        python-routes \
+        python-webob \
+        python-sqlalchemy-migrate \
+        python-sqlparse \
+        python-alembic \
+        python-httplib2 \
+        python-oslo.config \
         python-oslo.concurrency \
         python-oslo.context \
-        python-oslo.service \
         python-oslo.utils \
         python-stevedore \
         python-futurist \
         python-taskflow \
+        python-keystoneauth1 \
         python-keystonemiddleware \
         python-wsme \
+        python-prettytable \
+        python-paste \
+        python-jsonschema \
+        python-keystoneclient \
         python-pyopenssl \
         python-six \
         python-oslo.db \
+        python-oslo.i18n \
         python-oslo.log \
-        python-oslo.messaging  \
+        python-oslo.messaging \
         python-oslo.middleware \
         python-oslo.policy \
-        python-oslo.serialization \
-        python-castellan \
+        python-retrying \
+        python-osprofiler \
+        python-glance-store \
+        python-debtcollector \
         python-cryptography \
-	"
+        python-cursive \
+        python-iso8601 \
+        python-monotonic \
+        "
+
+RDEPENDS_${SRCNAME} = " \
+        ${PN} \
+        postgresql \
+        postgresql-client \
+        python-psycopg2 \
+        "
 
-RDEPENDS_${SRCNAME} = "${PN} \
-        postgresql postgresql-client python-psycopg2"
 RDEPENDS_${SRCNAME}-api = "${SRCNAME}"
 RDEPENDS_${SRCNAME}-registry = "${SRCNAME}"
-RDEPENDS_${SRCNAME}-setup = "postgresql sudo ${SRCNAME}"
+RDEPENDS_${SRCNAME}-setup = "postgresql-setup keystone-setup sudo ${SRCNAME}"
 RDEPENDS_${SRCNAME}-tests = "python-psutil qpid-python bash"
 
-INITSCRIPT_PACKAGES = "${SRCNAME}-api ${SRCNAME}-registry"
-INITSCRIPT_NAME_${SRCNAME}-api = "glance-api"
-INITSCRIPT_PARAMS_${SRCNAME}-api = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
-INITSCRIPT_NAME_${SRCNAME}-registry = "glance-registry"
-INITSCRIPT_PARAMS_${SRCNAME}-registry = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
+SYSTEMD_PACKAGES = "${SRCNAME}-api ${SRCNAME}-registry ${SRCNAME}-setup"
+SYSTEMD_SERVICE_${SRCNAME}-api = "glance-api.service"
+SYSTEMD_SERVICE_${SRCNAME}-registry = "glance-registry.service"
+SYSTEMD_SERVICE_${SRCNAME}-setup = "glance-init.service"
 
 MONITOR_SERVICE_PACKAGES = "${SRCNAME}"
 MONITOR_SERVICE_${SRCNAME} = "glance"
-- 
2.7.4


