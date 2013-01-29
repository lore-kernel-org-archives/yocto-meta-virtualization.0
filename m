Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E40F2E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:01:00 -0800 (PST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jan 2013 05:01:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,559,1355126400"; d="scan'208";a="279764524"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.31])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2013 05:00:59 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Jan 2013 15:01:39 +0200
Message-Id: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] iptables: Sync bbappend version with oe-core
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
X-List-Received-Date: Tue, 29 Jan 2013 13:01:01 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-extended/iptables/iptables_1.4.15.bbappend |    8 --------
 recipes-extended/iptables/iptables_1.4.17.bbappend |    8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 recipes-extended/iptables/iptables_1.4.15.bbappend
 create mode 100644 recipes-extended/iptables/iptables_1.4.17.bbappend

diff --git a/recipes-extended/iptables/iptables_1.4.15.bbappend b/recipes-extended/iptables/iptables_1.4.15.bbappend
deleted file mode 100644
index 52a4c4f..0000000
--- a/recipes-extended/iptables/iptables_1.4.15.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
-                      kernel-module-ip6table-filter \
-                      kernel-module-xt-tcpudp \
-                      kernel-module-ipt-reject \
-                      kernel-module-iptable-mangle \
-                      kernel-module-xt-checksum \
-                      kernel-module-xt-state \
-                      "
diff --git a/recipes-extended/iptables/iptables_1.4.17.bbappend b/recipes-extended/iptables/iptables_1.4.17.bbappend
new file mode 100644
index 0000000..52a4c4f
--- /dev/null
+++ b/recipes-extended/iptables/iptables_1.4.17.bbappend
@@ -0,0 +1,8 @@
+RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
+                      kernel-module-ip6table-filter \
+                      kernel-module-xt-tcpudp \
+                      kernel-module-ipt-reject \
+                      kernel-module-iptable-mangle \
+                      kernel-module-xt-checksum \
+                      kernel-module-xt-state \
+                      "
-- 
1.7.9.5


