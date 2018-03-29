Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E37A3E008E4; Thu, 29 Mar 2018 12:29:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D2B5E008E4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 12:29:24 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2TJTN5Z031420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 12:29:24 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 12:29:23 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Mar 2018 15:29:12 -0400
Message-ID: <1522351753-22380-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522351753-22380-1-git-send-email-mark.asselstine@windriver.com>
References: <1522351753-22380-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/3] postgresql: update all instances of PGDATA
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

While investigating a postgresql startup issue I found we were only
updating one instance of PGDATA where several exist. We do not use
these other instances but they are files installed in the system and
should reflect our customized setting for PGDATA.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
index 5b87960..1b8a952 100644
--- a/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
+++ b/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
@@ -19,7 +19,6 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/postgresql-init ${D_DEST_DIR}/postgresql-init
 
     sed -e "s:%DB_DATADIR%:${DB_DATADIR}:g" -i ${D_DEST_DIR}/postgresql-init
-    sed -e "s:\(PGDATA=\).*$:\1${DB_DATADIR}:g" -i ${D}${systemd_unitdir}/system/postgresql.service
 
     sed -e "s:%DB_USER%:${DB_USER}:g" -i ${D_DEST_DIR}/postgresql-init
     sed -e "s:%DB_PASSWORD%:${DB_PASSWORD}:g" -i ${D_DEST_DIR}/postgresql-init
@@ -34,6 +33,16 @@ do_install_append() {
     PG_INIT_SERVICE_FILE=${D}${systemd_unitdir}/system/postgresql-init.service
     install -m 644 ${WORKDIR}/postgresql-init.service ${PG_INIT_SERVICE_FILE}
     sed -e "s:%SYSCONFIGDIR%:${sysconfdir}:g" -i ${PG_INIT_SERVICE_FILE}
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
 }
 
 PACKAGES += " ${PN}-setup"
-- 
2.7.4


