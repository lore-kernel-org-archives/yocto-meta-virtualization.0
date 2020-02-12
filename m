Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.467.1581529974396026126
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Feb 2020 09:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mark.asselstine@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01CHq8H0019876
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 12 Feb 2020 09:52:18 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Wed, 12 Feb 2020
 09:51:58 -0800
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH] openvswitch: uprev from v2.11 to v2.12
Date: Wed, 12 Feb 2020 12:51:44 -0500
Message-ID: <1581529904-23985-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

A mostly straightforward uprev. Unfortunately a required patch for
python3 is only available on a non-release branch so we must carry it
in order to build (the discussion on the mailing list was that an
uprev might have avoided this, but this is not the case).

The ptest results are similar to after the v2.11 uprev

    ERROR: 2413 tests were run,
    23 failed unexpectedly.
    383 tests were skipped.

NOTE, however, that they have now marked many tests as 'skipped', such
as the python2 results, so the failed and skipped numbers have
essentially swapped with each other. The failed tests were in the
following areas:
    checkpatch.at (5)
    ovs-ofctl.at (1)
    dpif-netdev.at (1)
    ofproto-dpif.at (6)
    bridge.at (2)
    ovn.at (2)
    ovn-controller-vtep.at (6)

Most were issues with the test or expectations that source code would
be available. There might be an issue around packaging of
"/vswitchd/vswitch.ovsschema" but we should be able to overlook this
for now, as we have with previous versions.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...6beb94976e2b3e0c51430b63214de14186d8db39.patch} |  0
 ...-idlc.in-fix-dict-change-during-iteration.patch | 45 ++++++++++++++++++++++
 .../systemd-create-runtime-dirs.patch              | 12 +++---
 .../systemd-update-tool-paths.patch                | 32 +++++++--------
 recipes-networking/openvswitch/openvswitch_git.bb  | 11 +++---
 5 files changed, 74 insertions(+), 26 deletions(-)
 rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch => openvswitch-add-ptest-6beb94976e2b3e0c51430b63214de14186d8db39.patch} (100%)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/ovsdb-idlc.in-fix-dict-change-during-iteration.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-6beb94976e2b3e0c51430b63214de14186d8db39.patch
similarity index 100%
rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch
rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-6beb94976e2b3e0c51430b63214de14186d8db39.patch
diff --git a/recipes-networking/openvswitch/openvswitch-git/ovsdb-idlc.in-fix-dict-change-during-iteration.patch b/recipes-networking/openvswitch/openvswitch-git/ovsdb-idlc.in-fix-dict-change-during-iteration.patch
new file mode 100644
index 0000000..bf49ff6
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/ovsdb-idlc.in-fix-dict-change-during-iteration.patch
@@ -0,0 +1,45 @@
+From d84109f0b60096ce71cd0537b31b69a7f5ea8756 Mon Sep 17 00:00:00 2001
+From: Flavio Leitner <fbl@sysclose.org>
+Date: Sat, 14 Sep 2019 20:17:28 -0300
+Subject: [PATCH] ovsdb-idlc.in: fix dict change during iteration.
+
+Commit d84109f0b600 from git://github.com/openvswitch/ovs.git
+
+Python3 complains if a dict key is changed during the
+iteration.
+
+Use list() to create a copy of it.
+
+Traceback (most recent call last):
+  File "./ovsdb/ovsdb-idlc.in", line 1581, in <module>
+    func(*args[1:])
+  File "./ovsdb/ovsdb-idlc.in", line 185, in printCIDLHeader
+    replace_cplusplus_keyword(schema)
+  File "./ovsdb/ovsdb-idlc.in", line 179, in replace_cplusplus_keyword
+    for columnName in table.columns:
+RuntimeError: dictionary keys changed during iteration
+
+Signed-off-by: Flavio Leitner <fbl@sysclose.org>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+[MA: Upstream-Status: Submitted]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ ovsdb/ovsdb-idlc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index 40fef39..22d0a4e 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -176,7 +176,7 @@ def replace_cplusplus_keyword(schema):
+                 'wchar_t', 'while', 'xor', 'xor_eq'}
+ 
+     for tableName, table in schema.tables.items():
+-        for columnName in table.columns:
++        for columnName in list(table.columns):
+             if columnName in keywords:
+                 table.columns[columnName + '_'] = table.columns.pop(columnName)
+ 
+-- 
+2.7.4
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
index 65290cf..0438cf8 100644
--- a/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
@@ -1,4 +1,4 @@
-From 219e7cf9f28fdf14747fdf674bec293f763fe8e3 Mon Sep 17 00:00:00 2001
+From 6876e0c155b7f83e1f8545446e2dd69c2b7989f2 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 4 Sep 2018 15:38:59 -0400
 Subject: [PATCH] systemd: create runtime dirs
