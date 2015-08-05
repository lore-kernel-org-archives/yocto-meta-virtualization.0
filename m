Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22612E00A96; Wed,  5 Aug 2015 13:30:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82EBFE00AD1
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:30:04 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KU4w8010633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:30:04 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:30:03 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:46 -0400
Message-ID: <1438806592-32745-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 05/11] meta-openstack: fix dangling bbappends by adding wildcard
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
X-List-Received-Date: Wed, 05 Aug 2015 20:30:15 -0000
Content-Type: text/plain

Several bbappends were raising 'dangling' warnings since the base
recipe version has changed without a similar change being made in this
repo. The following are renames that include a wildcard to broaden the
versions to which these bbappends will be applied to. This will
address the 'dangling' warnings while ensuring the changes made in
this repo are properly applied to the associated recipes.

For the most part the files remain unchanged, in the case of
postgresql the 'brokensep' has been removed as there exists no more S
!= B issues in the base recipe.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../openssh/openssh_6.%.bbappend                   | 11 ++++
 .../openssh/openssh_6.7p1.bbappend                 | 11 ----
 .../recipes-extended/libpam/libpam_1.%.bbappend    | 21 +++++++
 .../recipes-extended/libpam/libpam_1.1.6.bbappend  | 21 -------
 .../recipes-httpd/apache2/apache2_2.4.%.bbappend   | 13 +++++
 .../recipes-httpd/apache2/apache2_2.4.10.bbappend  | 13 -----
 .../postgresql/postgresql_9.%.bbappend             | 65 ++++++++++++++++++++++
 .../postgresql/postgresql_9.2.4.bbappend           | 65 ----------------------
 8 files changed, 110 insertions(+), 110 deletions(-)
 create mode 100644 meta-openstack/recipes-connectivity/openssh/openssh_6.%.bbappend
 delete mode 100644 meta-openstack/recipes-connectivity/openssh/openssh_6.7p1.bbappend
 create mode 100644 meta-openstack/recipes-extended/libpam/libpam_1.%.bbappend
 delete mode 100644 meta-openstack/recipes-extended/libpam/libpam_1.1.6.bbappend
 create mode 100644 meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
 delete mode 100644 meta-openstack/recipes-httpd/apache2/apache2_2.4.10.bbappend
 create mode 100644 meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
 delete mode 100644 meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend

