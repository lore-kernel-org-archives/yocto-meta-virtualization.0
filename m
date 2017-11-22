Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 155FFE00D17; Wed, 22 Nov 2017 08:09:10 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83CE9E00D17
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:09:05 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAMG95bW015799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:09:05 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 08:09:04 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 11:08:46 -0500
Message-ID: <1511366926-8247-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511366926-8247-1-git-send-email-mark.asselstine@windriver.com>
References: <1511366926-8247-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 3/3] python-keystone: get things working with stable/pike
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
X-List-Received-Date: Wed, 22 Nov 2017 16:09:10 -0000
Content-Type: text/plain

Since we need to ensure the setup is run after postgresql is setup and
running we can't use a postinst as it runs too early in the boot
process. Instead we have a simple service which will run after
postgresql-init to complete the setup. On completion the service
disables itself, avoiding being run again on subsequent boots.

Update configuration data to match keystone setup as described on the
upstream project pages.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-keystone/keystone                | 128 --------------------
 .../python/python-keystone/keystone-init           |  60 ++++++++++
 .../python/python-keystone/keystone-init.service   |  12 ++
 .../python/python-keystone/wsgi-keystone.conf      |  73 ++++++++----
 .../recipes-devtools/python/python-keystone_git.bb | 129 ++++++++-------------
 5 files changed, 170 insertions(+), 232 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-keystone/keystone
 create mode 100644 meta-openstack/recipes-devtools/python/python-keystone/keystone-init
 create mode 100644 meta-openstack/recipes-devtools/python/python-keystone/keystone-init.service