@@ -15,17 +15,17 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
-index 694598f..0bb2274 100644
+index aad557f..69b0bf6 100644
 --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
 +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
-@@ -10,6 +10,7 @@ Type=forking
+@@ -11,6 +11,7 @@ PIDFile=/var/run/openvswitch/ovsdb-server.pid
  Restart=on-failure
  EnvironmentFile=/etc/openvswitch/default.conf
  EnvironmentFile=-/etc/sysconfig/openvswitch
 +ExecStartPre=-/bin/mkdir /var/run/openvswitch /var/log/openvswitch
- ExecStartPre=/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
- ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
- EnvironmentFile=-/run/openvswitch/useropts
+ ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
+ ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
+ ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
 -- 
 2.7.4
 
diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
index d7d4c15..aae44fe 100644
--- a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
@@ -1,7 +1,7 @@
-From 163020a5bba1323dc337d72d4771bb81d824b0dc Mon Sep 17 00:00:00 2001
+From efd6b8f03ef7278d2477833f84bb8488bd0c346d Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 29 May 2018 18:57:46 +0000
-Subject: [PATCH] systemd: update tool paths
+Subject: [PATCH 1/2] systemd: update tool paths
 
 We are using the rhel files but we install our tools in a slightly
 different path, update accordingly.
@@ -9,16 +9,16 @@ different path, update accordingly.
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
  rhel/usr_lib_systemd_system_ovs-vswitchd.service.in | 4 ++--
- rhel/usr_lib_systemd_system_ovsdb-server.service    | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
+ rhel/usr_lib_systemd_system_ovsdb-server.service    | 6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
-index 11b34c6..94c48f8 100644
+index ff43dae..f88b57c 100644
 --- a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
 +++ b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
-@@ -15,8 +15,8 @@ EnvironmentFile=/etc/openvswitch/default.conf
- EnvironmentFile=-/etc/sysconfig/openvswitch
- EnvironmentFile=-/run/openvswitch/useropts
+@@ -17,8 +17,8 @@ EnvironmentFile=-/etc/sysconfig/openvswitch
+ EnvironmentFile=-/run/openvswitch.useropts
+ LimitSTACK=2M
  @begin_dpdk@
 -ExecStartPre=-/bin/sh -c '/usr/bin/chown :$${OVS_USER_ID##*:} /dev/hugepages'
 -ExecStartPre=-/usr/bin/chmod 0775 /dev/hugepages
@@ -28,18 +28,20 @@ index 11b34c6..94c48f8 100644
  ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
            --no-ovsdb-server --no-monitor --system-id=random \
 diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
-index 70da1ec..694598f 100644
+index 4c170c0..aad557f 100644
 --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
 +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
-@@ -10,8 +10,8 @@ Type=forking
+@@ -11,9 +11,9 @@ PIDFile=/var/run/openvswitch/ovsdb-server.pid
  Restart=on-failure
  EnvironmentFile=/etc/openvswitch/default.conf
  EnvironmentFile=-/etc/sysconfig/openvswitch
--ExecStartPre=/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
--ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /usr/bin/echo "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
-+ExecStartPre=/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
-+ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
- EnvironmentFile=-/run/openvswitch/useropts
+-ExecStartPre=-/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
+-ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /usr/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
+-ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /usr/bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
++ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
++ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
++ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
+ EnvironmentFile=-/run/openvswitch.useropts
  ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
            --no-ovs-vswitchd --no-monitor --system-id=random \
 -- 
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 072d7f1..141a609 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -10,21 +10,21 @@ RDEPENDS_${PN}-ptest += "\
 	python3-datetime python3-netclient python3 sed \
 	ldd perl-module-socket perl-module-carp perl-module-exporter \
 	perl-module-xsloader python3-netserver python3-threading \
-	python3-resource findutils which \
+	python3-resource findutils which diffutils \
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.11+${SRCPV}"
+PV = "2.12+${SRCPV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "f22ca8011fdb7e81ffce5017cd26539bccf50e94"
+SRCREV = "6beb94976e2b3e0c51430b63214de14186d8db39"
 SRC_URI = "file://openvswitch-switch \
            file://openvswitch-switch-setup \
            file://openvswitch-testcontroller \
            file://openvswitch-testcontroller-setup \
-           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.11 \
-           file://openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch \
+           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.12 \
+           file://openvswitch-add-ptest-6beb94976e2b3e0c51430b63214de14186d8db39.patch \
            file://run-ptest \
            file://disable_m4_check.patch \
            file://kernel_module.patch \
@@ -33,6 +33,7 @@ SRC_URI = "file://openvswitch-switch \
            file://python-switch-remaining-scripts-to-use-python3.patch \
            file://systemd-update-tool-paths.patch \
            file://systemd-create-runtime-dirs.patch \
+           file://ovsdb-idlc.in-fix-dict-change-during-iteration.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.7.4

