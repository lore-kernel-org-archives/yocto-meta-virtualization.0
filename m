Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A998BE00BD2; Wed, 10 Oct 2018 20:50:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5ED2E00AB9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Oct 2018 20:50:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9B3opgC029053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 20:50:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 20:50:50 -0700
From: <mingli.yu@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 11 Oct 2018 11:50:19 +0800
Message-ID: <1539229819-322989-3-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539229819-322989-1-git-send-email-mingli.yu@windriver.com>
References: <1539229819-322989-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-openstack][PATCH 3/3] postgresql: make append version independent
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
X-List-Received-Date: Thu, 11 Oct 2018 03:50:53 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Make bbappend version independent and only
effective when the openstack distro enabled.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-dbs/postgresql/postgresql_%.bbappend   |  1 +
 .../recipes-dbs/postgresql/postgresql_9.%.bbappend | 60 ----------------------
 .../postgresql/postgresql_openstack.inc            | 60 ++++++++++++++++++++++
 3 files changed, 61 insertions(+), 60 deletions(-)
 create mode 100644 meta-openstack/recipes-dbs/postgresql/postgresql_%.bbappend
 delete mode 100644 meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
 create mode 100644 meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc

diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_%.bbappend b/meta-openstack/recipes-dbs/postgresql/postgresql_%.bbappend
new file mode 100644
index 0000000..025ee4e
--- /dev/null
+++ b/meta-openstack/recipes-dbs/postgresql/postgresql_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('DISTRO_FEATURES', 'openstack', '${BPN}_openstack.inc', '', d)}
diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
deleted file mode 100644
index 5bf25e1..0000000
--- a/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
+++ /dev/null
@@ -1,60 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " \
-    file://postgresql-init \
-    file://postgresql-init.service \
-    "
-
-inherit identity hosts
-
-SYSTEMD_AUTO_ENABLE_${PN} = "enable"
-
-# default
-DB_DATADIR ?= "/var/lib/postgres/data"
-
-do_install_append() {
-    D_DEST_DIR=${D}${sysconfdir}/postgresql
-
-    install -d ${D_DEST_DIR}
-    install -m 0755 ${WORKDIR}/postgresql-init ${D_DEST_DIR}/postgresql-init
-
-    sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${D_DEST_DIR}/postgresql-init
-
-    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${D_DEST_DIR}/postgresql-init
-    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${D_DEST_DIR}/postgresql-init
-
-    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${D_DEST_DIR}/postgresql-init
-    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
-
-    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${D_DEST_DIR}/postgresql-init
-    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
-
-    install -d ${D}${systemd_unitdir}/system/
-    PG_INIT_SERVICE_FILE=${D}${systemd_unitdir}/system/postgresql-init.service
-    install -m 644 ${WORKDIR}/postgresql-init.service ${PG_INIT_SERVICE_FILE}
-    sed -e "s:%SYSCONFIGDIR%:${sysconfdir}:g" -i ${PG_INIT_SERVICE_FILE}
-
-    # Update PGDATA throughout
-    files="${D}${localstatedir}/lib/${BPN}/.bash_profile"
-    files="$files ${D}${systemd_unitdir}/system/postgresql.service"
-    files="$files ${D}${bindir}/${BPN}-setup"
-    files="$files ${D}${sysconfdir}/init.d/${BPN}-server"
-    for f in $files
-    do
-        sed -e "s:\(PGDATA=\).*$:\1${DB_DATADIR}:g" -i $f
-    done
-
-    # Ensure DB is initialize before we attempt to start the service
-    FILE=${D}${systemd_unitdir}/system/postgresql.service
-    sed -e '/ExecStart=.*/i ExecStartPre=-${sysconfdir}/postgresql/postgresql-init initdb' -i $FILE
-    sed -e '/ExecStartPre=.*/i PermissionsStartOnly=true' -i $FILE
-}
-
-PACKAGES += " ${PN}-setup"
-
-SYSTEMD_PACKAGES += "${PN}-setup"
-SYSTEMD_SERVICE_${PN}-setup = "postgresql-init.service"
-
-FILES_${PN}-setup = " \
-    ${systemd_unitdir}/system \
-"
diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
new file mode 100644
index 0000000..5bf25e1
--- /dev/null
+++ b/meta-openstack/recipes-dbs/postgresql/postgresql_openstack.inc
@@ -0,0 +1,60 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+    file://postgresql-init \
+    file://postgresql-init.service \
+    "
+
+inherit identity hosts
+
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+
+# default
+DB_DATADIR ?= "/var/lib/postgres/data"
+
+do_install_append() {
+    D_DEST_DIR=${D}${sysconfdir}/postgresql
+
+    install -d ${D_DEST_DIR}
+    install -m 0755 ${WORKDIR}/postgresql-init ${D_DEST_DIR}/postgresql-init
+
+    sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${D_DEST_DIR}/postgresql-init
+
+    sed -e "s:%DB_USER%:${DB_USER}:g" -i ${D_DEST_DIR}/postgresql-init
+    sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${D_DEST_DIR}/postgresql-init
+
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${D_DEST_DIR}/postgresql-init
+    sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
+
+    sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${D_DEST_DIR}/postgresql-init
+    sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${D_DEST_DIR}/postgresql-init
+
+    install -d ${D}${systemd_unitdir}/system/
+    PG_INIT_SERVICE_FILE=${D}${systemd_unitdir}/system/postgresql-init.service
+    install -m 644 ${WORKDIR}/postgresql-init.service ${PG_INIT_SERVICE_FILE}
+    sed -e "s:%SYSCONFIGDIR%:${sysconfdir}:g" -i ${PG_INIT_SERVICE_FILE}
+
+    # Update PGDATA throughout
+    files="${D}${localstatedir}/lib/${BPN}/.bash_profile"
+    files="$files ${D}${systemd_unitdir}/system/postgresql.service"
+    files="$files ${D}${bindir}/${BPN}-setup"
+    files="$files ${D}${sysconfdir}/init.d/${BPN}-server"
+    for f in $files
+    do
+        sed -e "s:\(PGDATA=\).*$:\1${DB_DATADIR}:g" -i $f
+    done
+
+    # Ensure DB is initialize before we attempt to start the service
+    FILE=${D}${systemd_unitdir}/system/postgresql.service
+    sed -e '/ExecStart=.*/i ExecStartPre=-${sysconfdir}/postgresql/postgresql-init initdb' -i $FILE
+    sed -e '/ExecStartPre=.*/i PermissionsStartOnly=true' -i $FILE
+}
+
+PACKAGES += " ${PN}-setup"
+
+SYSTEMD_PACKAGES += "${PN}-setup"
+SYSTEMD_SERVICE_${PN}-setup = "postgresql-init.service"
+
+FILES_${PN}-setup = " \
+    ${systemd_unitdir}/system \
+"
-- 
2.7.4