diff --git a/meta-openstack/recipes-devtools/python/python-keystone/keystone b/meta-openstack/recipes-devtools/python/python-keystone/keystone
deleted file mode 100644
index 34cc3ad..0000000
--- a/meta-openstack/recipes-devtools/python/python-keystone/keystone
+++ /dev/null
@@ -1,128 +0,0 @@
-#!/bin/sh
-
-### BEGIN INIT INFO
-# Provides:          keystone
-# Required-Start: $remote_fs $network $syslog
-# Required-Stop: $remote_fs $syslog
-# Default-Start:     3 5
-# Default-Stop:      0 1 2 6
-# Short-Description: Keystone Server
-# Description: OpenStack identity Service (code-named keystone)
-### END INIT INFO
-
-DESC="keystone"
-DAEMON="uwsgi"
-DAEMON_OPTIONS="--http 127.0.0.1:35357 --wsgi-file $(which keystone-wsgi-admin)"
-PIDFILE="/var/run/keystone-all.pid"
-
-start ()
-{
-    if [ -e $PIDFILE ]; then
-        PIDDIR=/proc/$(cat $PIDFILE)
-        if [ -d ${PIDDIR} ]; then
-            echo "$DESC already running."
-            exit 1
-        else
-            echo "Removing stale PID file $PIDFILE"
-            rm -f $PIDFILE
-        fi
-    fi
-
-    if [ ! -d /var/log/keystone ]; then
-        mkdir /var/log/keystone                                                     
-    fi
-    echo -n "Starting $DESC..."
-
-    start-stop-daemon --start --quiet --background \
-        --pidfile ${PIDFILE} --make-pidfile --exec ${DAEMON} \
-	-- ${DAEMON_OPTIONS}
-
-    if [ $? -eq 0 ]; then
-        echo "done."
-    else
-        echo "failed."
-    fi
-}
-
-stop ()
-{
-    echo -n "Stopping $DESC..."
-    start-stop-daemon --stop --quiet --pidfile $PIDFILE
-    if [ $? -eq 0 ]; then
-        echo "done."
-    else
-        echo "failed."
-    fi
-    rm -f $PIDFILE
-}
-
-status()
-{
-    pid=`cat $PIDFILE 2>/dev/null`
-    if [ -n "$pid" ]; then
-        if ps -p $pid > /dev/null 2>&1 ; then
-            echo "$DESC is running"
-            return
-        fi
-    fi
-    echo "$DESC is not running"
-}
-
-reset()
-{
-    # Cleanup keystone tenant
-    . /etc/nova/openrc
-    simple_delete "keystone user-list" "keystone user-delete" 1 "keystone user"
-    simple_delete "keystone tenant-list" "keystone tenant-delete" 1 "keystone tenant"
-    simple_delete "keystone role-list" "keystone role-delete" 1 "keystone role"
-    simple_delete "keystone endpoint-list" "keystone endpoint-delete" 1 "keystone endpoint"
-    simple_delete "keystone service-list" "keystone service-delete" 1 "keystone service"
-
-    stop
-
-    # This is to make sure postgres is configured and running
-    if ! pidof postmaster > /dev/null; then
-        /etc/init.d/postgresql-init
-        /etc/init.d/postgresql start
-        sleep 2
-    fi
-
-    sudo -u postgres dropdb keystone
-    sudo -u postgres createdb keystone
-    keystone-manage db_sync
-    keystone-manage pki_setup --keystone-user=root --keystone-group=root
-
-    start
-
-    sleep 2
-
-    ADMIN_PASSWORD=%ADMIN_PASSWORD% \
-    SERVICE_PASSWORD=%SERVICE_PASSWORD% \
-    SERVICE_TENANT_NAME=%SERVICE_TENANT_NAME% \
-        bash /etc/keystone/service-user-setup
-}
-
-case "$1" in
-    start)
-        start
-        ;;
-    stop)
-        stop
-        ;;
-    restart|force-reload|reload)
-        stop
-        start
-        ;;
-    status)
-	status
-        ;;
-    reset)
-	reset
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|force-reload|restart|reload|status|reset}"
-        exit 1
-        ;;
-esac
-
-exit 0
diff --git a/meta-openstack/recipes-devtools/python/python-keystone/keystone-init b/meta-openstack/recipes-devtools/python/python-keystone/keystone-init
new file mode 100644
index 0000000..db4b4fa
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-keystone/keystone-init
@@ -0,0 +1,60 @@
+#!/bin/bash
+#
+# Basic keystone setup as described on:
+# https://docs.openstack.org/mitaka/install-guide-ubuntu/keystone-install.html
+# https://docs.openstack.org/keystone/pike/install/keystone-install-ubuntu.html
+#
+# Prerequisites: /etc/postgresql/postgresql-init must be run first to create the DB
+#
+# After complete you should be able to query keystone with something like the 
+# following (https://docs.openstack.org/keystone/latest/api_curl_examples.html)
+#
+#curl -i \
+#  -H "Content-Type: application/json" \
+#  -d '
+#{ "auth": {
+#    "identity": {
+#      "methods": ["password"],
+#      "password": {
+#        "user": {
+#          "name": "%ADMIN_USER%",
+#          "domain": { "id": "default" },
+#          "password": "%ADMIN_PASSWORD%"
+#        }
+#      }
+#    }
+#  }
+#}' \
+#  "http://localhost:5000/v3/auth/tokens" ; echo
+
+
+# Substitutions setup at do_intall()
+DB_USER=%DB_USER%
+KEYSTONE_USER=%KEYSTONE_USER%
+KEYSTONE_GROUP=%KEYSTONE_GROUP%
+CONTROLLER_IP=%CONTROLLER_IP%
+ADMIN_USER=%ADMIN_USER%
+ADMIN_PASSWORD=%ADMIN_PASSWORD%
+ADMIN_ROLE=%ADMIN_ROLE%
+
+# Create the keystone DB and grant the necessary permissions
+sudo -u postgres psql -c "CREATE DATABASE keystone" 2> /dev/null
+sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE keystone TO ${DB_USER}" 2> /dev/null
+
+keystone-manage db_sync
+
+keystone-manage fernet_setup --keystone-user ${KEYSTONE_USER} --keystone-group ${KEYSTONE_GROUP}
+keystone-manage credential_setup --keystone-user ${KEYSTONE_USER} --keystone-group ${KEYSTONE_GROUP}
+
+keystone-manage bootstrap \
+  --bootstrap-password ${ADMIN_PASSWORD} \
+  --bootstrap-username ${ADMIN_USER} \
+  --bootstrap-project-name admin \
+  --bootstrap-role-name ${ADMIN_ROLE} \
+  --bootstrap-service-name keystone \
+  --bootstrap-region-id RegionOne \
+  --bootstrap-admin-url http://${CONTROLLER_IP}:35357 \
+  --bootstrap-internal-url http://${CONTROLLER_IP}:5000 \
+  --bootstrap-public-url http://${CONTROLLER_IP}:5000
+
+#keystone-manage pki_setup --keystone-user=root --keystone-group=daemon
diff --git a/meta-openstack/recipes-devtools/python/python-keystone/keystone-init.service b/meta-openstack/recipes-devtools/python/python-keystone/keystone-init.service
new file mode 100644
index 0000000..b114806
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-keystone/keystone-init.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Barebones OpenStack keystone initialization
+After=postgresql-init.service
+
+[Service]
+Type=oneshot
+ExecStart=%SYSCONFIGDIR%/keystone/keystone-init
+ExecStartPost=/bin/systemctl --no-reload disable keystone-init.service
+RemainAfterExit=No
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-openstack/recipes-devtools/python/python-keystone/wsgi-keystone.conf b/meta-openstack/recipes-devtools/python/python-keystone/wsgi-keystone.conf
index 91b95f6..febf1d7 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone/wsgi-keystone.conf
+++ b/meta-openstack/recipes-devtools/python/python-keystone/wsgi-keystone.conf
@@ -1,25 +1,52 @@
-Listen 8081
-<VirtualHost *:8081>
-    ServerAdmin webmaster@localhost
-    WSGIApplicationGroup %{RESOURCE}
-    WSGIDaemonProcess keystone threads=15 display-name=%{GROUP}
-    WSGIProcessGroup keystone
-    WSGIScriptAlias /keystone/main  /var/www/cgi-bin/keystone/main
-    WSGIScriptAlias /keystone/admin  /var/www/cgi-bin/keystone/admin
-
-
-    <Location "/keystone">
-        Authtype none
-    </Location>
-
-    <Directory /var/www/cgi-bin/keystone/>
-        <IfVersion < 2.3>
-            Order allow,deny
-            Allow from all
-        </IfVersion>
-
-        <IfVersion >= 2.3>
-            Require all granted
-        </IfVersion>
+Listen 5000
+Listen 35357
+
+<VirtualHost *:5000>
+    WSGIDaemonProcess keystone-public processes=5 threads=1 user=keystone group=keystone display-name=%{GROUP}
+    WSGIProcessGroup keystone-public
+    WSGIScriptAlias / /usr/bin/keystone-wsgi-public
+    WSGIApplicationGroup %{GLOBAL}
+    WSGIPassAuthorization On
+    ErrorLogFormat "%{cu}t %M"
+    ErrorLog /var/log/apache2/keystone.log
+    CustomLog /var/log/apache2/keystone_access.log combined
+
+    <Directory /usr/bin>
+        Require all granted
+    </Directory>
+</VirtualHost>
+
+<VirtualHost *:35357>
+    WSGIDaemonProcess keystone-admin processes=5 threads=1 user=keystone group=keystone display-name=%{GROUP}
+    WSGIProcessGroup keystone-admin
+    WSGIScriptAlias / /usr/bin/keystone-wsgi-admin
+    WSGIApplicationGroup %{GLOBAL}
+    WSGIPassAuthorization On
+    ErrorLogFormat "%{cu}t %M"
+    ErrorLog /var/log/apache2/keystone.log
+    CustomLog /var/log/apache2/keystone_access.log combined
+
+    <Directory /usr/bin>
+        Require all granted
     </Directory>
 </VirtualHost>
