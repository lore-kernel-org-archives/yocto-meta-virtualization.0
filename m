Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A863DE00D8A; Wed, 22 Nov 2017 08:08:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B975BE00C78
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:07:59 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAMG7x9Q015566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:07:59 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 08:07:58 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 11:07:53 -0500
Message-ID: <1511366873-7095-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] postgresql: updates to get things working with systemd
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
X-List-Received-Date: Wed, 22 Nov 2017 16:08:13 -0000
Content-Type: text/plain

Convert the sysvinit code to instead work with systemd. We are no
longer able to make use of postinst scripts as we need to perform
setup after the postgresql service is started, this will have
'knock-on' effects for other postinst, such as for keystone. Changing
these postinst to "one time" services buys us greater control and
easier readability than the postinst scripts, so overall this is a
good change.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../classes/hosts.bbclass                          |   2 +-
 .../postgresql/postgresql/postgresql               | 117 ++++++---------------
 .../postgresql/postgresql/postgresql-init          |   9 +-
 .../postgresql/postgresql/postgresql-init.service  |  12 +++
 .../postgresql/postgresql_9.%.bbappend             |  65 +++++-------
 5 files changed, 78 insertions(+), 127 deletions(-)
 create mode 100644 meta-openstack/recipes-support/postgresql/postgresql/postgresql-init.service

diff --git a/meta-openstack-controller-deploy/classes/hosts.bbclass b/meta-openstack-controller-deploy/classes/hosts.bbclass
index d4062b4..07fa727 100644
--- a/meta-openstack-controller-deploy/classes/hosts.bbclass
+++ b/meta-openstack-controller-deploy/classes/hosts.bbclass
@@ -5,4 +5,4 @@ CONTROLLER_IP ?= "192.168.7.2"
 CONTROLLER_HOST ?= "controller"
 MY_IP ?= "${CONTROLLER_IP}"
 MY_HOST ?= "${CONTROLLER_HOST}"
-DB_DATADIR ?= "/etc/postgresql"
+DB_DATADIR ?= "/etc/postgresql/data"
diff --git a/meta-openstack/recipes-support/postgresql/postgresql/postgresql b/meta-openstack/recipes-support/postgresql/postgresql/postgresql
index cfff759..2bdd582 100644
--- a/meta-openstack/recipes-support/postgresql/postgresql/postgresql
+++ b/meta-openstack/recipes-support/postgresql/postgresql/postgresql
@@ -1,93 +1,40 @@
-#!/bin/sh
+[Unit]
+Description=PostgreSQL database server
+After=network.target
 
-### BEGIN INIT INFO
-# Provides:     postgresql
-# Required-Start:   $local_fs $remote_fs $network $time
-# Required-Stop:    $local_fs $remote_fs $network $time
-# Should-Start:     $syslog
-# Should-Stop:      $syslog
-# Default-Start:    2 3 4 5
-# Default-Stop:     0 1 6
-# Short-Description:    PostgreSQL RDBMS server
-### END INIT INFO
+[Service]
+Type=forking
 
-DAEMON=/usr/bin/postmaster
-DESC="PostgreSQL RDBMS server"
-DEFAULT_DATA_DIR=%DB_DATADIR%
+User=postgres
+Group=postgres
 
