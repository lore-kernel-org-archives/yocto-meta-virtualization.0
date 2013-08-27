Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A7D9E003BF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2013 09:49:31 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7RGnUXR022909
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2013 09:49:30 -0700 (PDT)
Received: from localhost.localdomain (147.11.152.86) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 27 Aug 2013 09:49:30 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 27 Aug 2013 09:44:18 -0700
Message-ID: <1377621858-18510-1-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Aug 2013 06:02:43 -0700
Cc: yang.shi@windriver.com
Subject: [PATCH] irqbalance: Uprev to 1.0.6
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
X-List-Received-Date: Tue, 27 Aug 2013 16:49:32 -0000
Content-Type: text/plain

Add recipe for 1.0.6 version. And, add status and reload commands into
init script.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 ...irqbalance-Add-status-and-reload-commands.patch |   55 ++++++++++++++++++++
 recipes-extended/irqbalance/irqbalance_1.0.6.bb    |   15 +++++
 2 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch
 create mode 100644 recipes-extended/irqbalance/irqbalance_1.0.6.bb

diff --git a/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch b/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch
new file mode 100644
index 0000000..d853d0b
--- /dev/null
+++ b/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch
@@ -0,0 +1,55 @@
+From dc7366896dd5a5bae82be4b11530bc9fdb7cbcdd Mon Sep 17 00:00:00 2001
+From: Yang Shi <yang.shi@windriver.com>
+Date: Mon, 26 Aug 2013 10:58:02 -0700
+Subject: [PATCH] irqbalance: Add status and reload commands
+
+Add status and reload commands for irqbalanced init script
+
+Signed-off-by: Yang Shi <yang.shi@windriver.com>
+---
+ irqbalance.init |   12 +++++++++---
+ 1 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/irqbalance.init b/irqbalance.init
+index d12d62c..f58bf55 100644
+--- a/irqbalance.init
++++ b/irqbalance.init
+@@ -1,6 +1,6 @@
+ #!/bin/sh
+ #
+-# Copyright (c) 2012 Wind River Systems, Inc.
++# Copyright (c) 2013 Wind River Systems, Inc.
+ #
+ ### BEGIN INIT INFO
+ # Provides:             irqbalance
+@@ -11,6 +11,8 @@
+ # Short-Description:    IRQ allocation daemon
+ ### END INIT INFO
+ 
++. /etc/init.d/functions
++
+ case "$1" in
+   start)
+ 	echo -n "Starting irqbalance: "
+@@ -22,12 +24,16 @@ case "$1" in
+ 	start-stop-daemon -K -n irqbalance
+ 	echo "done"
+ 	;;
+-  restart)
++  restart|reload)
+ 	$0 stop
+ 	$0 start
+ 	;;
++  status)
++	status irqbalance
++	echo "done"
++	;;
+   *)
+-	echo "Usage: $0 {start | stop | restart}" >&2
++	echo "Usage: $0 {start | stop | restart | reload | status}" >&2
+ 	exit 1
+ 	;;
+ esac
+-- 
+1.7.5.4
+
diff --git a/recipes-extended/irqbalance/irqbalance_1.0.6.bb b/recipes-extended/irqbalance/irqbalance_1.0.6.bb
new file mode 100644
index 0000000..fd08b73
--- /dev/null
+++ b/recipes-extended/irqbalance/irqbalance_1.0.6.bb
@@ -0,0 +1,15 @@
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
+
+require irqbalance.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "b73b1a5a9e1c3c428ae39024c711e41e"
+SRC_URI[sha256sum] = "95ac79992e6de501f613c781b0fc8aa17a4aaf6a3d865bb6e15ac6a46c6ab1fd"
+
+SRC_URI = "http://irqbalance.googlecode.com/files/irqbalance-${PV}.tar.gz \
+           file://add-initscript.patch \
+           file://irqbalance-Add-status-and-reload-commands.patch \
+          "
-- 
1.7.5.4