+
+Alias /identity /usr/bin/keystone-wsgi-public
+<Location /identity>
+    SetHandler wsgi-script
+    Options +ExecCGI
+
+    WSGIProcessGroup keystone-public
+    WSGIApplicationGroup %{GLOBAL}
+    WSGIPassAuthorization On
+</Location>
+
+Alias /identity_admin /usr/bin/keystone-wsgi-admin
+<Location /identity_admin>
+    SetHandler wsgi-script
+    Options +ExecCGI
+
+    WSGIProcessGroup keystone-admin
+    WSGIApplicationGroup %{GLOBAL}
+    WSGIPassAuthorization On
+</Location>
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index b5f92dd..d7f6400 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 SRCNAME = "keystone"
 
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike \
+           file://keystone-init \
+           file://keystone-init.service \
            file://keystone.conf \
            file://identity.sh \
-           file://keystone \
            file://convert_keystone_backend.py \
            file://wsgi-keystone.conf \
            "
@@ -24,11 +25,14 @@ PV = "12.0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools update-rc.d identity hosts default_configs monitor
+inherit setuptools identity hosts default_configs monitor useradd systemd
 
 SERVICE_TOKEN = "password"
 TOKEN_FORMAT ?= "PKI"
 
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system -m -s /bin/false keystone"
+
 LDAP_DN ?= "dc=my-domain,dc=com"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
