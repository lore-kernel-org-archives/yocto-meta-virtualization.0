Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00DBBE00AD1; Fri, 10 Aug 2018 00:30:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F4F2E00708
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Aug 2018 00:30:21 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7A7Thxx002106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Aug 2018 00:29:54 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 10 Aug 2018 00:29:33 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Fri, 10 Aug 2018 15:29:32 +0800
Message-ID: <1533886172-328377-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-openstack][PATCH] tgt: add systemd service file
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
X-List-Received-Date: Fri, 10 Aug 2018 07:30:24 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Add systemd service file for tgt

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-openstack/recipes-support/tgt/files/tgtd      |  5 ++++
 .../recipes-support/tgt/files/tgtd.service         | 33 ++++++++++++++++++++++
 meta-openstack/recipes-support/tgt/tgt_git.bb      | 22 +++++++++++++--
 3 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-openstack/recipes-support/tgt/files/tgtd
 create mode 100755 meta-openstack/recipes-support/tgt/files/tgtd.service

diff --git a/meta-openstack/recipes-support/tgt/files/tgtd b/meta-openstack/recipes-support/tgt/files/tgtd
new file mode 100644
index 0000000..64df6a3
--- /dev/null
+++ b/meta-openstack/recipes-support/tgt/files/tgtd
@@ -0,0 +1,5 @@
+# options for tgtd
+TGTD_OPTS=""
+
+# configuration file
+TGTD_CONFIG=/etc/tgt/targets.conf
diff --git a/meta-openstack/recipes-support/tgt/files/tgtd.service b/meta-openstack/recipes-support/tgt/files/tgtd.service
new file mode 100755
index 0000000..afbd4b4
--- /dev/null
+++ b/meta-openstack/recipes-support/tgt/files/tgtd.service
@@ -0,0 +1,33 @@
+[Unit]
+Description=tgtd iSCSI target daemon
+After=network.target
+
+[Service]
+EnvironmentFile=@SYSCONFDIR@/sysconfig/tgtd
+
+ExecStart=@SBINDIR@/tgtd -f $TGTD_OPTS
+# see bz 848942. workaround for a race for now.
+ExecStartPost=@BASE_BINDIR@/sleep 5
+# Put tgtd into "offline" state until all the targets are configured.
+# We don't want initiators to (re)connect and fail the connection
+# if it's not ready.
+ExecStartPost=@SBINDIR@/tgtadm --op update --mode sys --name State -v offline
+# Configure the targets.
+ExecStartPost=@SBINDIR@/tgt-admin -e -c $TGTD_CONFIG
+# Put tgtd into "ready" state.
+ExecStartPost=@SBINDIR@/tgtadm --op update --mode sys --name State -v ready
+
+# Update configuration for targets. Only targets which
+# are not in use will be updated.
+ExecReload=@SBINDIR@/tgt-admin --update ALL -c $TGTD_CONFIG
+
+# NOTE: Shutdown of the iscsi target may cause data corruption
+# for initiators that are connected.
+ExecStop=@SBINDIR@/tgtadm --op update --mode sys --name State -v offline
+# Remove all targets. It only removes targets which are not in use.
+ExecStop=@SBINDIR@/tgt-admin --update ALL -c /dev/null
+# tgtd will exit if all targets were removed
+ExecStop=@SBINDIR@/tgtadm --op delete --mode system
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
index f4e12da..b94b034 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -12,13 +12,19 @@ SRC_URI = "git://github.com/fujita/tgt.git \
         file://0001-usr-Makefile-WARNING-fix.patch \
         file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
 "
-SRC_URI += "file://tgtd.init"
+SRC_URI += "file://tgtd.init \
+            file://tgtd.service \
+            file://tgtd \
+"
 
 S = "${WORKDIR}/git"
 
 CONFFILES_${PN} += "${sysconfdir}/tgt/targets.conf"
 
-inherit update-rc.d
+inherit update-rc.d systemd
+
+SYSTEMD_SERVICE_${PN} = "tgtd.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 CFLAGS += ' -I. -DUSE_SIGNALFD -DUSE_TIMERFD -D_GNU_SOURCE -DTGT_VERSION=\\"1.0.63\\" -DBSDIR=\\"${libdir}/backing-store\\"'
 
@@ -33,9 +39,21 @@ do_install() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${WORKDIR}/tgtd.init ${D}${sysconfdir}/init.d/tgtd
+    elif ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/tgtd.service ${D}${systemd_unitdir}/system/tgtd.service
+        install -d ${D}${sysconfdir}/sysconfig
+        install -m 0644 ${WORKDIR}/tgtd ${D}${sysconfdir}/sysconfig/tgtd
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tgtd.service
+        sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/tgtd.service
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/tgtd.service
     fi
 }
 
+FILES_${PN} += "${systemd_unitdir}/system/tgtd.service \
+                ${sysconfdir}/sysconfig/tgtd \
+"
+
 RDEPENDS_${PN} = " \
     bash \
     libaio \
-- 
2.7.4


