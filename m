Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35C96E0054B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Apr 2013 09:30:52 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3PGUpvm004078
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Apr 2013 09:30:51 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 25 Apr 2013 09:30:50 -0700
From: Joe Slater <jslater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 25 Apr 2013 09:30:49 -0700
Message-ID: <1366907449-3706-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Cc: joe.slater@windriver.com
Subject: [PATCH] openvswitch: functionality sanity test
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
X-List-Received-Date: Thu, 25 Apr 2013 16:30:52 -0000
Content-Type: text/plain

Instructions for creating a simple bridge that will take
over eth0.  You cannot be executing out of an nfs-mounted
filesystem while setting up the bridge.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 docs/vswitch_test.sh |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100755 docs/vswitch_test.sh

diff --git a/docs/vswitch_test.sh b/docs/vswitch_test.sh
new file mode 100755
index 0000000..63168e3
--- /dev/null
+++ b/docs/vswitch_test.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+# runqemu defaults for the first "guest"
+#
+my_inet4="192.168.7.2"
+my_gw="192.168.7.1"
+
+# create a bridge
+#
+ovs-vsctl add-br br-int
+
+# Add a physical interface to your virtual bridge for connectivity off box.
+# If your rootfs is nfs mounted (on eth0), you will die after attaching it
+# to the bridge.
+#
+ovs-vsctl add-port br-int eth0
+
+# Zero out your eth0 interface and slap it on the bridge interface.
+#
+ifconfig eth0 0
+ifconfig br-int ${my_inet4} netmask 255.255.255.0
+
+# Change your default route.  If you don't do this, nothing will
+# be reachable.
+#
+route add default gw ${my_gw} br-int
+
+(You can then check that the connection works.)
+
+# The bridge configuration is persistant, so if something goes wrong
+# and you reboot, it will still be messed up.  Destroy the bridge,
+# then add a route, or reboot.
+#
+ovs-vsctl del-br br-int
+ifconfig eth0 ${my_inet4}
+route add default gw ${my_gw} eth0
-- 
1.7.3.4