diff --git a/meta-openstack/recipes-connectivity/openssh/openssh_6.%.bbappend b/meta-openstack/recipes-connectivity/openssh/openssh_6.%.bbappend
new file mode 100644
index 0000000..bfc543a
--- /dev/null
+++ b/meta-openstack/recipes-connectivity/openssh/openssh_6.%.bbappend
@@ -0,0 +1,11 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://mcs-sshd"
+SRC_URI += "file://mcs-sshd_config"
+
+do_install_append() {
+    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
+        install -D -m 644 ${WORKDIR}/mcs-sshd ${D}/etc/pam.d/sshd
+        install -D -m 644 ${WORKDIR}/mcs-sshd_config ${D}/etc/ssh/sshd_config
+    fi
+}
diff --git a/meta-openstack/recipes-connectivity/openssh/openssh_6.7p1.bbappend b/meta-openstack/recipes-connectivity/openssh/openssh_6.7p1.bbappend
deleted file mode 100644
index bfc543a..0000000
--- a/meta-openstack/recipes-connectivity/openssh/openssh_6.7p1.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://mcs-sshd"
-SRC_URI += "file://mcs-sshd_config"
-
-do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
-        install -D -m 644 ${WORKDIR}/mcs-sshd ${D}/etc/pam.d/sshd
-        install -D -m 644 ${WORKDIR}/mcs-sshd_config ${D}/etc/ssh/sshd_config
-    fi
-}
diff --git a/meta-openstack/recipes-extended/libpam/libpam_1.%.bbappend b/meta-openstack/recipes-extended/libpam/libpam_1.%.bbappend
new file mode 100644
index 0000000..0e93ace
--- /dev/null
+++ b/meta-openstack/recipes-extended/libpam/libpam_1.%.bbappend
@@ -0,0 +1,21 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://common-account"
+SRC_URI += "file://common-auth"
+SRC_URI += "file://common-password"
+SRC_URI += "file://common-session"
+SRC_URI += "file://common-session-noninteractive"
+
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
+PACKAGECONFIG[OpenLDAP] = ",,,pam-plugin-mkhomedir nss-pam-ldapd"
+
+do_install_append() {
+    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
+        install -m 755 -d ${D}/etc/pam.d/
+        install -m 644 ${WORKDIR}/common-account ${D}/etc/pam.d/
+        install -m 644 ${WORKDIR}/common-auth ${D}/etc/pam.d/
+        install -m 644 ${WORKDIR}/common-password ${D}/etc/pam.d/
+        install -m 644 ${WORKDIR}/common-session ${D}/etc/pam.d/
+        install -m 644 ${WORKDIR}/common-session-noninteractive ${D}/etc/pam.d/
+    fi
+}
diff --git a/meta-openstack/recipes-extended/libpam/libpam_1.1.6.bbappend b/meta-openstack/recipes-extended/libpam/libpam_1.1.6.bbappend
deleted file mode 100644
index 0e93ace..0000000
--- a/meta-openstack/recipes-extended/libpam/libpam_1.1.6.bbappend
+++ /dev/null
@@ -1,21 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://common-account"
-SRC_URI += "file://common-auth"
-SRC_URI += "file://common-password"
-SRC_URI += "file://common-session"
-SRC_URI += "file://common-session-noninteractive"
-
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'OpenLDAP', '', d)}"
-PACKAGECONFIG[OpenLDAP] = ",,,pam-plugin-mkhomedir nss-pam-ldapd"
-
-do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
-        install -m 755 -d ${D}/etc/pam.d/
-        install -m 644 ${WORKDIR}/common-account ${D}/etc/pam.d/
-        install -m 644 ${WORKDIR}/common-auth ${D}/etc/pam.d/
-        install -m 644 ${WORKDIR}/common-password ${D}/etc/pam.d/
-        install -m 644 ${WORKDIR}/common-session ${D}/etc/pam.d/
-        install -m 644 ${WORKDIR}/common-session-noninteractive ${D}/etc/pam.d/
-    fi
-}
diff --git a/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend b/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
new file mode 100644
index 0000000..7af8143
--- /dev/null
+++ b/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
@@ -0,0 +1,13 @@
+do_install_append() {
+    sed -i -e 's/#ServerName.*$/ServerName 127.0.0.1:80/' ${D}${sysconfdir}/apache2/httpd.conf
+
+    # default layout for htdocsdir in 2.4.7 is different, create the following for
+    # backward compatibility reasons
+
+    mkdir -p ${D}${datadir}/${BPN}/default-site
+    ln -sf ../htdocs ${D}${datadir}/${BPN}/default-site/htdocs
+    
+    sed -i '30i if [ ! -e /var/log/apache2 ]; then ln -sf /var/apache2/logs/ /var/log/apache2; fi' ${D}/etc/init.d/apache2
+}
+
+FILES_${PN} += "${datadir}/${BPN}/default-site"
diff --git a/meta-openstack/recipes-httpd/apache2/apache2_2.4.10.bbappend b/meta-openstack/recipes-httpd/apache2/apache2_2.4.10.bbappend
deleted file mode 100644
index 7af8143..0000000
--- a/meta-openstack/recipes-httpd/apache2/apache2_2.4.10.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-do_install_append() {
-    sed -i -e 's/#ServerName.*$/ServerName 127.0.0.1:80/' ${D}${sysconfdir}/apache2/httpd.conf
-
-    # default layout for htdocsdir in 2.4.7 is different, create the following for
-    # backward compatibility reasons
-
-    mkdir -p ${D}${datadir}/${BPN}/default-site
-    ln -sf ../htdocs ${D}${datadir}/${BPN}/default-site/htdocs
-    
-    sed -i '30i if [ ! -e /var/log/apache2 ]; then ln -sf /var/apache2/logs/ /var/log/apache2; fi' ${D}/etc/init.d/apache2
-}
-
-FILES_${PN} += "${datadir}/${BPN}/default-site"
diff --git a/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
new file mode 100644
index 0000000..42ceaf8
--- /dev/null
+++ b/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
@@ -0,0 +1,65 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://postgresql \
+            file://postgresql-init"
+
+inherit useradd update-rc.d identity hosts openstackchef
+
+PACKAGECONFIG[libxml] = "--with-libxml CFLAGS=-I${STAGING_INCDIR}/libxml2,--without-libxml,libxml2,libxml2"
+
+# default
+DB_DATADIR ?= "/var/lib/postgres/data"
+
+do_install_append() {
+    INIT_D_DEST_DIR=${D}${sysconfdir}/init.d
+
+    install -d ${D}${sysconfdir}/init.d/
+    install -m 0755 ${WORKDIR}/postgresql ${INIT_D_DEST_DIR}/postgresql
+    install -m 0755 ${WORKDIR}/postgresql-init ${INIT_D_DEST_DIR}/postgresql-init
+    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
+        sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql
+        sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+
+        sed -e "s:%DB_USER%:${DB_USER}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+        sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+
+        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+        sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+
+        sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+        sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
+    fi
+}
+
+CHEF_SERVICES_CONF_FILES := "\
+    ${sysconfdir}/init.d/postgresql \
+    ${sysconfdir}/init.d/postgresql-init \
+    "
+
+RDEPENDS_${PN} += "postgresql-timezone eglibc-utils update-rc.d"
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system postgres"
+USERADD_PARAM_${PN}  = "--system --home /var/lib/postgres -g postgres \
+                        --no-create-home --shell /bin/false postgres"
+
+PACKAGES += " ${PN}-setup"
+ALLOW_EMPTY_${PN}-setup = "1"
+
+pkg_postinst_${PN}-setup () {
+    # postgres 9.2.4 postinst
+    if [ "x$D" != "x" ]; then
+        exit 1
+    fi
+      
+    /etc/init.d/postgresql-init
+    if [ $? -ne 0 ]; then
+        echo "[ERROR] postgres: unable to create admin account"
+        exit 1
+    fi
+}
+
+FILES_${PN} += "${localstatedir}/run/${PN}"
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME = "${PN}"
+INITSCRIPT_PARAMS = "defaults"
diff --git a/meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend b/meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend
deleted file mode 100644
index db247e5..0000000
--- a/meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend
+++ /dev/null
@@ -1,65 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://postgresql \
-            file://postgresql-init"
-
-inherit useradd update-rc.d identity hosts autotools-brokensep openstackchef
-
-PACKAGECONFIG[libxml] = "--with-libxml CFLAGS=-I${STAGING_INCDIR}/libxml2,--without-libxml,libxml2,libxml2"
-
-# default
-DB_DATADIR ?= "/var/lib/postgres/data"
-
-do_install_append() {
-    INIT_D_DEST_DIR=${D}${sysconfdir}/init.d
-
-    install -d ${D}${sysconfdir}/init.d/
-    install -m 0755 ${WORKDIR}/postgresql ${INIT_D_DEST_DIR}/postgresql
-    install -m 0755 ${WORKDIR}/postgresql-init ${INIT_D_DEST_DIR}/postgresql-init
-    if [ -z "${OPENSTACKCHEF_ENABLED}" ]; then
-        sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql
-        sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-
-        sed -e "s:%DB_USER%:${DB_USER}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-        sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-
-        sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-        sed -e "s:%CONTROLLER_HOST%:${CONTROLLER_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-
-        sed -e "s:%COMPUTE_IP%:${COMPUTE_IP}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-        sed -e "s:%COMPUTE_HOST%:${COMPUTE_HOST}:g" -i ${INIT_D_DEST_DIR}/postgresql-init
-    fi
-}
-
-CHEF_SERVICES_CONF_FILES := "\
-    ${sysconfdir}/init.d/postgresql \
-    ${sysconfdir}/init.d/postgresql-init \
-    "
-
-RDEPENDS_${PN} += "postgresql-timezone eglibc-utils update-rc.d"
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system postgres"
-USERADD_PARAM_${PN}  = "--system --home /var/lib/postgres -g postgres \
-                        --no-create-home --shell /bin/false postgres"
-
-PACKAGES += " ${PN}-setup"
-ALLOW_EMPTY_${PN}-setup = "1"
-
-pkg_postinst_${PN}-setup () {
-    # postgres 9.2.4 postinst
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-      
-    /etc/init.d/postgresql-init
-    if [ $? -ne 0 ]; then
-        echo "[ERROR] postgres: unable to create admin account"
-        exit 1
-    fi
-}
-
-FILES_${PN} += "${localstatedir}/run/${PN}"
-
-INITSCRIPT_PACKAGES = "${PN}"
-INITSCRIPT_NAME = "${PN}"
-INITSCRIPT_PARAMS = "defaults"
-- 
2.1.4


