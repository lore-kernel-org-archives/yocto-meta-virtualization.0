Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68D62E009D9; Tue,  4 Sep 2018 13:13:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B48C9E009B2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Sep 2018 13:13:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w84KDAPK010276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 4 Sep 2018 13:13:10 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 4 Sep 2018 13:12:48 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 4 Sep 2018 16:12:40 -0400
Message-ID: <1536091960-1686-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536091960-1686-1-git-send-email-mark.asselstine@windriver.com>
References: <1536091960-1686-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] openvswitch: fixup the ovsdb-server.service
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
X-List-Received-Date: Tue, 04 Sep 2018 20:13:13 -0000
Content-Type: text/plain

The service currently fails to run since the runtime directories
aren't being created. Create the runtime directories and fixup the
path to echo to get things working again.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../systemd-create-runtime-dirs.patch              | 31 ++++++++++++++++++++++
 .../systemd-update-tool-paths.patch                | 14 +++++-----
 recipes-networking/openvswitch/openvswitch_git.bb  |  1 +
 3 files changed, 40 insertions(+), 6 deletions(-)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
new file mode 100644
index 0000000..65290cf
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
@@ -0,0 +1,31 @@
+From 219e7cf9f28fdf14747fdf674bec293f763fe8e3 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Tue, 4 Sep 2018 15:38:59 -0400
+Subject: [PATCH] systemd: create runtime dirs
+
+The recommendation would be to make use of "RuntimeDirectory=" and
+"RuntimeDirectoryMode=" instead of 'mkdir' and 'chown' but since the
+upstream service file uses 'chown' we will match this by using
+'mkdir'. Without this the service will fail to start since these
+directories won't exist.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ rhel/usr_lib_systemd_system_ovsdb-server.service | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
+index 694598f..0bb2274 100644
+--- a/rhel/usr_lib_systemd_system_ovsdb-server.service
++++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
+@@ -10,6 +10,7 @@ Type=forking
+ Restart=on-failure
+ EnvironmentFile=/etc/openvswitch/default.conf
+ EnvironmentFile=-/etc/sysconfig/openvswitch
++ExecStartPre=-/bin/mkdir /var/run/openvswitch /var/log/openvswitch
+ ExecStartPre=/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
+ ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
+ EnvironmentFile=-/run/openvswitch/useropts
+-- 
+2.7.4
+
diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
index ec1c111..d7d4c15 100644
--- a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
@@ -1,4 +1,4 @@
-From 3dbfcb0fa944b57215fab46fe484b02e69ff6e03 Mon Sep 17 00:00:00 2001
+From 163020a5bba1323dc337d72d4771bb81d824b0dc Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 29 May 2018 18:57:46 +0000
 Subject: [PATCH] systemd: update tool paths
@@ -9,8 +9,8 @@ different path, update accordingly.
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
  rhel/usr_lib_systemd_system_ovs-vswitchd.service.in | 4 ++--
- rhel/usr_lib_systemd_system_ovsdb-server.service    | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ rhel/usr_lib_systemd_system_ovsdb-server.service    | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
 index 11b34c6..94c48f8 100644
@@ -28,18 +28,20 @@ index 11b34c6..94c48f8 100644
  ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
            --no-ovsdb-server --no-monitor --system-id=random \
 diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
-index 70da1ec..c2c862f 100644
+index 70da1ec..694598f 100644
 --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
 +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
-@@ -10,7 +10,7 @@ Type=forking
+@@ -10,8 +10,8 @@ Type=forking
  Restart=on-failure
  EnvironmentFile=/etc/openvswitch/default.conf
  EnvironmentFile=-/etc/sysconfig/openvswitch
 -ExecStartPre=/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
+-ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /usr/bin/echo "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
 +ExecStartPre=/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
- ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /usr/bin/echo "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
++ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
  EnvironmentFile=-/run/openvswitch/useropts
  ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
+           --no-ovs-vswitchd --no-monitor --system-id=random \
 -- 
 2.7.4
 
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index edffdce..4a6002a 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -30,6 +30,7 @@ SRC_URI = "file://openvswitch-switch \
            file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
            file://python-switch-remaining-scripts-to-use-python3.patch \
            file://systemd-update-tool-paths.patch \
+           file://systemd-create-runtime-dirs.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.7.4