@@ -64,79 +68,67 @@ do_install_append() {
 
     KEYSTONE_CONF_DIR=${D}${sysconfdir}/keystone
     KEYSTONE_PACKAGE_DIR=${D}${PYTHON_SITEPACKAGES_DIR}/keystone
-
     APACHE_CONF_DIR=${D}${sysconfdir}/apache2/conf.d/
-    KEYSTONE_PY_DIR=${D}${datadir}/openstack-dashboard/openstack_dashboard/api/
-    KEYSTONE_CGI_DIR=${D}${localstatedir}/www/cgi-bin/keystone/
 
-    # Apache needs to read the configs.
+    # Create directories
     install -m 755 -d ${KEYSTONE_CONF_DIR}
     install -m 755 -d ${APACHE_CONF_DIR}
-
     install -d ${D}${localstatedir}/log/${SRCNAME}
-    install -m 755 -d ${KEYSTONE_CGI_DIR}
-    #install -m 755 -d ${KEYSTONE_PY_DIR}
 
+    # Setup the systemd service file
+    install -d ${D}${systemd_unitdir}/system/
+    KS_INIT_SERVICE_FILE=${D}${systemd_unitdir}/system/keystone-init.service
+    install -m 644 ${WORKDIR}/keystone-init.service ${KS_INIT_SERVICE_FILE}
+    sed -e "s:%SYSCONFIGDIR%:${sysconfdir}:g" -i ${KS_INIT_SERVICE_FILE}
+
+    # Setup the keystone initialization script
+    KS_INIT_FILE=${KEYSTONE_CONF_DIR}/keystone-init
+    install -m 755 ${WORKDIR}/keystone-init ${KS_INIT_FILE}
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${KS_INIT_FILE}
+    sed -e "s:%KEYSTONE_USER%:keystone:g" -i ${KS_INIT_FILE}
+    sed -e "s:%KEYSTONE_GROUP%:keystone:g" -i ${KS_INIT_FILE}
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${KS_INIT_FILE}
+    sed -e "s:%ADMIN_USER%:${ADMIN_USER}:g" -i ${KS_INIT_FILE}
+    sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${KS_INIT_FILE}
+    sed -e "s:%ADMIN_ROLE%:${ADMIN_ROLE}:g" -i ${KS_INIT_FILE}
+
+    # Install various configuration files. We have to select suitable
+    # permissions as packages such as Apache require read access.
+    #
     # Apache needs to read the keystone.conf
     install -m 644 ${WORKDIR}/keystone.conf ${KEYSTONE_CONF_DIR}/
     # Apache needs to read the wsgi-keystone.conf
-    install -m 644 ${WORKDIR}/wsgi-keystone.conf ${APACHE_CONF_DIR}
+    install -m 644 ${WORKDIR}/wsgi-keystone.conf \
+        ${APACHE_CONF_DIR}/keystone.conf
     install -m 755 ${WORKDIR}/identity.sh ${KEYSTONE_CONF_DIR}/
     install -m 600 ${S}${sysconfdir}/logging.conf.sample \
         ${KEYSTONE_CONF_DIR}/logging.conf
     install -m 600 ${S}${sysconfdir}/keystone.conf.sample \
         ${KEYSTONE_CONF_DIR}/keystone.conf.sample
-    # Apache user needs to read these files.
-    #install -m 644 ${S}${sysconfdir}/policy.json \
-    #    ${KEYSTONE_CONF_DIR}/policy.json
     install -m 644 ${S}${sysconfdir}/keystone-paste.ini \
         ${KEYSTONE_CONF_DIR}/keystone-paste.ini
-    #install -m 644 ${S}/httpd/keystone.py \
-    #    ${KEYSTONE_PY_DIR}/keystone-httpd.py
-    #install -m 644 ${S}/httpd/keystone.py \
-    #    ${KEYSTONE_CGI_DIR}/admin
-    #install -m 644 ${S}/httpd/keystone.py \
-    #    ${KEYSTONE_CGI_DIR}/main
 
+    # Copy examples from upstream
     cp -r ${S}/examples ${KEYSTONE_PACKAGE_DIR}
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)};
-    then
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/keystone ${D}${sysconfdir}/init.d/keystone
-    fi
-
+    # Edit the configuration to allow it to work out of the box
+    KEYSTONE_CONF_FILE=${KEYSTONE_CONF_DIR}/keystone.conf
     sed "/# admin_endpoint = .*/a \
         public_endpoint = http://%CONTROLLER_IP%:8081/keystone/main/ " \
