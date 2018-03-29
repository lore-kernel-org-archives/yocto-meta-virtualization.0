Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B99CFE009CF; Thu, 29 Mar 2018 12:29:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B827BE0090A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 12:29:25 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2TJTOeF016869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 12:29:24 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 12:29:24 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Mar 2018 15:29:13 -0400
Message-ID: <1522351753-22380-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522351753-22380-1-git-send-email-mark.asselstine@windriver.com>
References: <1522351753-22380-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 3/3] postgresql: don't attempt to start the DB before we setup the DB
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
X-List-Received-Date: Thu, 29 Mar 2018 19:29:26 -0000
Content-Type: text/plain

When we boot the first time the postgresql service will [FAIL] and
the following error is reported:

pg_ctl[288]: pg_ctl: directory "/etc/postgresql/data" does not exist

This is a result of the service being started before a call to
postgresql's initdb is made on the PGDATA directory, usually made by
the package's default 'postgresql-setup' or our 'postgresql-init'
scripts.

We split our 'postgresql-init' script into two, the first part which
does the 'initdb' can be executed as part of the postgresql.service
'ExecStartPre' allowing the postgresql.service to not fail. The
remainder of 'postgresql-init' script is executed as before, via the
postgresql-init.service on first boot.

This change also fixes some of the first boot startup races that was
preventing some of the openstack '*-init' services which do DB
configuration for openstack components from executing correctly.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../postgresql/postgresql/postgresql-init          | 36 +++++++++++++---------
 .../recipes-dbs/postgresql/postgresql_9.%.bbappend |  5 +++
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init b/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init
index cc7b13e..e1f9484 100644
--- a/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init
+++ b/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init
@@ -8,24 +8,30 @@ DB_USER=%DB_USER%
 DB_PASSWORD=%DB_PASSWORD%
 DATA_DIR=%DB_DATADIR%
 
-if [ ! -e $DATA_DIR ]; then
-	mkdir -p $DATA_DIR
-	chown postgres $DATA_DIR
-fi
+initdb(){
+    if [ ! -e $DATA_DIR ]; then
+        mkdir -p $DATA_DIR
+        chown postgres $DATA_DIR
+    fi
 
-if [ -e $DATA_DIR/PG_VERSION ]; then
-    # the database has already been initialized, return
-    exit 0
-fi
+    if [ -e $DATA_DIR/PG_VERSION ]; then
+        # the database has already been initialized, return
+        exit 0
+    fi
+
+    # Create the DB
+    sudo -u postgres initdb -D $DATA_DIR
 
-# Create the DB
-sudo -u postgres initdb -D $DATA_DIR
+    # Allow readers/writers by IP
+    echo "listen_addresses = '*'" >> $DATA_DIR/postgresql.conf
+    echo "host   all   all   ${CONTROLLER_IP}/32   trust" >> $DATA_DIR/pg_hba.conf
+    echo "host   all   all   ${COMPUTE_IP}/32   trust" >> $DATA_DIR/pg_hba.conf
+    }
 
-# Allow readers/writers by IP
-echo "listen_addresses = '*'" >> $DATA_DIR/postgresql.conf
-echo "host   all   all   ${CONTROLLER_IP}/32   trust" >> $DATA_DIR/pg_hba.conf
-echo "host   all   all   ${COMPUTE_IP}/32   trust" >> $DATA_DIR/pg_hba.conf
-systemctl restart postgresql
+if [ "$1" == "initdb" ]; then
+    initdb
+    exit 0
+fi
 
 count=0
 done=0
diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
index 1b8a952..5bf25e1 100644
--- a/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
+++ b/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
@@ -43,6 +43,11 @@ do_install_append() {
     do
         sed -e "s:\(PGDATA=\).*$:\1${DB_DATADIR}:g" -i $f
     done
+
+    # Ensure DB is initialize before we attempt to start the service
+    FILE=${D}${systemd_unitdir}/system/postgresql.service
+    sed -e '/ExecStart=.*/i ExecStartPre=-${sysconfdir}/postgresql/postgresql-init initdb' -i $FILE
+    sed -e '/ExecStartPre=.*/i PermissionsStartOnly=true' -i $FILE
 }
 
 PACKAGES += " ${PN}-setup"
-- 
2.7.4