-datadir=`grep ^data_directory $DEFAULT_DATA_DIR/postgresql.conf |sed -e "s#^.*= '##; s#'.*##"`
-if [ "$datadir" = "" ] ; then
-    datadir=$DEFAULT_DATA_DIR
-else
-    if [ ! -e $datadir/postgresql.conf ] ; then
-	if [ -e $DEFAULT_DATA_DIR/postgresql.conf -a -e $datadir ] ; then
-	    ln -s $DEFAULT_DATA_DIR/*.conf $datadir/
-	fi
-    fi
-fi
+# Where to send early-startup messages from the server (before the logging
+# options of postgresql.conf take effect)
+# This is normally controlled by the global default set by systemd
+# StandardOutput=syslog
 
-cd /
+# Disable OOM kill on the postmaster
+OOMScoreAdjust=-1000
+# ... but allow it still to be effective for child processes
+# (note that these settings are ignored by Postgres releases before 9.5)
+Environment=PG_OOM_ADJUST_FILE=/proc/self/oom_score_adj
+Environment=PG_OOM_ADJUST_VALUE=0
 
-start ()
-{
-    echo -n "Starting postgres server..."
-    if pidof ${DAEMON} > /dev/null; then
-        echo "already running."
-        exit 0
-    fi
-    touch /var/log/postgresql.log
-    chown postgres /var/log/postgresql.log
-    sudo -u postgres /usr/bin/pg_ctl start -w -D $datadir -s -l /var/log/postgresql.log
-    if [ $? -eq 0 ]; then
-        echo "done."
-    else
-        echo "failed."
-    fi
-}
+# Maximum number of seconds pg_ctl will wait for postgres to start.  Note that
+# PGSTARTTIMEOUT should be less than TimeoutSec value.
+Environment=PGSTARTTIMEOUT=270
 
-stop ()
-{
-    echo -n "Stopping postgres server..."
-    if ! pidof ${DAEMON} >/dev/null; then
-        echo "not running."
-        exit 0
-    fi
-    sudo -u postgres /usr/bin/pg_ctl stop -w -D $datadir -m fast -s
-    if [ $? -eq 0 ]; then
-        echo "done."
-    else
-	if [ -f $DEFAULT_DATA_DIR/postmaster.pid -a "$datadir" != "$DEFAULT_DATA_DIR" ] ; then
-	    # Special case for transition 
-	    sudo -u postgres /usr/bin/pg_ctl stop -w -D $DEFAULT_DATA_DIR -m fast -s
-	fi
-        if ! pidof ${DAEMON} > /dev/null; then
-	    echo "done."
-	else
-            echo "failed."
-	    exit 1
-	fi
-    fi
-}
+Environment=PGDATA=/usr/local/pgsql/data
 
-case "$1" in
-    start)
-        start
-        ;;
-    stop)
-        stop
-        ;;
-    force-reload)
-        stop
-        start
-        ;;
-    restart)
-        stop
-        start
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|force-reload|restart}"
-        exit 1
-        ;;
-esac
 
-exit 0
+ExecStart=/usr/local/pgsql/bin/pg_ctl start -D ${PGDATA} -s -w -t ${PGSTARTTIMEOUT}
+ExecStop=/usr/local/pgsql/bin/pg_ctl stop -D ${PGDATA} -s -m fast
+ExecReload=/usr/local/pgsql/bin/pg_ctl reload -D ${PGDATA} -s
+
+# Give a reasonable amount of time for the server to start up/shut down.
+# Ideally, the timeout for starting PostgreSQL server should be handled more
+# nicely by pg_ctl in ExecStart, so keep its timeout smaller than this value.
+TimeoutSec=300
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init b/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init
index f5e7dfb..cc7b13e 100644
--- a/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init
+++ b/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init
@@ -18,11 +18,14 @@ if [ -e $DATA_DIR/PG_VERSION ]; then
     exit 0
 fi
 
+# Create the DB
 sudo -u postgres initdb -D $DATA_DIR
+
+# Allow readers/writers by IP
 echo "listen_addresses = '*'" >> $DATA_DIR/postgresql.conf
 echo "host   all   all   ${CONTROLLER_IP}/32   trust" >> $DATA_DIR/pg_hba.conf
 echo "host   all   all   ${COMPUTE_IP}/32   trust" >> $DATA_DIR/pg_hba.conf
-/etc/init.d/postgresql start
+systemctl restart postgresql
 
 count=0
 done=0
@@ -30,9 +33,9 @@ while [ $count -le 10 ] && [ $done -eq 0 ]; do
     sudo -u postgres psql -c "CREATE ROLE ${DB_USER} WITH SUPERUSER LOGIN PASSWORD '${DB_PASSWORD}'" 2> /dev/null
     if [ $? -ne 0 ]; then
         echo "[INFO] postgres: failed to create account for ${DB_USER}, trying again"
-        /etc/init.d/postgresql stop
+        systemctl stop postresql
 	sleep 3
-        /etc/init.d/postgresql start
+        systemctl start postgresql
 	sleep 3
     else
         echo "[INFO] postgres: created account for ${DB_USER}, continuing .. "
diff --git a/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init.service b/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init.service
new file mode 100644
index 0000000..94206d2
--- /dev/null
+++ b/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Postgresql setup for OpenStack
+After=postgresql.service
+
+[Service]
+Type=oneshot
+ExecStart=%SYSCONFIGDIR%/postgresql/postgresql-init
+ExecStartPost=/bin/systemctl --no-reload disable postgresql-init.service
+RemainAfterExit=No
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
index b26054e..5b87960 100644
--- a/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
+++ b/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
@@ -1,57 +1,46 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += "file://postgresql \
-            file://postgresql-init"
+SRC_URI += " \
+    file://postgresql-init \
+    file://postgresql-init.service \
+    "
 
-inherit useradd update-rc.d identity hosts
+inherit identity hosts
 
-PACKAGECONFIG[libxml] = "--with-libxml CFLAGS=-I${STAGING_INCDIR}/libxml2,--without-libxml,libxml2,libxml2"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 
 # default
 DB_DATADIR ?= "/var/lib/postgres/data"
 
 do_install_append() {
-    INIT_D_DEST_DIR=${D}${sysconfdir}/init.d
+    D_DEST_DIR=${D}${sysconfdir}/postgresql
 
-    install -d ${D}${sysconfdir}/init.d/
-    install -m 0755 ${WORKDIR}/postgresql ${INIT_D_DEST_DIR}/postgresql
-    install -m 0755 ${WORKDIR}/postgresql-init ${INIT_D_DEST_DIR}/postgresql-init
+    install -d ${D_DEST_DIR}
+    install -m 0755 ${WORKDIR}/postgresql-init ${D_DEST_DIR}/postgresql-init
 
-    sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql
-    sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+    sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${D_DEST_DIR}/postgresql-init
+    sed -e "s:\(PGDATA=\).*$:\1${DB_DATADIR}:g" -i ${D}${systemd_unitdir}/system/postgresql.service
 
-    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${D_DEST_DIR}/postgresql-init
+    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${D_DEST_DIR}/postgresql-init
 
-    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${D_DEST_DIR}/postgresql-init
+    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
 
-    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-}
+    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${D_DEST_DIR}/postgresql-init
+    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
 
-RDEPENDS_${PN} += "postgresql-timezone eglibc-utils update-rc.d"
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system postgres"
-USERADD_PARAM_${PN}  = "--system --home /var/lib/postgres -g postgres \
-                        --no-create-home --shell /bin/false postgres"
+    install -d ${D}${systemd_unitdir}/system/
+    PG_INIT_SERVICE_FILE=${D}${systemd_unitdir}/system/postgresql-init.service
+    install -m 644 ${WORKDIR}/postgresql-init.service ${PG_INIT_SERVICE_FILE}
+    sed -e "s:%SYSCONFIGDIR%:${sysconfdir}:g" -i ${PG_INIT_SERVICE_FILE}
+}
 
 PACKAGES += " ${PN}-setup"
-ALLOW_EMPTY_${PN}-setup = "1"
-
-pkg_postinst_${PN}-setup () {
-    # postgres 9.2.4 postinst
-    if [ -z "$D" ]; then
-	/etc/init.d/postgresql-init
-	if [ $? -ne 0 ]; then
-	    echo "[ERROR] postgres: unable to create admin account"
-	    exit 1
-	fi
-    fi
-}
 
-FILES_${PN} += "${localstatedir}/run/${PN}"
+SYSTEMD_PACKAGES += "${PN}-setup"
+SYSTEMD_SERVICE_${PN}-setup = "postgresql-init.service"
 
-INITSCRIPT_PACKAGES = "${PN}"
-INITSCRIPT_NAME = "${PN}"
-INITSCRIPT_PARAMS = "defaults"
+FILES_${PN}-setup = " \
+    ${systemd_unitdir}/system \
+"
-- 
2.7.4