-        -i ${KEYSTONE_CONF_DIR}/keystone.conf
+        -i ${KEYSTONE_CONF_FILE}
 
     sed "/# admin_endpoint = .*/a \
         admin_endpoint = http://%CONTROLLER_IP%:8081/keystone/admin/ " \
-        -i ${KEYSTONE_CONF_DIR}/keystone.conf
+        -i ${KEYSTONE_CONF_FILE}
     
-    sed -e "s:%SERVICE_TOKEN%:${SERVICE_TOKEN}:g" \
-	-i ${KEYSTONE_CONF_DIR}/keystone.conf
-    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${KEYSTONE_CONF_DIR}/keystone.conf
-    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" \
-	-i ${KEYSTONE_CONF_DIR}/keystone.conf
-
-    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" \
-	-i ${KEYSTONE_CONF_DIR}/keystone.conf
-    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" \
-	-i ${KEYSTONE_CONF_DIR}/identity.sh
-
-    sed -e "s:%TOKEN_FORMAT%:${TOKEN_FORMAT}:g" \
-	-i ${KEYSTONE_CONF_DIR}/keystone.conf
-
-#    sed -e "s/%ADMIN_PASSWORD%/${ADMIN_PASSWORD}/g" \
-#	-i ${D}${sysconfdir}/init.d/keystone
-#    sed -e "s/%SERVICE_PASSWORD%/${SERVICE_PASSWORD}/g" \
-#	-i ${D}${sysconfdir}/init.d/keystone
-#    sed -e "s/%SERVICE_TENANT_NAME%/${SERVICE_TENANT_NAME}/g" \
-#	-i ${D}${sysconfdir}/init.d/keystone
+    sed -e "s:%SERVICE_TOKEN%:${SERVICE_TOKEN}:g" -i ${KEYSTONE_CONF_FILE}
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${KEYSTONE_CONF_FILE}
+    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${KEYSTONE_CONF_FILE}
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${KEYSTONE_CONF_FILE}
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${KEYSTONE_CONF_FILE}
+    sed -e "s:%TOKEN_FORMAT%:${TOKEN_FORMAT}:g" -i ${KEYSTONE_CONF_FILE}
     
     install -d ${KEYSTONE_PACKAGE_DIR}/tests/tmp
-
     if [ -e "${KEYSTONE_PACKAGE_DIR}/tests/test_overrides.conf" ];then
         sed -e "s:%KEYSTONE_PACKAGE_DIR%:${PYTHON_SITEPACKAGES_DIR}/keystone:g" \
             -i ${KEYSTONE_PACKAGE_DIR}/tests/test_overrides.conf
@@ -180,38 +172,13 @@ role_member_attribute = member \
 role_id_attribute = cn \
 role_name_attribute = ou \
 role_tree_dn = ou=Roles,${LDAP_DN} \
-' ${D}${sysconfdir}/keystone/keystone.conf
+' ${KEYSTONE_CONF_FILE}
 
         install -m 0755 ${WORKDIR}/convert_keystone_backend.py \
             ${D}${sysconfdir}/keystone/convert_keystone_backend.py
     fi
 }
 
-pkg_postinst_${SRCNAME}-setup () {
-    # python-keystone postinst start
-    if [ -z "$D" ]; then
-	# This is to make sure postgres is configured and running
-	if ! pidof postmaster > /dev/null; then
-	    /etc/init.d/postgresql-init
-	    /etc/init.d/postgresql start
-	    sleep 2
-	fi
-
-	# This is to make sure keystone is configured and running
-	PIDFILE="/var/run/keystone-all.pid"
-	if [ -z `cat $PIDFILE 2>/dev/null` ]; then
-	    sudo -u postgres createdb keystone
-	    keystone-manage db_sync
-	    keystone-manage pki_setup --keystone-user=root --keystone-group=daemon
-
-	    if ${@bb.utils.contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
-		/etc/init.d/openldap start
-	    fi
-	    /etc/init.d/keystone start
-	fi
-    fi
-}
-
 # By default tokens are expired after 1 day so by default we can set
 # this token flush cronjob to run every 2 days
 KEYSTONE_TOKEN_FLUSH_TIME ??= "0 0 */2 * *"
@@ -226,7 +193,12 @@ pkg_postinst_${SRCNAME}-cronjobs () {
 
 PACKAGES += " ${SRCNAME}-tests ${SRCNAME} ${SRCNAME}-setup ${SRCNAME}-cronjobs"
 
-ALLOW_EMPTY_${SRCNAME}-setup = "1"
+SYSTEMD_PACKAGES += "${SRCNAME}-setup"
+SYSTEMD_SERVICE_${SRCNAME}-setup = "keystone-init.service"
+
+FILES_${SRCNAME}-setup = " \
+    ${systemd_unitdir}/system \
+    "
 
 ALLOW_EMPTY_${SRCNAME}-cronjobs = "1"
 
@@ -237,10 +209,9 @@ FILES_${SRCNAME}-tests = "${sysconfdir}/${SRCNAME}/run_tests.sh"
 
 FILES_${SRCNAME} = "${bindir}/* \
     ${sysconfdir}/${SRCNAME}/* \
-    ${sysconfdir}/init.d/* \
     ${localstatedir}/* \
     ${datadir}/openstack-dashboard/openstack_dashboard/api/keystone-httpd.py \
-    ${sysconfdir}/apache2/conf.d/wsgi-keystone.conf \
+    ${sysconfdir}/apache2/conf.d/keystone.conf \
     "
 
 DEPENDS += " \
@@ -306,9 +277,5 @@ RDEPENDS_${SRCNAME} = " \
 RDEPENDS_${SRCNAME}-setup = "postgresql sudo ${SRCNAME}"
 RDEPENDS_${SRCNAME}-cronjobs = "cronie ${SRCNAME}"
 
-INITSCRIPT_PACKAGES = "${SRCNAME}"
-INITSCRIPT_NAME_${SRCNAME} = "keystone"
-INITSCRIPT_PARAMS_${SRCNAME} = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
-
 MONITOR_SERVICE_PACKAGES = "${SRCNAME}"
 MONITOR_SERVICE_${SRCNAME} = "keystone"
-- 
2.7.4


